var usuario, libros = [], select;

$(document).ready(function(){
	
	console.log("cargando info...");
	$('#loader').show();
	$('#info').hide();
	
    $('.tabs').tabs();
    $('.modal').modal();
    $('select').formSelect();
    $('.modal').modal();

    traerLocalStorage();
    $("html").on('click', '.btn-edit', function(e) {
    	let id = $(this).parent().parent()[0].getAttribute("name");
    	let token = localStorage.getItem("token");
    	let listCart = JSON.parse(localStorage.getItem("listCart"));
    	let encontrar = -1;
    	for(let i = 0; i < listCart.length; i++){
    		if(listCart[i].token == token){
    			encontrar = i;
    		}
    	}
    	if(encontrar != -1){
    		let buscar = -1;
        	for(let i = 0; i < listCart[encontrar].cart.length; i++){
        		if(listCart[encontrar].cart[i].id == id ){
        			buscar = i;
        		}
        	}
        	if(buscar != -1){
        		select = {idUser: encontrar, idLibro: buscar};
        		$("#titulo").html(listCart[encontrar].cart[buscar].name);
        		$("#cantidad").val(listCart[encontrar].cart[buscar].cantidad);
        	}
    	}
    	
    });
    $("#editar").on('click', function(e) {
    	let listCart = JSON.parse(localStorage.getItem("listCart"));
    	let value = $("#cantidad").val();
	    if(value && value != 0 && value != ""){
	    	listCart[select.idUser].cart[select.idLibro].cantidad = value;
	    	libros[listCart[select.idUser].cart[select.idLibro].id] = listCart[select.idUser].cart[select.idLibro];
			let text = `
				${value}<i class="center indigo-text right small material-icons modal-trigger btn-edit" href="#modal1">edit</i>
			`;
			let children = $("tr[name=" + listCart[select.idUser].cart[select.idLibro].id + "]").children()[1];
			$(children).html(text);
			listCart = JSON.stringify(listCart);
			localStorage.setItem("listCart", listCart);
			calcularTotal();
    	}
    });
    
    $("html").on('click', '.btn-del', function(e) {
    	let id = $(this).parent().parent()[0].getAttribute("name");
    	$('tr[name=' + id + ']').remove();
    	let token = localStorage.getItem("token");
    	let listCart = JSON.parse(localStorage.getItem("listCart"));
    	let encontrar = -1;
    	for(let i = 0; i < listCart.length; i++){
    		if(listCart[i].token == token){
    			encontrar = i;
    		}
    	}
    	
    	if(encontrar != -1){
    		let buscar = -1;
        	for(let i = 0; i < listCart[encontrar].cart.length; i++){
        		if(listCart[encontrar].cart[i].id == id ){
        			buscar = i;
        		}
        	}
        	if(buscar != -1){
        		listCart[encontrar].cart.splice( buscar, 1);
    			listCart = JSON.stringify(listCart);
    			localStorage.setItem("listCart", listCart);
    			M.toast({html: 'Removido.'});
        	}
    	}
    	
    });
    
    $("#factura").on("click", function(){
		M.toast({html: 'Enviando...'});
    	let total = calcularTotal();
    	let detail, details = [];

    	libros.forEach(function(libro){
    		detail = {amount:libro.cantidad, book: libro};
    		details.push(detail);
    	});

    	let orden = {
    			date: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
    			total,
    			details
    	};
    	
    	let data = JSON.stringify(orden);
    	
    	let success = function(data, status, jqXHR){
        	let token = localStorage.getItem("token");
        	let listCart = JSON.parse(localStorage.getItem("listCart"));
        	let encontrar = -1;
        	for(let i = 0; i < listCart.length; i++){
        		if(listCart[i].token == token){
        			encontrar = i;
        		}
        	}
        	if(encontrar != -1){
        		listCart.splice(encontrar, 1);
    			listCart = JSON.stringify(listCart);
    			localStorage.setItem("listCart", listCart);
        	}
			libros = [];
			$("#tabla").html("");
			calcularTotal();
			M.toast({html: '¡Compra exitosa!'});
        	
    	};
    	
		$.ajax({
			method: "POST",
			url: "/api/orden/add",
			beforeSend: function (xhr) {
			    xhr.setRequestHeader ("Authorization", localStorage.getItem("token"));
			},
			data,
			contentType: "application/json",
			datatype: "JSON",
			success,
			error: function(jqXHR , status, e){
				if(jqXHR.status == 402){
    				M.toast({html: jqXHR.getResponseHeader("errorMessage")});
				}else{
    				M.toast({html: 'Error al buscar status: '+jqXHR.status});
    				console.log(jqXHR);
				}
			}
		});
    	
    });
    
    
	$.ajax({
		method: "GET",
		url: "/api/client",
		beforeSend: function (xhr) {
		    xhr.setRequestHeader ("Authorization", localStorage.getItem("token"));
		},
		contentType: "application/json",
		datatype: "JSON",
		success: 
			function(data, status, jqXHR){
				usuario = data;
			},
		error: 
			function(jqXHR , status, e){
				if(status == 401){
					window.location.replace("/login");
				}else{
					M.toast({html: 'Error al buscar status: '+jqXHR.status});
					console.log(jqXHR);
				}
			}
	}).then(function(){
		if(usuario.username){
			$(".name").text(usuario.name);
			$(".lastname").text(usuario.lastname);
			$("#email").text(usuario.email);
			$("#address").text(usuario.address);
			$("#city").text(usuario.city.name);
			$("#areacode").text(usuario.areacode);
			$("#username").text(usuario.username);
			$("#phone").text(usuario.phone);
			$("#shippingpreference").text(usuario.shippingpreference);
			if(usuario.speciality) $("#speciality").text(usuario.speciality.name);
			if(usuario.creditCard) $("#creditCard").html("Tiene una tarjeta. <a class ='indigo btn waves-effect waves-light' href='/user/addcard'>Cambiar</a>");
			else $("#creditCard").html("No tiene una tarjeta. <a class ='indigo btn waves-effect waves-light' href='/user/addcard'>Agregar</a>");
			if($.urlParam('mensaje')){
				$("#welcome").text("¡Bienvenido "+ usuario.name +"!");
			}
			$('#loader').hide();
			$('#info').show();
		}else{
			localStorage.removeItem('token');
			window.location.replace("/login");
		}
	});
	
	
});

$.urlParam = function(name){
	var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if(results) return results[1] || 0;
	else return 0;
}

function traerLocalStorage(){
	let listCart = JSON.parse(localStorage.getItem("listCart"));
	let token = localStorage.getItem("token");
	if(!listCart) listCart = [];
	let encontrar = -1;
	for(let i = 0; i < listCart.length; i++){
		if(listCart[i].token == token){
			encontrar = i;
		}
	}
	if(encontrar != -1){
		listCart[encontrar].cart.forEach(function(libro){
			agregarTabla(libro.id, libro.name, libro.cantidad, libro.price);
			libros[libro.id] = libro;
		});
	}
	calcularTotal();
}

function agregarTabla(id, nombre, cantidad, precio){
	let markup =`
	<tr name ="${id}">
    	<td>${nombre}</td>
    	<td>${cantidad}<i class="center indigo-text right small material-icons modal-trigger btn-edit" href="#modal1">edit</i></td>
    	<td>$ ${precio}<i class="center red-text right small material-icons btn-del">delete</i></td>
    </tr>`;
	$("#tabla").append(markup);
}

function calcularTotal(){
	let suma = 0;
	libros.forEach(function(libro){
		suma += libro.cantidad*libro.price;
	});
	$("#total").html(suma);
	return suma;
}
var usuario;

$(document).ready(function(){
	console.log("cargando info...");
	$('#loader').show();
	$('#info').hide();
	
    $('.tabs').tabs();
    $('.modal').modal();
    $('select').formSelect();
    traerLocalStorage();
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
		});
	}
}

function agregarTabla(id, nombre, cantidad, precio){
	let markup =`
	<tr name ="${id}">
    	<td>${nombre}</td>
    	<td>${cantidad}</td>
    	<td>${precio}$<i id="delete" class="center red-text right small material-icons modal-trigger btn-del">delete</i></td>
    </tr>`;
	$("#tabla").append(markup);
}
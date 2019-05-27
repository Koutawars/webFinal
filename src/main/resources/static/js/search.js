var libros = [];

class UsuarioCarro {
	constructor(token){
		this.token = token;
		this.cart = [];
	}
}

$(document).ready(function(){  
	traerRecomendado();
	$("html").on('click', '.add', function(e) {
		e.preventDefault();
		let id = $(this)[0].getAttribute("name");
		let token = localStorage.getItem("token");
		let libro = libros[id];
		let listCart = JSON.parse(localStorage.getItem("listCart"));
		if(!listCart) listCart = [];
		var encontrar = -1;
		for(let i = 0; i < listCart.length; i++){
			if(listCart[i].token  == token){
				encontrar = i;
			}
		}
		if(encontrar == -1) encontrar = listCart.push(new UsuarioCarro(token)) - 1;
		let agregar = true;
		listCart[encontrar].cart.forEach(function(libro){
			if(libro.id == id) agregar = false;
		});
		if(agregar){
			listCart[encontrar].cart.push(libro);
			listCart = JSON.stringify(listCart);
			localStorage.setItem("listCart", listCart);
			M.toast({html: '¡Agregado ' + libro.name +'!'});
		}else{
			M.toast({html: '¡Ya se encuentra agregado:  ' + libro.name +'!'});
		}
	});
	$("#book").on("keyup", function(e) {
		let text = $(this).val();
		if(text != ""){
			let url = "/api/book/search/" + $('input[type=radio]:checked').val();
			
			let success = function(data, status, jqXHR ){
				console.log(data);
			};
			$.ajax({
				method: "POST",
				url,
				beforeSend: function (xhr) {
				    xhr.setRequestHeader ("Authorization", localStorage.getItem("token"));
				},
				data: text,
				contentType: "application/json",
				datatype: "JSON",
				success,
				error: function(jqXHR , status, e){
					M.toast({html: 'Error al buscar status: '+jqXHR.status});
					console.log(jqXHR);
				}
			});
		}
	});
});
  
  function traerRecomendado(){
		$.ajax({
			method: "GET",
			url: "/api/book/recommends",
			beforeSend: function (xhr) {
			    xhr.setRequestHeader ("Authorization", localStorage.getItem("token"));
			},
			contentType: "application/json",
			datatype: "JSON",
			success: 
				function(data, status, jqXHR){
					console.log(data);
					var texto = "";
					data.forEach(function(best){
						texto += `
							<div class="carousel-item white black-text">
		                    	<h2>${best.name}</h2>
		                    	<h6>precio: ${best.price} $</h6>
		                    	<i name="${best.id}" class="green-text large material-icons add">add_shopping_cart</i>
		                    	<img class="materialboxed" width="200" src="/img/libro.png">
							</div>`;
						libros[best.id] = best;
					});
				$("#recomendados").html(texto);

				$('.carousel.carousel-slider').carousel({
				    fullWidth: true,
				    indicators: true
				  });
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
		});
  }
$(document).ready(function(){  
	traerRecomendado();
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
		                    	<i class="green-text large material-icons add">add_shopping_cart</i>
		                    	<img class="materialboxed" width="200" src="/img/libro.png">
							</div>`;
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
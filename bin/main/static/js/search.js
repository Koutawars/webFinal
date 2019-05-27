$(document).ready(function(){  
	$('.carousel.carousel-slider').carousel({
	    fullWidth: true,
	    indicators: true
	  });
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
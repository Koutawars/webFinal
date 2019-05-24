$(document).ready(function(){
	if(localStorage.getItem("token") != null) window.location.replace("/user");
	$("#login").on('click', function(e) {
		e.preventDefault();
		let username = $("#username").val();
		let password = $("#password").val();
		let json = JSON.stringify({username, password});
		$.ajax({
			method: "POST",
			url: "/login",
			data: json,
			contentType: "application/json",
			datatype: "JSON",
			success: function(data, status, jqXHR){
				let token = jqXHR.getResponseHeader("Authorization");
				if(token != null){
					localStorage.setItem("token", token);
					window.location.replace("/user");
				}else{
					console.log("error en identificar");
				}
			},
			error: function(jqXHR , status, e){
				M.toast({html: 'Error al buscar status: '+jqXHR.status});
				console.log(jqXHR);
			}
		});
	});
	
});
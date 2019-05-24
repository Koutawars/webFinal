$(document).ready(function(){
	$("#logout").on('click', function(e) {
		e.preventDefault();
		localStorage.removeItem('token')
		window.location.replace("/login");
	});

	if(localStorage.getItem("token") == null) window.location.replace("/login");
});
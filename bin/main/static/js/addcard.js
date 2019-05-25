$(document).ready(function(){
    $('select').formSelect();
	$("#agregar").on('click', function(e) {
		e.preventDefault();
		let type = $("#type").val();
		if(type) type = {id: $("#type").val()};
		let number = $("#number").val();
		if(number) number = number.trim();
		let mounth = $("#mounth").val();
		let year = $("#year").val();
		let expiration = "";
		if(mounth && year){
			mounth = mounth.trim();
			year = year.trim();
			expiration = mounth + "/" + year.trim();
		}
		let ccv = $("#ccv").val();
		if(!ccv) ccv = ccv.trim();
		if(type != "" && number != "" && mounth != "" && year != "" && ccv != ""){
			let creditCard = {type, number, expiration, ccv};
			let json = JSON.stringify(creditCard);
			$.ajax({
				method: "POST",
				url: "/api/client/addcard",
				beforeSend: function (xhr) {
				    xhr.setRequestHeader ("Authorization", localStorage.getItem("token"));
				},
				contentType: "application/json",
				data: json,
				datatype: "JSON",
				success: 
					function(data, status, jqXHR){
						if(data.number == number){
							window.location.replace("/dashboard");
						}
						console.log(data);
					},
				error: 
					function(jqXHR , status, e){
						if(status == 401){
							window.location.replace("/login");
						}else{
							M.toast({html: 'Error al agregar status: '+jqXHR.status});
							console.log(jqXHR);
						}
					}
			});
		}
	});
});
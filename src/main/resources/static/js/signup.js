$(document).ready(function(){
    $('select').formSelect();
	$("#registrar").on('click', function(e) {
		e.preventDefault();
		let value, nombre;
		let name = $("#name").val();
		if(name) name = name.trim();
		let lastname = $("#lastname").val();
		if(lastname) lastname = lastname.trim();
		let username = $("#username").val().trim();
		if(username) username = username.trim();
		let email = $("#email").val();
		if(email)email = email.trim();
		let password = $("#password").val();
		if(password)password = password.trim();
		let password2 = $("#password2").val();
		if(password2)password2 = password2.trim();
		let phone = $("#phone").val();
		if(phone)phone = phone.trim();
		let areacode = $("#areacode").val();
		if(areacode)areacode = areacode.trim();
		let city = $("#city").val();
		if(city){
			value = city.trim();
			nombre = $("#speciality option:selected").text();
			city = {id:value, name:nombre};
		}
		let address = $("#address").val();
		if(address)address = address.trim();
		let speciality = $("#speciality").val();
		if(speciality == ''){
			speciality = null;
		}else{
			value = speciality.trim();
			nombre = $("#speciality").text();
			speciality = {id:value, name:nombre};
		}
		let shippingpreference = $("#forma").val();
		if(shippingpreference) shippingpreference = shippingpreference.trim();
		if(password != password2){
			  M.toast({html: 'Tiene que ser igual la contraseña.'});
		}else if(name != "" && lastname != "" && email != "" && password != "" && phone != ""  && city != "" && address != "" && shippingpreference != "" ){
			let client = {username, password, name, lastname, address, areacode, phone, email, shippingpreference, speciality, city};
			let json = JSON.stringify(client);
			$.ajax({
				method: "POST",
				url: "/signup",
				data: json,
				contentType: "application/json",
				datatype: "JSON",
				success: function(data, status, jqXHR){
					if(data.username == username) window.location.replace("/login");
				},
				error: function(jqXHR , status, e){
					M.toast({html: 'Error al registrar status: '+jqXHR.status});
					console.log(jqXHR);
				}
			});
		}else{
			M.toast({html: 'Revise campos vacío.'});
		}
	});
 });
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Guardar usuario servicio</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="container mt-4">
			<form id="formularioUsuario" class="needs-validation">
				<div class="col sm-6">
					<div class="card">
						<div class="card-header">
							<h3>CREAR USUARIO</h3>
						</div>
						<div class="card-body">
						<div id="mensajeRespuesta" style="color: green;></div>
							<div class="form-group">
								<label>NOMBRE</label>
								<input id="name" name="name" type="text" class="form-control" required/>
								<div id="nameError" style="color: red;"></div>
								<div id="nameError2" style="color: red;"></div>
							</div>
                            <div class="form-group">
								<label>EDAD</label>
								<input id="age" name="age" type="number" class="form-control" required/>
								 <div id="ageError" style="color: red;"></div>
							</div>
                            <div class="form-group">
								<label>TELEFONO</label>
								<input id="phoneNumber" name="phoneNumber" type="number" class="form-control" required/>
								<div id="phoneNumberError" style="color: red;"></div>
							</div>
                            <div class="form-group">
								<label>DIRECCION</label>
								<input id="address" name="address" type="text" class="form-control" required/>
								<div id="addressError" style="color: red;"></div>
							</div>
						</div>
						<div class="card-footer">
							<input type="submit" value="guardar" class="btn btn-success"/>
							<a type="button" href="<%= request.getContextPath() %>/lista" class="btn btn-danger">cancelar</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<script>
    		var nameInput = document.getElementById('name');
    		var nameError = document.getElementById('nameError');
    		var isTyping = false;

    		function validateUpperCase() {
        		var nameValue = nameInput.value;
        		var words = nameValue.split(' ');
        		var allWordsCapitalized = words.every(function(word) {
            		return /^[A-Z]/.test(word);
        		});

        		if(!allWordsCapitalized) {
            		nameError.textContent = "La primera letra de cada palabra debe estar en mayuscula.";
            		nameInput.setCustomValidity("La primera letra de cada palabra debe estar en mayuscula.");
        		}else{
            		nameError.textContent = "";
            		nameInput.setCustomValidity("");
        		}

        		isTyping = false;
    		}
    		
    		function validateNumber() {
        		var nameValue = nameInput.value;
        		var num = /\d/.test(nameValue); 

        		if(num) {
            		nameError2.textContent = "No puede ingresar numeros en el campo nombre.";
            		nameInput.setCustomValidity("No puede ingresar numeros en el campo nombre.");
        		}else{
            		nameError2.textContent = "";
            		nameInput.setCustomValidity("");
        		}

        		isTyping = false;
    		}

    		nameInput.addEventListener('input', function() {
        		if(!isTyping){
            		validateUpperCase();
            		validateNumber();
        		}
    		});
    		    	
    	</script>
		
	
		
		<script>
    		var ageInput = document.getElementById('age');
    		var ageError = document.getElementById('ageError');

    		ageInput.addEventListener('input', function() {
        		var ageValue = ageInput.value;
        		if(ageValue.length !== 2 || isNaN(ageValue)) {
            		ageError.textContent = "La edad debe contener exactamente dos digitos.";
            		ageInput.setCustomValidity("La edad debe contener exactamente dos digitos.");
        		}else{
            		ageError.textContent = "";
            		ageInput.setCustomValidity("");
        		}
    		});
		</script>
		
		<script>
    		var phoneInput = document.getElementById('phoneNumber');
    		var phoneError = document.getElementById('phoneNumberError');

    		phoneInput.addEventListener('input', function() {
        		var phoneValue = phoneInput.value;
        		if(phoneValue.length !== 10 || isNaN(phoneValue)) {
            		phoneError.textContent = "El numero de telefono debe contener exactamente diez digitos.";
            		phoneInput.setCustomValidity("El numero de telefono debe contener exactamente diez digitos.");
        		}else{
            		phoneError.textContent = "";
            		phoneInput.setCustomValidity("");
        		}
    		});
		</script>
		
		<script>
    		var addressInput = document.getElementById('address');
    		var addressError = document.getElementById('addressError');

    		addressInput.addEventListener('input', function() {
        		var addressValue = addressInput.value;
        		var addressPattern = /^[A-Za-z]{4} \d{2} # \d{2}[A-Za-z]{3} - \d{2}[A-Za-z]{3}$/;

        		if(!addressPattern.test(addressValue)) {
            		addressError.textContent = "La direccion debe tener el formato guia XXXX 99 # 99XXX - 99XXX.";
            		addressInput.setCustomValidity("La direccion debe tener el formato guia XXXX 99 # 99XXX - 99XXX.");
        		}else{
            		addressError.textContent = "";
            		addressInput.setCustomValidity("");
        		}
    		});
		</script>
		
		<script>
    		$(document).ready(function() {
        		$('#formularioUsuario').submit(function(event) {
            		event.preventDefault();
            		var nombre = $('#name').val();
            		var edad = $('#age').val()
            		var tel = $('#phoneNumber').val();
            		var dir = $('#address').val();
            		
						var usuario = {
                			name: nombre,
                			age: edad,
                			phoneNumber: tel,
                			address: dir
            			};

            			$.ajax({
                			type: 'POST',
                			url: '/crear',
                			contentType: 'application/json',
                			data: JSON.stringify(usuario),
                			success: function(response) {
                    			$('#mensajeRespuesta').text(response);
                    			console.log(response);
                			},
                			error: function(xhr, status, error) {
                    			console.error(xhr.responseText);
                			}
            			});
        		});
			});
		</script>
		
				
	</body>
</html>
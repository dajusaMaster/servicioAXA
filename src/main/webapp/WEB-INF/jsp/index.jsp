<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>vista servicio</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.1/dist/sweetalert2.min.css" rel="stylesheet">
		<link href="DataTables/datatables.min.css" rel="stylesheet">
	</head>
	
	<style>
		.contenedor-flexbox{ 
    		display: flex;
    		justify-content: start;
    		margin-right: 5px;
    		max-width: 100%;
		}
	</style>
	
	<body>
		<div class="container">
			<h3 class="mt-2">ADMINISTRADOR DE USUARIOS</h3>
			<div class="contenedor-flexbox">
				<div class="container mt-4">
					<a class="btn btn-primary" href="<%= request.getContextPath() %>/crea">crear usuario</a>
				</div>
			</div>
			
			<br><br>
		
			<table class="table table-bordered" aria-describedby="mydesc" id="myTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NOMBRE</th>
						<th scope="col">EDAD</th>
						<th scope="col">TELEFONO</th>
						<th scope="col">DIRECCION</th>
						<th scope="col">ACCIONES</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			
		</div>
		<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.1/dist/sweetalert2.all.min.js"></script>
		<script src="DataTables/datatables.js"></script>
		<script>
        	$(document).ready(function() {
				$('#myTable').DataTable({
        			ajax: {
            			url: '/listar',
            			dataSrc: ''
        			},
        			columns: [
            			{ data: 'name' },
            			{ data: 'age' },
            			{ data: 'phoneNumber' },
            			{ data: 'address' },
            			{
							data: null,
								render: function(data, type, row) {
                    		return `
                        		<button class="btn btn-warning" href="#">Editar</button>
                        		<button class="btn btn-danger" href="#">Eliminar</button>
                    		`;
                			}
            			}
        			]
    			});
			});
		</script>
	</body>
</html>
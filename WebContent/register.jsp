
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>�Qu� Comemos Hoy?</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
	
	<script type="text/javascript">
	function posicionarCursor(){
		document.getElementById("usuario").focus();
	}
	</script>
	
	
<!-- 	Librerias importantes para que ande bootsStrap Validator -->
	<!-- jQuery library -->
<script src="js/jquery-2.2.0.js"></script>
<script src="js/bootstrapvalidator.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/bootstrap.min"></script>
<link rel="stylesheet" href="css/bootstrapvalidator.min.css">
 
<!-- 	Librerias importantes para que ande bootsStrap Validator -->

<!-- 	Este es el script que valida el form de registrarse!! -->
	<script>
$(document).ready(function() {
    $('#registrarse_form').bootstrapValidator({
         framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	inputUsuario: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de usuario es un campo obligatorio'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The name must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The name can only consist of alphabetical, number and underscore'
                    }
                }
            },
            altura: {
                validators: {
                    notEmpty: {
                        message: 'The price is required'
                    },
                    numeric: {
                        message: 'The price must be a number'
                    }
                }
            },
//             'size[]': {
//                 validators: {
//                     notEmpty: {
//                         message: 'The size is required'
//                     }
//                 }
//             },
            optionSexo: {
                validators: {
                    notEmpty: {
                        message: 'El sexo es un campo obligatorio'
                    }
                }
             }
//         },
        
// submitHandler: function(validator, form, submitButton) {
//     var inputUsuario = [validator.getFieldElements('firstName').val(),
//                     validator.getFieldElements('lastName').val()].join(' ');
//     alert('Hello ' + fullName);
// }
       
    }
    });
});
</script>
	
</head>
<body onload="posicionarCursor();">
    <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form class="form-horizontal" method="POST" action="register" id="registrarse_form">
				  <fieldset>
				    <legend>Ingrese sus Datos</legend>
				    <div class="form-group">
				      <label for="inputUsuario" class="col-lg-3 control-label">Usuario</label>
				      <div class="col-lg-9">
				        <input type="text" class="form-control" name ="inputUsuario" id="inputUsuario" placeholder="Usuario" required>
				      </div>
				    </div>
				    <div class="form-group">
				      <label for="inputPassword" class="col-lg-3 control-label">Contrase�a</label>
				      <div class="col-lg-9">
				        <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Contrase�a" required>
				      </div>
				    </div>
				    <div class="form-group">
				      <label for="textArea" class="col-lg-3 control-label">Fecha de Nacimiento</label>
				      <div class="col-lg-9">
				        <input class="form-control" name="fechaNacimiento" type="date" id="fechaNacimiento" placeholder="dd/mm/aaaa" required>
				      </div>
				    </div>
					<div class="form-group">
				      <label for="inputAltura" class="col-lg-3 control-label">Altura</label>
				      <div class="col-lg-9">
				        <input type="text" class="form-control" id="altura" name="altura" placeholder="Altura(cm)" required>
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-lg-3 control-label">Sexo</label>
				      <div class="col-lg-9">
				        <div class="radio">
				          <label>
				            <input type="radio" name="optionSexo"  value="M" checked="">
				            Masculino
				          </label>
				        </div>
				        <div class="radio">
				          <label>
				            <input type="radio" name="optionSexo" value="F">
				            Femenino
				          </label>
				        </div>
				      </div>
				    </div>
				    <div class="form-group">
				      <label for="select" class="col-lg-3 control-label">Complexion</label>
				      <div class="col-lg-9">
				        <select class="form-control" id="complexion" name="complexion">
				          <option value="P">Peque�a</option>
				          <option value="M">Mediana</option>
				          <option value="G">Grande</option>
				        </select>
				      </div>
				    </div>
				    <!-- Falta agregar las condiciones preexistentes, rutina y preferencias alimenticias -->
				    <div class="form-group">
				      <label for="select" class="col-lg-3 control-label">Dieta</label>
				      <div class="col-lg-9">
				        <select class="form-control" id="dieta" name="dieta">
				          <option value="N">Normal</option>
				          <option value="V">Vegetariano</option>
				          <option value="VEG">Vegano</option>
				          <option value="OLV">Ovolacteovegetariano</option>
				        </select>
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-lg-3 control-label">Rutina</label>
				      <div class="col-lg-9">
				        <div class="radio">
				          <label>
				            <input type="radio" value="LEVE" name="rutina">Sedentaria con algo de ejercicio (-30 min.) [LEVE]
				          </label>
				        </div>
				        <div class="radio">
				          <label>
				            <input type="radio" value="NADA" name="rutina">Sedentaria con nada de ejercicio [NADA]
				          </label>
				        </div>
				        <div class="radio">
				          <label>
				            <input type="radio" value="MEDIANO" name="rutina">Sedentaria con ejercicio [MEDIANO]
				          </label>
				        </div>
				        <div class="radio">
				          <label>
				            <input type="radio" value="MEDIO_INTENSIVO" name="rutina">Activa con ejercicio adicional (+30 min.) [MEDIO-INTENSIVO]
				          </label>
				        </div>
				        <div class="radio">
				          <label>
				            <input type="radio" value="INTENSIVO" name="rutina">Activa con ejercicio adicional (+30 min.) [INTENSIVO]
				          </label>
				        </div>
				      </div>
				    </div>
				    
				    
				    <div class="form-group">
				      <div class="col-lg-9 col-lg-offset-3">
				        <button type="reset" class="btn btn-default">Cancelar</button>
				        <button type="submit" class="btn btn-primary">Aceptar</button>
				      </div>
				    </div>
				  </fieldset>
				</form>
			</div>
		</div>
	</div>
    
<!--       Las comento porque actualice las librerias y me tiraba error... por favor revisar que no rompi nada!! -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<!--     <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="es">

<!-- De esta forma se van a recibir todos los datos necesarios para la pagina -->
<%@page import="java.util.*" %>
<%  
	String seCreoOkCondimento = (String) session.getAttribute("seCreoOkCondimento");
%>

<head>
	<meta charset="UTF-8">
	<title>Qué Comemos Hoy?</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	function comfirm_decision(){
	    if(confirm("Seguro que quieres descartar los cambios?")) // this will pop up confirmation box and if yes is clicked it call servlet else return to page
	     {
 	       window.location="listadoDeRecetas.jsp"; 
	     }else{
	       return false;
	    }
	   return true;
	 }
	</script>

<script type="text/javascript">
	function logout(){
	    if(confirm("Seguro que quieres cerrar la sesion?")) // this will pop up confirmation box and if yes is clicked it call servlet else return to page
	     {
	    	window.location="logout.jsp"; 
	     }else{
	       return false;
	    }
	   return true;
	 }
</script>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
	<script src="js/jquery-2.2.0.js"></script>
	<script src="js/bootstrapvalidator.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
	<script src="js/bootstrap.min"></script>
	<link rel="stylesheet" href="css/bootstrapvalidator.min.css">


		<!-- 	Este es el script que valida el form de registrarse!! -->
		<script>
	$(document).ready(function() {
	    $('#crearCondimento_form').bootstrapValidator({
	         framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	inputNombre: {
	                validators: {
	                    notEmpty: {
	                        message: 'El nombre es un campo obligatorio'
	                    },
	                    stringLength: {
	                        min: 4,
	                        max: 30,
	                        message: 'El nombre debe tener entre 4 y 30 caracteres'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_]+$/,
	                        message: 'El nombre solo puede tener valores alfanumericos y guiones bajos'
	                    }
	                }
	            },
	            inputTipo: {
	                validators: {
	                    notEmpty: {
	                        message: 'El tipo es un campo obligatorio'
	                    },
	                    stringLength: {
	                        min: 4,
	                        max: 30,
	                        message: 'El tipo debe tener entre 4 y 30 caracteres'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_]+$/,
	                        message: 'El tipo solo puede tener valores alfanumericos y guiones bajos'
	                    }
	                }
	            },
	                     
	    }}
	    );
	});
	</script>


	
	</head>


<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navegacion-kd">
						<span class="sr-only"> Desplegar / Ocultar Menu</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
					<a href="creditos.jsp" class="navbar-brand">Que Comemos Hoy?</a>
                    <ul class="nav navbar-nav">
						<li><a href="welcome.jsp">Inicio</a></li>
						<li><a href="misGrupos.jsp">Mis Grupos</a></li>
						<li><a href="listadoDeRecetas.jsp">Mis Recetas</a></li>
						<li><a href="misDatos.jsp">Mis Datos</a></li>
						<li><a href="reportes.jsp">Reportes</a></li>
						<li><a href="#" onclick="logout();">Cerrar Sesión</a></li>
					</ul>
				</div>
				<!-- Inicia Menu -->
				<div class="collapse navbar-collapse" id="navegacion-kd">
					<form action="ListarRecetasEncontradas" method="post" class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Buscar Receta" name="buscar_nombreReceta">
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
				
				<% if (seCreoOkCondimento.equals("yes")) {
 				 out.println("<div class=\"alert alert-success fade in\">");
    out.println("<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>");
     out.println("<strong>Success!</strong> El condimento se creo correctamente.");
   out.println("</div>");
 	  session.setAttribute("seCreoOkCondimento", "no");	//reseteo el flag
 				}
  				
  				%>
				
			</div>
		</nav>

<section class="jumbotron jumbotron-kd">
		<div class="container">
			<h1>Qué Comemos Hoy?</h1>
			<p>Crear Ingredientes</p>
						
			<a class="btn btn-default" href="crearIngredientes.jsp" role="button" id="crearIngrete" data-toggle="tooltip" title="siguiente paso" data-placement="bottom">
				 	Volver al paso 1 &nbsp; <span class="glyphicon glyphicon-arrow-left"></span></a> 
			
			<a class="btn btn-default" href="nuevaReceta.jsp" role="button" id="nuevaReceta" data-toggle="tooltip" title="siguiente paso" data-placement="bottom">
				 	Paso 3 &nbsp;<span class="glyphicon glyphicon-arrow-right"></span></a> 
		</div>
		
</section>


<section class="main container">

<div class="panel-body">
			<div class="panel panel-default" id="condimentos">
				<div class=panel-heading>  <h3>Paso 2: &nbsp; Agregar Condimento</h3> </div>
				<div class="panel-body" id="1">		
				
					<form class="form-horizontal" method="POST" action="ABM_CONDIMENTO" id="crearCondimento_form">
				  <fieldset>
				       <div class="form-group">
				      <label for="inputNombre" class="col-lg-3 control-label">Nombre Condimento</label>
				      <div class="col-lg-9">
				        <input type="text" class="form-control" name ="inputNombre" id="inputNombre" placeholder="Nombre Condimento" required>
				      </div>
				    </div>
				    <div class="form-group">
				      <label for="inputTipo" class="col-lg-3 control-label">Tipo Condimento</label>
				      <div class="col-lg-9">
				        <input type="text" class="form-control" id="inputTipo" name="inputTipo" placeholder="Tipo Condimento" required>
				      </div>
				    </div>
				   
				    <input type="hidden" name="esCrearCondimento" id="esCrearCondimento" value="si">
				    
	<div class="form-group">
				      <div class="col-lg-9 col-lg-offset-3">
				        <!-- Cancelar edicion -->
			<button type="button" id="evento_descartar" name="evento_descartar" class="btn btn-default" onclick="comfirm_decision()" >
				Descartar     <span class=" glyphicon glyphicon-remove"></span>
			</button>
				    
				       <!-- Modificar Datos  -->
			<button type="submit" id="evento_aceptar" name="evento_aceptar" class="btn btn-default">
				Aceptar     <span class=" glyphicon glyphicon-ok"></span>
			</button>
			</div>
	</div>
	</fieldset>
</form>
	</div>
	</div>
</div>
</section>

</body>
</html>
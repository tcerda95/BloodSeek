<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
					<link rel="stylesheet" href="<c:url value="/resources/css/general.css"/>">

	</head>
	<body>
		<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="/"/>">
				<img alt="Bloodseek" src="<c:url value="/resources/img/logo.png"/>">
			</a>
		</div>
		
		<div class="collapse navbar-collapse" id="navbar-collapse-1"> 
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/"/>">Inicio<span class="sr-only">(current)</span></a></li>
				<li class="active"><a href="<c:url value="/help"/>">¿Cómo dono?</a></li>
			  </ul>
			<a href="<c:url value="/create"/>" class="btn navbar-btn ask-donation-btn">Pedir donación</a>
		</div>
	</div>
</nav>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Preguntas frecuentes sobre la donación de sangre</h1>
				</div>
			</div>
		    <div class="panel-group" id="faqAccordion">
		        <div class="panel panel-default ">
		            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
		                 <h4 class="panel-title">
							<a href="#" class="ing">¿Por qué donar sangre?</a>
		              	</h4>
		            </div>
		            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
		                <div class="panel-body">
		                     <h5><span class="label label-primary"></span></h5>
		                    <p>
		                    Porque a pesar de los avances científicos y tecnológicos, la sangre humana no puede producirse artificialmente y debe proceder de la generosidad del ser humano, único capaz de fabricarla en su propio organismo.
		                    </p>
		                </div>
		            </div>
		        </div>
		        <div class="panel panel-default ">
		            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
		                 <h4 class="panel-title">
		                    <a href="#" class="ing">¿Qué necesito para donar sangre?</a>
		              </h4>
		
		            </div>
		            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
		                <div class="panel-body">
		                     <h5><span class="label label-primary"></span></h5>
		                    <p>
		                    	Edad: 18 a 65 años 
							Entre 16 y 18 años, con autorización de los padres. 
							Concurrir con DNI. 
							No es necesario estar en ayunas. (Evitar grasas y lacteos) 
							Estar en buen estado de salud. 
							Descansar bien previamente. 
							Pesar más de 50 kg. 
							Si es mujer, no estar embarazada ni dentro de las 8 semanas posteriores. 
							Tatuajes y piercings deben tener más de seis meses de realizados para donar
		                    </p>
		                </div>
		            </div>
		        </div>
		        <div class="panel panel-default ">
		            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
		                 <h4 class="panel-title">
		                    <a href="#" class="ing">¿A quién le puedo donar sangre?</a>
		              </h4>
		
		            </div>
		            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
		                <div class="panel-body">
		                     <h5><span class="label label-primary"></span></h5>
							<p> CUADRO DE TIPOS DE SANGRE</p>
		                    
		                </div>
		            </div>
		        </div>
		        
		    </div>
		    <!--/panel-group-->
		</div>
		<%-- jQuery --%>
		<script type="text/javascript" src="<c:url value="https://code.jquery.com/jquery-2.1.1.min.js"/>"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>

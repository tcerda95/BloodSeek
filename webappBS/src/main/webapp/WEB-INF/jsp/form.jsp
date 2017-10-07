<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	    <link rel="stylesheet" href="<c:url value="/resources/css/form.css"/>">

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>" crossorigin="anonymous">
	
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
				<li><a href="<c:url value="/help"/>">Ayuda</a></li>
            </ul>
        </div>
    </div>
</nav>
	<div class="container">
		<c:url value="/create" var="postPath" />
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="title">Registrá un aviso de donación</div>
			</div>
		<div class="row">
			<form:form modelAttribute="createForm" action="${postPath}" method="post" class="form-horizontal">
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="name" class ="col-sm-3 control-label">Nombre:</form:label>
						<div class="col-sm-4">
							<form:input type="text" path="name" class="form-control" placeholder="Nombre" maxlength="64"/>
						</div>
						<form:label path="age" class ="col-sm-1 control-label">Edad:</form:label>
						<div class="col-sm-1">
							<form:input type="text" path="age" class="form-control" placeholder="Edad"/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="bloodType" class ="col-sm-3 control-label">Tipo de Sangre:</form:label>
						<div class="col-sm-1">
							<form:select path="bloodType" class="form-control">
								<c:forEach var="bloodTypeOption" items="${bloodTypes}">
									<option value="${bloodTypeOption}">${bloodTypeOption.name}</option>
								</c:forEach>
							</form:select>
						</div>
						<form:label path="donorsNeeded" class ="col-sm-2 control-label">Donaciones necesitadas:</form:label>
						<div class="col-sm-1">
							<form:input type="text" path="donorsNeeded" class="form-control" placeholder=""/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label class="col-sm-3 control-label">Punto de donación:</label>
						<div class="col-sm-6" >
							<input class="form-control" id="place-input" type="text" placeholder="Punto de donación"/>
						</div>
						<c:forEach items="${createForm.hospitals}" varStatus="status">
							<form:input type="text" data-find="" path="hospitals[${status.index}].name" class="hide"/>
							<form:input type="text" data-find="" path="hospitals[${status.index}].address" class="hide"/>
							<form:input type="text" data-find="" path="hospitals[${status.index}].latitude" class="hide"/>
							<form:input type="text" data-find="" path="hospitals[${status.index}].longitude" class="hide"/>
						</c:forEach>
					</div>
				</div>
				
				<c:forEach begin="0" end="${hospitalNum}" var="idx">
					<div class="panel panel-default col-md-4 col-md-offset-3 hospital-card hospital-hide" id="hospital-card${idx}">
						<div class="row">
							<div class="col-md-12 hospital-name"></div>
						</div>
						<div class="row">
							<div class="col-md-12 hospital-address"></div>
						</div>
					</div>
				</c:forEach>
				
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="description" class ="col-sm-3 control-label">Mensaje del donatario:</form:label>
						<div class="col-sm-6">
							<form:textarea path="description" class="form-control" placeholder="Descripción"/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="password" class ="col-sm-3 control-label">Contraseña para editar:</form:label>
						<div class="col-sm-3">
							<form:password path="password" class="form-control" placeholder="Contraseña"/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 centered">
						<input class="btn post-btn" type="submit" value="Publicar"/>
					</div>
				</div>
			</form:form>
		</div>
		
	</div>


	<%-- index.js --%>
	<script type="text/javascript" src="<c:url value="/resources/js/index.js"/>"></script>
	<%-- jQuery --%>
	<script type="text/javascript" src="<c:url value="https://code.jquery.com/jquery-2.1.1.min.js"/>"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script>

	var hospitalNum = 0;
	
	function mapForm() {
		var input = document.getElementById("place-input");

		var autocomplete = new google.maps.places.Autocomplete(input, {});
		autocomplete.addListener('place_changed', function() {
			console.log(autocomplete.getPlace());
			
			var place = autocomplete.getPlace();
			var frontAddr = place.address_components[1].short_name + " " + place.address_components[0].short_name + ", " + 
						place.address_components[4].short_name + ", " + place.address_components[5].short_name;

			console.log($("#hospitals" + hospitalNum + "\\.name"));
			
			$("#hospitals" + hospitalNum + "\\.name").attr("value", place.name);
			$("#hospitals" + hospitalNum + "\\.address").attr("value", place.address_components[1].long_name + " " + place.address_components[0].long_name);
			$("#hospitals" + hospitalNum + "\\.latitude").attr("value", place.geometry.location.lat());
			$("#hospitals" + hospitalNum + "\\.longitude").attr("value", place.geometry.location.lng());

			$("#hospital-card"+ hospitalNum).show()
			$("#hospital-card"+ hospitalNum).find(".hospital-name").append(place.name);
			$("#hospital-card"+ hospitalNum).find(".hospital-address").append(frontAddr);
			
			hospitalNum += 1;
		});	
	}

		
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6N15_BF6SfeCXrGdzzmGnl8IFS0DsyYU&callback=mapForm&libraries=places"></script>
</body>
</html>
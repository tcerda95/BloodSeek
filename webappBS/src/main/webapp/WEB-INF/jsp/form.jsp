<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<c:url value="/create" var="postPath" />
		<div class="row">titulo</div>
		<div class="row">
			<form:form modelAttribute="createForm" action="${postPath}" method="post" class="form-horizontal">
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="name" class ="col-sm-3 control-label">Nombre:</form:label>
						<div class="col-sm-9">
							<form:input type="text" path="name" class="form-control" placeholder="Nombre" maxlength="64"/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="age" class ="col-sm-3 control-label">Edad:</form:label>
						<div class="col-sm-9">
							<form:input type="text" path="age" class="form-control" placeholder="Edad"/>
						</div>
					</div> 
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<form:label path="bloodType" class ="col-sm-3 control-label">Tipo de Sangre:</form:label>
						<div class="col-sm-9">
						<form:select path="bloodType" class="form-control">
							<c:forEach var="bloodTypeOption" items="${bloodTypes}">
								<option value="${bloodTypeOption}">${bloodTypeOption.name}</option>
							</c:forEach>
						</form:select>
						</div>
					</div> 
				</div>
			
			</form:form>
		</div>
		
		
	</div>


	<%-- index.js --%>
	<script type="text/javascript" src="<c:url value='/resources/js/index.js'/>"></script>
	<%-- jQuery --%>
	<script type="text/javascript" src="<c:url value='https://code.jquery.com/jquery-2.1.1.min.js'/>"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
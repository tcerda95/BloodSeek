<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>" crossorigin="anonymous">
</head>

<body>
	<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">titulo</div>
	</div>


	<%-- index.js --%>
	<script type="text/javascript" src="<c:url value='/resources/js/index.js'/>"></script>
	<%-- jQuery --%>
	<script type="text/javascript" src="<c:url value='https://code.jquery.com/jquery-2.1.1.min.js'/>"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
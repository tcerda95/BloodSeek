<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="/"/>">
				<img alt="Bloodseek" src="<c:url value="/resources/img/logo.png"/>">
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value="/"/>">Inicio<span class="sr-only">(current)</span></a></li>
				<li><a href="<c:url value="/help"/>">Ayuda</a></li>
			  </ul>
			<a href="<c:url value="/create"/> class="btn navbar-btn ask-donation-btn">Pedir donación</a>
			
		</div>
	</div>
</nav>
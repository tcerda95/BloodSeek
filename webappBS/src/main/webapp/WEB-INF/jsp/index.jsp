<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

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
                <li class="active"><a href="<c:url value="/"/>">Inicio<span class="sr-only">(current)</span></a></li>
                <li><a href="#">¿Cómo dono?</a></li>
            </ul>
            <button type="button" class="btn navbar-btn ask-donation-btn">Pedir donación</button>
        </div>
    </div>
</nav>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="titleContainer">
            <span class="pageTitle">¡Busca quién necesita sangre y dona!</span>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <c:forEach items="${grantees}" var="g">
            <div class="panel panel-default grantee-card">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="imgContainer">
                                <img class="grantee-img" src="<c:url value="https://trip101.com/assets/default_profile_pic-9c5d869a996318867438aa3ccf9a9607daee021047c1088645fbdfbbed0e2aec.jpg"/>" alt="picture">
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="cardInfoContainer">
                                <div class="row">
                                    <div class="grantee-nameContainer">
                                        <div class="grantee-name">
                                                ${g.name}
                                                <%--Pedro Balaguer--%>
                                        </div>
                                        <div class="ageContainer">
                                            <span class="grantee-age">${g.age} años</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="blood-types grantee-bloodType">
                                                <span class="blood-type">
                                                    A+
                                                </span>
                                                <span class="blood-type">
                                                    A-
                                                </span>
                                                <span class="blood-type">
                                                    B+
                                                </span>
                                                <span class="blood-type">
                                                    B-
                                                </span>
                                                <span class="blood-type">
                                                    O-
                                                </span>
                                            </div>
                                        </div>
                                            <%--<div class="row">--%>
                                            <%--<div class="grantee-remainingTime">--%>
                                            <%--26 días restantes--%>
                                            <%--</div>--%>
                                            <%--</div>--%>
                                        <div class="row">
                                            <c:forEach items="${g.hospitals}" var="h">
                                                <div class="grantee-hospital">
                                                        ${h.name}
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="percentageContainer">
                                            <div class="completedPercentage">
                                                    ${1.0 * g.actualDonated / g.donorsNeeded * 100}%
                                                    <%--50%--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<%-- jQuery --%>
<script type="text/javascript" src="<c:url value='https://code.jquery.com/jquery-2.1.1.min.js'/>"></script>
<%-- index.js --%>
<script type="text/javascript" src="<c:url value='/resources/js/index.js'/>"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>

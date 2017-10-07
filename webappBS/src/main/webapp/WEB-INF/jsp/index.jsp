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

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <c:forEach items="${grantees}" var="g">
            <div class="grantee-card">
                <div class="row">
                    <div class="col-md-3">
                        <div class="imgContainer">
                            <img class="grantee-img" src="<c:url value="https://trip101.com/assets/default_profile_pic-9c5d869a996318867438aa3ccf9a9607daee021047c1088645fbdfbbed0e2aec.jpg"/>" alt="picture">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="grantee-nameContainer">
                                <div class="grantee-name">
                                    Nombre Apellido
                                </div>
                                <div class="grantee-age">
                                    26 años
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="grantee-bloodType">
                                        O+
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="grantee-remainingTime">
                                        26 días restantes
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="grantee-hospital">
                                        Hospital ASD
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="completedPercentage">
                                    50%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
        </c:forEach>
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

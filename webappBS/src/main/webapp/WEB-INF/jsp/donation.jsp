<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="<c:url value="/resources/css/donation.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/css/general.css"/>">
	</head>
	
	<body>
		<%@include file="navbar.jsp" %>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="row">
						<div class="row">
							<div class="col-md-12">
								<span class="grantee-name">Luciano Bianchi</span>
								<span class="grantee-age">21 años</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="blood-needed">
											Necesita sangre de tipo:
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="blood-types">
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
								</div>
							</div> 
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="donation-limit-date">Necesita donaciones hasta el: 08/10/2017</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<p class="grantee-bio">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent gravida massa et sapien vehicula, et varius augue ultrices. Ut posuere eros quis ligula iaculis sollicitudin. Vestibulum odio felis, luctus vel sapien vitae, gravida dignissim metus. Quisque hendrerit neque ut lorem eleifend ullamcorper. Ut tincidunt vulputate velit, a posuere orci aliquam in. In hac habitasse platea dictumst. Maecenas et nisi augue. Nunc mollis nec mauris eu dignissim. Sed euismod sem ac consequat iaculis. Maecenas facilisis laoreet nisi, in sagittis nunc vehicula non. Fusce blandit volutpat justo, eu sodales orci aliquet in. Morbi aliquam, turpis ut maximus consectetur, mi velit vehicula orci, quis mattis risus tortor ac nunc. Aliquam cursus velit ac massa mollis eleifend. In hac habitasse platea dictumst. Nam magna velit, commodo in elit quis, bibendum vehicula neque.</p>
				</div>
			</div>	
			<!-- hospitales -->
			<div class="row">
				<div class="col-md-5">
					<div class="row">
						<div class="col-md-12">
							<div class="where-to-donate">¿Donde donar?</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="donation-place panel panel-default">
								<div class="panel-body">
									<div class="donation-place-name">Hospital de Clínicas</div>
									<div class="donation-place-info">Montes de Oca 380</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="panel panel-default">
						<div class="panel-body">
							<div id="googleMap" style="width:100%;height:400px;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<span>Redes Sociales</span>
					<span></span>
					<span></span>
				</div>
			</div>
		</div>

		<script>
			function myMap() {
				var mapProp= {
					center:new google.maps.LatLng(51.508742,-0.120850),
					zoom:12,
				};
				var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(52, -0.121)
				});

				var infowindow = new google.maps.InfoWindow({
					content:"Hello World!"
				});

				infowindow.open(map, marker);

				marker.setMap(map);

			};		
		</script>
		
<!--		API KEY URL SHORTENER: AIzaSyAdU3wmVgwO_MJ5X2IMXKXz9lTAJ__tyvQ-->

		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6N15_BF6SfeCXrGdzzmGnl8IFS0DsyYU&callback=myMap&libraries=places"></script>
		<script   src="https://code.jquery.com/jquery-3.2.1.min.js"   integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="   crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>

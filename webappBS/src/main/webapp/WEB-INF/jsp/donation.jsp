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
		<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="/"/>">
				<img alt="Bloodseek" src="<c:url value="/resources/img/logo2.png"/>">
			</a>
		</div>
		
		<div class="collapse navbar-collapse" id="navbar-collapse-1"> 
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/"/>">Inicio<span class="sr-only">(current)</span></a></li>
				<li><a href="<c:url value="/help"/>">Ayuda</a></li>
			  </ul>
			<a href="<c:url value="/create"/>" class="btn navbar-btn ask-donation-btn">Pedir donación</a>
		</div>
	</div>
</nav>
		<div class="container" id="img-canvas">
			<div class="row">
				<div class="col-md-5">
					<div id="img-canvas">
					<div class="row">
						<div class="row">
							<div class="col-md-12">
								<span class="grantee-name">${grantee.name}</span>
								<span class="grantee-age">${grantee.age} años</span>
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
											 <c:forEach items="${donorBloodTypes}" var="bloodType">
												<span class="blood-type">
													${bloodType.name}
												</span>
											</c:forEach>
										</div>
									</div>
								</div>
							</div> 
						</div>
<!--
						<div class="row">
							<div class="col-md-12">
								<div class="donation-limit-date">Necesita donaciones hasta el: 08/10/2017</div>
							</div>
						</div>
-->
						<div class="row">
						<div class="col-md-12">
							<div class="where-to-donate">¿Donde donar?</div>
						</div>
					</div>
						<c:forEach items="${hospitalsAvailable}" var="hospital" varStatus="lo">
							<div class="row">
								<div class="col-md-12">
									<div id="place-${lo.index}" class="donation-place panel panel-default place-panel">
										<div class="panel-body">
											<div class="donation-place-name">${hospital.name}</div>
											<div class="donation-place-info">${hospital.address}</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach> 
					</div>					
					</div>
				</div>
				<div class="col-md-7">
					<div class="row">
						<div class="col-md-12">
							<div class="grantee-msg">Mensaje de ${grantee.name}:</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						<p class="grantee-bio">${grantee.description}</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div id="googleMap" style="width:100%;height:400px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="row">
				<div class="col-md-12">
					<span>
						<button id="copy-link-btn" class="btn btn-default" type="submit"><span class="glyphicon glyphicon-link" data-toggle="tooltip" data-placement="bottom" title="Copiado al portapapeles"></span>Copiar Link</button>
					</span>
<!--
					<span>
						<button id="download-img-btn" class="btn btn-default" type="submit"><span class="glyphicon glyphicon-download-alt"></span>Descargar como imagen</button>
					</span>
-->
				</div>
			</div>
			<div class="row share-buttons-row">
				<div class="col-md-12">
					<span id="fb-root" class="fb-share-button" data-href="#" data-layout="button" data-size="large" data-mobile-iframe="false"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">Compartir</a></span>
					<span><a class="twitter-share-button"
					  	href="https://twitter.com/intent/tweet"
					  	data-size="large">
							Tweet</a>
					</span>
				</div>
			</div>
		</div>

		<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.10";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		window.twttr = (function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0],
				t = window.twttr || {};
			if (d.getElementById(id)) return t;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js, fjs);

			t._e = [];
			t.ready = function(f) {
				t._e.push(f);
			};

			return t;
		}(document, "script", "twitter-wjs"));
		</script>
		
		<script>
		
			
		function myMap() {
			var mapProp= {
				center:new google.maps.LatLng(${hospitalsAvailable[0].latitude},${hospitalsAvailable[0].longitude}),
				zoom:12,
			};
			var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
			
			<c:forEach items="${hospitalsAvailable}" var="hospital" varStatus="loop">
				var marker${loop.index} = new google.maps.Marker({
					position: new google.maps.LatLng(${hospital.latitude}, ${hospital.longitude})
				});

				var infowindow${loop.index} = new google.maps.InfoWindow({
					content: "${hospital.name}"
				});

				infowindow${loop.index}.open(map, marker${loop.index});

				marker${loop.index}.setMap(map);
			</c:forEach>
			
			function moveToLocation(lat, lng){
			 var center = new google.maps.LatLng(lat, lng);
			 map.panTo(center);

		  	}
			
			<c:forEach items="${hospitalsAvailable}" var="hospital" varStatus="loop">
				$('#place-${loop.index}').on('click', function() {
					moveToLocation(${hospital.latitude}, ${hospital.longitude});
				});
			
			</c:forEach>
		};		
		</script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
		<script   src="https://code.jquery.com/jquery-3.2.1.min.js"   integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="   crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/clipboard@1/dist/clipboard.min.js"></script>
		<script src="<c:url value="/resources/js/donation.js"/>"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6N15_BF6SfeCXrGdzzmGnl8IFS0DsyYU&callback=myMap&libraries=places"></script>
		
	</body>
</html>

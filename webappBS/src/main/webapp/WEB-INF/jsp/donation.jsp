<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
	<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	</head>
	<body>
	<h2>Hello World!</h2>
	<h3>${greeting}</h3>
	<h3>${grantee.name}</h3>
		
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div classs="col-md-4">
						<div class="profile-img-holder">
							<img src="http://cdn2.hermandadblanca.org/wp-content/uploads/2016/04/hermandadblanca_org_circulacian-de-la-sangre-620x449.jpg">
						</div>
					</div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-8">
								<h4>Luciano Bianchi</h4>
							</div>
							<div class="col-md-4">
								<h4>21 años</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="blood-needed">
									<h4>Necesita sangre de tipo:</h4>
								</div>
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
						<div class="row">
							<div class="col-md-12">
								<span>Necesita donaciones hasta el: </span>
								<span class="donation-limit-date">08/10/2017</span>
							</div>
						</div>
					</div>
				</div>
				<!-- hospitales -->
				<div class="row">
					<div class="col-md-12">
						<h3>Donde donar: </h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h5>Hospital de Clínicas</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h5>Garrahan</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h5>Hospital de Niños</h5>
					</div>
				</div>
			</div>	
			<div class="col-md-6">
				<input id="pac-input" class="controls" type="text" placeholder="Start typing here">
	<div id="googleMap" style="width:100%;height:400px;"></div>

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

					var input = document.getElementById("pac-input");

					var autocomplete = new google.maps.places.Autocomplete(input, {});
					autocomplete.addListener('place_changed', function() {
						console.log(autocomplete.getPlace());
					});
				};		
				</script>
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
		
	<script   src="https://code.jquery.com/jquery-3.2.1.min.js"   integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="   crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>

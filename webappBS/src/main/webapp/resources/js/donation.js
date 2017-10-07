function copyTextToClipboard(text) {
	var textArea = document.createElement("textarea");

	textArea.style.position = 'fixed';
	textArea.style.top = 0;
	textArea.style.left = 0;
	textArea.style.width = '2em';
	textArea.style.height = '2em';
	textArea.style.padding = 0;
	textArea.style.border = 'none';
	textArea.style.outline = 'none';
	textArea.style.boxShadow = 'none';
	textArea.style.background = 'transparent';
	textArea.value = text;
	document.body.appendChild(textArea);
	textArea.select();
	try {
		var successful = document.execCommand('copy');
		var msg = successful ? 'successful' : 'unsuccessful';
		console.log('Copying text command was ' + msg);
		if (successful)
			console.log('Copied ' + text + ' to clipboard')
			} catch (err) {
				console.log('Oops, unable to copy');
			}
	document.body.removeChild(textArea);
}

$('#copy-link-btn').on('click', function(event) {
	copyTextToClipboard(window.location.href);
	$('#copy-link-btn').tooltip('show')
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

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

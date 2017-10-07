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

//html2canvas(document.body, {
//    proxy: 'html2canvasproxy.php',
//    useCORS: true,
//	allowTaint: false,
//    onrendered: function (canvas) {
//        var dataUrl= canvas.toDataURL("image/png");
//		document.body.appendChild(canvas);
//		console.log(dataUrl);
//    },
//	  width: 620,
//  height: 500
//});
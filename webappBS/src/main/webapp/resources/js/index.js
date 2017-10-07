
// if ("geolocation" in navigator) {
//     navigator.geolocation.getCurrentPosition(function (position) {
//         var longitude = position.coords.longitude
//         var latitude = position.coords.latitude
//     })
// } else {
//     // no hay geolocalización
// }

$("#applyFilter").click(function () {
    window.location.hash = "O"
})
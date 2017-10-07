
// if ("geolocation" in navigator) {
//     navigator.geolocation.getCurrentPosition(function (position) {
//         var longitude = position.coords.longitude
//         var latitude = position.coords.latitude
//     })
// } else {
//     // no hay geolocalización
// }

$("#applyFilter").click(function () {
    var param = ""
    if ($("input#OChkBox").is(":checked")) {
        param += "O"
    }
    if ($("input#OOChkBox").is(":checked")) {
        param += "o"
    }
    if ($("input#AChkBox").is(":checked")) {
        param += "A"
    }
    if ($("input#AAChkBox").is(":checked")) {
        param += "a"
    }
    if ($("input#BChkBox").is(":checked")) {
        param += "B"
    }
    if ($("input#BBChkBox").is(":checked")) {
        param += "b"
    }
    if ($("input#CChkBox").is(":checked")) {
        param += "C"
    }
    if ($("input#CCChkBox").is(":checked")) {
        param += "c"
    }
    window.location.hash = param
    location.reload()
})
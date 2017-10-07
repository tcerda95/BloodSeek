
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
    if($("input#nearMe").is(":checked")) {
        navigator.geolocation.getCurrentPosition(
            function (position) {
                window.location.href = contextPath + "?bloodType=" + param
                var longitude = position.coords.longitude
                var latitude = position.coords.latitude
                console.log(longitude)
                console.log(contextPath + "?bloodType=" + param + "&?lat=" + latitude + "&?long=" + longitude)
                window.location.href = contextPath + "?bloodType=" + param + "&?lat=" + latitude + "&?long=" + longitude
            },
            function(error){
                console.log(error)
                alert("Error al obtener la localización")
            }, {
                enableHighAccuracy: true
                ,timeout : 5000
            })
    } else {
        window.location.href = contextPath + "?bloodType=" + param
    }
})
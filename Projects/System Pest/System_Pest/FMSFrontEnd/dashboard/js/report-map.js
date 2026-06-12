var geocoder;

obj = JSON.parse(localStorage.row)

var lat = obj.PosY
var lng = obj.PosX

function initialize() {

    geocoder = new google.maps.Geocoder();

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 10,
        center: new google.maps.LatLng(1.3000, 103.8000),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        zoomControl: true
    });




}


google.maps.event.addDomListener(window, 'load', initialize);





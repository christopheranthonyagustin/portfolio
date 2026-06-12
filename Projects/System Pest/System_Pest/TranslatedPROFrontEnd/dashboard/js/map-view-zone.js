
var geocoder;
obj = JSON.parse(localStorage.row);

var perimeter = obj.Perimeter;
var name = obj.Name;
var type = obj.Type;
//InfoBox Content
var company = obj.Company;
var address = obj.Location;
var color = obj.Color;
var map;
var polygon;
var pathCoordinates = new google.maps.MVCArray();

var parsePerimeter = perimeter.replace(/\),/g, "");
var coords = parsePerimeter.split(" ");
var recoords;

var infoWindow;

if (coords.length == 1) {

    for (var k = 0; k < coords.length; k++) {
        recoords = coords[k].split(",");

        var circle = {};
        circle['Zones'] = {
            center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
            radius: recoords[2]
            //radius: 100
        };


        var zoneCircle;


    }

    function initialize() {
        // Create the map.
        var mapOptions = {
            zoom: 10,
            center: new google.maps.LatLng(13.7500, 100.4833),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        };

        var map = new google.maps.Map(document.getElementById('map'),
            mapOptions);


        resize('map', 32);


        // Construct the circle for each value in citymap.
        // Note: We scale the area of the circle based on the population.
        for (var zone in circle) {
            var radiusOptions = {
                strokeColor: color,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: color,
                fillOpacity: 0.35,
                map: map,
                Name: name,
                center: circle[zone].center,
                radius: Math.sqrt(circle[zone].radius) * 10
            };
            // Add the circle for this city to the map.
            zoneCircle = new google.maps.Circle(radiusOptions);
        }


        map.fitBounds(zoneCircle.getBounds());

        // Add a listener for the click event.
        google.maps.event.addListener(zoneCircle, 'click', showArrayCircle);

        infoWindow = new google.maps.InfoWindow();


        // Click Zones
        google.maps.event.addListener(zoneCircle, 'click', (function (zoneCircle) {

            return function () {

                map.fitBounds(zoneCircle.getBounds());
              
            }

        })(zoneCircle));

    }

    google.maps.event.addDomListener(window, 'load', initialize);


}

else if (coords.length > 1) {


    function initialize() {

        geocoder = new google.maps.Geocoder();

        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: new google.maps.LatLng(13.7500, 100.4833),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        });

        resize('map', 32);



        for (var k = 0; k < coords.length; k++) {
            recoords = coords[k].split(",");
            pathCoordinates.push(new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])));
        }


        // Construct the polygon.
        polygon = new google.maps.Polygon({
            path: pathCoordinates,
            strokeColor: color,
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: color,
            fillOpacity: 0.35,
            Company: company,
            Name: name,
            Address: address,
            map: map
        });

        pathCoordinates = [];


        var bounds = new google.maps.LatLngBounds();
        var point = [];
        for (var i = 0; i < polygon.getPath().length; i++) {
            recoords = coords[i].split(",");
            point = new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1]));
            bounds.extend(point);
        }


        polygon.setMap(map);

        map.fitBounds(bounds);
        var listener = google.maps.event.addListener(map, "idle", function () {
            if (map.getZoom() > 18) map.setZoom(18);
            google.maps.event.removeListener(listener);
        });


        // Add a listener for the click event.
        google.maps.event.addListener(polygon, 'click', showArrays);

        infoWindow = new google.maps.InfoWindow();


        // Click Zones
        google.maps.event.addListener(polygon, 'click', (function (polygon) {

            return function () {

                var bounds = new google.maps.LatLngBounds();
                var point = [];

                var getPolygon = polygon.Pos;

                for (var i = 0; i < polygon.getPath().length; i++) {
                    getPolygonEx = getPolygon[i].split(",");
                    point = new google.maps.LatLng(parseFloat(getPolygonEx[0]), parseFloat(getPolygonEx[1]));
                    bounds.extend(point);
                }


                map.fitBounds(bounds);
                var listener = google.maps.event.addListener(map, "idle", function () {
                    if (map.getZoom() > 18) map.setZoom(18);
                    google.maps.event.removeListener(listener);
                });
            }

        })(polygon));



    }


    google.maps.event.addDomListener(window, 'load', initialize);


}





/** @this {google.maps.Polygon} */
function showArrays(event) {
    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

    var titleZone, titleCompany, titleClickedLocation;

    if (getSessionstorageValueLanguage == "en")
    {
        titleZone = "Zone";
        titleCompany = "Company";
        titleClickedLocation = "Clicked Location";
    }
    else if (getSessionstorageValueLanguage == "th")
    {
        titleZone = "โซน";
        titleCompany = "บริษัท";
        titleClickedLocation = "สถานที่ที่คลิก";
    }
    else if (getSessionstorageValueLanguage == "vn")
    {
        titleZone = "Vùng";
        titleCompany = "Công Ty";
        titleClickedLocation = "Vị trí được nhấp";
    }
    else if (getSessionstorageValueLanguage == "id")
    {
        titleZone = "Zona";
        titleCompany = "Perusahaan";
        titleClickedLocation = "Lokasi Diklik";
    }

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<strong>' + titleZone + ': &nbsp;</strong>' + this.Name + '<br>' +
    '<strong>' + titleCompany + ': &nbsp;</strong>' + this.Company + '<br>' +
    '<strong>' + titleClickedLocation + ':</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
    '<br>';

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}


function showArrayCircle(event) {

    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

    var titleZone, titleCompany, titleClickedLocation;

    if (getSessionstorageValueLanguage == "en") {
        titleZone = "Zone";
        titleCompany = "Company";
        titleClickedLocation = "Clicked Location";
    }
    else if (getSessionstorageValueLanguage == "th") {
        titleZone = "โซน";
        titleCompany = "บริษัท";
        titleClickedLocation = "สถานที่ที่คลิก";
    }
    else if (getSessionstorageValueLanguage == "vn") {
        titleZone = "Vùng";
        titleCompany = "Công Ty";
        titleClickedLocation = "Vị trí được nhấp";
    }
    else if (getSessionstorageValueLanguage == "id") {
        titleZone = "Zona";
        titleCompany = "Perusahaan";
        titleClickedLocation = "Lokasi Diklik";
    }

    var contentString = '<div><strong>' + titleZone + ':</strong>&nbsp;' + this.Name + '</div>' +
                         '<strong>' + titleCompany + ':&nbsp;</strong>' + this.Company + '</strong><br>' +
                         '<strong>' + titleClickedLocation + ':</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
                         '<br>';

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}



// handle window resize
function resize(element, offset) {
    // get window height
    var height = 0;
    if (typeof (window.innerWidth) == 'number') height = window.innerHeight;
    else if (document.documentElement && document.documentElement.clientHeight)
        height = document.documentElement.clientHeight;
    else if (document.body && document.bodyclientHeight)
        height = document.body.clientHeight;
    else if (screen.availheight)
        height = screen.availheight;
    else return;
    // update window size
    height = height - offset;
    if (height > 0)
        document.getElementById(element).style.height = height + "px";
}







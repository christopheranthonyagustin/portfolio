
var geocoder;
obj = JSON.parse(localStorage.row);

var zoneID = obj.ZoneID;
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

var map;
var poi;
var pois = [];
var infoWindowList = [];
var infoWindowListLabel = [];
var contentString;
var finalString;
var poiContent;
var markerLabel;
var markerLabels = [];

var circle = {};
var circle1 = {};
var polygon1 = {};

var polygon;
var pathCoordinates = new google.maps.MVCArray();
var polygonCoordinates = new Array();
var circleCoordinates = new Array();
var circleCoordinates1 = new Array();

if (/\s/.test(perimeter)) {
 
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
    else if (coords.length <= 2) {

        var latlng1 = coords[0];
        var latlng2 = coords[1];
        var getlatlng1 = latlng1.split(",");

        var lat1 = getlatlng1[0];
        var lon1 = getlatlng1[1];

        var getlatlng2 = latlng2.split(",");

        var lat2 = getlatlng2[0];
        var lon2 = getlatlng2[1];

        function deg2rad(deg) {
            return deg * (Math.PI / 180)
        }

        var R = 6371; // Radius of the earth in km
        var dLat = deg2rad(lat2 - lat1);  // deg2rad below
        var dLon = deg2rad(lon2 - lon1);
        var a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2)
            ;
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var d = R * c; // Distance in km

        var Radius = d * 100;

        recoords = coords[0].split(",");

        circle['Zones'] = {
            center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
            //radius: recoords[2]
            //radius: 100
            radius: Radius
        };

        for (var zone in circle) {
            var radiusOptions = {
                strokeColor: color,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: color,
                fillOpacity: 0.35,
                map: map,
                Company: company,
                Name: name,
                Pos: coords,
                zoneID: zoneID,
                center: circle[zone].center,
                radius: Math.sqrt(circle[zone].radius) * 100
            };
            // Add the circle for this city to the map.
            zoneCircle = new google.maps.Circle(radiusOptions);
        }

        circleCoordinates.push(zoneCircle);


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
    else if (coords.length >= 3) {


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
} else {

    function initialize() {
        // Create the map.
        var mapOptions = {
            zoom: 10,
            center: new google.maps.LatLng(13.7500, 100.4833),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        };

        map = new google.maps.Map(document.getElementById('map'),
            mapOptions);
        resize('map-canvas', 32);
        handlePois();

    }

    function handlePois() {
        obj = JSON.parse(localStorage.row);

        var name = obj.Name;
        //alert(name);
        var location = obj.Location;
        var company = obj.Company;

        var perimeter = obj.Perimeter.split(",");
        var latLng = new google.maps.LatLng(parseFloat(perimeter[0]), parseFloat(perimeter[1]));
        var bounds = new google.maps.LatLngBounds();
        bounds.extend(latLng);
        map.fitBounds(bounds);
        //map.setZoom(8);
        var imageUrl = 'https://chart.apis.google.com/chart?cht=mm&chs=24x32&' + 'chco=FFFFFF,' + (Math.random() * 0xFFFFFF << 0).toString(16) + '&ext=.png';
        
        poi = new google.maps.Marker({
            map: map,
            position: latLng,
            draggable: false,
            icon: imageUrl,
            title: name
        });

        pois.push(poi);

        markerLabel = new MarkerWithLabel({
            position: latLng,
            draggable: true,
            map: map,
            icon: imageUrl,
            labelContent: name,
            labelAnchor: new google.maps.Point(22, 0),
            labelClass: "labels", // the CSS class for the label
            labelStyle: { opacity: 0.75 }
        });

        markerLabels.push(markerLabel);


        // InfoBox
        poiContent = "<div class='form-group' style='color:#4C4C4C;'>" +
            "<h4 style='color:#4286CF;'>" + name + "</h4>" +
            "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
            "<tbody>" +
            "<tr>" + "<td>" +
            "<span data-l11n class='text-bold'>Location:&nbsp;</span>" + location +
            "<br />" +
            "<span data-l11n class='text-bold'>Type:&nbsp;</span>" + type +
            "<br />" +
            "<span class='text-bold'>Coordinates:&nbsp;</span>" + perimeter +
            "</td>" + "</tr>"
            "</tbody>" + "</table>" +
            "</div>"; //infobox


        setPOILabel(markerLabel);

    }

    function setPOILabel(markerLabel) {


        var getWidth;
        var getHeight;

        // please note, 
        // that IE11 now returns undefined again for window.chrome
        // and new Opera 30 outputs true for window.chrome
        // and new IE Edge outputs to true now for window.chrome
        // so use the below updated condition
        var isChromium = window.chrome,
            vendorName = window.navigator.vendor,
            isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
            isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
        if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
            // is Google chrome 
            getWidth = 220;
            getHeight = 100;
        } else {
            // not Google chrome 
            getWidth = 180;
            getHeight = 100;
        }

        var infoBubble = new InfoBubble({
            minWidth: getWidth,
            minHeight: getHeight,
            map: map,
            content: poiContent,
            shadowStyle: 1,
            //padding: 0,
            // backgroundColor: 'rgb(57,57,57)',
            borderRadius: 4,
            arrowSize: 15,
            borderWidth: 1,
            // borderColor: '#2c2c2c',
            disableAutoPan: false,
            hideCloseButton: false,
            arrowPosition: 30,
            backgroundClassName: 'phoney',
            arrowStyle: 2
        });

        infoWindowListLabel.push(infoBubble);

        infoBubble.open(markerLabel.get('map'), markerLabel);
        markerLabel.addListener('click', function () {

            infoBubble.open(markerLabel.get('map'), markerLabel);
        });

    }

    google.maps.event.addDomListener(window, 'load', initialize);


}







/** @this {google.maps.Polygon} */
function showArrays(event) {

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<strong>Zone: &nbsp;</strong>' + this.Name + '<br>' +
    '<strong>Company: &nbsp;</strong>' + this.Company + '<br>' +
    '<strong>Clicked location:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
    '<br>';

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}

function showArrayCircle(event) {

    var contentString = '<div><strong>Zone:</strong>&nbsp;' + this.Name + '</div>' +
                         '<strong>Company:&nbsp;</strong>' + this.Company + '</strong><br>' +
                         '<strong>Clicked location:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
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







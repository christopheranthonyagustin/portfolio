var getSessionstorageValueZoneColor = sessionStorage.getItem('setSessionstorageValueZoneColor');

obj = JSON.parse(localStorage.row)

var perimeter = obj.Perimeter;
var name = obj.Name;
var type = obj.Type;
//InfoBox Content
var company = obj.Company;
var address = obj.Location;
var color = obj.Color;

var pathCoordinates = new google.maps.MVCArray();
var circleCoordinates = new Array();
var polygonCoordinates = new Array();


var parsePerimeter = perimeter.replace(/\),/g, "");
var coords = parsePerimeter.split(" ");
var recoords;

var map;
var marker;

var markers = new Array();
var drawingManager;
var all_overlays = [];
var selectedShape;
var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082', '#8560a8', '#005e20', '#CBCC29', '#495f75', '#a00000', '#1B1B1B'];
var selectedColor;
var colorButtons = {};

var circle;
var circles = [];
var polygon;
var polygons = [];
var geocoder;


var rectangle;
var arrRectangle = [];

var marker1;
var marker2;

$('.clearZone').hide();

if (coords.length == 1) {

    for (var k = 0; k < coords.length; k++) {
        recoords = coords[k].split(",");

        var circle = {};
        circle['Zones'] = {
            center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
            radius: recoords[2]
        };


        var zoneCircle;


    }


    function initialize() {

        geocoder = new google.maps.Geocoder();


        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: new google.maps.LatLng(13.7500, 100.4833),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        });

        map.controls[google.maps.ControlPosition.RIGHT_TOP].push
        (document.getElementById('panel'));

        //SearchPlaces();

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
                editable: true,
                center: circle[zone].center,
                radius: Math.sqrt(circle[zone].radius) * 10
            };
            // Add the circle for this city to the map.
            zoneCircle = new google.maps.Circle(radiusOptions);
        }

        circleCoordinates.push(zoneCircle);

        map.fitBounds(zoneCircle.getBounds());

        google.maps.event.addDomListener(savebutton, 'click', function () {
            document.getElementById("Perimeter").value = "";

            var circleCenter = zoneCircle.getCenter();
            var circleRadius = zoneCircle.getRadius();

            document.getElementById("Perimeter").value +=

            circleCenter.lat() + "," + circleCenter.lng() + "," + circleRadius;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", circles.length);
            drawZone();

        });

        showControl();
       
    }


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

        map.controls[google.maps.ControlPosition.RIGHT_TOP].push
        (document.getElementById('panel'));

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
            map: map,
            editable: true

        });

        pathCoordinates = [];
        polygonCoordinates.push(polygon);

        var bounds = new google.maps.LatLngBounds();
        var point = [];
        for (var i = 0; i < polygon.getPath().length; i++) {
            recoords = coords[i].split(",");
            point = new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1]));
            bounds.extend(point);
        }


        polygon.setMap(map);
        map.fitBounds(bounds);



        // Add a listener for the click event.
        google.maps.event.addListener(polygon, 'click', showArrays);

        infoWindow = new google.maps.InfoWindow();


        // Click Zones
        google.maps.event.addListener(polygon, 'click', (function (polygon, k) {

            return function () {

                map.panTo(this.position);

            }

        })(polygon, k));


        document.getElementById("savebutton").onclick = function () {

            console.log(polygon.getPath().getArray());
            var coordsPolygon = polygon.getPath().getArray();
            document.getElementById("Perimeter").value += coordsPolygon;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", coordsPolygon.length);
            drawZone();
            
        }

        
        showControl();

    }



}


function drawZone() {


    var polyOptions = {
        strokeWeight: 0,
        fillOpacity: 0.45,
        editable: false
    };

    // Creates a drawing manager attached to the map that allows the user to draw
    // markers, lines, and shapes.
    drawingManager = new google.maps.drawing.DrawingManager({
        drawingControl: true,
        drawingControlOptions: {
            position: google.maps.ControlPosition.TOP_LEFT,
            drawingModes: [
              google.maps.drawing.OverlayType.CIRCLE,
              google.maps.drawing.OverlayType.POLYGON,
              //google.maps.drawing.OverlayType.MARKER,
              google.maps.drawing.OverlayType.RECTANGLE
            ]
        },

        markerOptions: {
            draggable: true
        },
        polylineOptions: {
            editable: true
        },
        rectangleOptions: polyOptions,
        circleOptions: polyOptions,
        polygonOptions: polyOptions,
        map: map
    });


    drawingManager.setMap(map);


    google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {
        if (event.type == google.maps.drawing.OverlayType.CIRCLE) {
            var radius = event.overlay.getRadius();
        }
    });


    google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
        all_overlays.push(e);


        if (e.type != google.maps.drawing.OverlayType.MARKER) {
            // Switch back to non-drawing mode after drawing a shape.
            drawingManager.setDrawingMode(null);

            // To hide:
            drawingManager.setOptions({
                drawingControl: false
            });

            // Add an event listener that selects the newly-drawn shape when the user
            // mouses down on it.
            var newShape = e.overlay;
            newShape.type = e.type;
            google.maps.event.addListener(newShape, 'click', function () {
                setSelection(newShape);
            });
            setSelection(newShape);
        }
    });

    // Clear the current selection when the drawing mode is changed, or when the
    // map is clicked.
    google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
    google.maps.event.addListener(map, 'click', clearSelection);
    google.maps.event.addDomListener(document.getElementById('delete-all-button'), 'click', deleteAllShape);


 
    google.maps.event.addListener(drawingManager, 'polygoncomplete', function (polygon) {

        polygons.push(polygon);

        function getCoordinates() {
            console.log(polygon.getPath().getArray());


            var coordsPolygon = polygon.getPath().getArray();
            document.getElementById("Perimeter").value += coordsPolygon;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", coordsPolygon.length);

        }

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', getCoordinates);

    });


    google.maps.event.addListener(drawingManager, 'circlecomplete', function (circle) {
        circles.push(circle);
    });



    google.maps.event.addListener(drawingManager, 'rectanglecomplete', function (rectangle) {
        arrRectangle.push(rectangle);

        var bounds = rectangle.getBounds();
        var NE = bounds.getNorthEast();
        var SW = bounds.getSouthWest();
        var NW = new google.maps.LatLng(NE.lat(), SW.lng());
        var SE = new google.maps.LatLng(SW.lat(), NE.lng());


        // Plot two markers to represent the Rectangle's bounds.
        marker1 = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(NE.lat(), SW.lng()),
            draggable: false,
            title: 'Drag me!'
        });

        marker2 = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(SW.lat(), NE.lng()),
            draggable: false,
            title: 'Drag me!'
        });

        markers.push(marker1, marker2);

        function getRectangleCoordinates() {

            document.getElementById("Perimeter").value += NW + "," + SW + "," + SE + "," + NE;

        }

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', getRectangleCoordinates);

        sessionStorage.setItem("setSessionstorageValuePerimeterLength", 4);

    });


    google.maps.event.addListener(drawingManager, 'click', function (event) {
        placeMarker(event.latLng);
    });


    google.maps.event.addDomListener(savebutton, 'click', function () {
        document.getElementById("Perimeter").value = "";
        for (var i = 0; i < circles.length; i++) {
            var circleCenter = circles[i].getCenter();
            var circleRadius = circles[i].getRadius();

            //document.getElementById("savedata").value += "circle((";
            //document.getElementById("savedata").value +=
            //circleCenter.lat().toFixed(3) + "," + circleCenter.lng().toFixed(3);
            //document.getElementById("savedata").value += "), ";
            //document.getElementById("savedata").value += circleRadius.toFixed(3) + ")\n";


            document.getElementById("Perimeter").value +=
            //circleCenter.lat().toFixed(3) + "," + circleCenter.lng().toFixed(3);
            circleCenter.lat() + "," + circleCenter.lng() + "," + circleRadius;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", circles.length);

        }
    });

}


function showControl() {


    var polyOptions = {
        strokeWeight: 0,
        fillOpacity: 0.45,
        editable: false
    };

    // Creates a drawing manager attached to the map that allows the user to draw
    // markers, lines, and shapes.
    drawingManager = new google.maps.drawing.DrawingManager({
        drawingControl: false,
        drawingControlOptions: {
            position: google.maps.ControlPosition.TOP_LEFT,
            drawingModes: [
              google.maps.drawing.OverlayType.CIRCLE,
              google.maps.drawing.OverlayType.POLYGON,
              //google.maps.drawing.OverlayType.MARKER,
              google.maps.drawing.OverlayType.RECTANGLE
            ]
        },

        markerOptions: {
            draggable: true
        },
        polylineOptions: {
            editable: true
        },
        rectangleOptions: polyOptions,
        circleOptions: polyOptions,
        polygonOptions: polyOptions,
        map: map
    });


    drawingManager.setMap(map);


    buildColorPalette();

}




/** @this {google.maps.Polygon} */
function showArrays(event) {

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<b>' + this.Name + '</b><br>' +
        'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
        '<br>';

    // Iterate over the vertices.
    //for (var i = 0; i < vertices.getLength() ; i++) {
    //    var xy = vertices.getAt(i);
    //    contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
    //        xy.lng();
    //}

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}





function placeMarker(location) {
    var marker = new google.maps.Marker({
        position: location,
        map: map,
    });
    var infowindow = new google.maps.InfoWindow({
        content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
    });
    infowindow.open(map, marker);
}

function clearSelection() {
    if (selectedShape) {
        selectedShape.setEditable(false);
        selectedShape = null;
    }
}

function setSelection(shape) {
    clearSelection();
    selectedShape = shape;

    if (shape.type == "rectangle") {

        shape.setEditable(false);
    }

    else {
        shape.setEditable(true);
    }


    selectColor(shape.get('fillColor') || shape.get('strokeColor'));
}

function deleteSelectedShape() {
    if (selectedShape) {
        selectedShape.setMap(null);
    }


}

function deleteAllShape() {
    for (var i = 0; i < all_overlays.length; i++) {
        all_overlays[i].overlay.setMap(null);
    }
    all_overlays = [];

    // To show:
    drawingManager.setOptions({
        drawingControl: true
    });

    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];


}

function selectColor(color) {
    selectedColor = color;
    for (var i = 0; i < colors.length; ++i) {
        var currColor = colors[i];
        colorButtons[currColor].style.border = currColor == color ? '2px solid #789' : '2px solid #fff';
    }

    // Retrieves the current options from the drawing manager and replaces the
    // stroke or fill color as appropriate.
    var polylineOptions = drawingManager.get('polylineOptions');
    polylineOptions.strokeColor = color;
    drawingManager.set('polylineOptions', polylineOptions);

    var rectangleOptions = drawingManager.get('rectangleOptions');
    rectangleOptions.fillColor = color;
    drawingManager.set('rectangleOptions', rectangleOptions);

    var circleOptions = drawingManager.get('circleOptions');
    circleOptions.fillColor = color;
    drawingManager.set('circleOptions', circleOptions);

    var polygonOptions = drawingManager.get('polygonOptions');
    polygonOptions.fillColor = color;
    drawingManager.set('polygonOptions', polygonOptions);

    //Set
    sessionStorage.setItem("setSessionstorageValueZoneColor", selectedColor);



    if (selectedColor != getSessionstorageValueZoneColor) {
        clearZoneColor();
        setZones();
    }



}


function clearZoneColor() {

    for (var i = 0; i < polygonCoordinates.length; i++) {
        polygonCoordinates[i].setMap(null);
    }

    for (var i = 0; i < circleCoordinates.length; i++) {
        circleCoordinates[i].setMap(null);
    }
}

function setSelectedShapeColor(color) {
    if (selectedShape) {
        if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
            selectedShape.set('strokeColor', color);
        } else {
            selectedShape.set('fillColor', color);
        }
    }
}

function makeColorButton(color) {
    var button = document.createElement('span');
    button.className = 'color-button';
    button.style.backgroundColor = color;
    google.maps.event.addDomListener(button, 'click', function () {
        selectColor(color);
        setSelectedShapeColor(color);
    });

    return button;
}

function buildColorPalette() {
    var colorPalette = document.getElementById('color-palette');
    for (var i = 0; i < colors.length; ++i) {
        var currColor = colors[i];
        var colorButton = makeColorButton(currColor);
        colorPalette.appendChild(colorButton);
        colorButtons[currColor] = colorButton;
    }
    selectColor(colors[0]);
}





google.maps.event.addDomListener(window, 'load', initialize);

//declare namespace
var search = {};

//geocode function
search.geocode = function () {

    var address = $('#SearchAsset').val();

    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);


            var infowindow = new google.maps.InfoWindow();

            marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                anchorPoint: new google.maps.Point(0, -29)

            });

            infowindow.setContent('<div><strong>' + address + '</strong><br>');
            infowindow.open(map, marker);

        }
        else {
            console.log("Geocode was not successful for the following reason: " + status);
        }

    });


}



//Search Places
function SearchPlaces() {

    var defaultBounds = new google.maps.LatLngBounds(
       new google.maps.LatLng(13.7500, 100.4833),
       new google.maps.LatLng(13.7072, 100.5710));


    var input = document.getElementById('SearchAsset');

    var options = {
        bounds: defaultBounds,
        types: ['establishment']
    };


    var autocomplete = new google.maps.places.Autocomplete(input, options);
    autocomplete.bindTo('bounds', map);


    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            //window.alert("Autocomplete's returned place contains no geometry");
            console.log("Autocomplete's returned place contains no geometry");
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
        }));
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);

    });

    autocomplete.setTypes();


}
$('#cancel-button').on('click', function (event) {
    event.preventDefault();
    var url = $(this).data('target');
    location.replace(url);
});



function setZones() {


    if (coords.length == 1) {

        for (var k = 0; k < coords.length; k++) {
            recoords = coords[k].split(",");

            var circle = {};
            circle['Zones'] = {
                center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
                radius: recoords[2]
            };


            var zoneCircle;


        }




        geocoder = new google.maps.Geocoder();


        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            center: new google.maps.LatLng(13.7500, 100.4833),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        });

        //SearchPlaces();

        // Construct the circle for each value in citymap.
        // Note: We scale the area of the circle based on the population.
        for (var zone in circle) {
            var radiusOptions = {
                strokeColor: selectedColor,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: selectedColor,
                fillOpacity: 0.35,
                map: map,
                editable: true,
                center: circle[zone].center,
                radius: Math.sqrt(circle[zone].radius) * 10
            };
            // Add the circle for this city to the map.
            zoneCircle = new google.maps.Circle(radiusOptions);
        }

        circleCoordinates.push(zoneCircle);

        map.fitBounds(zoneCircle.getBounds());

        google.maps.event.addDomListener(savebutton, 'click', function () {
            document.getElementById("Perimeter").value = "";

            var circleCenter = zoneCircle.getCenter();
            var circleRadius = zoneCircle.getRadius();

            document.getElementById("Perimeter").value +=

            circleCenter.lat() + "," + circleCenter.lng() + "," + circleRadius;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", circles.length);


        });


    }

    else if (coords.length > 1) {


        for (var k = 0; k < coords.length; k++) {
            recoords = coords[k].split(",");
            pathCoordinates.push(new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])));
        }


        // Construct the polygon.
        polygon = new google.maps.Polygon({
            path: pathCoordinates,
            strokeColor: selectedColor,
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: selectedColor,
            fillOpacity: 0.35,
            Company: company,
            Name: name,
            Address: address,
            map: map,
            editable: true

        });

        pathCoordinates = [];
        polygonCoordinates.push(polygon);

        var bounds = new google.maps.LatLngBounds();
        var point = [];
        for (var i = 0; i < polygon.getPath().length; i++) {
            recoords = coords[i].split(",");
            point = new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1]));
            bounds.extend(point);
        }


        polygon.setMap(map);
        map.fitBounds(bounds);



        // Add a listener for the click event.
        google.maps.event.addListener(polygon, 'click', showArrays);

        infoWindow = new google.maps.InfoWindow();


        // Click Zones
        google.maps.event.addListener(polygon, 'click', (function (polygon, k) {

            return function () {

                map.panTo(this.position);

            }

        })(polygon, k));


        document.getElementById("savebutton").onclick = function () {

            console.log(polygon.getPath().getArray());
            var coordsPolygon = polygon.getPath().getArray();
            document.getElementById("Perimeter").value += coordsPolygon;

            sessionStorage.setItem("setSessionstorageValuePerimeterLength", coordsPolygon.length);

        }


    }
}
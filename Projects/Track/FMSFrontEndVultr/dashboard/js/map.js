var btusername = "systemtrack";
var btpassword = "track101!";

sessionStorage.setItem("setSessionstorageValueDefaultReseller", 4);
sessionStorage.setItem("setSessionstorageValueDefaultCompany", 2);
$('#panel').hide();
jQuery.support.cors = true;

function createCORSRequest(method, url) {
    var xhr = new XMLHttpRequest();
    if ("withCredentials" in xhr) {

        // Check if the XMLHttpRequest object has a "withCredentials" property.
        // "withCredentials" only exists on XMLHTTPRequest2 objects.
        xhr.open(method, url, true);

    } else if (typeof XDomainRequest != "undefined") {

        // Otherwise, check if XDomainRequest.
        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
        xhr = new XDomainRequest();
        xhr.open(method, url);

    } else {

        // Otherwise, CORS is not supported by the browser.
        xhr = null;

    }
    return xhr;
}

var url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo';
var xhr = createCORSRequest('GET', url);
xhr.send();
if (!xhr) {
    throw new Error('CORS not supported');
}


//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueUserNotifications = sessionStorage.getItem('setSessionstorageValueUserNotifications');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueAssetReseller = sessionStorage.getItem('setSessionstorageValueAssetReseller');
var getSessionstorageValueAssetReseller = sessionStorage.getItem('setSessionstorageValueAssetReseller');
var getSessionstorageValueAssetCompany = sessionStorage.getItem('setSessionstorageValueAssetCompany');



$("#showVideo").hide();


var geocoder;
var map;
var markers = new Array();
var marker;
var direction;
var directions = new Array();
var pulse;
var pulses = new Array();
var styleMaker;
var styleMakers = new Array();

var assets = [];
var infoBoxList = [];
var k;
var zones = [];
var polygon;
var pathCoordinates = new google.maps.MVCArray();
var polygonCoordinates = new Array();
var circleCoordinates = new Array();
var circleCoordinates1 = new Array();

var paramtitle;
var firstData = true;
var openmarker = [];
var assetContent;
var assetDriverInfo;
var assetJobInfo;
var assetVideo;

//=====================================//
var drawingManager;
var all_overlays = [];
var selectedShape;
var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082', '#8560a8', '#005e20', '#CBCC29', '#495f75', '#a00000', '#1B1B1B'];
var selectedColor;
var colorButtons = {};
var polygon;
var polygons = [];
var circle;
var circles = [];
var poi;
var pois = [];
var poiContent;
var markerLabel;
var markerLabels = [];

var all_overlays = [];
var selectedShape;
var infoWindowList = [];
var infoWindowListLabel = [];
var contentString;
var finalString;
var poiContent;
var rectangle;
var arrRectangle = [];
var marker1;
var marker2;
var recmarkers = new Array();
//=====================================//

//search destination
var URLDest;
var destfrom;
var destto;


//var markerCluster1;
//var markerCluster2;
//var markerCluster3;

//var AssignedNotifications = new Array();    


var AssignedNotifications = getSessionstorageValueUserNotifications.split(",");

// var getStatusID = new Array();
var getNotification = new Array();


for (var a = 0; a < AssignedNotifications.length; a++) {

    //var arrStatus = AssignedNotifications[a].substring(0, 2);
    var arrNotification = AssignedNotifications[a].substring(5);

    //getStatusID.push(arrStatus);
    getNotification.push(arrNotification);

}


for (var b = 0; b < getNotification.length; b++) {
    arrNotif = getNotification[b];

}

var arrNotif;

var mySound;

//Sounds Checkbox
var changeCheckbox = document.querySelector('.js-check-change-sounds');


//Onload
document.getElementById("muteAlert").checked = true;

var url = "";
var gprs;
var id;

var assetMarkerInterval;
var IntervalCompanyFilter;
var IntervalCompanyFilterMobile;
var IntervalCompanyFilterMobileAsset;


var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "4") {
                $('#load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)

                );
            } else {

                $('#load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)

                );
            }
        });
        var getReseller = $("#load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#load-reseller').selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append(
                $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
            );
        });
        var getReseller = $("#load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#load-reseller').remove();
}


//Company Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

        $.each(data, function (index, item) {
	
            $('#load-company').append(
                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
            );
			

        });
        var getCompany = $("#load-company").val();
        sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
        $('#load-company').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {

                $('#load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );
            } else {
                $('#load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
            }

        });
        var getCompany = $("#load-company").val();
        sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
        $('#load-company').selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


        $.each(data, function (index, item) {

            $('#load-company').append(
                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
            );

        });

        $('.selectpicker').selectpicker('refresh');

    });
}



var selectedReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();
        var getCompany = $('#load-company').val();

        sessionStorage.setItem("setSessionstorageValueDefaultReseller", 0);
        sessionStorage.setItem("setSessionstorageValueDefaultCompany", 0);

        $('#mobile-load-reseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                        );
                    }
                    else {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#mobile-load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#mobile-load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-load-reseller').remove();
        }

        var $result = $('#total-vehicles');
        var $result2 = $('#total-vehiclesEN');
        var $getGPS = $('#getGPS');
        var $getGPRS = $('#getGPRS');
        $result.text(0)
        $result2.text(0)
        $getGPS.text(0)
        $getGPRS.text(0)

        if (getSessionstorageValueLanguage == "th") {

            $("#getMove").hide().html('0').fadeIn('0');
            $("#getIdle").hide().html('0').fadeIn('0');
            $("#getStop").hide().html('0').fadeIn('0');
            $("#getDown").hide().html('0').fadeIn('0');

        } else if (getSessionstorageValueLanguage == "en") {

            $("#getMoveEN").hide().html('0').fadeIn('0');
            $("#getIdleEN").hide().html('0').fadeIn('0');
            $("#getStopEN").hide().html('0').fadeIn('0');
            $("#getDownEN").hide().html('0').fadeIn('0');

        }

        $('#assetStatus').empty();
        $('#load-company').empty();
        $('#getAssets').empty();

        AutoRefreshResellerFilter();

        $(".selectpicker").selectpicker('refresh');

        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append(
                $('<option></option>').val(0).html("-------")
            );

            $.each(data, function (index, item) {
				if (item.CompanyID != 1){
					
					 $('#load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
				}
               
            });

            $(".SelectCompanyFilter").selectpicker('refresh');
        });

        AutoAdjustScreen();
    });

    function AutoRefreshResellerFilter() {


        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            if (markers[i]) markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];

        for (var i = 0; i < directions.length; i++) {
            if (directions[i]) directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];

        for (var i = 0; i < pulses.length; i++) {
            if (pulses[i]) pulses[i].setMap(null);
        }
        pulses = [];

        for (var i = 0; i < styleMakers.length; i++) {
            if (styleMakers[i]) styleMakers[i].setMap(null);
        }
        styleMakers = [];

        for (var i = 0; i < infoBoxList.length; i++) {

            if (infoBoxList[i]) infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkers(map, assets, updateAssets);
    }

});


var selectedMobileReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.MobileSelectResellerFilter').on('change', function () {
        selectedMobileReseller = $(this).find("option:selected").val();

        $('#load-reseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedMobileReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                        );
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedMobileReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedMobileReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').remove();
        }

        var $result = $('#total-vehicles');
        var $result2 = $('#total-vehiclesEN');
        var $getGPS = $('#getGPS');
        var $getGPRS = $('#getGPRS');
        var $getDown = $('#getDown');
        $result.text(0)
        $result2.text(0)
        $getGPS.text(0)
        $getGPRS.text(0)
        $getDown.text(0)

        $("#getMove").hide().html('0').fadeIn('0');
        $("#getIdle").hide().html('0').fadeIn('0');
        $("#getStop").hide().html('0').fadeIn('0');
        $("#getDown").hide().html('0').fadeIn('0');

        $('#assetStatus').bootstrapTable('destroy');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedMobileReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
        });


    });

});

var getSessionstorageValueAssetCompany = sessionStorage.getItem('setSessionstorageValueAssetCompany');

var icon;
var iconURL = "img/markers/";
var iconURLOnClick = "img/no-bg/";
var markerCategory = "";
var pictureLabelURL = "img/categories/marker/";
var infoboxCloseURL = "img/close.gif";
var tipboxURL = "img/tipbox.gif";


// Shapes define the clickable region of the icon.
// The type defines an HTML &lt;area&gt; element 'poly' which
// traces out a polygon as a series of X,Y points. The final
// coordinate closes the poly by connecting to the first
// coordinate.
var shape = {
    //coords: [1, 1, 1, 20, 18, 20, 18, 1],
    coord: [16, 0, 18, 1, 21, 2, 24, 3, 26, 4, 27, 5, 28, 6, 29, 7, 29, 8, 29, 9, 29, 10, 29, 11, 29, 12, 29, 13, 29, 14, 29, 15, 29, 16, 29, 17, 29, 18, 29, 19, 29, 20, 29, 21, 29, 22, 29, 23, 29, 24, 29, 25, 29, 26, 29, 27, 29, 28, 28, 29, 3, 29, 2, 28, 2, 27, 1, 26, 1, 25, 1, 24, 0, 23, 0, 22, 0, 21, 0, 20, 0, 19, 0, 18, 0, 17, 0, 16, 0, 15, 0, 14, 0, 13, 0, 12, 0, 11, 0, 10, 0, 9, 0, 8, 0, 7, 1, 6, 2, 5, 2, 4, 3, 3, 5, 2, 6, 1, 8, 0, 16, 0],
    type: 'poly'
};

var directionsDisplay;
function initialize() {


    $('#LoadingForm').modal('show');

    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(1.3000, 103.8000);
    var mapTypeIds = ["OSM", "PublicTransport", "OneMap"];
    for (var type in google.maps.MapTypeId) {
        mapTypeIds.push(google.maps.MapTypeId[type]);
    }

    var mapOptions = {
        zoom: 12,
        center: latlng,
        panControl: false,
        zoomControl: true,
        zoomControlOptions:
        {
            position: google.maps.ControlPosition.LEFT_TOP
        },
        mapTypeControl: true,
        //mapTypeId: "hybrid",
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            mapTypeIds: mapTypeIds,
            position: google.maps.ControlPosition.TOP_LEFT
        },
        streetViewControl: false,
        streetViewControlOptions: {
            position: google.maps.ControlPosition.RIGHT_BOTTOM
        },
        fullscreenControl: true,
        fullscreenControlOptions:
        {
            position: google.maps.ControlPosition.TOP_LEFT
        },
        scaleControl: true,
        overviewMapControl: true
    }

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(document.getElementById('panel'));

    resize('map-canvas', 32);

    // Create the search box and link it to the UI element.
    var input = document.getElementById('search-wrap');
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);

    Layers();
    //SearchPlaces();
    $('#pac-input-from').val("");
    $('#pac-input-to').val("");
    new AutocompleteDirectionsHandler(map);

    setZones(map, zones, handleZones);
    setMarkers(map, assets, updateAssets);

    google.maps.event.addListener(map, 'mousemove', function (event) {
        document.getElementById('coordinates-panel').innerHTML =
            event.latLng.lat() + ', ' + event.latLng.lng();
    });

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
            position: google.maps.ControlPosition.BOTTOM_CENTER,
            drawingModes: [
                google.maps.drawing.OverlayType.CIRCLE,
                google.maps.drawing.OverlayType.POLYGON,
                google.maps.drawing.OverlayType.MARKER,
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

    google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
        deleteAllShape();
        all_overlays.push(e);

        if (e.type == google.maps.drawing.OverlayType.CIRCLE) {
            var radius = e.overlay.getRadius();
        }

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

        if (e.type == google.maps.drawing.OverlayType.MARKER) {
            var latlng = e.overlay.getPosition()
            console.log(latlng);
        }

    });

    buildColorPalette();

    // Clear the current selection when the drawing mode is changed, or when the map is clicked.
    google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);

    google.maps.event.addListener(map, 'click', clearSelection);

    google.maps.event.addListener(drawingManager, 'polygoncomplete', function (polygon) {

        polygons.push(polygon);

        getCoordinates();
        function getCoordinates() {
            console.log(polygon.getPath().getArray());
            var vertices = polygon.getPath().getArray();

            var arrayToString = vertices.toString();
            var removeSpace = arrayToString.replace(/\ /g, "");
            var removeOpen = removeSpace.replace(/\(/g, "");
            var removeClose = removeOpen.replace(/\),/g, " ");
            finalString = removeClose.replace(/\)/g, "");


            var coords = finalString.split(" ");
            var recoords;

            for (var k = 0; k < coords.length; k++) {
                recoords = coords[0].split(",");
            };

            var position = new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1]));

            // Replace the info infoBubble's content and position.
            var infoBubble = new InfoBubble({
                //minWidth: 220,
                //minHeight: 180,
                map: map,
                content: document.getElementById("infobubbleDrawing"),
                shadowStyle: 1,
                backgroundColor: 'white',
                borderRadius: 10,
                arrowSize: 15,
                borderWidth: 1,
                disableAutoPan: false,
                hideCloseButton: false,
                arrowPosition: 30,
                backgroundClassName: 'phoney',
                arrowStyle: 2
            });

            infoWindowList.push(infoBubble);

            infoBubble.setPosition(position);
            infoBubble.open(map);

            document.getElementById("infobubbleDrawing").style.display = 'block';
            $('#panel').show();

            google.maps.event.addListener(infoBubble, 'closeclick', function () {
                deleteAllShape();
                $('#panel').hide();
            });

            //var coordsPolygon = polygon.getPath().getArray();
            //document.getElementById("Perimeter").value += coordsPolygon;

            //sessionStorage.setItem("setSessionstorageValuePerimeterLength", coordsPolygon.length);

        }

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', saveZone);

    });

    google.maps.event.addListener(drawingManager, 'circlecomplete', function (circle) {
        circles.push(circle);

        var circleStart;
        var circleCenter;
        var circleRadius;
        var pointA;
        var pointB;

        for (var i = 0; i < circles.length; i++) {
            circleCenter = circles[i].getCenter();
            circleRadius = circles[i].getRadius();

            Number.prototype.toRad = function () {
                return this * Math.PI / 180;
            }

            Number.prototype.toDeg = function () {
                return this * 180 / Math.PI;
            }

            google.maps.LatLng.prototype.destinationPoint = function (brng, dist) {
                dist = dist / 6371;
                brng = brng.toRad();

                var lat1 = this.lat().toRad(), lon1 = this.lng().toRad();

                var lat2 = Math.asin(Math.sin(lat1) * Math.cos(dist) +
                    Math.cos(lat1) * Math.sin(dist) * Math.cos(brng));

                var lon2 = lon1 + Math.atan2(Math.sin(brng) * Math.sin(dist) *
                    Math.cos(lat1),
                    Math.cos(dist) - Math.sin(lat1) *
                    Math.sin(lat2));

                if (isNaN(lat2) || isNaN(lon2)) return null;

                return new google.maps.LatLng(lat2.toDeg(), lon2.toDeg());
            }

            var getKm = circleRadius / 1000;

            pointA = new google.maps.LatLng(circleCenter.lat(), circleCenter.lng());
            pointB = pointA.destinationPoint(90, getKm);

            var arrayToString = pointB.toString();
            var removeSpace = arrayToString.replace(/\ /g, "");
            var removeOpen = removeSpace.replace(/\(/g, "");
            var removeClose = removeOpen.replace(/\),/g, " ");
            var removeEnd = removeClose.replace(/\)/g, "");

            //5.977254,116.079409 5.980241,116.080362
            finalString = circleCenter.lat() + "," + circleCenter.lng() + " " + removeEnd;

            //alert(circleCenter.lat() + "," + circleCenter.lng() + "," + circleRadius);

            //sessionStorage.setItem("setSessionstorageValuePerimeterLength", circles.length);

        }


        var position = new google.maps.LatLng(parseFloat(circleCenter.lat()), parseFloat(circleCenter.lng()));

        // Replace the info infoBubble's content and position.
        var infoBubble = new InfoBubble({
            //minWidth: 220,
            //minHeight: 180,
            map: map,
            content: document.getElementById("infobubbleDrawing"),
            shadowStyle: 1,
            borderRadius: 10,
            arrowSize: 15,
            borderWidth: 1,
            disableAutoPan: false,
            hideCloseButton: false,
            arrowPosition: 30,
            backgroundClassName: 'phoney',
            arrowStyle: 2,
            enableEventPropagation: false
        });

        infoWindowList.push(infoBubble);

        infoBubble.setPosition(pointA);
        infoBubble.open(map);

        document.getElementById("infobubbleDrawing").style.display = 'block';
        $('#panel').show();
        google.maps.event.addListener(infoBubble, 'closeclick', function () {
            deleteAllShape();
            $('#panel').hide();
        });

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', saveZone);

    });

    google.maps.event.addListener(drawingManager, 'markercomplete', function (poi) {

        pois.push(poi);
        var coords;

        for (var i = 0; i < pois.length; i++) {
            coords = pois[i].getPosition();
            var arrayToString = coords.toString();
            var removeSpace = arrayToString.replace(/\ /g, "");
            var removeOpen = removeSpace.replace(/\(/g, "");
            var removeClose = removeOpen.replace(/\),/g, " ");
            finalString = removeClose.replace(/\)/g, "");
        }

        // Replace the info infoBubble's content and position.
        var infoBubble = new InfoBubble({
            //minWidth: 220,
            minHeight: 180,
            map: map,
            content: document.getElementById("infobubbleDrawing"),
            shadowStyle: 1,
            backgroundColor: 'white',
            borderRadius: 10,
            arrowSize: 15,
            borderWidth: 1,
            disableAutoPan: false,
            hideCloseButton: false,
            arrowPosition: 30,
            backgroundClassName: 'phoney',
            arrowStyle: 2,
        });

        infoWindowList.push(infoBubble);

        infoBubble.setPosition(coords);
        infoBubble.open(map);

        document.getElementById("infobubbleDrawing").style.display = 'block';
        $('#panel').hide();
        google.maps.event.addListener(infoBubble, 'closeclick', function () {
            deleteAllPoi();
            $('#panel').hide();
        });

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', saveZone);

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

        recmarkers.push(marker1, marker2);

        function getRectangleCoordinates() {
            return NW + "," + SW + "," + SE + "," + NE;
        }

        var arrayToString = getRectangleCoordinates();
        var removeSpace = arrayToString.replace(/\ /g, "");
        var removeOpen = removeSpace.replace(/\(/g, "");
        var removeClose = removeOpen.replace(/\),/g, " ");
        finalString = removeClose.replace(/\)/g, "");

        var coords = finalString.split(" ");
        var recoords;

        for (var k = 0; k < coords.length; k++) {
            recoords = coords[0].split(",");
        };

        var position = new google.maps.LatLng(NE.lat(), SW.lng());

        // Replace the info infoBubble's content and position.
        var infoBubble = new InfoBubble({
            //minWidth: 220,
            // minHeight: 180,
            map: map,
            content: document.getElementById("infobubbleDrawing"),
            shadowStyle: 1,
            backgroundColor: 'white',
            borderRadius: 4,
            arrowSize: 15,
            borderWidth: 1,
            disableAutoPan: false,
            hideCloseButton: false,
            arrowPosition: 30,
            backgroundClassName: 'phoney',
            arrowStyle: 2
        });

        infoWindowList.push(infoBubble);

        infoBubble.setPosition(position);
        infoBubble.open(map);

        document.getElementById("infobubbleDrawing").style.display = 'block';
        $('#panel').show();
        google.maps.event.addListener(infoBubble, 'closeclick', function () {
            deleteAllShape();
            $('#panel').hide();
        });

        sessionStorage.setItem("setSessionstorageValuePerimeterLength", 4);

        google.maps.event.addDomListener(document.getElementById('savebutton'), 'click', saveZone);

    });

    assetMarkerInterval = setInterval(function () {

        setMarkers(map, assets, updateAssets);

    }, '10000');


    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);

    //No Network Coverage Alert
    setTimeout(function () {
        if ($('#LoadingForm').is(":visible")) {
            $('#LoadingForm').modal('hide');
            return alert("Unable to connect to server, Please check your network connection");
        }
    }, 120000);

}




//Dashboard Company
var selectedCompany = "";

/*** Function to filter tables, markers and zones*/
$(function () {


    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        sessionStorage.setItem("setSessionstorageValueDefaultReseller", getReseller);
        sessionStorage.setItem("setSessionstorageValueDefaultCompany", getCompany);

        if (selectedCompany > 0) {
            $("#assetStatus").empty();
            AutoRefreshCompanyFilter();

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }

            setZonesFilter(map, zones, handleZones);

            $('#mobile-load-company').empty();
            $('.MobileSelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#mobile-load-company').selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }

                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#mobile-load-company').selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#mobile-load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }

                    });

                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');

                });
            }


            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            if (getSessionstorageValueRoleID == 1) {
                var getZoneAPI = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                var getZoneAPI = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + "&CompanyID=" + selectedCompany;
            }

            else if (getSessionstorageValueRoleID >= 3) {
                var getZoneAPI = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }



            $.getJSON(getZoneAPI, function (data) {

                $('#assetZone').append(
                    $('<option></option>').val(0).html("--")
                );

                $.each(data, function (index, item) {
                    $('#assetZone').append(
                        $('<option></option>').val(item.ZoneID).html(item.Name)
                    );
                });

                $(".SelectZonesFilter").selectpicker('refresh');
            });

            $('#getAssets').empty();
            $(".selectpicker").selectpicker('refresh');
            var reloadWebAPIAsset = "";
            if (getSessionstorageValueRoleID == 1) {
                if (sessionStorage.getItem('setSessionstorageValueDefaultReseller') > 0 && sessionStorage.getItem('setSessionstorageValueDefaultCompany') > 0) {
                    reloadWebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + sessionStorage.getItem('setSessionstorageValueDefaultReseller') + '&CompanyID=' + sessionStorage.getItem('setSessionstorageValueDefaultCompany');
                } else {
                    reloadWebAPIAsset = '';
                }

            } else if (getSessionstorageValueRoleID == 2) {

                reloadWebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

            } else if (getSessionstorageValueRoleID >= 3) {


                reloadWebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

            }


            $('#getAssets').append($('<option></option>').val(0).html('--'));

            $.getJSON({
                url: reloadWebAPIAsset,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
                },
            }, function (data) {

                $.each(data, function (index, item) {
                    $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
                });
                $(".selectpicker").selectpicker('refresh');
            });


        }


        else {

            sessionStorage.setItem("setSessionstorageValueDefaultReseller", 0);
            sessionStorage.setItem("setSessionstorageValueDefaultCompany", 0);

            var $result = $('#total-vehicles');
            var $result2 = $('#total-vehiclesEN');
            var $getGPS = $('#getGPS');
            var $getGPRS = $('#getGPRS');
            $result.text(0)
            $result2.text(0)
            $getGPS.text(0)
            $getGPRS.text(0)

            var getCountMove = 0;
            var getCountIdle = 0;
            var getCountStop = 0;
            var getCountDown = 0;

            if (getSessionstorageValueLanguage == "th") {
                document.getElementById("getMove").innerHTML = getCountMove;
                document.getElementById("getIdle").innerHTML = getCountMove;
                document.getElementById("getStop").innerHTML = getCountStop;
                document.getElementById("getDown").innerHTML = getCountDown;
            } else if (getSessionstorageValueLanguage == "en") {
                document.getElementById("getMoveEN").innerHTML = getCountMove;
                document.getElementById("getIdleEN").innerHTML = getCountIdle;
                document.getElementById("getStopEN").innerHTML = getCountStop;
                document.getElementById("getDown").innerHTML = getCountDown;
            }

            $('#assetStatus').empty();
            $('#getAssets').empty();
            $(".selectpicker").selectpicker('refresh');

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }

            AutoRefreshCompanyFilter();
            clearInterval(IntervalCompanyFilter);
        }

        AutoAdjustScreen();


    });


    function AutoRefreshCompanyFilter() {

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            if (markers[i]) markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];

        for (var i = 0; i < directions.length; i++) {
            if (directions[i]) directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];

        for (var i = 0; i < pulses.length; i++) {
            if (pulses[i]) pulses[i].setMap(null);
        }
        pulses = [];

        for (var i = 0; i < styleMakers.length; i++) {
            if (styleMakers[i]) styleMakers[i].setMap(null);
        }
        styleMakers = [];

        for (var i = 0; i < infoBoxList.length; i++) {

            if (infoBoxList[i]) infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkers(map, assets, updateAssets);
    }

});


var selectedMobileCompany = "";

//Mobile Company
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedMobileCompany = $(this).find("option:selected").val();

        if (selectedMobileCompany != 0) {
            clearInterval(assetMarkerInterval);
            clearInterval(IntervalCompanyFilterMobile);
            clearInterval(IntervalCompanyFilter);
            clearInterval(IntervalCompanyFilterMobileAsset);
            MobileAutoRefreshCompanyFilter();

            //Select New Company
            $('#load-company').empty();
            $('.SelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }

                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }
                        else {
                            $('#load-company').append(
                                $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                            );
                        }

                    });

                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');

                });
            }


            //Load New Assets
            $('#mobile-load-assets').empty();
            $('.MobileSelectVechsFilter').selectpicker('refresh');
            var getReseller = $('#mobile-load-reseller').val();
            var getCompany = $('#mobile-load-company').val();

            if (getSessionstorageValueRoleID == 1) {

                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append(
                            $('<option></option>').val(item.Name).html(item.Name)
                        );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        $('#mobile-load-assets').append(
                            $('<option></option>').val(item.Name).html(item.Name)
                        );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                    $.each(data, function (index, item) {
                        $('#mobile-load-assets').append(
                            $('<option></option>').val(item.Name).html(item.Name)
                        );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });
            }

            $('#assetStatus').bootstrapTable('destroy');

            var WebAPICompanyFilter = "";

            if (getSessionstorageValueRoleID == 1) {

                if (selectedReseller != "") {
                    WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedMobileCompany;
                } else {
                    WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            $('#assetStatus').bootstrapTable(
                {
                    idField: 'AssetID',
                    url: WebAPICompanyFilter,
                    columns: [{
                        field: 'AssetID',
                        title: 'id',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Company',
                        title: 'Company',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Category',
                        title: 'Category',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Engine',
                        title: 'Engine',
                        class: 'col-md-2',
                        formatter: 'assetColorStatus'
                    }, {
                        field: 'Name',
                        title: 'Asset'
                    }, {
                        field: 'Gps',
                        title: 'GPS',
                        class: 'col-md-1',
                        formatter: 'gpsStatus'
                    }, {
                        field: 'Gprs',
                        title: 'GPRS',
                        class: 'col-md-1',
                        formatter: 'gprsStatus'
                    }],

                    onLoadSuccess: function (row) {

                        var move = 0;
                        var idle = 0;
                        var stop = 0;
                        var gps = 0;
                        var gprs = 0;


                        for (var i = 0; i < row.length; ++i) {
                            if (row[i].Engine == "MOVE") {
                                move++;
                            } else if (row[i].Engine == "IDLE") {
                                idle++;
                            } else if (row[i].Engine == "STOP") {
                                stop++;
                            }
                        }

                        for (var i = 0; i < row.length; ++i) {

                            if (row[i].Gps < 2) {
                                gps++;
                            }
                        }

                        for (var i = 0; i < row.length; ++i) {

                            if (row[i].Gprs == 2) {
                                gprs++;
                            }
                        }

                        var objEngine = {
                            Move: move,
                            Idle: idle,
                            Stop: stop,
                            GPS: gps,
                            GPRS: gprs
                        };

                        var getCountMove = objEngine.Move;
                        var getCountIdle = objEngine.Idle;
                        var getCountStop = objEngine.Stop;
                        var getCountGPS = objEngine.GPS;
                        var getCountGPRS = objEngine.GPRS;

                        if (getSessionstorageValueLanguage == "th") {
                            document.getElementById("getMove").innerHTML = getCountMove;
                            document.getElementById("getIdle").innerHTML = getCountIdle;
                            document.getElementById("getStop").innerHTML = getCountStop;
                            document.getElementById("getGPS").innerHTML = getCountGPS;
                            document.getElementById("getGPRS").innerHTML = getCountGPRS;
                        } else if (getSessionstorageValueLanguage == "en") {
                            document.getElementById("getMoveEN").innerHTML = getCountMove;
                            document.getElementById("getIdleEN").innerHTML = getCountIdle;
                            document.getElementById("getStopEN").innerHTML = getCountStop;
                            document.getElementById("getGPS").innerHTML = getCountGPS;
                            document.getElementById("getGPRS").innerHTML = getCountGPRS;
                        }


                        //Total Vehicles
                        var $result = $('#total-vehicles');
                        var $result2 = $('#total-vehiclesEN');
                        var rows = document.getElementById('assetStatus').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;

                        if (row.length == 0) {
                            $result.text(0)
                            $result2.text(0)

                        } else {

                            $result.text(rows)
                            $result2.text(rows)
                        }
                    },

                    onClickRow: function (row, $element) {

                        $('.assetSelectedRow').removeClass('assetSelectedRow');
                        $($element).addClass('assetSelectedRow');

                        var id = row.AssetID;
                        var category = row.Category;
                        var company = row.Company;
                        var vechs = row.Name;
                        var assetFix = row.LastPos.Fix;
                        var engine = row.Engine;
                        var assetAddress = row.LastPos.Location;
                        var assetSpeed = row.LastPos.Speed;
                        var mileage = row.LastPos.Mileage;
                        var assetTimestamp = row.LastPos.Timestamp;
                        var assetTag = row.Tag;
                        var gps = row.Gps;
                        var assetZone = row.LastPos.Zone;

                        //Convert Timezone
                        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                        var Singapore = moment.tz(assetTimestamp, Asia);
                        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


                        var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));

                        //Background marker
                        switch (row.Engine) {
                            case "MOVE":
                                icon = "move";
                                break;
                            case "IDLE":
                                icon = "idle";
                                break;
                            case "STOP":
                                icon = "stop";
                                break;
                        }
                        icon = iconURLOnClick + icon + ".png";


                        markerPosition = new google.maps.Marker({
                            map: map,
                            position: myLatLng,
                            icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                            shape: shape,
                            title: vechs

                        });

                        markers.push(markerPosition);

                        var bounds = new google.maps.LatLngBounds();
                        var point = [];

                        point = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                        bounds.extend(point);

                        map.fitBounds(bounds);
                        map.setZoom(16);



                        //setTimeout(function () { infobox.close(map, marker); }, '30000');                           
                    }

                });


            IntervalCompanyFilterMobile = setInterval(function () { MobileAutoRefreshCompanyFilter(); }, '20000');

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }


            setZonesFilterMobile(map, zones, handleZones);

            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/zoneinfo?CompanyID=" + selectedMobileCompany, function (data) {

                $('#assetZone').append(
                    $('<option></option>').val(0).html("Select Zones")
                );

                $.each(data, function (index, item) {
                    $('#assetZone').append(
                        $('<option></option>').val(item.ZoneID).html(item.Name)
                    );
                });

                $(".SelectZonesFilter").selectpicker('refresh');
            });
        }


        else {

            var $result = $('#total-vehicles');
            var $result2 = $('#total-vehiclesEN');
            var $getGPS = $('#getGPS');
            var $getGPRS = $('#getGPRS');
            $result.text(0)
            $result2.text(0)
            $getGPS.text(0)
            $getGPRS.text(0)

            var getCountMove = 0;
            var getCountIdle = 0;
            var getCountStop = 0;

            if (getSessionstorageValueLanguage == "th") {
                document.getElementById("getMove").innerHTML = getCountMove;
                document.getElementById("getIdle").innerHTML = getCountMove;
                document.getElementById("getStop").innerHTML = getCountStop;
            } else if (getSessionstorageValueLanguage == "en") {
                document.getElementById("getMoveEN").innerHTML = getCountMove;
                document.getElementById("getIdleEN").innerHTML = getCountIdle;
                document.getElementById("getStopEN").innerHTML = getCountStop;
            }

            // Loop through markers and set map to null for each
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }

            // Reset the markers array
            markers = [];

            for (var i = 0; i < directions.length; i++) {
                directions[i].setMap(null);
            }

            // Reset the markers array
            directions = [];

            $('#assetStatus').bootstrapTable('destroy');

            clearInterval(IntervalCompanyFilterMobile);

        }


        $('#assetStatus').bootstrapTable('refresh');

    });


    function MobileAutoRefreshCompanyFilter() {

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];

        // Clears all clusters and markers from the clusterer.
        //markerCluster1.clearMarkers();
        //markerCluster2.clearMarkers();
        //markerCluster3.clearMarkers();

        for (var i = 0; i < directions.length; i++) {
            directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];

        for (var i = 0; i < pulses.length; i++) {
            pulses[i].setMap(null);
        }
        pulses = [];

        for (var i = 0; i < infoBoxList.length; i++) {

            infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkersFilterMobile(map, assets, updateAssets);

        //$('#assetStatus').bootstrapTable('refresh');

    }



});


var selectedMobileAsset = "";

//Mobile Asset
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectVechsFilter').on('change', function () {
        selectedMobileAsset = $(this).find("option:selected").val();

        $('#assetStatus').bootstrapTable('destroy');
        var getReseller = $('#mobile-load-reseller').val();
        var getCompany = $('#mobile-load-company').val();

        if (selectedMobileAsset != 0) {
            clearInterval(assetMarkerInterval);
            clearInterval(IntervalCompanyFilterMobileAsset);
            clearInterval(IntervalCompanyFilter);
            clearInterval(IntervalCompanyFilterMobile);
            MobileAutoRefreshAssetFilter();

            var WebAPICompanyFilter = "";

            if (getSessionstorageValueRoleID == 1) {

                if (selectedReseller != "") {
                    WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                } else {
                    WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;
            }


            $('#assetStatus').bootstrapTable(
                {
                    idField: 'AssetID',
                    url: WebAPICompanyFilter,
                    columns: [{
                        field: 'AssetID',
                        title: 'id',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Company',
                        title: 'Company',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Category',
                        title: 'Category',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                    }, {
                        field: 'Engine',
                        title: 'Engine',
                        class: 'col-md-2',
                        formatter: 'assetColorStatus'
                    }, {
                        field: 'Name',
                        title: 'Asset'
                    }, {
                        field: 'Gps',
                        title: 'GPS',
                        class: 'col-md-1',
                        formatter: 'gpsStatus'
                    }, {
                        field: 'Gprs',
                        title: 'GPRS',
                        class: 'col-md-1',
                        formatter: 'gprsStatus'
                    }],

                    onLoadSuccess: function (row) {

                        var move = 0;
                        var idle = 0;
                        var stop = 0;
                        var gps = 0;
                        var gprs = 0;


                        for (var i = 0; i < row.length; ++i) {
                            if (row[i].Engine == "MOVE") {
                                move++;
                            } else if (row[i].Engine == "IDLE") {
                                idle++;
                            } else if (row[i].Engine == "STOP") {
                                stop++;
                            }
                        }

                        for (var i = 0; i < row.length; ++i) {

                            if (row[i].Gps < 2) {
                                gps++;
                            }
                        }

                        for (var i = 0; i < row.length; ++i) {

                            if (row[i].Gprs == 2) {
                                gprs++;
                            }
                        }

                        var objEngine = {
                            Move: move,
                            Idle: idle,
                            Stop: stop,
                            GPS: gps,
                            GPRS: gprs
                        };

                        var getCountMove = objEngine.Move;
                        var getCountIdle = objEngine.Idle;
                        var getCountStop = objEngine.Stop;
                        var getCountGPS = objEngine.GPS;
                        var getCountGPRS = objEngine.GPRS;

                        if (getSessionstorageValueLanguage == "th") {
                            document.getElementById("getMove").innerHTML = getCountMove;
                            document.getElementById("getIdle").innerHTML = getCountIdle;
                            document.getElementById("getStop").innerHTML = getCountStop;
                            document.getElementById("getGPS").innerHTML = getCountGPS;
                            document.getElementById("getGPRS").innerHTML = getCountGPRS;
                        } else if (getSessionstorageValueLanguage == "en") {
                            document.getElementById("getMoveEN").innerHTML = getCountMove;
                            document.getElementById("getIdleEN").innerHTML = getCountIdle;
                            document.getElementById("getStopEN").innerHTML = getCountStop;
                            document.getElementById("getGPS").innerHTML = getCountGPS;
                            document.getElementById("getGPRS").innerHTML = getCountGPRS;
                        }


                        //Total Vehicles
                        var $result = $('#total-vehicles');
                        var $result2 = $('#total-vehiclesEN');
                        var rows = document.getElementById('assetStatus').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;

                        if (row.length == 0) {
                            $result.text(0)
                            $result2.text(0)

                        } else {

                            $result.text(rows)
                            $result2.text(rows)
                        }
                    },

                    onClickRow: function (row, $element) {

                        $('.assetSelectedRow').removeClass('assetSelectedRow');
                        $($element).addClass('assetSelectedRow');

                        var id = row.AssetID;
                        var category = row.Category;
                        var company = row.Company;
                        var vechs = row.Name;
                        var assetFix = row.LastPos.Fix;
                        var engine = row.Engine;
                        var assetAddress = row.LastPos.Location;
                        var assetSpeed = row.LastPos.Speed;
                        var mileage = row.LastPos.Mileage;
                        var assetTimestamp = row.LastPos.Timestamp;
                        var assetTag = row.Tag;
                        var gps = row.Gps;
                        var assetZone = row.LastPos.Zone;

                        //Convert Timezone
                        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                        var Singapore = moment.tz(assetTimestamp, Asia);
                        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


                        var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));

                        //Background marker
                        switch (row.Engine) {
                            case "MOVE":
                                icon = "move";
                                break;
                            case "IDLE":
                                icon = "idle";
                                break;
                            case "STOP":
                                icon = "stop";
                                break;
                        }
                        icon = iconURLOnClick + icon + ".png";


                        markerPosition = new google.maps.Marker({
                            map: map,
                            position: myLatLng,
                            icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                            shape: shape,
                            title: vechs

                        });

                        markers.push(markerPosition);

                        var bounds = new google.maps.LatLngBounds();
                        var point = [];

                        point = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                        bounds.extend(point);

                        map.fitBounds(bounds);
                        map.setZoom(16);

                    }

                });


            IntervalCompanyFilterMobileAsset = setInterval(function () { MobileAutoRefreshAssetFilter(); }, '20000');

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }


            setZonesFilterMobileAsset(map, zones, handleZones);

            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/zoneinfo?CompanyID=" + getCompany, function (data) {

                $('#assetZone').append(
                    $('<option></option>').val(0).html("Select Zones")
                );

                $.each(data, function (index, item) {
                    $('#assetZone').append(
                        $('<option></option>').val(item.ZoneID).html(item.Name)
                    );
                });

                $(".SelectZonesFilter").selectpicker('refresh');
            });
        }




        $('#assetStatus').bootstrapTable('refresh');
    });


    function MobileAutoRefreshAssetFilter() {

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];

        // Clears all clusters and markers from the clusterer.
        //markerCluster1.clearMarkers();
        //markerCluster2.clearMarkers();
        //markerCluster3.clearMarkers();

        for (var i = 0; i < directions.length; i++) {
            directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];

        for (var i = 0; i < pulses.length; i++) {
            pulses[i].setMap(null);
        }
        pulses = [];

        for (var i = 0; i < infoBoxList.length; i++) {

            infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkersFilterMobileAsset(map, assets, updateAssets);

        //$('#assetStatus').bootstrapTable('refresh');

    }



});

function setMarkers(map, assets, callback) {

    if (getSessionstorageValueRoleID == 1) {
        if (sessionStorage.getItem('setSessionstorageValueDefaultReseller') > 0 && sessionStorage.getItem('setSessionstorageValueDefaultCompany') > 0) {
            url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + sessionStorage.getItem('setSessionstorageValueDefaultReseller') + '&CompanyID=' + sessionStorage.getItem('setSessionstorageValueDefaultCompany');
        } else {
            url = '';
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (assets) {

        callback(assets);

    });
}

function setMarkersFilter(map, assets, callback) {

    var getReseller = $('#load-reseller').val();
    var getCompany = $('#load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedReseller != "") {
            url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function setMarkersFilterMobile(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function updateAssets(data) {

    var imagePulse = new google.maps.MarkerImage(
        'img/alert.png',
        null, // size
        null, // origin
        new google.maps.Point(8, 8), // anchor (move to center of marker)
        new google.maps.Size(27, 27) // scaled size (required for Retina display icon)
    );
    //first start
    var move = 0;
    var idle = 0;
    var stop = 0;
    var down = 0;
    var nogps = 0;
    var nogprs = 0;

    var bounds = new google.maps.LatLngBounds();

    for (var i = 0, length = data.length; i < length; i++) {

        if (data[i]) {
         
            if (data[i].LastPos == null || data[i].LastPos.Engine == null || data[i].LastPos.PosID == 0 || data[i].LastPos === "") {
                console.log('Data is Null');
                down++;
                continue;
            }

            else {

                var assets = data[i];
                var latLng = new google.maps.LatLng(data[i].LastPos.PosY, data[i].LastPos.PosX);
                var id = data[i].AssetID;
                var category = data[i].Category;
                var company = data[i].Company;
                var vechs = data[i].Name;
                var gps = data[i].Gps;
                var gprs = data[i].Gprs;
                var engine = data[i].Engine;
                var fix = data[i].LastPos.Fix;
                var make = data[i].Make;
                var model = data[i].Model;
                var plate_no = data[i].LicensePlate;
                var address = data[i].LastPos.Location;
                var speed = data[i].LastPos.Speed;
                var course = data[i].LastPos.Course;
                var zone = data[i].LastPos.Zone;
                var speedLimit = data[i].SpeedLimit;
                var tagID = data[i].TagID;
                var mileage = data[i].LastPos.Mileage;
                var assetTimestamp = data[i].LastPos.Timestamp;
                var assetBattery = data[i].LastPos.Battery.toFixed(2);
                var finaldata1 = data[i].Name.match(/.{1,28}/g).join("<br/>");
                var finaldata = finaldata1.substring(0, 18);
                var getXPosition = data[i].LastPos.PosX;
                var getYPosition = data[i].LastPos.PosY;
                var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
                var d = new Date();
                var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
                timestamp2 = Date.parse(timestamp2);
                timestamp1 = Date.parse(timestamp1);

                //Convert Timezone
                var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                var Singapore = moment.tz(assetTimestamp, Asia);
                var timestamp;

                if (assets.TagType == "N32A") {
                    timestamp = moment.utc(Singapore.format()).add('hours', 0).format('D-MMM-YYYY, hh:mm:ss A');
                }
                else {
                    timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                }

                switch (engine) {
                    case "MOVE":
                        icon = "move";
                        break;
                    case "IDLE":
                        icon = "idle";
                        break;
                    case "STOP":
                        icon = "stop";
                        break;
                    default:
                        icon = "down";
                }

                // Category image
                switch (category) {
                    case "Car":
                        markerCategory = "car";
                        break;
                    case "Truck":
                        markerCategory = "truck";
                        break;
                    case "Van":
                        markerCategory = "van";
                        break;
                    case "Bus":
                        markerCategory = "bus";
                        break;
                    case "Motorcycle":
                        markerCategory = "motorcycle";
                        break;
                    case "Recovery Veh":
                        markerCategory = "truck";
                        break;
                    case "Lorry":
                        markerCategory = "truck";
                        break;
                    case "10 Footer Lorry":
                        markerCategory = "truck";
                        break;
                    case "14 Footer Lorry":
                        markerCategory = "truck";
                        break;
                    case "Ambulance":
                        markerCategory = "ambulance";
                        break;
				    default:
                        markerCategory = "car";
                        break;
                }

                if (timestamp2 > timestamp1) {

                    icon = {
                        url: iconURL + markerCategory + "-" + "down" + ".png", // url
                        scaledSize: new google.maps.Size(28, 28), // scaled size
                        origin: new google.maps.Point(0, 0), // origin
                        anchor: new google.maps.Point(14, 14) // anchor
                    };
                }
                else {
                    icon = {
                        url: iconURL + markerCategory + "-" + icon + ".png", // url
                        scaledSize: new google.maps.Size(28, 28), // scaled size
                        origin: new google.maps.Point(0, 0), // origin
                        anchor: new google.maps.Point(14, 14) // anchor
                    };
                }

                iconDirection = {
                    path: 'M -3,0 0,-3 3,0 0,-1 z',
                    scale: 2,
                    strokeColor: '#5CB000',
                    strokeWeight: 1,
                    fillOpacity: 0.8,
                    fillColor: 'green',
                    offset: '100%',
                    rotation: course,
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(0, 8)
                };

                //  Format for Asset Status Infobox Color
                // =================================================================
                var assetColor;

                if (engine == 'MOVE')
                    assetColor = "success";
                else if (engine == 'IDLE')
                    assetColor = "warning";
                else if (engine == 'STOP' && timestamp2 > timestamp1)
                    assetColor = "down";
                else if (engine == 'STOP')
                    assetColor = "danger";


                var assetDriver;
                if (assets.ImageFill == 'None') {
                    assetDriver = "img/av1.png";
                } else if (assets.ImageFill == 'Uniform') {
                    assetDriver = assets.Image;
                }

                var driverName;
                if (assets.Driver.Name == null) {
                    driverName = "No Driver Assigned";
                } else {
                    driverName = assets.Driver.Name;
                }


                var driverAddress;
                if (assets.Driver.Address == null) {
                    driverAddress = "No Driver Address";
                } else {
                    driverAddress = assets.Driver.Address;
                }


                var driverPhone;
                if (assets.Driver.Phone == null) {
                    driverPhone = "No Driver Phone";
                } else {
                    driverPhone = assets.Driver.Phone;
                }

                //Count Status
                if (engine == "MOVE")
                    move++;
                else if (engine == "IDLE")
                    idle++;
                else if (engine == "STOP" && timestamp2 > timestamp1)
                    down++;
                else if (engine == "STOP")
                    stop++;

                if (gps < 2)
                    nogps++;

                if (gprs == 2)
                    nogprs++;


               var assetContent = "<div id='assetInfo' class='form-group' style='padding:0px !important;'>";
                if (plate_no !== "Unknown") assetContent += "<h6 style='color:#4286CF;'>" + finaldata + " - (" + plate_no + ")</h6>";
                  else assetContent += "<h6 style='color:#4286CF;'>" + finaldata + "</h6>";

                        assetContent += "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                                   "<tbody>" +
                                   "<tr>" + "<td>";
               if (make !== "Unknown") assetContent += "<span data-l11n class='text-bold'>Brand:&nbsp;</span>" + make +
                                         "<br />";
               if (model !== "Unknown") assetContent += "<span data-l11n class='text-bold'>Model:&nbsp;</span>" + model +
                                          "<br />";
                         assetContent += "<span data-l11n class='text-bold'>Address:&nbsp;</span>" + address +
                                    "<br />" +
                                    "<span data-l11n class='text-bold'>Date:&nbsp;</span>" + timestamp +
                                    "<br />" +
                                    "<span data-l11n class='text-bold'>Speed:&nbsp;</span>" + speedFormatter(speed) +
                                    "<br />" +
                                    "<span data-l11n class='text-bold'>GPS Status:&nbsp;</span>" + fix +
                                    "<br />" +
                                    "<span data-l11n class='text-bold'>Driver:&nbsp;</span>" + driverName +
                                    "<br />" +
                                    "<span data-l11n class='text-bold'>Zones:&nbsp;</span>" + zone +
                                    "<br />" +
                                    '<span class="text-bold">Route Info:&nbsp;</span><input id="destination" type="text" class="input-sm" placeholder="Enter Destination" style="margin-right:10px;"><button id="submitdest" class="btn-dark btn btn-sm" onclick="searchdestination(\'' + getYPosition + ',' + getXPosition + '\')">Search</button>' +
                                    "</td>" + "</tr>"
                                    "</tbody>" + "</table>" +
                                    "</div>"; //infobox

                var assetDriverInfo = "<div class='form-group'>" +
                    "<a class='thumbnail' data-style='btn-success'>" +
                    "<img src='" + assetDriver + "' name='image-swap' class='img-responsive' alt='Driver Preview' width='110' height='110' id='showDriver'>" +
                    "</a>" +
                    "<span data-l11n='th' class='text-bold'>คนขับรถ:&nbsp;" + driverName + "</span>" +
                    "<span data-l11n class='text-bold'>Driver:&nbsp;" + driverName + "</span>" +
                    "<br />" +
                    "<span data-l11n='th' class='text-bold'>ที่อยู่:&nbsp;" + driverAddress + "</span>" +
                    "<span data-l11n class='text-bold'>Address:&nbsp;" + driverAddress + "</span>" +
                    "<br />" +
                    "<span data-l11n='th' class='text-bold'>โทรศัพท์:&nbsp;" + driverPhone + "</span>" +
                    "<span data-l11n class='text-bold'>Phone:&nbsp;" + driverPhone + "</span>" +
                    "<br />" +
                    "</div>";

                marker = new setInfoBubble({
                    map: map,
                    position: latLng,
                    icon: icon,
                    shape: shape,
                    category: category,
                    address: address,
                    vechs: vechs,
                    id: id,
                    gps: gps,
                    gprs: gprs,
                    title: vechs,
                    zone: zone,
                    engine: engine,
                    speed: speed,
                    mileage: mileage,
                    timestamp: timestamp,
                    getYPosition: getYPosition,
                    getXPosition: getXPosition,
                    assetBattery: assetBattery,
                    content: assetContent,
                    assetDriverInfo: assetDriverInfo
                });

                marker.setMap(map);

                styleMaker = new StyledMarker({
                    styleIcon: new StyledIcon(StyledIconTypes.BUBBLE, {
                        color: "#458FD2",
                        text: vechs,
                        fore: "#FFFFFF"
                    }),
                    position: latLng,
                    map: map,
                    shadow: 'none'
                });

                direction = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    icon: {
                        //path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                        path: 'M -3,0 0,-3 3,0 0,-1 z',
                        scale: 2,
                        strokeColor: '#5CB000',
                        strokeWeight: 1,
                        fillOpacity: 0.8,
                        fillColor: 'green',
                        offset: '100%',
                        rotation: course,
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(0, 8)

                    },
                    //shape: shape,
                    category: category,
                    engine: engine,
                    company: company,
                    vechs: vechs,
                    speed: speed,
                });


                if (speed > 0 && engine != "STOP") {

                    if (timestamp2 > timestamp1) {
                        direction.setVisible(false);
                    }
                    else {
                        if (engine == "MOVE") {
                            direction.setVisible(true);
                        }
                        else if (engine == "IDLE") {
                            direction.setVisible(false);
                        }
                    }

                }
                else {
                    direction.setVisible(false);
                }


                //then create the new marker
                pulse = new google.maps.Marker({
                    flat: true,
                    icon: imagePulse,
                    map: map,
                    optimized: false,
                    position: latLng,
                    visible: true,
                    title: engine,
                    engine: engine,
                    gps: gps,
                    gprs: gprs,
                    category: category
                });



                if (gps < 2 || gprs == 2) {

                    if (changeCheckbox.checked && arrNotif == 1 && timestamp2 > timestamp1) {
                        pulse.setVisible(true);
                    }
                    else {
                        pulse.setVisible(false);
                    }

                } else {
                    pulse.setVisible(false);
                }

                //To fix marker sensitivity issue
                google.maps.event.addDomListener(pulse, "click", function (event) {
                    google.maps.event.trigger(marker[i], "click");
                });


                if (markers[i] && markers[i].setPosition) {
                    //$("#assetStatus tr").remove();
                    $("#assetStatus").empty();
                    //direction.setVisible(false);
                    //marker.setVisible(false);
                    //pulse.setVisible(false);
                    // To remove the marker from the map
                    marker.setMap(null);
                    direction.setMap(null);
                    pulse.setMap(null);
                    styleMaker.setMap(null);


                    markers[i].setPosition(latLng);
                    directions[i].setPosition(latLng);
                    pulses[i].setPosition(latLng);
                    styleMakers[i].setPosition(latLng);

                    if (speed > 0 && engine != "STOP") {

                        if (timestamp2 > timestamp1) {
                            directions[i].setVisible(false);
                        }
                        else {

                            directions[i].setIcon(iconDirection);

                            if (engine == "MOVE") {
                                directions[i].setVisible(true);
                            }
                            else if (engine == "IDLE") {
                                directions[i].setVisible(false);
                            }
                        }

                    }
                    else {
                        directions[i].setVisible(false);
                    }

                    if (gps < 2 || gprs == 2) {

                        if (changeCheckbox.checked && arrNotif == 1 && timestamp2 > timestamp1) {
                            pulses[i].setVisible(true);
                        }
                        else {
                            pulses[i].setVisible(false);
                        }
                    }

                    markers[i].setIcon(icon);
                    //markers[i].setIcon(/** @type {google.maps.Icon} */({
                    //    url: icon,
                    //    scaledSize: new google.maps.Size(28, 28), // scaled size
                    //    origin: new google.maps.Point(0, 0), // origin
                    //    anchor: new google.maps.Point(14, 14) // anchor
                    //}));

                    if (paramtitle == vechs) {
                        markers[i].content = assetContent;
                        markers[i].address = address;
                        markers[i].timestamp = timestamp;
                        markers[i].gps = gps;
                        markers[i].gprs = gprs;
                        markers[i].fix = fix;
                        if ($('#assetInfo').val() != null || $('#assetInfo').val() != undefined) { document.getElementById('assetInfo').innerHTML = assetContent; }
                        //map.panTo(marker.getPosition());
                    }
                    else {
                        markers[i].content = assetContent;
                        markers[i].address = address;
                        markers[i].timestamp = timestamp;
                        markers[i].gps = gps;
                        markers[i].gprs = gprs;
                        markers[i].fix = fix;
                    }


                } else {

                    bounds.extend(latLng);
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
                        getHeight = 180;
                    } else {
                        // not Google chrome 
                        getHeight = 150;
                    }


                    markers[i] = marker;
                    directions[i] = direction;
                    pulses[i] = pulse;
                    styleMakers[i] = styleMaker;


                }//end of else
            }//end of else continue     

        }


    }//end of for

    if (firstData) {
        map.setZoom(7);
        map.fitBounds(bounds);

        firstData = false;
    }

    var outputDiv = document.getElementById('assetStatus');

    for (k = 0; k < markers.length; k++) {

        if (markers[k] != undefined || markers[k]) {

            outputDiv.innerHTML += "<div style='margin-top:10px;'>"
                + "<table id='' border='0'>"
                + "<tbody>"
                + "<tr>"
                + "<td>"
                + "<strong><a href='javascript:google.maps.event.trigger(openmarker[" + k + "],\"click\");' style='color:#458FD2;'>" + markers[k].title + '</a></strong><br>' + markers[k].address + "<br>"
                + "</td>"
                + "<td>"
                + gpsStatus(markers[k].gps, markers[k].timestamp)
                + "</td>"
                + "<td>"
                + gprsStatus(markers[k].gprs, markers[k].timestamp)
                + "</td>"
                + "</tr>"
                + "</tbody>"
                + "</table>"
                + "</div>";
            + "<hr style='border: 1px solid #FFFFFF !important'>";
        } 

    }

    if (marker) openmarker = findMarker(marker.position);

    document.getElementById('getMove').innerHTML = move;
    document.getElementById('getIdle').innerHTML = idle;
    document.getElementById('getStop').innerHTML = stop;
    document.getElementById('getDown').innerHTML = down;
    document.getElementById('getGPS').innerHTML = nogps;
    document.getElementById('getGPRS').innerHTML = nogprs;
    document.getElementById('total-vehiclesEN').innerHTML = data.length;

    //end

}

function findMarker(pt) {
    var openmarker = [];
    for (var i = 0; i < markers.length; i++) {
        openmarker.push(markers[i]);
    }

    return openmarker.splice(0);
}

function setInfoBubble(param) {

    var getWidth;
    var getHeight;
    var getHeightChart;

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
        getHeight = 260;
        getHeightChart = 220;
    } else {
        // not Google chrome 
        getWidth = 220;
        getHeight = 240;
        getHeightChart = 220;
    }


    var newMarker = new google.maps.Marker({
        map: param.map,
        position: param.position,
        title: param.title,
        category: param.category,
        address: param.address,
        timestamp: param.timestamp,
        vechs: param.vechs,
        gps: param.gps,
        gprs: param.gprs,
        zone: param.zone,
        engine: param.engine,
        speed: param.speed,
        fix: param.fix,
        icon: icon,
        shape: shape,
        content: param.content
    });

    if (param.content) {
        google.maps.event.addListener(newMarker, 'click', function () {

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            var infoBubble;
            // this -> the marker on which the onclick event is being attached
            if (!this.getMap().newMarker) {
                infoBubble = this.getMap().newMarker = new google.maps.InfoWindow({

                });

                infoBoxList.push(infoBubble);

            }
            //this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            //this.getMap().newMarker.removeTab(2);
            //this.getMap().newMarker.removeTab(1);
            //this.getMap().newMarker.removeTab(0);
            //this.getMap().newMarker.addTab('Details', this.content);
            //this.getMap().newMarker.addTab('Driver', param.assetDriverInfo);
            this.getMap().setCenter(this.position);
            paramtitle = param.title;

        });

        google.maps.event.addListener(newMarker, 'mouseover', function () {

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            var infoBubble;
            // this -> the marker on which the onclick event is being attached
            if (!this.getMap().newMarker) {
                infoBubble = this.getMap().newMarker = new google.maps.InfoWindow({

                });

                infoBoxList.push(infoBubble);

            }
            //this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            //this.getMap().newMarker.removeTab(2);
            //this.getMap().newMarker.removeTab(1);
            //this.getMap().newMarker.removeTab(0);
            //this.getMap().newMarker.addTab('Details', this.content);
            //this.getMap().newMarker.addTab('Driver', param.assetDriverInfo);
            this.getMap().setCenter(this.position);
            paramtitle = param.title;

        });

    }



    return newMarker;
}

//On Load assets
var WebAPIAsset = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

    $.getJSON({
        url: WebAPIAsset,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (data) {

        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON({
        url: WebAPIAsset,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (data) {
        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON({
        url: WebAPIAsset,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (data) {
        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


/*** Function to Assets*/
$(function () {

    $('.SelectAssetFilter').on('change', function () {

        var selected = $(this).find("option:selected").val();
        //paramtitle = selected;
        for (k = 0; k < markers.length; k++) {
            marker = markers[k];

            if (markers[k]) {
                // If is same assets or assets not picked
                if (marker.title == selected) {

                    marker.setVisible(true);
                    var position = marker.getPosition();
                    map.setCenter(position);
                    map.setZoom(18);

                    for (var i = 0; i < infoBoxList.length; i++) {

                        infoBoxList[i].close();
                    }

                    // Reset the markers array
                    infoBoxList = [];

                    //var infoBubble = new google.maps.InfoWindow();

                    //infoBoxList.push(infoBubble);

                    //infoBubble.setContent(marker.content);
                    //infoBubble.open(this, marker);
                    //paramtitle = marker.title;
                    //Open Infowindow
                    //infoBubble.setContent(marker.content);
                    //infoBubble.open(this, marker);

                }
            }


        }

    }); // end of on change


}); //end of function



function speedFormatter(value) {

    //Speed Formula
    //if (value < 20) {
       // var convertKmPerHour = value * 3.6;
    //}
    //else {
       // var convertKmPerHour = value * 3.6 / 2;
    //}

    var roundoff = Math.round(value * 100) / 100;

    return roundoff + ' Km/h';
}

function meterTokm(value) {

    var convert = value / 1000; 
    var roundoff = Math.round(convert * 100) / 100;
    return roundoff + ' Km';
}

function mileageFormatter(value) {

    var roundoff = Math.round(value * 100) / 100;
    return roundoff + ' Km';
}

function getVideo(assets) {

    var panel1 = $.jsPanel({
        iframe: {
            width: 680,
            height: 580,
            src: 'https://103.228.55.216:8080/demo/demo1x.html?busid=20007',
            name: 'myFrame',
            style: { 'border': '10px solid transparent' }
        },
        size: 'auto',
        position: { left: "center", top: 30 },
        title: 'DEMO',
        theme: 'black'
    });

}

/** @this {google.maps.Video} */
function showVideo(event) {

    $("#showVideo").show();

    // document.getElementById("showLabelVideo").innerHTML = this.vechs;

    $('video').mediaelementplayer({
        // if the <video width> is not specified, this is the default
        defaultVideoWidth: 480,
        // if the <video height> is not specified, this is the default
        defaultVideoHeight: 270,
        // if set, overrides <video width>
        videoWidth: -1,
        // if set, overrides <video height>
        videoHeight: -1,
        // width of audio player
        audioWidth: 400,
        // height of audio player
        audioHeight: 30,
        // initial volume when the player starts
        startVolume: 0.8,
        // useful for <audio> player loops
        loop: true,
        // enables Flash and Silverlight to resize to content size
        enableAutosize: true,
        // the order of controls you want on the control bar (and other plugins below)
        features: ['playpause', 'volume', 'fullscreen'],
        // Hide controls when playing and mouse is not over the video
        alwaysShowControls: false,
        // force iPad's native controls
        iPadUseNativeControls: false,
        // force iPhone's native controls
        iPhoneUseNativeControls: false,
        // force Android's native controls
        AndroidUseNativeControls: false,
        // forces the hour marker (##:00:00)
        alwaysShowHours: false,
        // show framecount in timecode (##:00:00:00)
        showTimecodeFrameCount: false,
        // used when showTimecodeFrameCount is set to true
        framesPerSecond: 25,
        // turns keyboard support on and off for this instance
        enableKeyboard: true,
        // when this player starts, it will pause other players
        pauseOtherPlayers: true,
        // array of keyboard commands
        keyActions: [],
        // shows debug errors on screen
        enablePluginDebug: false,
        // remove or reorder to change plugin priority
        plugins: ['flash', 'silverlight'],
        // overrides <video width>
        pluginWidth: -1,
        // overrides <video height>       
        pluginHeight: -1,
        // rate in milliseconds for Flash and Silverlight to fire the timeupdate event
        // larger number is less accurate, but less strain on plugin->JavaScript bridge
        timerRate: 250,
        success: function (mediaElement, domObject) {

            // call the play method
            mediaElement.play();

        },
        // fires when a problem is detected
        error: function () {

        }

    });

}

function setZonesFilter(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedReseller != "") {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (zones) {
   
        callback(zones);


    });
}

function setZonesFilterMobile(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (zones) {

        callback(zones);


    });
}

function setZonesFilterMobileAsset(map, zones, callback) {

    var getReseller = $('#mobile-load-reseller').val();
    var getCompany = $('#mobile-load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        } else {
            url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (zones) {

        callback(zones);


    });
}

function setZones(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    //alert(url);

    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (zones) {

        callback(zones);


    });
}


var circle = {};
var circle1 = {};
var polygon1 = {};

function handleZones(zones) {

    for (var i = 0; i < zones.length; i++) {

        var zone = zones[i];
        var zoneID = zone.ZoneID;
        var name = zone.Name;
        var type = zone.Type;
        var perimeter = zone.Perimeter;
        var company = zone.Company;
        var color = zone.Color;
        var location = zone.Location;


        var coords = perimeter.split(" ");
        var recoords;
        var Pos;
        var zoneCircle;
        var zoneCircle1;
        var imageUrl = 'https://chart.apis.google.com/chart?cht=mm&chs=24x32&' + 'chco=FFFFFF,' + (Math.random() * 0xFFFFFF << 0).toString(16) +'&ext=.png';


        if (/\s/.test(perimeter)) {
            // It has any kind of whitespace
            if (coords.length == 1) {

                for (var k = 0; k < coords.length; k++) {

                    recoords = coords[k].split(",");

                    var circle1 = {};
                    circle1['Zones'] = {
                        center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
                        radius: recoords[2]
                        //radius: 100
                    };


                }

                // Construct the circle for each value in citymap.
                // Note: We scale the area of the circle based on the population.
                for (var zone in circle1) {
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
                        center: circle1[zone].center,
                        radius: Math.sqrt(circle1[zone].radius)
                    };
                    // Add the circle for this city to the map.
                    zoneCircle1 = new google.maps.Circle(radiusOptions);

                }
                circleCoordinates1.push(zoneCircle1);

                // Add a listener for the click event.
                google.maps.event.addListener(zoneCircle1, 'click', showArrayCircle);
                infoWindow = new google.maps.InfoWindow();

                // Click Zones
                google.maps.event.addListener(zoneCircle1, 'click', (function (zoneCircle1) {

                    return function () {

                        map.panTo(this.position);

                    }

                })(zoneCircle1));

            }
            //Circle - 1.042346,99.939392 1.038056,99.937031
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


                // Add a listener for the click event.
                google.maps.event.addListener(zoneCircle, 'click', showArrayCircle);

                infoWindow = new google.maps.InfoWindow();


                // Click Zones
                google.maps.event.addListener(zoneCircle, 'click', (function (zoneCircle) {

                    return function () {

                        map.panTo(this.position);

                    }

                })(zoneCircle));




            }
            else if (coords.length >= 3) {

                //for (var k = 0; k < coords.length; k++) {
                //    recoords = coords[k].split(",");
                //    pathCoordinates.push(new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])));
                //}

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
                    Pos: coords,
                    zoneID: zoneID,
                    map: map
                });



                pathCoordinates = [];
                polygonCoordinates.push(polygon);


                polygon.setMap(map);


                // Add a listener for the click event.
                google.maps.event.addListener(polygon, 'click', showArrays);

                infoWindow = new google.maps.InfoWindow();


                // Click Zones
                google.maps.event.addListener(polygon, 'click', (function (polygon, i) {

                    return function () {

                        map.panTo(this.position);

                    }

                })(polygon, i));


            } //end of if

        } else {


            var perimeterPOI = zones[i].Perimeter.split(",");
            var latLngPOI = new google.maps.LatLng(parseFloat(perimeterPOI[0]), parseFloat(perimeterPOI[1]));

            poi = new google.maps.Marker({
                map: map,
                position: latLngPOI,
                draggable: false,
                zoneID: zoneID,
                icon: imageUrl,
                title: name
            });

            pois.push(poi);

            markerLabel = new MarkerWithLabel({
                position: latLngPOI,
                draggable: false,
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
                "<h6 style='color:#4286CF;'>" + name + "</h6>" +
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


            setPOILabel(markerLabel, markerLabels[i]);
        }
       



        $(function () {

            $('.SelectZonesFilter').on('change', function () {

                var selected = $(this).find("option:selected").val();


                for (var p = 0; p < pois.length; p++) {       
                    poi = pois[p];        
                    if (poi.zoneID == selected || selected.length === 0) {
                        poi.setVisible(true);
                        var position = poi.getPosition();
                        map.setCenter(position);
                        map.setZoom(18);
                    }
                }
                for (var b = 0; b < circleCoordinates1.length; b++) {
                    circle1 = circleCoordinates1[b];
                    if (circle1.zoneID == selected || selected.length === 0) {

                        map.fitBounds(circle1.getBounds());

                    }
                }
                for (var j = 0; j < circleCoordinates.length; j++) {
                    circle = circleCoordinates[j];
                    if (circle.zoneID == selected || selected.length === 0) {

                        map.fitBounds(circle.getBounds());

                    }
                }
                for (var a = 0; a < polygonCoordinates.length; a++) {

                    polygon = polygonCoordinates[a];

                    if (polygon.zoneID == selected || selected.length === 0) {

                        var bounds = new google.maps.LatLngBounds();
                        var point = [];

                        var getPolygon = polygon.Pos;

                        for (var i = 0; i < polygon.getPath().length; i++) {
                            getPolygonEx = getPolygon[i].split(",");
                            point = new google.maps.LatLng(parseFloat(getPolygonEx[0]), parseFloat(getPolygonEx[1]));
                            bounds.extend(point);
                        }


                        map.fitBounds(bounds);
                    }//end if
                }//end for

            }); // end of on change

        }); //end of function

    }
    return zones;
}

function setPOILabel(markerLabel, markerLabels) {


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
        getHeight = 150;
    } else {
        // not Google chrome 
        getWidth = 180;
        getHeight = 150;
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


    markerLabel.addListener('click', function () {

        infoBubble.open(markerLabel.get('map'), markerLabel);
    });

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

function AutoRefresh() {


    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        if (markers[i]) markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];

    //markerCluster1.clearMarkers();
    //markerCluster2.clearMarkers();
    //markerCluster3.clearMarkers();

    for (var i = 0; i < pulses.length; i++) {
        if (pulses[i]) pulses[i].setMap(null);
    }
    pulses = [];

    // Loop through markers and set map to null for each
    for (var i = 0; i < directions.length; i++) {

        if (directions[i]) directions[i].setMap(null);
    }

    // Reset the markers array
    directions = [];


    for (var i = 0; i < infoBoxList.length; i++) {

        if (infoBoxList[i]) infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];

    // Call set markers to re-add markers




    setMarkers(map, assets, updateAssets);

    // $('#assetStatus').bootstrapTable('refresh');

}

function RemoveInfobox() {

    for (var i = 0; i < infoBoxList.length; i++) {

        if (infoBoxList[i]) infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];
}

function loopSound(sound) {
    sound.play({
        onfinish: function () {
            loopSound(sound);
        }
    });
}

function UIAlert() {



    soundManager.setup({

        // location: path to SWF files, as needed (SWF file name is appended later.)

        url: 'plugins/sound-manager/swf/soundmanager2.swf',

        // optional: version of SM2 flash audio API to use (8 or 9; default is 8 if omitted, OK for most use cases.)
        // flashVersion: 9,

        // use soundmanager2-nodebug-jsmin.js, or disable debug mode (enabled by default) after development/testing
        // debugMode: false,

        // good to go: the onready() callback

        onready: function () {

            // SM2 has started - now you can create and play sounds!

            mySound = soundManager.createSound({
                id: 'UIAlertStop', // optional: provide your own unique id
                url: 'sounds/b1_oringz-pack-nine-20.mp3',
                //onload: function () { console.log('sound loaded!', this); }
                // other options here..
            });


            //mySound.play();
            loopSound(mySound);

        },

        // optional: ontimeout() callback for handling start-up failure

        ontimeout: function () {

            // Hrmm, SM2 could not start. Missing SWF? Flash blocked? No HTML5 audio support? Show an error, etc.?
            // See the flashblock demo when you want to start getting fancy.

        }

    });


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

//Search Places
function SearchPlaces() {

    var defaultBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(1.3000, 103.8000),
        new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('pac-input');

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

function Layers() {

    TrafficLayer();
    //TransitLayer();
    //BicycleLayer();

    map.mapTypes.set("OSM", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {

            var normalizedCoord = getNormalizedCoord(coord, zoom);
            if (!normalizedCoord) {
                return null;
            }
            var bound = Math.pow(2, zoom);

            return "https://tile.openstreetmap.org/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "OSM",
        alt: "Open Street Map",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //OSM Public Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("PublicTransport", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {

            var normalizedCoord = getNormalizedCoord(coord, zoom);
            if (!normalizedCoord) {
                return null;
            }
            var bound = Math.pow(2, zoom);

            return "https://tile.memomaps.de/tilegen/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Public", //Public
        alt: "Show Public Transport", //Show Public Transport
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Outdoor Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OneMap", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {

            var normalizedCoord = getNormalizedCoord(coord, zoom);
            if (!normalizedCoord) {
                return null;
            }
            var bound = Math.pow(2, zoom);
            return "https://maps-a.onemap.sg/v3/Night/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
            //return "https://maps-a.onemap.sg/v3/Default/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "One Map",
        alt: "One Map",
        maxZoom: 20

    }));

    // Normalizes the coords that tiles repeat across the x axis (horizontally)
    // like the standard Google map tiles.
    function getNormalizedCoord(coord, zoom) {
        var y = coord.y;
        var x = coord.x;
        // tile range in one direction range is dependent on zoom level
        // 0 = 1 tile, 1 = 2 tiles, 2 = 4 tiles, 3 = 8 tiles, etc
        var tileRange = 1 << zoom;
        // don't repeat across y-axis (vertically)
        if (y < 0 || y >= tileRange) {
            return null;
        }
        // repeat across x-axis
        if (x < 0 || x >= tileRange) {
            x = (x % tileRange + tileRange) % tileRange;
        }
        return {
            x: x,
            y: y
        };
    }

    //End
    /*=================================================*/

}

function TrafficLayer() {

    //Traffic Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
        .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Traffic'); //Traffic
    $(controlDiv).append(controlUI);

    var legend = '<ul>'
        + '<li><span style="background-color: #30ac3e">&nbsp;&nbsp;</span><span style="color: #30ac3e"> &gt; Smooth Traffic</span></li>'
        + '<li><span style="background-color: #ffcf00">&nbsp;&nbsp;</span><span style="color: #ffcf00"> Slow Moving Traffic</span></li>'
        + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> &lt; Heavy Traffic</span></li>'
        + '<li><span style="background-color: #c0c0c0">&nbsp;&nbsp;</span><span style="color: #c0c0c0"> No data available</span></li>'
        + '</ul>';

    var controlLegend = document.createElement('DIV');
    $(controlLegend).addClass('gmap-control-legend');
    $(controlLegend).html(legend);
    $(controlLegend).hide();
    $(controlDiv).append(controlLegend);

    // Set hover toggle event
    $(controlUI)
        .mouseenter(function () {
            $(controlLegend).show();
        })
        .mouseleave(function () {
            $(controlLegend).hide();
        });

    var trafficLayer = new google.maps.TrafficLayer();

    google.maps.event.addDomListener(controlUI, 'click', function () {
        if (typeof trafficLayer.getMap() == 'undefined' || trafficLayer.getMap() === null) {
            $(controlUI).addClass('gmap-control-active');
            trafficLayer.setMap(map);
        } else {
            trafficLayer.setMap(null);
            $(controlUI).removeClass('gmap-control-active');
        }
    });

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(controlDiv);

    //Traffic Layer - On
    //End
    /*=================================================*/

}

function TransitLayer() {

    //Transit Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
        .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Transit'); //Transit
    $(controlDiv).append(controlUI);

    var transitLayer = new google.maps.TransitLayer();

    google.maps.event.addDomListener(controlUI, 'click', function () {
        if (typeof transitLayer.getMap() == 'undefined' || transitLayer.getMap() === null) {
            $(controlUI).addClass('gmap-control-active');
            transitLayer.setMap(map);
        } else {
            transitLayer.setMap(null);
            $(controlUI).removeClass('gmap-control-active');
        }
    });

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(controlDiv);

    //Transit Layer - On
    //End
    /*=================================================*/

}

function BicycleLayer() {

    //Transit Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
        .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Bicycle'); //Transit
    $(controlDiv).append(controlUI);

    var bicycleLayer = new google.maps.BicyclingLayer();

    google.maps.event.addDomListener(controlUI, 'click', function () {
        if (typeof bicycleLayer.getMap() == 'undefined' || bicycleLayer.getMap() === null) {
            $(controlUI).addClass('gmap-control-active');
            bicycleLayer.setMap(map);
        } else {
            bicycleLayer.setMap(null);
            $(controlUI).removeClass('gmap-control-active');
        }
    });

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(controlDiv);

    //Transit Layer - On
    //End
    /*=================================================*/

}


/**
* @constructor
*/
function AutocompleteDirectionsHandler(map) {
    //alert(document.getElementById('pac-input-to').value);
    this.map = map;
    this.originPlaceId = null;
    this.destinationPlaceId = null;
    this.travelMode = 'DRIVING';
    var originInput = document.getElementById('pac-input-from');
    var destinationInput = document.getElementById('pac-input-to');
    this.directionsService = new google.maps.DirectionsService;
    directionsDisplay = new google.maps.DirectionsRenderer;
    directionsDisplay.setMap(map);

    var originAutocomplete = new google.maps.places.Autocomplete(
        originInput, {
            place_id: true,
            componentRestrictions: { country: 'sg' }
        });
    var destinationAutocomplete = new google.maps.places.Autocomplete(
        destinationInput, {
            place_id: true,
        componentRestrictions: { country: 'sg' }
        });

    this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
    this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');
}


AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function (autocomplete, mode) {
    var me = this;
    autocomplete.bindTo('bounds', this.map);
    autocomplete.addListener('place_changed', function () {
        var place = autocomplete.getPlace();
        if (!place.place_id) {
            window.alert("Please select an option from the dropdown list.");
            return;
        }
        if (mode === 'ORIG') {
            me.originPlaceId = place.place_id;
        } else {
            me.destinationPlaceId = place.place_id;
        }
        me.route();
    });

};
var panel;
AutocompleteDirectionsHandler.prototype.route = function () {
    if (!this.originPlaceId || !this.destinationPlaceId) {
        return;
    }
    var me = this;
    if ($('#pac-input-from').val() && $('#pac-input-to').val()) {
        this.directionsService.route({
            origin: { 'placeId': this.originPlaceId },
            destination: { 'placeId': this.destinationPlaceId },
            travelMode: this.travelMode
        }, function (response, status) {

            if (status === 'OK') {

                if ($('#direction-panel').is(':visible')) {
                    panel.close(function (id) {

                    });
                } 

                panel = jsPanel.create({
                    theme: "black",
                    headerToolbar: '<span style="font-size:.85rem;">' + $('#pac-input-from').val() + ' to ' + $('#pac-input-to').val() + '</span>',
                    footerToolbar: '<span style="flex:1 1 auto">Status: ' + status + '</span>' +
                        '<i class="fal fa-clock"></i><span class="clock">loading ...</span>',
                    contentSize: {
                        width: function () { return Math.min(730, window.innerWidth * 0.9); },
                        height: function () { return Math.min(400, window.innerHeight * 0.5); }
                    },
                    position: 'center-top 0 100',
                    animateIn: 'jsPanelFadeIn',
                    headerTitle: 'Directions',
                    headerControls: {                       
                        smallify: 'enable',
                        minimize: 'enable',
                        normalize: 'enable',
                        maximize: 'disable',
                        close: 'enable'
                    },
                    contentSize: '290 523',
                    position: {
                        my: 'right-top',
                        at: 'right-top',
                        autoposition: 'down',
                        offsetX: -5,
                        offsetY: 95
                    },
                    content: '<div id="direction-panel"></div>',
                    onbeforeclose: function () {

                        //$('#pac-input-from').val("");
                        //$('#pac-input-to').val("");

                        directionsDisplay.setMap(null);
                        directionsDisplay.setPanel(null);
                        //document.getElementById("direction-panel").innerHTML = "";
                        new AutocompleteDirectionsHandler(map);
                        directionsDisplay = new google.maps.DirectionsRenderer;
                        directionsDisplay.setMap(map);
                        directionsDisplay.setPanel(document.getElementById("direction-panel"));

                        return confirm('Do you really want to close the panel?');
                    },
                    onwindowresize: true,
                    callback: function (panel) {

                        this.content.style.padding = '20px';
                        jsPanel.setStyles(panel.content, {
                            padding: '10px',
                            fontSize: '1rem'
                        });
                        function clock() {
                            var time = new Date(),
                                hours = time.getHours(),
                                minutes = time.getMinutes(),
                                seconds = time.getSeconds();
                            panel.footer.querySelectorAll('.clock')[0].innerHTML = harold(hours) + ':' + harold(minutes) + ':' + harold(seconds);
                            function harold(standIn) {
                                if (standIn < 10) { standIn = '0' + standIn; }
                                return standIn;
                            }
                        }
                        setInterval(clock, 1000);

                        directionsDisplay.setPanel(document.getElementById('direction-panel'));
                    }
                });


                directionsDisplay.setDirections(response);

            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    }
    else {
        alert('One or more field is empty');
    }

};


google.maps.event.addDomListener(window, 'load', initialize);


//Hide Elements
$(document).ready(function () {
    $('[visibly]').Visibly();
})


//declare namespace
var search = {};

//geocode function
search.geocode = function () {

    var address = $('#pac-input').val();

    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);


            var infowindow = new google.maps.InfoWindow();

            var marker = new google.maps.Marker({
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

//Enable/Disable alert
changeCheckbox.onchange = function () {

    if (changeCheckbox.checked) {

        AutoRefresh();

    } else {


        AutoRefresh();
    }



};




AutoAdjustScreen();

window.onresize = function (event) {
    setTimeout(function () {

        AutoAdjustScreen();
    }, 500);
};



function AutoAdjustScreen() {

    $(window).height();   // returns height of browser viewport
    $(document).height(); // returns height of HTML document
    $(window).width();   // returns width of browser viewport
    $(document).width(); // returns width of HTML document

    //alert(screen.height);
    var isChromium = window.chrome,
        vendorName = window.navigator.vendor,
        isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
        isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;

    if (screen.height == 768) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "542px";
                $("#tableContainer").height(320);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "558px";
                $("#tableContainer").height(335);
            }

        }, 500);
    }
    else if (screen.height == 720) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "520px";
                $("#tableContainer").height(250);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "520px";
                $("#tableContainer").height(285);
            }

        }, 500);
    }
    else if (screen.height == 786) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "560px";
                $("#tableContainer").height(338);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "576px";
                $("#tableContainer").height(353);
            }

        }, 500);
    }
    else if (screen.height == 800) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "600px";
                $("#tableContainer").height(365);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "590px";
                $("#tableContainer").height(360);
            }

        }, 500);
    }
    else if (screen.height == 864) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "662px";
                $("#tableContainer").height(435);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "664px";
                $("#tableContainer").height(425);
            }

        }, 500);
    }
    else if (screen.height == 900) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "690px";
                $("#tableContainer").height(450);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "700px";
                $("#tableContainer").height(465);
            }

        }, 500);
    }
    else if (screen.height == 960) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "760px";
                $("#tableContainer").height(525);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "747px";
                $("#tableContainer").height(520);
            }

        }, 500);
    }
    else if (screen.height == 1024) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "822px";
                $("#tableContainer").height(590);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "812px";
                $("#tableContainer").height(580);
            }

        }, 500);
    }
    else if (screen.height == 1080) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "878px";
                $("#tableContainer").height(646);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "868px";
                $("#tableContainer").height(636);
            }

        }, 500);
    }
    else if (screen.height == 1050) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "847px";
                $("#tableContainer").height(615);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "840px";
                $("#tableContainer").height(605);
            }

        }, 500);
    }
    else if (screen.height == 1200) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1000px";
                $("#tableContainer").height(760);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "990px";
                $("#tableContainer").height(755);
            }

        }, 500);
    }
    else if (screen.height == 1344) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1142px";
                $("#tableContainer").height(900);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "1132px";
                $("#tableContainer").height(895);
            }

        }, 500);
    }
    else {
        setTimeout(function () {
            $("#tableContainer").height(400);
        }, 500);
    }
}

//================================================//

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
}

function deleteAllShape() {

    for (var i = 0; i < all_overlays.length; i++) {
        all_overlays[i].overlay.setMap(null);
    }
    all_overlays = [];

    for (var i = 0; i < infoWindowList.length; i++) {
        infoWindowList[i].close();
    }

    for (var i = 0; i < recmarkers.length; i++) {
        recmarkers[i].setMap(null);
    }
    recmarkers = [];

    // Reset the markers array
    infoWindowList = [];

    // To show:
    drawingManager.setOptions({
        drawingControl: true
    });

}

function saveZone() {


    var checkName = $('#zname').val();

    if (checkName == "") {

        alert('Zone name must not be empty');

    }
    else {

        if (/\s/.test(finalString)) {
            savePoi("Default");
        } else {

            var form = new FormData();
            form.append("email", "anthony_agustin@acecom.com.sg");
            form.append("password", "acecom2015");

            var settings = {
                "async": true,
                "crossDomain": true,
                "url": "https://developers.onemap.sg/privateapi/auth/post/getToken",
                "method": "POST",
                "processData": false,
                "contentType": false,
                "mimeType": "multipart/form-data",
                "data": form
            }

            $.ajax(settings).done(function (response) {
                var obj = JSON.parse(response);

                var onemap_api = 'https://developers.onemap.sg/privateapi/commonsvc/revgeocode?location=' + finalString + '&token=' + obj.access_token;
                console.log(onemap_api)
                $.ajax({
                    url: onemap_api,
                    type: 'GET',
                    success: function (data) {
                        if (data.GeocodeInfo.length > 0) {
                            //console.log(data);
                            var address_block = '';
                            var address_road = '';
                            var address_building = '';
                            var full_address = '';

                            if (data.GeocodeInfo[0].BLOCK != null || data.GeocodeInfo[0].BLOCK != undefined) {
                                address_block = data.GeocodeInfo[0].BLOCK
                                full_address = address_block + " ";
                            }

                            if (data.GeocodeInfo[0].ROAD != null || data.GeocodeInfo[0].ROAD != undefined) {
                                address_road = data.GeocodeInfo[0].ROAD
                                full_address += address_road + " ";
                            }

                            if (data.GeocodeInfo[0].BUILDINGNAME != null || data.GeocodeInfo[0].BUILDINGNAME != undefined) {
                                if (data.GeocodeInfo[0].BUILDINGNAME != "null") {
                                    address_building = data.GeocodeInfo[0].BUILDINGNAME
                                    full_address += address_building;
                                }

                            }

                            savePoi(full_address);
                        } else {

                            var onemap_api = 'https://developers.onemap.sg/privateapi/commonsvc/revgeocode?location=' + finalString + '&token=' + obj.access_token;
                            console.log(onemap_api)
                            $.ajax({
                                url: onemap_api,
                                type: 'GET',
                                success: function (data) {
                                    if (data.GeocodeInfo.length == 0) {
                                        console.log('No Address')
                                        savePoi('No Address');
                                    } else {
                                        var address_block = '';
                                        var address_road = '';
                                        var address_building = '';
                                        var full_address = '';

                                        if (data.GeocodeInfo[0].BLOCK != null || data.GeocodeInfo[0].BLOCK != undefined) {
                                            address_block = data.GeocodeInfo[0].BLOCK
                                            full_address = address_block + " ";
                                        }

                                        if (data.GeocodeInfo[0].ROAD != null || data.GeocodeInfo[0].ROAD != undefined) {
                                            address_road = data.GeocodeInfo[0].ROAD
                                            full_address += address_road + " ";
                                        }

                                        if (data.GeocodeInfo[0].BUILDINGNAME != null || data.GeocodeInfo[0].BUILDINGNAME != undefined) {

                                            if (data.GeocodeInfo[0].BUILDINGNAME != "null") {
                                                address_building = data.GeocodeInfo[0].BUILDINGNAME
                                                full_address += address_building;
                                            }
                                        }

                                        savePoi(full_address);

                                    }
                                }
                            });
                        }
                    }
                });

            });

        }
    }

}

function savePoi(address) {

    var d = new Date();
    var timestamp = moment.utc(d).local().format("DD MMM YYYY, hh:mm:ss A");

    if (getSessionstorageValueRoleID > 2) {

        var zones = {
            ZoneID: 0,
            Name: $('#zname').val(),
            TypeID: $('#getZoneTypes').val(),
            CompanyID: getSessionstorageValueCompanyID,
            CreatedDate: timestamp,
            Perimeter: finalString,
            CellIds: '',
            Location: address,
            Created_User: getSessionstorageValueUser,
            Modified_User: getSessionstorageValueUser,
            Color: sessionStorage.getItem('setSessionstorageValueZoneColor')
        };

    } else {

        var zones = {
            ZoneID: 0,
            Name: $('#zname').val(),
            TypeID: $('#getZoneTypes').val(),
            CompanyID: getSessionstorageValueAssetCompany,
            CreatedDate: timestamp,
            Perimeter: finalString,
            CellIds: '',
            Location: address,
            Created_UserID: getSessionstorageValueUserID,
            Modified_UserID: getSessionstorageValueUserID,
            Color: sessionStorage.getItem('setSessionstorageValueZoneColor')
        };

    }

    if (zones.ZoneID == 'undefined' || zones.ZoneID == null || zones.ZoneID == 0) {
        $.ajax({
            url: 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo',
            type: "POST",
            data: JSON.stringify(zones),
            crossDomain: true,
            contentType: 'application/json; charset=utf-8',
            xhrFields: {
                withCredentials: false
            },
            permissions: ["https://*.track-asia.com"],
            success: function (zones) {
                console.log(zones);                   
                //return false;
                //window.location.reload(true);
                window.location.reload(true);
            },
        });
    }
    

}

function deleteAllPoi() {

    for (var i = 0; i < pois.length; i++) {
        pois[i].setMap(null);
    }
    pois = [];

    //for (var i = 0; i < markerLabels.length; i++) {
    //    markerLabels[i].setMap(null);
    //}
    //markerLabels = [];

    for (var i = 0; i < all_overlays.length; i++) {
        all_overlays[i].overlay.setMap(null);
    }
    all_overlays = [];

    for (var i = 0; i < infoWindowList.length; i++) {
        infoWindowList[i].close();
    }

    // Reset the markers array
    infoWindowList = [];

    // To show:
    drawingManager.setOptions({
        drawingControl: true
    });

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

//================================================//

function searchdestination(address) {

    destto = $('#destination').val();

    URLDest = "https://www.google.com/maps/dir/" + address + "/" + destto;

    if ($('#destination').val().length == 0) {
        alert("Your Destination is empty!");
    } else {
        window.open(URLDest, 'newwindow');
    }
}

function copyToClipboard(text) {
    // alert(text);
    if (window.clipboardData && window.clipboardData.setData) {
        // IE specific code path to prevent textarea being shown while dialog is visible.
        return clipboardData.setData("Text", text);

    } else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
        var textarea = document.createElement("textarea");
        textarea.textContent = text;
        textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in MS Edge.
        document.body.appendChild(textarea);
        textarea.select();
        try {
            return document.execCommand("copy");  // Security exception may be thrown by some browsers.
        } catch (ex) {
            console.warn("Copy to clipboard failed.", ex);
            return false;
        } finally {
            document.body.removeChild(textarea);
        }
    }
}






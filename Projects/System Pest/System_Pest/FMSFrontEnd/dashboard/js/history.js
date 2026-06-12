$(document).ready(function () {

    var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
    var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

    //Then retrieve
    var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
    var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
    var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');
    var getLocalstorageValueDateFrom = localStorage.getItem('setLocalstorageValueDateFrom');
    var getLocalstorageValueDateTo = localStorage.getItem('setLocalstorageValueDateTo');


    //Set
    var localObjAsset = document.getElementById('load-assets').value = getLocalstorageValueAsset;
    var localObjCompany = document.getElementById('load-company').value = getLocalstorageValueCompany;
    var localObjDateFrom = document.getElementById('dateFrom').value = getLocalstorageValueDateFrom;
    var localObjDateTo = document.getElementById('dateTo').value = getLocalstorageValueDateTo;


    localStorage.setItem("setLocalstorageValueAsset", localObjAsset);
    localStorage.setItem("setLocalstorageValueCompany", localObjCompany);
    localStorage.setItem("setLocalstorageValueDateFrom", localObjDateFrom);
    localStorage.setItem("setLocalstorageValueDateTo", localObjDateTo);


    //Change
    $('#load-assets').append($('<option></option>').val(getLocalstorageValueAsset).html(getLocalstorageValueAsset));
    $('#load-company').append($('<option></option>').val(getLocalstorageValueCompany).html(getLocalstorageValueCompany));



    //Onload
    //document.getElementById("marker").checked = true;
    //document.getElementById("direction").checked = true;
    //document.getElementById("line").checked = true;


var geocoder;
var map;
var markers = new Array();
var marker;
var direction;
var directions = new Array();
var assets = [];
// var MarkerDirection = [];
var lines = [];

var zones = [];
var polygon;
var pathCoordinates = new google.maps.MVCArray();
var pathCoordinatesLines = new google.maps.MVCArray();
var polygonCoordinates = new Array();
var circleCoordinates = new Array();

var pulses = new Array();
var pulse;

var polyline;
var interval;
var infoBoxList = [];

var webapi;
var validateTimestamp;
var validateRxTime;
var interval;
var i = 0;






    //Marker Checkbox
    var changeCheckbox = document.querySelector('.js-check-change-marker');

    //Line Checkbox
    var changeCheckboxLines = document.querySelector('.js-check-change-line');



    function initialize() {


        geocoder = new google.maps.Geocoder();


        map = new google.maps.Map(document.getElementById('map-canvas'), {
            zoom: 12,
            center: new google.maps.LatLng(1.3000, 103.8000),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            zoomControl: true
        });

        resize('map-canvas', 32);
            
        setZones(map, zones, handleZones);

        //Click Refresh
        document.getElementById("clickGenerate").onclick = Generate;
        document.getElementById("clickGenerateEN").onclick = GenerateEN;
        document.getElementById("clickReset").onclick = Reset;
        document.getElementById("clickResetEN").onclick = ResetEN;


        google.maps.event.addListener(map, 'mousemove', function (event) {
            document.getElementById('panel').innerHTML =
               event.latLng.lat() + ', ' + event.latLng.lng();
        });

    }


    //Marker
    changeCheckbox.onchange = function () {


        //Sets the map on all markers in the array.
        function setAllMap(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }

            for (var i = 0; i < directions.length; i++) {
                directions[i].setMap(map);
            }

        }

        if (changeCheckbox.checked) {

            setMarkers(map, assets);
            setDirection(map, MarkerDirection);
            //setAllMap(map);

        } else {
            setAllMap(null);

        }



    };

    //Lines
    changeCheckboxLines.onchange = function () {


        //for (var i = 0; i < lines.length; i++) {
        //    lines[i].setMap(null);
        //}

        if (changeCheckboxLines.checked) {

            setLines(map, lines);

        } else {


            // you probably then want to empty out your array as well
            lines = [];

            // not sure you'll require this at this point, but if you want to also clear out your array of coordinates...
            pathCoordinates.clear();

        }

    };


    function RemoveMarker() {


        for (var i = 0; i < infoBoxList.length; i++) {
            infoBoxList[i].setMap(null);
        }

        // Reset the markers array
        infoBoxList = [];


    }



    $(function () {

        $('.SelectSpeed').on('change', function () {
            var getSpeedAnimation = $(this).find("option:selected").val();

            localStorage.setItem("setLocalstorageValueAnimationSpeed", getSpeedAnimation);


        });

    });





    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly'
    };


    var pictureLabel;
    var icon = "";
    var iconURL = "img/bk-marker/";
    var markerCategory = "";
    var pictureLabelURL = "img/categories/marker/";
    var infoboxCloseURL = "img/close.gif";
    var tipboxURL = "img/tipbox.gif";
    var contentString;



    function setLines(map, lines) {


        var company = getLocalstorageValueCompany;
        var vehicle = getLocalstorageValueAsset;
        var datefrom = getLocalstorageValueDateFrom;
        var dateto = getLocalstorageValueDateTo;
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";

        var convertTimestamp = moment(datefrom, dateFormat);
        var convertRxtime = moment(dateto, dateFormat);

        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);

        validateTimestamp = moment(datefrom, dateFormat).isValid();
        validateRxTime = moment(dateto, dateFormat).isValid();


        localStorage.setItem("setLocalstorageValueAsset", vehicle);
        localStorage.setItem("setLocalstorageValueCompany", company);
        localStorage.setItem("setLocalstorageValueDateFrom", timestamp);
        localStorage.setItem("setLocalstorageValueDateTo", rxtime);



        webapi = "http://117.120.7.119/spwebapi/api/posinfo?Asset=" + vehicle + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;


        $.getJSON(webapi, function (lines) {

            for (var i = 0; i < lines.length; i++) {
                var line = lines[i];
                var myLatLng = new google.maps.LatLng(parseFloat(line.PosY), parseFloat(line.PosX));
                var assetName = line.Asset;
                var engine = line.Engine;
                var speed = line.Speed;
                var mileage = line.Mileage;
                var battery = line.Battery;
                var assetTimestamp = line.Timestamp;
                var address = line.Location;
                var tag = line.Tag;
                var fix = line.Fix;

                //Format UTC
                var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");

                var icon = "";
                switch (line.Engine) {
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

                icon = iconURL + icon + ".png";

                marker = new google.maps.Marker({
                    position: myLatLng,
                    //zoom: 17,
                    map: map,
                    icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                    shape: shape,
                    title: line.Asset,
                    optimized: false
                });

                markers.push(marker);


                direction = new google.maps.Marker({
                    position: myLatLng,
                    map: map,

                    icon: {
                        //path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                        path: 'M -3,0 0,-3 3,0 0,-1 z',
                        scale: 2,
                        strokeColor: 'green',
                        strokeWeight: 1,
                        fillOpacity: 0.8,
                        fillColor: 'green',
                        offset: '100%',
                        rotation: line.Course,
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(0, 8),
                        optimized: false

                    }
                });

                directions.push(direction);

                try {

                    //Speed

                    if (line.Speed > 0) {
                        direction.setVisible(true);
                    }
                    else {
                        direction.setVisible(false);
                    }

                }
                catch (e) {

                    alert('You got this error: ' + e);
                }

                // Construct the polyline.
                //polyline = new google.maps.Polyline({
                //    path: pathCoordinatesLines,
                //    asset: assetName,
                //    location: address,
                //    geodesic: true,
                //    strokeColor: '#FF0000',
                //    strokeOpacity: 1.0,
                //    strokeWeight: 2,
                //    scale: 4
                //});

                // Define a symbol using SVG path notation, with an opacity of 1.
                var lineSymbol = {
                    path: 'M 0,-1 0,1',
                    strokeOpacity: 1,
                    strokeColor: '#FF0000',
                    scale: 3
                };

                polyline = new google.maps.Polyline({
                    path: pathCoordinatesLines,
                    asset: assetName,
                    location: address,
                    strokeOpacity: 0,
                    icons: [{
                        icon: lineSymbol,
                        offset: '0',
                        repeat: '20px'
                    }],
                });


                var bounds = new google.maps.LatLngBounds();
                var point = [];

                point = new google.maps.LatLng(parseFloat(line.PosY), parseFloat(line.PosX));
                bounds.extend(point);

                map.fitBounds(bounds);
                map.setZoom(12);

                pathCoordinatesLines.push(myLatLng);

                polyline.setMap(map);


            }



        });


    }

    /**
 * Animating...
 */
    function playAnimate() {


        RemoveMarker();
        

        var company = getLocalstorageValueCompany;
        var vehicle = getLocalstorageValueAsset;
        var datefrom = getLocalstorageValueDateFrom;
        var dateto = getLocalstorageValueDateTo;
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";

        var convertTimestamp = moment(datefrom, dateFormat);
        var convertRxtime = moment(dateto, dateFormat);

        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);

        validateTimestamp = moment(datefrom, dateFormat).isValid();
        validateRxTime = moment(dateto, dateFormat).isValid();


        localStorage.setItem("setLocalstorageValueAsset", vehicle);
        localStorage.setItem("setLocalstorageValueCompany", company);
        localStorage.setItem("setLocalstorageValueDateFrom", timestamp);
        localStorage.setItem("setLocalstorageValueDateTo", rxtime);



        url = "http://117.120.7.119/spwebapi/api/posinfo?Asset=" + vehicle + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

        if (validateTimestamp == true && validateRxTime == true) {

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


            var xhr = createCORSRequest('GET', url);
            xhr.send();
            if (!xhr) {
                throw new Error('CORS not supported');
            }

            interval = setInterval(function () {
                RemoveMarker();
                setMarker();
            }, 1500);

        }
        else {
            alert('Invalid Date');
        }


    }

    function setMarker() {

        $.getJSON(url, function (assets) {

            var asset = assets[i];

            if (asset == undefined) {
                window.location.reload(true);                
            }

            var category = asset.Category;
            var company = asset.Company;
            var vechs = asset.Name;
            var id = asset.AssetID;
            var gps = asset.FixID;
            var engine = asset.Engine;
            var address = asset.Location;
            var speed = asset.Speed;
            var mileage = asset.Mileage;
            var assetTimestamp = asset.Timestamp;

            //Convert Timezone
            var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            var Singapore = moment.tz(assetTimestamp, Asia);

            var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');

            var myLatLng = new google.maps.LatLng(parseFloat(asset.PosY), parseFloat(asset.PosX));

            var icon = "";
            switch (asset.Engine) {
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

            icon = iconURL + icon + ".png";



            marker = new google.maps.Marker({
                position: myLatLng,
                //zoom: 17,
                map: map,
                icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                shape: shape,
                title: asset.Asset,
                optimized: false
            });

            //var bounds = new google.maps.LatLngBounds();
            //var point = [];

            //point = new google.maps.LatLng(parseFloat(asset.PosY), parseFloat(asset.PosX));
            //bounds.extend(point);

            //map.fitBounds(bounds);
            //map.setZoom(15);

            //marker.setEasing("easeInOutQuint");
            //marker.setPosition(myLatLng);

            markers.push(marker);



            var assetColor;

            if (asset.Engine == 'MOVE')
                assetColor = "success";
            if (asset.Engine == 'IDLE')
                assetColor = "warning";
            if (asset.Engine == 'STOP')
                assetColor = "danger";

            var finaldata = assets[i].Asset.match(/.{1,31}/g).join("<br/>");

            contentString = '<div style="width=240px; class="scrollFix"><h5 class="text-primary"><strong>' + finaldata + '</strong></h5>' +
            '<p class="text-default text-justify bg-' + assetColor + '" style="height:auto; padding:7px;">' + address + '</p>' +
            '<div id="toggleInfobox" style="color:black;">' +
            '<b>Status:&nbsp;</b>' + engine + '<br />' +
            '<b>Speed:&nbsp;</b>' + speed + '<br />' +
            '<b>Timestamp:&nbsp;</b>' + timestamp + 
            '</div>' +
            '</div>';

            setInfoBubble(marker, assets[i]);

            var infoBubble = new InfoBubble({
                minWidth: 300,
                minHeight: 160,
                map: map,
                content: contentString,
                shadowStyle: 1,
                // backgroundColor: 'rgb(57,57,57)',
                borderRadius: 4,
                arrowSize: 15,
                borderWidth: 1,
                // borderColor: '#2c2c2c',
                disableAutoPan: false,
                hideCloseButton: false,
                arrowPosition: 30,
                backgroundClassName: 'phoney',
                arrowStyle: 2,
            });

            infoBoxList.push(infoBubble);

            infoBubble.open(map, marker);


            i++;
            if (i == assets.length) {
                clearInterval(interval);
            }

        });


    }

    function setInfoBubble(marker, assets) {

        var infoBubble = new InfoBubble({
            maxWidth: 300,
            minHeight: 180,
            map: map,
            content: contentString,
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

        infoBoxList.push(infoBubble);

        marker.addListener('click', function () {
            infoBubble.open(marker.get('map'), marker);
        });
    }

    /**
    * Pausing...
     */
    function pauseAnimate() {

        window.clearTimeout(interval);

    }

    function pauseAnimateEN() {

        window.clearTimeout(interval);

    }




    /** @this {google.maps.Polyline} */
    function showArrays(event) {


        // Since this polygon has only one path, we can call getPath()
        // to return the MVCArray of LatLngs.
        var vertices = this.getPath();

        var contentString = '<b>' + this.location + '</b><br>' +
            'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
            '<br>';

        // Iterate over the vertices.
        //for (var i = 0; i < vertices.getLength() ; i++) {
        //    var xy = vertices.getAt(i);
        //    contentString += '<br>' + 'Coordinate ' + i + ':&nbsp;' + location + '<br>' + xy.lat() + ',' +
        //        xy.lng();
        //}

        // Replace the info window's content and position.
        infoWindow.setContent(contentString);
        infoWindow.setPosition(event.latLng);

        infoWindow.open(map);

    }



    function Generate() {

        RemoveMarker();

        if (changeCheckbox.checked) {

            setMarkers(map, assets);
            setDirection(map, MarkerDirection);

        }

        else {

            alert('Marker not selected');
        }


        if (changeCheckboxLines.checked) {

            setLines(map, lines);
        }

        else {

            alert('Line not selected');
        }




    }

    function GenerateEN() {

        RemoveMarker();

        if (changeCheckbox.checked) {

            setMarkers(map, assets);
            setDirection(map, MarkerDirection);

        }

        else {

            alert('Marker not selected');
        }

        if (changeCheckboxLines.checked) {

            setLines(map, lines);
        }

        else {

            alert('Line not selected');
        }

    }


    function Reset() {

        //window.location.reload(true);
        clearInterval(interval);

        clearTimeout(interval);

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];


        // Loop through markers and set map to null for each
        for (var i = 0; i < directions.length; i++) {

            directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];


        for (var i = 0; i < lines.length; i++) {
            lines[i].setMap(null);
        }

        // you probably then want to empty out your array as well
        lines = [];

        // not sure you'll require this at this point, but if you want to also clear out your array of coordinates...
        pathCoordinates.clear();


    }


    function ResetEN() {

        //window.location.reload(true);
        clearInterval(interval);

        clearTimeout(interval);

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];


        // Loop through markers and set map to null for each
        for (var i = 0; i < directions.length; i++) {

            directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];


        for (var i = 0; i < lines.length; i++) {
            lines[i].setMap(null);
        }

        // you probably then want to empty out your array as well
        lines = [];

        // not sure you'll require this at this point, but if you want to also clear out your array of coordinates...
        pathCoordinatesLines.clear();

        for (var i = 0; i < infoBoxList.length; i++) {
            infoBoxList[i].setMap(null);
        }

        // Reset the markers array
        infoBoxList = [];




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


    function setZones(map, zones, callback) {

        var url = "";


        if (getSessionstorageValueRoleID == 1) {

            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getLocalstorageValueReseller + '&CompanyID=' + getLocalstorageValueCompany;

        } else if (getSessionstorageValueRoleID == 2) {

            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getLocalstorageValueReseller;

        } else if (getSessionstorageValueRoleID >= 3) {

            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getLocalstorageValueReseller + '&CompanyID=' + getLocalstorageValueCompany;

        }

        $.getJSON(url, function (zones) {
            callback(zones);
        });


    }

    var circle = {};

    function handleZones(zones) {

        for (var i = 0; i < zones.length; i++) {

            var zone = zones[i];
            var zoneID = zone.ZoneID;
            var name = zone.Name;
            var type = zone.Type;
            var perimeter = zone.Perimeter;
            var company = zone.Company;
            var color = zone.Color;


            var coords = perimeter.split(" ");
            var recoords;
            var Pos;
            var zoneCircle;



            //Circle - 1.042346,99.939392 1.038056,99.937031
            if (coords.length <= 2) {

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

            if (coords.length >= 3) {

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


            }


            /**
            * Function to Zones
            */
            $(function () {

                $('.SelectZonesFilter').on('change', function () {
                    var selected = $(this).find("option:selected").val();

                    for (i = 0; i < zones.length; i++) {

                        if (coords.length <= 2) {
                            circle = circleCoordinates[i];
                            if (circle.zoneID == selected || selected.length === 0) {
                                map.fitBounds(zoneCircle.getBounds());
                            }
                        }

                        if (coords.length >= 2) {

                            polygon = polygonCoordinates[i];

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





                            }
                        }



                    }

                });

            });


        }
        return zones;

    }


    /** @this {google.maps.Polygon} */
    function showArrays(event) {

        // Since this polygon has only one path, we can call getPath()
        // to return the MVCArray of LatLngs.


        var contentString = '<div style="color:#000"><b>Zone:&nbsp;' + this.Name + '</b></div>';



        // Replace the info window's content and position.
        infoWindow.setContent(contentString);
        infoWindow.setPosition(event.latLng);

        infoWindow.open(map);
    }


    function showArrayCircle(event) {

        // Since this polygon has only one path, we can call getPath()
        // to return the MVCArray of LatLngs.
        var contentString = '<div style="color:#000"><b>Zone:&nbsp;' + this.Name + '</b></div>';



        // Replace the info window's content and position.
        infoWindow.setContent(contentString);
        infoWindow.setPosition(event.latLng);

        infoWindow.open(map);
    }




    google.maps.event.addDomListener(window, 'load', initialize);



    //=====================================================

    $('#pauseAnimateEN').hide();
    $('#stopAnimateEN').hide();

    // Click events
    $('#startAnimate').click(function () {
        playAnimate();
    });

    $('#startAnimateEN').click(function () {

        $('#startAnimateEN').hide();
        $('#stopAnimateEN').show();
        $('#pauseAnimateEN').show();

        setLines(map, lines);
        playAnimate();
        //playAnimateEN(handlePlayAnimateEN);
    });


    $('#stopAnimate').click(function () {
        Reset();
    });

    $('#stopAnimateEN').click(function () {

        $('#startAnimateEN').show();
        $('#stopAnimateEN').hide();
        $('#pauseAnimateEN').hide();
        ResetEN();
    });



    $('#pauseAnimate').click(function () {
        pauseAnimate();
    });

    $('#pauseAnimateEN').click(function () {
        pauseAnimateEN();
    });


});
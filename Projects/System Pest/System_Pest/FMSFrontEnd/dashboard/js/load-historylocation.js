//Then retrieve
var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
var getLocalstorageValueDateFrom = localStorage.getItem('setLocalstorageValueDateFrom');
var getLocalstorageValueDateTo = localStorage.getItem('setLocalstorageValueDateTo');
var getLocalstorageValueSpeedLimit = localStorage.getItem('setLocalstorageValueSpeedLimit');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleDevice, titleDate, titleStatus;

if (getSessionstorageValueLanguage == "en")
{
    titleDevice = "Device";
    titleDate = "Date";
    titleStatus = "Status";

} else if (getSessionstorageValueLanguage == "th")
{
    titleDevice = "อุปกรณ์";
    titleDate = "วันที่";
    titleStatus = "สถานะ";

} else if (getSessionstorageValueLanguage == "vn")
{
    titleDevice = "Thiết Bị";
    titleDate = "Ngày";
    titleStatus = "Trạng Thái";

} else if (getSessionstorageValueLanguage == "id")
{
    titleDevice = "Alatan";
    titleDate = "Tanggal";
    titleStatus = "Status";

}

if (getLocalstorageValueAsset == "") {

    alert('History Location Not Allowed');
    window.location.href = 'history.html';

}
else {

    //Storage
    $(document).ready(function () {


        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";


        var convertTimestamp = moment(getLocalstorageValueDateFrom, dateFormat);
        var convertRxtime = moment(getLocalstorageValueDateTo, dateFormat);

        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
        var duration = 'Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration';


        var geocoder;
        var map;
        var markers = new Array();
        var marker;
        var assets = [];
        var direction;
        var directions = new Array();
        var MarkerDirection = [];

        var polyline;
        var pathCoordinates = new google.maps.MVCArray();
        var lines = [];


        //Checkbox
        var changeCheckbox = document.querySelector('.js-check-change-viewALL');


        //Onload
        //document.getElementById("viewALL").checked = false;

        $("#viewALL").removeAttr("checked");

        function initialize() {

            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(1.3000, 103.8000);
            var mapTypeIds = [];
            for (var type in google.maps.MapTypeId) {
                mapTypeIds.push(google.maps.MapTypeId[type]);
            }

            var mapOptions = {
                zoom: 12,
                center: latlng,
                panControl: false,
                zoomControl: false,
                mapTypeControl: true,

                mapTypeId: "roadmap",

                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                    //style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                    mapTypeIds: mapTypeIds,
                    position: google.maps.ControlPosition.TOP_LEFT
                },
                streetViewControl: true,
                streetViewControlOptions: {
                    position: google.maps.ControlPosition.TOP_LEFT
                },
                scaleControl: true,
                overviewMapControl: true
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            resize('map-canvas', 32);

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


            /*=================================================*/

            //setMarkers(map, assets);
            setLines(map, lines);
            //AutoCenter();



            google.maps.event.addListener(map, 'mousemove', function (event) {
                document.getElementById('panel').innerHTML =
                   event.latLng.lat() + ', ' + event.latLng.lng();
            });



        }


        function setLines(map, lines) {


            var url = "http://117.120.7.119/spwebapi/api/posinfo/?Asset=" + getLocalstorageValueAsset + "&Speed=" + getLocalstorageValueSpeedLimit + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

            $.getJSON(url, function (lines) {


                for (var i = 0; i < lines.length; i++) {

                    var line = lines[i];

                    pathCoordinates.push(new google.maps.LatLng(parseFloat(line.PosY), parseFloat(line.PosX)));


                    // Construct the polyline.
                    polyline = new google.maps.Polyline({
                        path: pathCoordinates,
                        geodesic: false,
                        strokeColor: '#FF0000',
                        strokeOpacity: 1.0,
                        strokeWeight: 2
                    });

                    polyline.setMap(map);

                    var bounds = new google.maps.LatLngBounds();

                    polyline.getPath().forEach(function (e) {//can't do polyline.getPath()[i] because it's a MVCArray
                        bounds.extend(e);
                    })

                    map.fitBounds(bounds);


                }

                return lines;
            }

                        //End
                        /*=================================================*/


                         )


        }



        function RemoveMarker() {


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


        }


        google.maps.event.addDomListener(window, 'load', initialize);


        if (getLocalstorageValueAsset == "null" | getLocalstorageValueDateFrom == "null" | getLocalstorageValueDateTo == "null") {

            alert('You must select or some fields are empty');
            window.location.href = 'history.html';
        }

        else {


            //Set
            localStorage.setItem("setLocalstorageValueAsset", getLocalstorageValueAsset);
            localStorage.setItem("setLocalstorageValueCompany", getLocalstorageValueCompany);
            localStorage.setItem("setLocalstorageValueDateFrom", getLocalstorageValueDateFrom);
            localStorage.setItem("setLocalstorageValueDateTo", getLocalstorageValueDateTo);


            //Then retrieve
            var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
            var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
            var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
            var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
            var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
            var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

            if (getSessionstorageValueUser == null | getSessionstorageValueUser == undefined | getSessionstorageValueUser == "") {

                localStorage.clear();
                window.location.href = 'http://track-asia.com/systempest/'; //Login URL

            }

            else {

                //Set
                sessionStorage.setItem("setSessionstorageValueCompany", getSessionstorageValueCompany);
                sessionStorage.setItem("setSessionstorageValueCompanyID", getSessionstorageValueCompanyID);
                sessionStorage.setItem("setSessionstorageValueEmail", getSessionstorageValueEmail);
                sessionStorage.setItem("setSessionstorageValueName", getSessionstorageValueName);
                sessionStorage.setItem("setSessionstorageValueRoleDesc", getSessionstorageValueRoleDesc);
                sessionStorage.setItem("setSessionstorageValueUser", getSessionstorageValueUser);

                $('#load-username').append($('<div></div>').val(getSessionstorageValueUser).html(getSessionstorageValueUser));
                $('#load-email').append($('<p></p>').val(getSessionstorageValueEmail).html(getSessionstorageValueEmail));

                function loadjscssfile(filename, filetype) {
                    if (filetype == "js") { //if filename is a external JavaScript file
                        var fileref = document.createElement('script')
                        fileref.setAttribute("type", "text/javascript")
                        fileref.setAttribute("src", filename)
                    }
                    else if (filetype == "css") { //if filename is an external CSS file
                        var fileref = document.createElement("link")
                        fileref.setAttribute("rel", "stylesheet")
                        fileref.setAttribute("type", "text/css")
                        fileref.setAttribute("href", filename)
                    }
                    if (typeof fileref != "undefined")
                        document.getElementsByTagName("head")[0].appendChild(fileref)
                }

                //loadjscssfile("myscript.js", "js") //dynamically load and add this .js file
                //loadjscssfile("javascript.php", "js") //dynamically load "javascript.php" as a JavaScript file

                //load css
                var css = "";
                switch (getSessionstorageValueRoleDesc) {
                    case "Super User":
                        css = "super";
                        break;
                    case "Reseller":
                        css = "reseller";
                        break;
                    case "Master User":
                        css = "master";
                        break;
                    case "Company Administrator":
                        css = "companyadmin";
                        break;
                    case "Administrator":
                        css = "administrator";
                        break;
                    case "User Report":
                        css = "viewer";
                        break;
                    case "User w/o Report":
                        css = "viewernoreport";
                        break;
                }


                loadjscssfile("css/" + css + ".css", "css") ////dynamically load and add this .css file





                var WebApi = "http://117.120.7.119/spwebapi/api/posinfo/?Asset=" + getLocalstorageValueAsset + "&Speed=" + getLocalstorageValueSpeedLimit + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                // $('#viewReports').bootstrapTable('destroy');
                //document.getElementById("timeIntervalPosition").innerHTML = duration;
                //Reports Table
                $(document).ready(function () {


                    $('#Reports').bootstrapTable(
                        {
                            idField: 'PosID',
                            url: WebApi,
                            columns: [{
                                field: 'PosID',
                                title: 'id',
                                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                            }, {
                                field: 'Asset',
                                title: titleDevice
                            }, {
                                field: 'Timestamp',
                                title: titleDate,
                                //sortable: 'true',
                                formatter: timestampFormatter
                            }, {
                                field: 'Engine',
                                title: titleStatus,
                                //sortable: 'true',
                                formatter: engineFormatter
                            }],

                            onClickRow: function (row, $element) {
                                console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                $('.assetSelectedRow').removeClass('assetSelectedRow');
                                $($element).addClass('assetSelectedRow');

                                //Store
                                localStorage.setItem("row", JSON.stringify(row));


                                //Then retrieve
                                //var localObj = JSON.parse(localStorage.getItem(row));

                                //Table Vehicle List

                                RemoveMarker();

                                obj = JSON.parse(localStorage.row)

                                var lat = obj.PosY;
                                var lng = obj.PosX;
                                var assetName = obj.Asset;
                                var engine = obj.Engine;
                                var course = obj.Course

                                //InfoBox Content
                                var tag = obj.Tag;
                                var address = obj.Location;
                                var speed = obj.Speed;
                                var mileage = obj.Mileage;
                                var fix = obj.Fix;
                                var assetTimestamp = obj.Timestamp;
                                var battery = obj.battery;
                                var myLatLng = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));


                                var shape = {
                                    coords: [1, 1, 1, 20, 18, 20, 18, 1],
                                    type: 'poly'
                                };

                                //Background marker

                                var icon = "";
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
                                }


                                icon = "img/bk-marker/" + icon + ".png";


                                marker = new google.maps.Marker({
                                    map: map,
                                    position: myLatLng,
                                    icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                                    shape: shape,
                                    title: assetName

                                });



                                var bounds = new google.maps.LatLngBounds();
                                var point = [];

                                point = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));
                                bounds.extend(point);

                                map.fitBounds(bounds);
                                map.setZoom(15);

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
                                        rotation: course,
                                        origin: new google.maps.Point(0, 0),
                                        anchor: new google.maps.Point(0, 7)

                                    }
                                });

                                directions.push(direction);



                                try {

                                    //Speed

                                    if (speed > 0) {
                                        direction.setVisible(true);
                                    }
                                    else {
                                        direction.setVisible(false);
                                    }

                                }
                                catch (e) {

                                    alert('You got this error: ' + e);
                                }


                                //Format UTC
                                var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");


                                var contentString = '<div id="content">' +
                                      '<div id="siteNotice">' +
                                      '</div>' +
                                      '<h4 id="firstHeading" class="firstHeading text-primary">' + assetName + '</h4>' +
                                      '<div id="bodyContent">' +
                                      '<p><b data-l11n="th">ที่อยู่: </b><b data-l11n>Address: </b>' + address +
                                      '<br /><b data-l11n="th">สถานะ: </b><b data-l11n>Status: </b>' + engine +
                                      '<br /><b data-l11n="th">ความเร็ว: </b><b data-l11n>Speed: </b>' + speedFormatter(speed) + '</p>' +
                                      '<p><b data-l11n="th">การประทับเวลา: </b><b data-l11n>Timestamp: </b>' + timestamp + '</p>' +
                                      '</div>' +
                                      '</div>';


                                infoWindow = new google.maps.InfoWindow({
                                    content: contentString
                                });

                                //infoWindow.open(map, marker);


                                (function (marker) {
                                    google.maps.event.addListener(marker, "click", function (e) {
                                        //infoWindow.setContent(asset.Asset);
                                        infoWindow.open(map, marker);
                                        map.panTo(this.position);
                                    });
                                })(marker);





                            },



                        });

                });



                //Enable/Disable View ALL
                changeCheckbox.onchange = function () {

                    if (changeCheckbox.checked) {

                        RemoveMarker();

                        $.getJSON(WebApi, function (assets) {

                            var shape = {
                                coords: [1, 1, 1, 20, 18, 20, 18, 1],
                                type: 'poly'
                            };

                            var infoboxCloseURL = "img/close.gif";
                            var tipboxURL = "img/tipbox.gif";


                            for (var i = 0; i < assets.length; i++) {

                                var asset = assets[i];
                                var engine = asset.Engine;
                                var vechs = asset.Asset;
                                var id = asset.AssetID;
                                var gps = asset.FixID;
                                var address = asset.Location;
                                var course = asset.Course;
                                var speed = asset.Speed;
                                var assetTimestamp = asset.Timestamp;

                                if (assets.indexOf(i) !== -1) continue;

                                var myLatLng = new google.maps.LatLng(parseFloat(asset.PosY), parseFloat(asset.PosX));


                                var icon = "";
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
                                }


                                icon = "img/bk-marker/" + icon + ".png";


                                marker = new google.maps.Marker({
                                    map: map,
                                    position: myLatLng,
                                    icon: new google.maps.MarkerImage(icon, new google.maps.Size(28, 28), new google.maps.Point(0, 0), new google.maps.Point(14, 14)),
                                    shape: shape,
                                    title: vechs

                                });

                                var bounds = new google.maps.LatLngBounds();
                                var point = [];

                                point = new google.maps.LatLng(parseFloat(asset.PosY), parseFloat(asset.PosX));
                                bounds.extend(point);

                                map.fitBounds(bounds);

                                map.setZoom(13);
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
                                        rotation: course,
                                        origin: new google.maps.Point(0, 0),
                                        anchor: new google.maps.Point(0, 7)

                                    }
                                });

                                directions.push(direction);



                                try {

                                    //Speed

                                    if (speed > 0) {
                                        direction.setVisible(true);
                                    }
                                    else {
                                        direction.setVisible(false);
                                    }

                                }
                                catch (e) {

                                    alert('You got this error: ' + e);
                                }


                                //Format UTC
                                var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");

                                if (asset.Engine == 'MOVE')
                                    assetColor = "success";
                                if (asset.Engine == 'IDLE')
                                    assetColor = "warning";
                                if (asset.Engine == 'STOP')
                                    assetColor = "danger";


                                var assetContent = '<div id="infobox">' +
                                      '<div id="siteNotice">' +
                                      '</div>' +
                                      '<h4 id="firstHeading" class="firstHeading" style="color:white">' + vechs + '</h4>' +
                                      '<div id="bodyContent">' + "<p class='text-default text-justify bg-" + assetColor + " pad-all' style='height:auto'>" + address + "</p>" +
                                      '<br /><b data-l11n="th">สถานะ: </b><b data-l11n>Status: </b>' + engine +
                                      '<br /><b data-l11n="th">ความเร็ว: </b><b data-l11n>Speed: </b>' + speed +
                                      '<p><b data-l11n="th">การประทับเวลา: </b><b data-l11n>Timestamp: </b>' + timestamp + '</p>' +
                                      '</div>' +
                                      '</div>';




                                //Marker Details - Info Window
                                /*=================================================*/
                                //Start

                                var infoboxOptions = {
                                    //content: document.getElementById("infobox"),
                                    content: assetContent,
                                    disableAutoPan: false,
                                    maxWidth: 150,
                                    pixelOffset: new google.maps.Size(-140, 14),
                                    zIndex: null,
                                    boxStyle: {
                                        background: "url('" + tipboxURL + "') no-repeat",
                                        opacity: 1,
                                        width: "280px"
                                    },
                                    closeBoxMargin: "12px 4px 2px 2px",
                                    closeBoxURL: infoboxCloseURL,
                                    infoBoxClearance: new google.maps.Size(1, 1),
                                    isHidden: false,
                                    enableEventPropagation: false
                                };

                                //Define the infobox
                                assets[i].infobox = new InfoBox(infoboxOptions);

                                //Open box when page is loaded
                                assets[i].infobox.close(map, marker);


                                google.maps.event.addListener(marker, 'click', (function (marker, i) {

                                    return function () {
                                        assets[i].infobox.open(map, this);
                                        map.panTo(this.position);

                                    }

                                })(marker, i));

                            }

                        });

                    } else {

                        RemoveMarker();

                    }



                };


            }
        }

    });

}

function speedFormatter(value) {

    //Speed Formula
    if (value < 20) {
        var convertKmPerHour = value * 3.6;
    }
    else {
        var convertKmPerHour = value * 3.6 / 2;
    }

    var roundoff = Math.round(convertKmPerHour * 100) / 100;

    return roundoff + ' Km/h';
}

    //  Format for Vehicle Column.
    // =================================================================
    function vehicleFormatter(value, row) {


        return '<a class="btn-link" id="showVehicle" onClick="showVehicle()">' + value + '</a>';
    }


    //  Format for Ignition Column.
    // =================================================================
    function ignitionFormatter(value, row) {
        var labelColor;
        var text;
        if (value == 1) {
            labelColor = "success";
            text = "On";
        } else if (value == 0) {
            labelColor = "dark";
            text = "Off";
        }
        var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
        return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
    }


    //  Format for Engine Column.
    // =================================================================
    function engineFormatter(value, row) {
        var labelColor;
        var text;

        if (getSessionstorageValueLanguage == "en") {
            switch (value) {
                case "MOVE":
                    text = "MOVE";
                    break;
                case "IDLE":
                    text = "IDLE";
                    break;
                case "STOP":
                    text = "STOP"
                    break;
            }
        }
        else if (getSessionstorageValueLanguage == "th") {
            switch (value) {
                case "MOVE":
                    text = "ย้าย";
                    break;
                case "IDLE":
                    text = "ว่าง";
                    break;
                case "STOP":
                    text = "หยุด"
                    break;
            }
        }
        else if (getSessionstorageValueLanguage == "vn") {
            switch (value) {
                case "MOVE":
                    text = "DI CHUYEN";
                    break;
                case "IDLE":
                    text = "RANH RANG";
                    break;
                case "STOP":
                    text = "DỪNG LẠI"
                    break;
            }
        }
        else if (getSessionstorageValueLanguage == "id") {
            switch (value) {
                case "MOVE":
                    text = "GERAK";
                    break;
                case "IDLE":
                    text = "TAK JALAN";
                    break;
                case "STOP":
                    text = "HENTI"
                    break;
            }
        }

        if (value == "MOVE") {
            labelColor = "success";
        } else if (value == "IDLE") {
            labelColor = "warning";
        } else if (value == "STOP") {
            labelColor = "danger";
        }
        var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
        return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
    }



    //  Format for Timestamp Column.
    // =================================================================
    function timestampFormatter(value, row) {


        //Convert Timezone
        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

        var Singapore = moment.tz(value, Asia);

        //Format UTC
        //var timestamp = moment(Singapore.format()).format("D-MMM-YYYY, hh:mm:ss A");
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';



    }


    //Session Storage
    $(document).ready(function () {

        //Then retrieve
        var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');


        //Set
        sessionStorage.setItem("setSessionstorageValueLanguage", getSessionstorageValueLanguage);


        document.documentElement.lang = getSessionstorageValueLanguage;


        $("#load-lang").val(getSessionstorageValueLanguage);


    });

    //OnChange Session Storage
    $(document).ready(function () {

        $('#load-lang').change(function () {

            //sessionStorage.clear();

            sessionStorage.removeItem("setSessionstorageValueLanguage");

            var lang = $("#load-lang").val();

            //Set
            sessionStorage.setItem("setSessionstorageValueLanguage", lang);


        });


    });

    $(document).ready(function () {

        $.ajax({
            type: "GET",
            url: "data/version.txt",
            async: false,
            dataType: "text",
            success: function (data) {


                //Set
                localStorage.setItem("setLocalstorageValueVersion", data);


            },
            error: function () { alert('error'); }
        });

        var version;
        //Then retrieve
        version = localStorage.getItem('setLocalstorageValueVersion');

        document.getElementById("verNum").innerHTML = version;

        document.getElementById("verNumEN").innerHTML = version;

    });

    $(document).ready(function () {

        $.ajax({
            type: "GET",
            url: "data/software.txt",
            async: false,
            dataType: "text",
            success: function (data) {


                //Set
                localStorage.setItem("setLocalstorageValueSoftware", data);


            },
            error: function () { alert('error'); }
        });


        //Then retrieve
        var version = localStorage.getItem('setLocalstorageValueSoftware');

        document.getElementById("software").innerHTML = version;
        document.getElementById("softwareEN").innerHTML = version;


    });

    if (getSessionstorageValueLanguage == "en") {
        $("#idle").text("IDLE");
        $("#move").text("MOVE");
        $("#stop").text("STOP");
        $("#down").text("DOWN");


    } else if (getSessionstorageValueLanguage == "th") {
        $("#idle").text("ว่าง");
        $("#move").text("ย้าย");
        $("#stop").text("หยุด");
        $("#down").text("ลง");


    } else if (getSessionstorageValueLanguage == "vn") {
        $("#idle").text("RANH RANG");
        $("#move").text("DI CHUYEN");
        $("#stop").text("DỪNG LẠI");
        $("#down").text("XUỐNG");


    } else if (getSessionstorageValueLanguage == "id") {
        $("#idle").text("TAK JALAN");
        $("#move").text("GERAK");
        $("#stop").text("HENTI");
        $("#down").text("MATI");


    }
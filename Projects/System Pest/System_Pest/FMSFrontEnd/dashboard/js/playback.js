var app = app || {};
var iconURL = "img/playback-marker/";
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titlePlaybackNotAllow, titleDate;

if (getSessionstorageValueLanguage == "en") {
    titlePlaybackNotAllow = "Playback Not Allowed"
    titleDate = "Date";
}
else if (getSessionstorageValueLanguage == "th") {
    titlePlaybackNotAllow = "ไม่อนุญาตให้เล่น"
    titleDate = "วันที่";


} else if (getSessionstorageValueLanguage == "vn") {
    titlePlaybackNotAllow = "Không Dược Phát Lại"
    titleDate = "Ngày";


}
else if (getSessionstorageValueLanguage == "id") {
    titlePlaybackNotAllow = "Pemutaran Tidak Diizinkan"
    titleDate = "Tanggal";

}

//Then retrieve
var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');
var getLocalstorageValueDateFrom = localStorage.getItem('setLocalstorageValueDateFrom');
var getLocalstorageValueDateTo = localStorage.getItem('setLocalstorageValueDateTo');

if (getLocalstorageValueAsset == "" || getLocalstorageValueDateFrom == "" || getLocalstorageValueDateTo == "") {

    alert(titlePlaybackNotAllow);
    window.location.href = 'history.html';


} else {

    (function ($) {

        // map settings
        var mapTypeIds = [];

        for (var type in google.maps.MapTypeId) {
            mapTypeIds.push(google.maps.MapTypeId[type]);
        }

        mapOptions = {
            panControl: true,
            zoomControl: true,
            zoomControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            },
            mapTypeControl: false,
            mapTypeId: "roadmap",
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                mapTypeIds: mapTypeIds,
                position: google.maps.ControlPosition.LEFT_BOTTOM
            },
            streetViewControl: true,
            streetViewControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            },
            scaleControl: true,
            overviewMapControl: true
        };

        // symbol settings
        symbolOptions = {
            path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
            scale: 7,
            strokeWeight: 2,
            strokeColor: "#FFFFFF",
            offset: '100%',
            fillColor: '#3895FF',
            fillOpacity: 1
        };

        // polyline settings
        polylineOptions = {
            path: [],
            asset: '',
            location: '',
            geodesic: false,
            strokeColor: 'red',
            strokeOpacity: 1.0,
            strokeWeight: 2.0,
            icons: [{
                icon: symbolOptions,
                offset: '0%'
            }]
        };


        // marker control app
        app = {
            map: false, // map object
            polyline: false, // polyline object
            route: false, //  API data
            coordinates: [], // route coordinates 
            tempCount: 0, // previous count
            count: 0, // current count
            offset: 0, //  symbol current offset value
            isPlay: false, // play / pause flag
            speed: 200, // adjust play speed
            animateTimeout: false,
            createMap: function (element, options) {

                // initialize map
                this.map = new google.maps.Map(element, options);

                // store all route coordinate as google maps latlng object
                for (var i = 0; i < app.route.length; i++) {
                    this.coordinates.push(new google.maps.LatLng(this.route[i].PosY, this.route[i].PosX));

                    var lines = this.route[i];

                    //Background marker
                    switch (this.route[i].Engine) {
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

                    var marker = new google.maps.Marker({
                        icon: {
                            url: icon,
                            size: new google.maps.Size(7, 7),
                            anchor: new google.maps.Point(4, 4)
                        },
                        position: new google.maps.LatLng(this.route[i].PosY, this.route[i].PosX),
                        map: app.map
                    });

                    var finaldata = this.route[i].Asset.match(/.{1,31}/g).join("<br/>");
                    var assetTimestamp = this.route[i].Timestamp;

                    //Format UTC
                    var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");

                    contentString = '<div style="width=200px; class="scrollFix"><p class="text-primary"><strong><font size="1.5">' + finaldata + '</font></strong></p>' +
                    '<div id="toggleInfobox" style="color:black;">' +
                    '<b>' + titleDate + '&nbsp;</b>' + timestamp + '<br>' +
                    '</div>' +
                    '</div>';

                    setInfoBubble(marker, lines[i]);

                };


                function setInfoBubble(marker, lines) {

                    var infoBubble = new InfoBubble({
                        minWidth: 210,
                        minHeight: 70,
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


                    marker.addListener('click', function () {
                        infoBubble.open(marker.get('map'), marker);
                    });
                }

                // if polyline doesnt exist, create
                if (!this.polyline) {
                    polylineOptions.path = this.coordinates;
                    this.polyline = new google.maps.Polyline(polylineOptions);
                }

                // plot the polyline
                this.polyline.setMap(this.map);

                // center map on polyline
                this.zoomToMap(this.polyline);

                // show the control
                $('.control').show();
                $('.controlSlider').show();
                $('.controlClose').show();

                // update slider's max value
                $('#forwind').attr('max', (this.route.length - 1));

            },
            startRoute: function () {

                var pauseTimeout;

                function plot() {

                    // count add
                    app.count++;

                    // update slider's current value
                    $('#forwind').val(app.count);

                    if (app.offset < 100) {

                        pauseTimeout = setTimeout(function (data) {

                            console.log(app.count + ', ' + app.offset);
                            if (app.isPlay) {

                                // continue playing
                                plot();

                                console.log(app.count + ': ' + data.PosY + ', ' + data.PosX);

                            } else {

                                // reset timeout
                                clearTimeout(pauseTimeout);

                                console.log('paused at ' + app.count);

                            }

                        }, app.speed, app.route[app.count]);

                    }

                }

                if (this.isPlay) {

                    // continue playing
                    plot();

                    // start animating
                    this.animateSymbol();

                }

            },
            zoomToMap: function (obj) {

                var bounds = new google.maps.LatLngBounds();
                var points = obj.getPath().getArray();

                for (var n = 0; n < points.length; n++) {
                    bounds.extend(points[n]);
                }

                this.map.fitBounds(bounds);

            },
            animateSymbol: function () {

                // reset timeout
                clearTimeout(this.animateTimeout);

                this.animateTimeout = setInterval(function () {

                    if ((app.count / app.route.length * 100) === 100) {

                        // reset timeout
                        clearTimeout(app.animateTimeout);

                    } else {

                        // move symbol relative to polyline
                        app.count = (app.count) % app.coordinates.length;

                        // track symbol
                        app.trackSymbol(app.count);

                    }

                }, 20);
            },
            trackSymbol: function (count) {

                // set symbol's current offset on the polyline
                this.offset = (count / (this.coordinates.length - 1) * 100);
                var icons = this.polyline.get('icons');
                icons[0].offset = this.offset + '%';
                this.polyline.set('icons', icons);
                var position = google.maps.geometry.spherical.interpolate(this.coordinates[0], this.coordinates[this.coordinates.length - 1], (count / this.coordinates.length));

                // always center the symbol on the map
                //this.map.setZoom(15);
                this.map.setCenter(position);

            }
        };

        $(function () {

            // after window load
            google.maps.event.addDomListener(window, 'load', function () {

                // route API
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



                // route API
                var api = 'http://117.120.7.119/spwebapi/api/posinfo?Asset=' + vehicle + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                console.log(api);

                // get data from API
                $.get(api)
                    .done(function (response) {

                        // gathered data
                        app.route = response;

                        // initialize map
                        app.createMap(document.getElementById('map'), mapOptions);

                    })
                    .fail(function (error) {
                        console.trace(error);
                    });

            });

            function play() {

                // start playing
                app.isPlay = true;

                // start symbol routing
                app.startRoute(app.route);

                console.log('played at ' + app.count);

            }

            function pause() {

                // stop playing
                app.isPlay = false;

                clearTimeout(app.animateTimeout);

            }

            $('#play').on('click', function (e) {

                e.preventDefault();

                // prevent multi click
                $(this).prop('disabled', 'disabled');
                $('#pause').removeAttr('disabled');

                // play, play where you left
                play();

            });

            $('#pause').on('click', function (e) {

                e.preventDefault();

                // prevent multi click
                $(this).prop('disabled', 'disabled');
                $('#play').removeAttr('disabled');

                // pause
                pause();

            });


            $('#close').on('click', function (e) {

                e.preventDefault();

                window.location.href = "history.html";
            });

            $("#forwind").on('input change', function (e) {

                // stop playing
                app.isPlay = false;

                // prevent multi click
                $('#play').removeAttr('disabled');
                $('#pause').prop('disabled', 'disabled');

                // update count
                app.count = $(this).val();

                // move symbol relative to polyline
                app.count = (app.count) % app.route.length;

                // track symbol
                app.trackSymbol(app.count);

                // detect slider direction
                if (app.count > app.tempCount) {
                    console.log('forward at ' + app.count);
                } else if (app.count < app.tempCount) {
                    console.log('rewind at ' + app.count);
                }

                // save previous value
                app.tempCount = app.count;

            });

        });

    })(jQuery);


}

if (getSessionstorageValueLanguage == "en")
{
    $("#close1").text("Close");
    $("#map").text("Loading Map ...");

}
else if (getSessionstorageValueLanguage == "th")
{
    $("#close1").text("ปิด");
    $("#map").text("กำลังโหลดแผนที่ ...");

} else if (getSessionstorageValueLanguage == "vn")
{
    $("#close1").text("Gần");
    $("#map").text("Loading Bản đồ ...");

}
else if (getSessionstorageValueLanguage == "id")
{
    $("#close1").text("Tutup");
    $("#map").text("Pemuatan Peta ...");

}
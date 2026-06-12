
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

var url = 'http://117.120.7.119/spwebapi/api/assetinfo';
var xhr = createCORSRequest('GET', url);
xhr.send();
if (!xhr) {
    throw new Error('CORS not supported');
}


//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueUserNotifications = sessionStorage.getItem('setSessionstorageValueUserNotifications');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueAssetReseller = sessionStorage.getItem('setSessionstorageValueAssetReseller');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
$("#showVideo").hide();



sessionStorage.setItem("setSessionstorageValueDefaultReseller", 1);
sessionStorage.setItem("setSessionstorageValueDefaultCompany", 1);

var geocoder;
var map;
var markers = new Array();
var marker;
var direction;
var directions = new Array();
var pulse;
var pulses = new Array();

var assets = [];
var infoBoxList = [];

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


//var markerCluster1;
//var markerCluster2;
//var markerCluster3;

var AssignedNotifications = getSessionstorageValueUserNotifications.split(",");
var getNotification = new Array();

for (var a = 0; a < AssignedNotifications.length; a++) {

    var arrNotification = AssignedNotifications[a].substring(5);
    getNotification.push(arrNotification);
}

for (var b = 0; b < getNotification.length; b++) {
    arrNotif = getNotification[b];
}

var arrNotif;
if (arrNotif != 1) $('#uiAlert').hide();

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

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
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

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

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

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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

        $('#mobile-load-reseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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
	    var $result3 = $('#total-vehiclesVN');
        var $result4 = $('#total-vehiclesID');
        var $getGPS = $('#getGPS');
        var $getGPRS = $('#getGPRS');
        $result.text(0)
        $result2.text(0)
	    $result3.text(0)
        $result4.text(0)
        $getGPS.text(0)
        $getGPRS.text(0)

        $("#getMove").hide().html('0').fadeIn('0');
        $("#getIdle").hide().html('0').fadeIn('0');
        $("#getStop").hide().html('0').fadeIn('0');
        $("#getDown").hide().html('0').fadeIn('0');

        $('#assetStatus').bootstrapTable('destroy');

        $('#load-company').empty();

        $(".SelectCompanyFilter").selectpicker('refresh');

	$('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');
        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

	$('#load-company').append($('<option></option>').val(0).html("-------"));
            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));



            $.each(data, function (index, item) {
               
		$('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".SelectCompanyFilter").selectpicker('refresh');
	    $(".MobileSelectCompanyFilter").selectpicker('refresh');
        });

        AutoAdjustScreen();
    });

});


var selectedMobileReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.MobileSelectResellerFilter').on('change', function () {
        selectedMobileReseller = $(this).find("option:selected").val();

        $('#load-reseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedMobileReseller, function (data) {
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
	 var $result3 = $('#total-vehiclesVN');
        var $result4 = $('#total-vehiclesID');
        var $getGPS = $('#getGPS');
        var $getGPRS = $('#getGPRS');

        $result.text(0)
        $result2.text(0)
	 $result3.text(0)
        $result4.text(0)
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

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedMobileReseller, function (data) {

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


function initialize() {
var latitude;
    var longitude;

    if (getSessionstorageValueLanguage == "en") {
        latitude = 1.3000;
        longitude = 103.8000;
    }
    else if (getSessionstorageValueLanguage == "th") {
        latitude = 13.7500;
        longitude = 100.4833;
    }
    else if (getSessionstorageValueLanguage == "vn") {
        latitude = 10.7500;
        longitude = 106.6667;
    }
    else if (getSessionstorageValueLanguage == "id") {
        latitude = 0.7893;
        longitude = 113.9213;
    }

    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(latitude, longitude);
    var mapTypeIds = ["SEA", "OSMBW", "PublicTransport", "Skobbler", "OpenCycleMap", "OCMTransport-D", "OCMTransport-L", "OCMLandscape", "OCMOutdoor"];
    for (var type in google.maps.MapTypeId) {
        mapTypeIds.push(google.maps.MapTypeId[type]);
    }

    var mapOptions = {
        zoom: 12,
        center: latlng,
        panControl: false,
        zoomControl: false,
        mapTypeControl: true,

        //mapTypeId: "hybrid",

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

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);


    if (getSessionstorageValueLanguage == "th") {
        LayersTH();
    }
    else if (getSessionstorageValueLanguage == "en") {
        LayersEN();
    }
    else if (getSessionstorageValueLanguage == "vn") {
        LayersVN();
    }
    else if (getSessionstorageValueLanguage == "id") {
        LayersID();
    }



    setZones(map, zones, handleZones);
    setMarkers(map, assets, updateAssets);



    google.maps.event.addListener(map, 'mousemove', function (event) {
        document.getElementById('panel').innerHTML =
           event.latLng.lat() + ', ' + event.latLng.lng();
    });

    SearchPlaces();

    assetMarkerInterval = setInterval(function () {

        setMarkers(map, assets, updateAssets);
       // $('#assetStatus').bootstrapTable('refresh');
    }, '10000');

}


//Load Table
//$(document).ready(function () {

//    var WebAPI = "";

//    if (getSessionstorageValueRoleID == 1) {

//        WebAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';
//    }
//    else if (getSessionstorageValueRoleID == 2) {

//        WebAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
//    }
//    else if (getSessionstorageValueRoleID >= 3) {

//        WebAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
//    }

//    $('#assetStatus').bootstrapTable(
//        {
//            idField: 'AssetID',
//            url: WebAPI,
//            columns: [{
//                field: 'AssetID',
//                title: 'id',
//                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
//            }, {
//                field: 'Company',
//                title: 'Company',
//                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
//            }, {
//                field: 'Category',
//                title: 'Category',
//                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
//            }, {
//                //field: 'LastPos.Engine',
//                field: 'Engine',
//                title: 'Engine',
//                class: 'col-sm-1',
//                formatter: 'assetColorStatus'
//            }, {
//                field: 'Name',
//                title: 'Asset'
//            }, {
//                //field: 'LastPos.FixID',
//                field: 'Gps',
//                title: 'GPS',
//                class: 'col-sm-1',
//                formatter: 'gpsStatus'
//            }, {
//                field: 'Gprs',
//                title: 'GPRS',
//                class: 'col-sm-1',
//                formatter: 'gprsStatus'
//            }], onLoadSuccess: function (row) {
//                //$result.text('Event: onLoadSuccess, data: ' + data);
//                // var rowCount = $('table#assetStatus tr:last').index() + 1;

//                var move = 0;
//                var idle = 0;
//                var stop = 0;
//                var gps = 0;
//                var gprs = 0;
//                var down = 0;

//                for (var i = 0; i < row.length; ++i) {

//                    //var timestamp1 = moment.utc(row[i].LastPos.Timestamp).local().format("DD MMM YYYY");
//                    //var d = new Date();
//                    //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
//                    //timestamp2 = Date.parse(timestamp2);
//                    //timestamp1 = Date.parse(timestamp1);

//                    var timestamp2 = new Date().getDate();
//                    var timestamp1 = new Date(row[i].LastPos.Timestamp).getDate();

//                    if (row[i].Engine == "MOVE") {
//                        move++;
//                    } else if (row[i].Engine == "IDLE") {
//                        idle++;
//                    } else if (row[i].Engine == "STOP" && timestamp2 > timestamp1) {
//                        down++;
//                    } else if (row[i].Engine == "STOP") {
//                        stop++;
//                    }
//                }

//                for (var i = 0; i < row.length; ++i) {

//                    if (row[i].Gps < 2) {
//                        gps++;
//                    }
//                }

//                for (var i = 0; i < row.length; ++i) {

//                    if (row[i].Gprs == 2) {
//                        gprs++;
//                    }
//                }

//                var objEngine = {
//                    Move: move,
//                    Idle: idle,
//                    Stop: stop,
//                    GPS: gps,
//                    GPRS: gprs,
//                    Down: down,
//                };


//                var getCountMove = objEngine.Move;
//                var getCountIdle = objEngine.Idle;
//                var getCountStop = objEngine.Stop;
//                var getCountDown = objEngine.Down;
//                var getCountGPS = objEngine.GPS;
//                var getCountGPRS = objEngine.GPRS;


//                document.getElementById("getMove").innerHTML = getCountMove;
//                document.getElementById("getIdle").innerHTML = getCountIdle;
//                document.getElementById("getStop").innerHTML = getCountStop;
//                document.getElementById("getDown").innerHTML = getCountDown;
//                document.getElementById("getGPS").innerHTML = getCountGPS;
//                document.getElementById("getGPRS").innerHTML = getCountGPRS;


//                //Total Vehicles
//                var $result = $('#total-vehicles');
//                var $result2 = $('#total-vehiclesEN');
//                var rows = document.getElementById('assetStatus').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;

//                if (row.length == 0) {
//                    $result.text(0)
//                    $result2.text(0)

//                } else {

//                    $result.text(rows)
//                    $result2.text(rows)
//                }


//            },

//            onClickRow: function (row, $element) {

//                for (var i = 0; i < infoBoxList.length; i++) {

//                    infoBoxList[i].close();
//                }

//                // Reset the markers array
//                infoBoxList = [];

//                if ($($element).hasClass('assetSelectedRow')) {
//                    console.log('true');
//                }
//                else {

//                    $('.assetSelectedRow').removeClass('assetSelectedRow');
//                    $($element).addClass('assetSelectedRow');

//                    var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
//                    $("#assetStatus").find("tbody tr").each(function (index) {

//                        $(this).on(
//                            'click',
//                            function () {
//                                getPos = markers[index].getPosition();
//                                map.panTo(markers[index].getPosition());
//                                // map.setZoom(14);
//                                map.setCenter(markers[index].getPosition());

//                            });
//                    });


//                    var contentStringonload = "<div>" +
//                              "<table id='assetDetails'>" +
//                              "<tbody>" +
//                              "<tr>" +
//                              "<td style='width:120px !important;'>" +
//                              "<small class='text-primary'><strong>&nbsp;&nbsp;" + row.Name + "</strong></small>" +
//                              "</td>" +
//                              "</tr>" +
//                              "</tbody>" +
//                              "</table>" +
//                              "</div>";


//                    var infoBubble = new InfoBubble({
//                        minWidth: 110,
//                        minHeight: 40,
//                        map: map,
//                        content: contentStringonload,
//                        shadowStyle: 1,
//                        // backgroundColor: 'rgb(57,57,57)',
//                        backgroundColor: 'white',
//                        borderRadius: 4,
//                        arrowSize: 15,
//                        borderWidth: 1,
//                        // borderColor: '#2c2c2c',
//                        disableAutoPan: false,
//                        hideCloseButton: false,
//                        arrowPosition: 30,
//                        backgroundClassName: 'phoney',
//                        arrowStyle: 2,
//                    });

//                    infoBoxList.push(infoBubble);

//                    infoBubble.setPosition(myLatLng);
//                    infoBubble.open(map);


//                    paramtitle = row.Name;

//                    google.maps.event.addListener(infoBubble, 'closeclick', function () {
//                        $('.assetSelectedRow').removeClass('assetSelectedRow');
//                    });

//                }
//            }
//        });

//});



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


            $('#mobile-load-company').empty();
            $('.MobileSelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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


            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }


            setZonesFilter(map, zones, handleZones);

            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            if (getSessionstorageValueRoleID == 1) {
                var getZoneAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                var getZoneAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + "&CompanyID=" + selectedCompany;
            }

            else if (getSessionstorageValueRoleID >= 3) {
                var getZoneAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }


            //alert(getZoneAPI);


            $.getJSON(getZoneAPI, function (data) {

                $('#assetZone').append(
                    $('<option></option>').val(0).html("----")
                );

                $.each(data, function (index, item) {
                    $('#assetZone').append(
                         $('<option></option>').val(item.ZoneID).html(item.Name)
                     );
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

            document.getElementById("getMove").innerHTML = getCountMove;
            document.getElementById("getIdle").innerHTML = getCountMove;
            document.getElementById("getStop").innerHTML = getCountStop;

            $('#assetStatus').empty();


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


            for (var i = 0; i < pulses.length; i++) {
                pulses[i].setMap(null);
            }

            // Reset the markers array
            pulses = [];

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }



            clearInterval(IntervalCompanyFilter);
        }

        AutoAdjustScreen();
        //$('#assetStatus').bootstrapTable('refresh');

    });


    function AutoRefreshCompanyFilter() {

        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            if (markers[i] != null) markers[i].setMap(null);
        }

        // Reset the markers array
        markers = [];

        // Clears all clusters and markers from the clusterer.
        //markerCluster1.clearMarkers();
        //markerCluster2.clearMarkers();
        //markerCluster3.clearMarkers();

        for (var i = 0; i < directions.length; i++) {
            if (directions[i] != null) directions[i].setMap(null);
        }

        // Reset the markers array
        directions = [];

        for (var i = 0; i < pulses.length; i++) {
            if (pulses[i] != null) pulses[i].setMap(null);
        }
        pulses = [];

        for (var i = 0; i < infoBoxList.length; i++) {

         infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkers(map, assets, updateAssets);

       // $('#assetStatus').bootstrapTable('refresh');

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
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

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
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append(
                             $('<option></option>').val(item.Name).html(item.Name)
                         );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        $('#mobile-load-assets').append(
                             $('<option></option>').val(item.Name).html(item.Name)
                         );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
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
                    WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedMobileCompany;
                } else {
                    WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
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
                     var timestamp = moment(assetTimestamp).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
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


            $.getJSON("http://117.120.7.119/spwebapi/api/zoneinfo?CompanyID=" + selectedMobileCompany, function (data) {

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

        $('#assetStatus').bootstrapTable('refresh');

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
                    WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                } else {
                    WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;
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
                     var timestamp = moment(assetTimestamp).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');


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


            $.getJSON("http://117.120.7.119/spwebapi/api/zoneinfo?CompanyID=" + getCompany, function (data) {

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

        $('#assetStatus').bootstrapTable('refresh');

    }



});


function setMarkers(map, assets, callback) {

    if (getSessionstorageValueRoleID == 1) {
        if (sessionStorage.getItem('setSessionstorageValueDefaultReseller') > 0 && sessionStorage.getItem('setSessionstorageValueDefaultCompany') > 0) {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + sessionStorage.getItem('setSessionstorageValueDefaultReseller') + '&CompanyID=' + sessionStorage.getItem('setSessionstorageValueDefaultCompany');
        } else {
            url = '';
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $.getJSON(url, function (assets) {

        callback(assets);

    });
}

function setMarkersFilter(map, assets, callback) {

    var getReseller = $('#load-reseller').val();
    var getCompany = $('#load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedReseller != "") {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function setMarkersFilterMobile(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function setMarkersFilterMobileAsset(map, assets, callback) {

    var getReseller = $('#mobile-load-reseller').val();
    var getCompany = $('#mobile-load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileAsset != "") {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;

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

    if (data.length > 0) {

        for (var i = 0, length = data.length; i < length; i++) {

            var assets = data[i];
            var latLng = new google.maps.LatLng(data[i].LastPos.PosY, data[i].LastPos.PosX);
            var id = data[i].AssetID;
            var category = data[i].Category;
            var company = data[i].Company;
            var vechs = data[i].Name;
            var gps = data[i].Gps;
            var gprs = data[i].Gprs;
            var engine = data[i].Engine;
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
            //var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
            //var d = new Date();
            //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
            //timestamp2 = Date.parse(timestamp2);
            //timestamp1 = Date.parse(timestamp1);

            var timestamp2 = new Date().getDate();
            var timestamp1 = new Date(assetTimestamp).getDate();

            if (getSessionstorageValueTrackVersion == "sg") var timestamp = moment(assetTimestamp).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
            else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "vn") var timestamp = moment(assetTimestamp).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');

            if (data[i].LastPos == null | data[i].LastPos.Engine == null) {
                console.log('Data is Null');
                continue;
            }
            else {

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
                    case "Phone":
                        markerCategory = "phone";
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

                var assetDriver;
                if (assets.ImageFill == 'None') {
                    assetDriver = "img/av1.png";
                } else if (assets.ImageFill == 'Uniform') {
                    assetDriver = assets.Image;
                }

                var driverName;
                if (assets.Driver.Name == null) {
                    if (getSessionstorageValueLanguage == "en") {
                        driverName = "No Phone User";
                    } else if (getSessionstorageValueLanguage == "th") {
                        driverName = "ไม่มีผู้ใช้โทรศัพท์";
                    } else if (getSessionstorageValueLanguage == "vn") {
                        driverName = "Không có điện thoại tài";
                    } else if (getSessionstorageValueLanguage == "id") {
                        driverName = "Tiada Pengguna Ponsel";
                    }
                }
                else {
                    driverName = assets.Driver.Name;
                }


                var driverAddress;
                if (assets.Driver.Address == null) {
                    if (getSessionstorageValueLanguage == "en") {
                        driverAddress = "No Phone User Address";
                    } else if (getSessionstorageValueLanguage == "th") {
                        driverAddress = "ไม่มีที่อยู่ของผู้ใช้โทรศัพท์";
                    } else if (getSessionstorageValueLanguage == "vn") {
                        driverAddress = "Không có điện thoại Địa chỉ người dùng";
                    } else if (getSessionstorageValueLanguage == "id") {
                        driverAddress = "Tiada Pengguna Ponsel Alamat";
                    }
                } else {
                    driverAddress = assets.Driver.Address;
                }

                var driverPhone;
                if (assets.Driver.Phone == null) {
                    if (getSessionstorageValueLanguage == "en") {
                        driverPhone = "No Phone Number";
                    } else if (getSessionstorageValueLanguage == "th") {
                        driverPhone = "ไม่มีหมายเลขโทรศัพท์";
                    } else if (getSessionstorageValueLanguage == "vn") {
                        driverPhone = "Không có số điện thoại";
                    } else if (getSessionstorageValueLanguage == "id") {
                        driverPhone = "Tiada ada Nomor Ponsel";
                    }
                } else {
                    driverPhone = assets.Driver.Phone;
                }

                var parseAddress;
                if (address != null) {
                    parseAddress = address.match(/.{1,32}/g).join("<br/>");
                }

                if (getSessionstorageValueLanguage == "en") {

                    switch (engine) {
                        case "MOVE":
                            engine = "MOVE";
                            break;
                        case "IDLE":
                            engine = "IDLE";
                            break;
                        case "STOP":
                            engine = "STOP";
                            break;
                    }
                }
                else if (getSessionstorageValueLanguage == "th") {

                    switch (category) {
                        case "Phone":
                            category = "โทรศัพท์";
                            break;
                    }

                    switch (engine) {
                        case "MOVE":
                            engine = "รถวิ่ง";
                            break;
                        case "IDLE":
                            engine = "รถจอดติดเครื่อง";
                            break;
                        case "STOP":
                            engine = "หยุด";
                            break;
                    }
                } else if (getSessionstorageValueLanguage == "vn") {

                    switch (category) {
                        case "Phone":
                            category = "Điện thoại";
                            break;
                    }

                    switch (engine) {
                        case "MOVE":
                            engine = "chuyển động";
                            break;
                        case "IDLE":
                            engine = "không hoạt động";
                            break;
                        case "STOP":
                            engine = "Dừng lại";
                            break;
                    }

                } else if (getSessionstorageValueLanguage == "id") {

                    switch (category) {
                        case "Phone":
                            category = "Ponsel";
                            break;
                    }

                    switch (engine) {
                        case "MOVE":
                            engine = "Gerak";
                            break;
                        case "IDLE":
                            engine = "Menganggur";
                            break;
                        case "STOP":
                            engine = "Berhenti";
                            break;
                    }
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

                document.getElementById('getMove').innerHTML = move;
                document.getElementById('getIdle').innerHTML = idle;
                document.getElementById('getStop').innerHTML = stop;
                document.getElementById('getDown').innerHTML = down;
                document.getElementById('getGPS').innerHTML = nogps;
                document.getElementById('getGPRS').innerHTML = nogprs;
                document.getElementById('total-vehiclesEN').innerHTML = data.length;

                var assetContent = "<div id='assetInfo' class='form-group' style='padding:0px !important;'>" +
                           "<h6 style='color:#458FD2;'>" + finaldata + "</h6>" +
                           "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                           "<tbody>" +
                           "<tr>" + "<td>" +
                           "<span data-l11n class='text-bold'>Address:&nbsp;</span><span data-l11n='th' class='text-bold'>ที่อยู่: &nbsp;</span><span data-l11n='vn' class='text-bold'>Địa chỉ nhà: &nbsp;</span><span data-l11n='id' class='text-bold'>Alamat: &nbsp;</span>" + address +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Date:&nbsp;</span><span data-l11n='th' class='text-bold'>วันที่: &nbsp;</span><span data-l11n='vn' class='text-bold'>Ngày: &nbsp;</span><span data-l11n='id' class='text-bold'>Tanggal dan Waktu: &nbsp;</span>" + timestamp +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Category:&nbsp;</span><span data-l11n='th' class='text-bold'>ประเภท:&nbsp; </span><span data-l11n='vn' class='text-bold'>thể loại: &nbsp;</span><span data-l11n='id' class='text-bold'>Kategori: &nbsp;</span>" + category +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Speed:&nbsp;</span><span data-l11n='th' class='text-bold'>ความเร็ว:&nbsp; </span><span data-l11n='vn' class='text-bold'>Tốc độ: &nbsp;</span><span data-l11n='id' class='text-bold'>Kelajuan:&nbsp;</span>" + speedFormatter(speed) +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Latitude:&nbsp;</span><span data-l11n='th' class='text-bold'>ละติจูด: &nbsp; </span><span data-l11n='vn' class='text-bold'>vĩ độ: &nbsp;</span><span data-l11n='id' class='text-bold'>Garis Lintang: &nbsp;</span>" + getYPosition +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Longitude:&nbsp;</span><span data-l11n='th' class='text-bold'>ลองจิจูด: &nbsp; </span><span data-l11n='vn' class='text-bold'>kinh độ: &nbsp;</span><span data-l11n='id' class='text-bold'>Garis Bujur: &nbsp;</span>" + getXPosition +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Device Status:&nbsp;</span><span data-l11n='th' class='text-bold'>สถานะของอุปกรณ์: &nbsp; </span><span data-l11n='vn' class='text-bold'>Tình trạng thiết bị: &nbsp;</span><span data-l11n='id' class='text-bold'>Status Ponsel: &nbsp;</span>" + engine +
                           "<br />" +
                           "<span data-l11n class='text-bold'>Zones:&nbsp;</span><span data-l11n='th' class='text-bold'>พื้นที่: &nbsp; </span><span data-l11n='vn' class='text-bold'>Khu: &nbsp;</span><span data-l11n='id' class='text-bold'>lokasi: &nbsp;</span>" + zone +
                           "</td>" + "</tr>"
                "</tbody>" + "</table>" +
                "</div>"; //infobox

                var assetDriverInfo = "<div class='form-group'>" +
                         "<a class='thumbnail' data-style='btn-success'>" +
                         "<img src='" + assetDriver + "' name='image-swap' class='img-responsive' alt='Phone User Preview' width='110' height='110' id='showDriver'>" +
                         "</a>" +
                         "<span data-l11n class='text-bold'>Phone User:&nbsp;</span><span data-l11n='th' class='text-bold'>ผู้ใช้โทรศัพท์:&nbsp;</span><span data-l11n='vn' class='text-bold'>sử dụng điện thoại: &nbsp;</span><span data-l11n='id' class='text-bold'>Pengguna telepon: &nbsp;</span>" + driverName +
                         "<br />" +
                         "<span data-l11n class='text-bold'>Address:&nbsp;</span><span data-l11n='th' class='text-bold'>ที่อยู่:&nbsp;</span><span data-l11n='vn' class='text-bold'>Địa chỉ nhà: &nbsp;</span><span data-l11n='id' class='text-bold'>Alamat: &nbsp;</span>" + driverAddress +
                         "<br />" +
                         "<span data-l11n class='text-bold'>Phone:&nbsp;</span><span data-l11n='th' class='text-bold'>โทรศัพท์:&nbsp;</span><span data-l11n='vn' class='text-bold'>Điện thoại: &nbsp;</span><span data-l11n='id' class='text-bold'>Ponsel: &nbsp;</span>" + driverPhone +
                         "<br />" +
                         "</div>";

                if (data[i].Phone != null && data[i].Phone != "") {

                    var assetDriverContent = "<div class='form-group'>" +
                              "<br />" +
                              "<span data-l11n class='text-bold'>" + "SMS Phone User" + "</span>" +
                              "<textarea data-l11n rows='5' class='form-control' placeholder='Your message here ..' name='smsMsgDriverEN' id='smsMsgDriverEN' data-by-field='smsMsgDriverEN'></textarea>" +
                              "<br />" +
                              "<button data-l11n onclick='sendSMSEN(\"" + data[i].Phone + "\")' class='btn-dark btn btn-md pull-right'>Send</button>" +
                              "</div>";
                } else {

                    var assetDriverContent = "<div class='form-group'>" +
                          "<br />" +
                          "<span class='text-bold'>" + "No Registered Phone Number" + "</span>" +
                          "</div>";
                }

                if (data[i].TagPhoneNo != null && data[i].TagPhoneNo != "") {

                    if (data[i].Flag == 1) {

                        var Immobilize = "<div class='form-group'>" +
                                     "<br />" +
                                     "<button disabled='disabled' id='activateImmobilize' onclick='ActivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-success' type='button' style='width:100%; height: 50px; margin-top:40px;'>Activated</button>" +
                                     "<br />" +
                                     "<button id='deactivateImmobilize' onclick='DeactivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-danger' type='button'  style='width:100%; height: 50px; margin-top:10px;'>Deactivated</button>" +
                                     "</div>";

                    }
                    else if (data[i].Flag == 0) {

                        var Immobilize = "<div class='form-group'>" +
                                     "<br />" +
                                     "<button id='activateImmobilize' onclick='ActivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-success' type='button' style='width:100%; height: 50px; margin-top:40px;'>Activated</button>" +
                                     "<br />" +
                                     "<button disabled='disabled' id='deactivateImmobilize' onclick='DeactivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-danger' type='button'  style='width:100%; height: 50px; margin-top:10px;'>Deactivated</button>" +
                                     "</div>";

                    }
                }
                else {

                    var Immobilize = "<div class='form-group'>" +
                          "<br />" +
                          "<span class='text-bold'>" + "No Registered Device Number" + "</span>" +
                          "</div>";
                }

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


                if (speed > 0 && data[i].Engine != "STOP") {

                    if (timestamp2 > timestamp1) {
                        direction.setVisible(false);
                    }
                    else {
                        if (data[i].Engine == "MOVE") {
                            direction.setVisible(true);
                        }
                        else if (data[i].Engine == "IDLE") {
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
                        UIAlert();
                    }
                    else {
                        pulse.setVisible(false);
                    }

                }
                else {
                    pulse.setVisible(false);
                }

                //Filter Search
                $(function () {

                    $('#SearchAsset').keyup(function () {

                        var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$';
                        var rex = new RegExp($(this).val(), 'i');
                        $('.searchable tr').hide();


                        $('.searchable tr').filter(function () {
                            text = $(this).text().replace(/\s+/g, ' ');
                            return rex.test($(this).text());

                        }).show();


                    });

                });

                //To fix marker sensitivity issue
                google.maps.event.addDomListener(pulse, "click", function (event) {
                    google.maps.event.trigger(marker[i], "click");
                });

                if (markers[i] && markers[i].setPosition) {
                    $("#assetStatus").empty();
                    //direction.setVisible(false);
                    //marker.setVisible(false);
                    //pulse.setVisible(false);
                    // To remove the marker from the map
                    marker.setMap(null);
                    direction.setMap(null);
                    pulse.setMap(null);


                    markers[i].setPosition(latLng);
                    directions[i].setPosition(latLng);
                    pulses[i].setPosition(latLng);

                    if (speed > 0 && engine != "STOP") {

                        if (timestamp2 > timestamp1) {
                            directions[i].setVisible(false);
                        }
                        else {

                            directions[i].setIcon(iconDirection);

                            if (data[i].Engine == "MOVE") {
                                directions[i].setVisible(true);
                            }
                            else if (data[i].Engine == "IDLE") {
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
                        if ($('#assetInfo').val() != null || $('#assetInfo').val() != undefined) { document.getElementById('assetInfo').innerHTML = assetContent; }
                        map.panTo(marker.getPosition());
                    }
                    else {
                        markers[i].content = assetContent;
                        markers[i].address = address;
                        markers[i].timestamp = timestamp;
                        markers[i].gps = gps;
                        markers[i].gprs = gprs;
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


                }//end of else
            }//end of else continue



        }//end of for

        if (firstData) {

            map.fitBounds(bounds);
            //map.setZoom(15);
            var listener = google.maps.event.addListener(map, "idle", function () {
                if (map.getZoom() > 15) map.setZoom(15);
                google.maps.event.removeListener(listener);
            });

            firstData = false;
        }


        for (k = 0; k < markers.length; k++) {

            if (markers[k] != undefined || markers[k]) {
                var outputDiv = document.getElementById('assetStatus');
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

        //end

    }
    else {
            document.getElementById('getMove').innerHTML = 0;
            document.getElementById('getIdle').innerHTML = 0;
            document.getElementById('getStop').innerHTML = 0;
            document.getElementById('getDown').innerHTML = 0;
            document.getElementById('getGPS').innerHTML = 0;
            document.getElementById('getGPRS').innerHTML = 0;
            document.getElementById('total-vehiclesEN').innerHTML = data.length;
    }





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
        vechs: param.vechs,
        gps: param.gps,
        gprs: param.gprs,
        zone: param.zone,
        engine: param.engine,
        icon: icon,
        shape: shape,
        content: param.content
    });

    var getAssetReseller = $("#load-reseller").val();
    var getAssetCompany = $("#load-company").val();
    
    var getTimestamp = moment().subtract('hours', 8).format('D-MMM-YYYY');
    var getRxTime = moment().add('month', 12).format('D-MMM-YYYY, HH:mm:ss A');

    var url = "http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=" + getAssetReseller + "&AssetCompanyID=" + getAssetCompany + "&AssetID=" + param.id + "&Timestamp=" + getTimestamp + "&RxTime=" + getRxTime;
    var tabJobs;

    $.getJSON(url, function (dataValues) {

        if (dataValues.length > 0) {

            var data = new google.visualization.DataTable();

            if (getSessionstorageValueLanguage == "en")
            {
                data.addColumn('string', 'Job Number');
                data.addColumn('string', 'Date');
                data.addColumn('string', 'To');
                data.addColumn('string', 'Status');
            }
            else if (getSessionstorageValueLanguage == "th")
            {
                data.addColumn('string', 'หมายเลขงาน');
                data.addColumn('string', 'วันที่');
                data.addColumn('string', 'ไปยัง');
                data.addColumn('string', 'สถานะ');
            }
            else if (getSessionstorageValueLanguage == "vn")
            {
                data.addColumn('string', 'Số việc làm');
                data.addColumn('string', 'Ngày');
                data.addColumn('string', 'Đến');
                data.addColumn('string', 'Trạng thái');
            }
            else if (getSessionstorageValueLanguage == "id")
            {
                data.addColumn('string', 'nomor pekerjaan');
                data.addColumn('string', 'Tanggal');
                data.addColumn('string', 'Untuk');
                data.addColumn('string', 'Status');
            }          

            var jobs;
            // Populate series
            for (i = 0; i < dataValues.length; i++) {

                jobs = dataValues[i];
                var assetTimestamp = jobs.Timestamp;

                if (getSessionstorageValueTrackVersion == "sg") {

                    if (getSessionstorageValueLanguage == "en") moment.locale('en')
                    if (getSessionstorageValueLanguage == "th") moment.locale('th')
                    if (getSessionstorageValueLanguage == "vn") moment.locale('vi')
                    if (getSessionstorageValueLanguage == "id") moment.locale('id')
                    var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, HH:mm:ss A");
                }
                else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                    if (getSessionstorageValueLanguage == "en") moment.locale('en')
                    if (getSessionstorageValueLanguage == "th") moment.locale('th')
                    if (getSessionstorageValueLanguage == "vn") moment.locale('vi')
                    if (getSessionstorageValueLanguage == "id") moment.locale('id')
                    var timestamp = moment(assetTimestamp).add('hours', 7).format("D-MMM-YYYY, HH:mm:ss A");
                }


                var jobstatus;
                if (getSessionstorageValueLanguage == "en") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "New";
                            break;
                        case "Transferred":
                            jobstatus = "Transferred";
                            break;
                        case "In Progress":
                            jobstatus = "In Progress";
                            break;
                        case "Scheduled":
                            jobstatus = "Scheduled";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Scheduled In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "Job Cancelled";
                            break;
                        case "Expired":
                            jobstatus = "Expired";
                            break;
                        case "Incomplete":
                            jobstatus = "Incomplete";
                            break;
                        case "Completed":
                            jobstatus = "Completed";
                            break;
                    }
                }
                else if (getSessionstorageValueLanguage == "th") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "ใหม่";
                            break;
                        case "Transferred":
                            jobstatus = "โอน";
                            break;
                        case "In Progress":
                            jobstatus = "กำลังดำเนินการ";
                            break;
                        case "Scheduled":
                            jobstatus = "ตามเวลาที่กำหนด";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "ความคืบหน้าในการกำหนดตารางเวลา";
                            break;
                        case "Job Cancelled":
                            jobstatus = "งานที่ยกเลิก";
                            break;
                        case "Expired":
                            jobstatus = "หมดอายุ";
                            break;
                        case "Incomplete":
                            jobstatus = "ไม่สมบูรณ์";
                            break;
                        case "Completed":
                            jobstatus = "เสร็จ";
                            break;
                    }

                }
                else if (getSessionstorageValueLanguage == "vn") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "Mới";
                            break;
                        case "Transferred":
                            jobstatus = "chuyển";
                            break;
                        case "In Progress":
                            jobstatus = "Trong tiến trình";
                            break;
                        case "Scheduled":
                            jobstatus = "Lên kế hoạch";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Theo lịch trình In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "việc hủy";
                            break;
                        case "Expired":
                            jobstatus = "Đã hết hạn";
                            break;
                        case "Incomplete":
                            jobstatus = "chưa hoàn thiện";
                            break;
                        case "Completed":
                            jobstatus = "Đã hoàn thành";
                            break;
                    }
                }
                else if (getSessionstorageValueLanguage == "id") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "Baru";
                            break;
                        case "Transferred":
                            jobstatus = "Ditransfer";
                            break;
                        case "In Progress":
                            jobstatus = "Sedang berlangsung";
                            break;
                        case "Scheduled":
                            jobstatus = "dijadwalkan";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Dijadwalkan In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "job Dibatalkan";
                            break;
                        case "Expired":
                            jobstatus = "kedaluwarsa";
                            break;
                        case "Incomplete":
                            jobstatus = "Tidak lengkap";
                            break;
                        case "Completed":
                            jobstatus = "Lengkap";
                            break;
                    }
                }


                data.addRows([[jobs.JobNumber, timestamp, jobs.Destination, jobstatus]]);

            }

            tabJobs = document.createElement('DIV');
            chart = new google.visualization.Table(tabJobs);
            chart.draw(data, {
                //firstRowNumber: 0,
                //frozenColumns: 5,
                showRowNumber: true,
                page: 'disable',
                // pageSize: 2,
                // pagingButtons: 'both',
                //startPage: 0,
                width: 280,
                height: getHeightChart
            });

        }
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
                infoBubble = this.getMap().newMarker = new InfoBubble({
                    minWidth: getWidth,
                    minHeight: getHeight,
                    shadowStyle: 1,
                    borderRadius: 4,
                    arrowSize: 15,
                    borderWidth: 1,
                    disableAutoPan: false,
                    hideCloseButton: false,
                    arrowPosition: 30,
                    backgroundClassName: 'phoney',
                    arrowStyle: 2
                });

                infoBoxList.push(infoBubble);

            }

            this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            this.getMap().newMarker.removeTab(2);
            this.getMap().newMarker.removeTab(1);
            this.getMap().newMarker.removeTab(0);
	        var titleDetails = "";
            var titlePhoneUser = "";
            var titleJobs = "";
            if (getSessionstorageValueLanguage == "en") {
                titleDetails = 'Details';
                titlePhoneUser = "Phone User";
                titleJobs = "Jobs";
            } else if (getSessionstorageValueLanguage == "th") {
                titleDetails = 'รายละเอียด';
                titlePhoneUser = "ผู้ใช้โทรศัพท์";
                titleJobs = "งาน";
            } else if (getSessionstorageValueLanguage == "vn") {
                titleDetails = 'Chi tiết';
                titlePhoneUser = "sử dụng điện thoại";
                titleJobs = "Việc làm";
            } else if (getSessionstorageValueLanguage == "id") {
                titleDetails = 'Perincian';
                titlePhoneUser = "Pengguna telepon";
                titleJobs = "Tugas";
            }
            this.getMap().newMarker.addTab(titleDetails, this.content); //Tab 1
            this.getMap().newMarker.addTab(titlePhoneUser, param.assetDriverInfo); //Tab 2

            if (tabJobs != null)
            {
                this.getMap().newMarker.addTab(titleJobs, tabJobs); //Tab 3
            }
            this.getMap().setCenter(this.position);
            paramtitle = param.title;


        });
    }



    return newMarker;
}

function setInfoBubble2(param) {

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
        vechs: param.vechs,
        gps: param.gps,
        gprs: param.gprs,
        zone: param.zone,
        engine: param.engine,
        icon: icon,
        shape: shape,
        content: param.content
    });

    var getAssetReseller = $("#load-reseller").val();
    var getAssetCompany = $("#load-company").val();

    var getTimestamp = moment().subtract('hours', 8).format('D-MMM-YYYY');
    var getRxTime = moment().add('month', 12).format('D-MMM-YYYY, HH:mm:ss A');

    var url = "http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=" + getAssetReseller + "&AssetCompanyID=" + getAssetCompany + "&AssetID=" + param.id + "&Timestamp=" + getTimestamp + "&RxTime=" + getRxTime;
    var tabJobs;

    $.getJSON(url, function (dataValues) {

        if (dataValues.length > 0) {

            var data = new google.visualization.DataTable();

            if (getSessionstorageValueLanguage == "en") {
                data.addColumn('string', 'Job Number');
                data.addColumn('string', 'Date');
                data.addColumn('string', 'To');
                data.addColumn('string', 'Status');
            }
            else if (getSessionstorageValueLanguage == "th") {
                data.addColumn('string', 'หมายเลขงาน');
                data.addColumn('string', 'วันที่');
                data.addColumn('string', 'ไปยัง');
                data.addColumn('string', 'สถานะ');
            }
            else if (getSessionstorageValueLanguage == "vn") {
                data.addColumn('string', 'Số việc làm');
                data.addColumn('string', 'Ngày');
                data.addColumn('string', 'Đến');
                data.addColumn('string', 'Trạng thái');
            }
            else if (getSessionstorageValueLanguage == "id") {
                data.addColumn('string', 'nomor pekerjaan');
                data.addColumn('string', 'Tanggal');
                data.addColumn('string', 'Untuk');
                data.addColumn('string', 'Status');
            }

            var jobs;
            // Populate series
            for (i = 0; i < dataValues.length; i++) {

                jobs = dataValues[i];
                var assetTimestamp = jobs.Timestamp;

                if (getSessionstorageValueTrackVersion == "sg") {

                    if (getSessionstorageValueLanguage == "en") moment.locale('en')
                    if (getSessionstorageValueLanguage == "th") moment.locale('th')
                    if (getSessionstorageValueLanguage == "vn") moment.locale('vi')
                    if (getSessionstorageValueLanguage == "id") moment.locale('id')
                    var timestamp = moment(assetTimestamp).add('hours', 8).format("D-MMM-YYYY, HH:mm:ss A");
                }
                else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                    if (getSessionstorageValueLanguage == "en") moment.locale('en')
                    if (getSessionstorageValueLanguage == "th") moment.locale('th')
                    if (getSessionstorageValueLanguage == "vn") moment.locale('vi')
                    if (getSessionstorageValueLanguage == "id") moment.locale('id')
                    var timestamp = moment(assetTimestamp).add('hours', 7).format("D-MMM-YYYY, HH:mm:ss A");
                }


                var jobstatus;
                if (getSessionstorageValueLanguage == "en") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "New";
                            break;
                        case "Transferred":
                            jobstatus = "Transferred";
                            break;
                        case "In Progress":
                            jobstatus = "In Progress";
                            break;
                        case "Scheduled":
                            jobstatus = "Scheduled";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Scheduled In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "Job Cancelled";
                            break;
                        case "Expired":
                            jobstatus = "Expired";
                            break;
                        case "Incomplete":
                            jobstatus = "Incomplete";
                            break;
                        case "Completed":
                            jobstatus = "Completed";
                            break;
                    }
                }
                else if (getSessionstorageValueLanguage == "th") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "ใหม่";
                            break;
                        case "Transferred":
                            jobstatus = "โอน";
                            break;
                        case "In Progress":
                            jobstatus = "กำลังดำเนินการ";
                            break;
                        case "Scheduled":
                            jobstatus = "ตามเวลาที่กำหนด";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "ความคืบหน้าในการกำหนดตารางเวลา";
                            break;
                        case "Job Cancelled":
                            jobstatus = "งานที่ยกเลิก";
                            break;
                        case "Expired":
                            jobstatus = "หมดอายุ";
                            break;
                        case "Incomplete":
                            jobstatus = "ไม่สมบูรณ์";
                            break;
                        case "Completed":
                            jobstatus = "เสร็จ";
                            break;
                    }

                }
                else if (getSessionstorageValueLanguage == "vn") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "Mới";
                            break;
                        case "Transferred":
                            jobstatus = "chuyển";
                            break;
                        case "In Progress":
                            jobstatus = "Trong tiến trình";
                            break;
                        case "Scheduled":
                            jobstatus = "Lên kế hoạch";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Theo lịch trình In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "việc hủy";
                            break;
                        case "Expired":
                            jobstatus = "Đã hết hạn";
                            break;
                        case "Incomplete":
                            jobstatus = "chưa hoàn thiện";
                            break;
                        case "Completed":
                            jobstatus = "Đã hoàn thành";
                            break;
                    }
                }
                else if (getSessionstorageValueLanguage == "id") {
                    switch (jobs.JobStatus) {
                        case "New":
                            jobstatus = "Baru";
                            break;
                        case "Transferred":
                            jobstatus = "Ditransfer";
                            break;
                        case "In Progress":
                            jobstatus = "Sedang berlangsung";
                            break;
                        case "Scheduled":
                            jobstatus = "dijadwalkan";
                            break;
                        case "Scheduled In Progress":
                            jobstatus = "Dijadwalkan In Progress";
                            break;
                        case "Job Cancelled":
                            jobstatus = "job Dibatalkan";
                            break;
                        case "Expired":
                            jobstatus = "kedaluwarsa";
                            break;
                        case "Incomplete":
                            jobstatus = "Tidak lengkap";
                            break;
                        case "Completed":
                            jobstatus = "Lengkap";
                            break;
                    }
                }


                data.addRows([[jobs.JobNumber, timestamp, jobs.Destination, jobstatus]]);

            }

            tabJobs = document.createElement('DIV');
            chart = new google.visualization.Table(tabJobs);
            chart.draw(data, {
                //firstRowNumber: 0,
                //frozenColumns: 5,
                showRowNumber: true,
                page: 'disable',
                // pageSize: 2,
                // pagingButtons: 'both',
                //startPage: 0,
                width: 280,
                height: getHeightChart
            });

        }
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
                infoBubble = this.getMap().newMarker = new InfoBubble({
                    minWidth: getWidth,
                    minHeight: getHeight,
                    shadowStyle: 1,
                    borderRadius: 4,
                    arrowSize: 15,
                    borderWidth: 1,
                    disableAutoPan: false,
                    hideCloseButton: false,
                    arrowPosition: 30,
                    backgroundClassName: 'phoney',
                    arrowStyle: 2
                });

                infoBoxList.push(infoBubble);

            }

            this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            this.getMap().newMarker.removeTab(2);
            this.getMap().newMarker.removeTab(1);
            this.getMap().newMarker.removeTab(0);
            var titleDetails = "";
            var titlePhoneUser = "";
            var titleJobs = "";
            if (getSessionstorageValueLanguage == "en") {
                titleDetails = 'Details';
                titlePhoneUser = "Phone User";
                titleJobs = "Jobs";
            } else if (getSessionstorageValueLanguage == "th") {
                titleDetails = 'รายละเอียด';
                titlePhoneUser = "ผู้ใช้โทรศัพท์";
                titleJobs = "งาน";
            } else if (getSessionstorageValueLanguage == "vn") {
                titleDetails = 'Chi tiết';
                titlePhoneUser = "sử dụng điện thoại";
                titleJobs = "Việc làm";
            } else if (getSessionstorageValueLanguage == "id") {
                titleDetails = 'Perincian';
                titlePhoneUser = "Pengguna telepon";
                titleJobs = "Tugas";
            }
            this.getMap().newMarker.addTab(titleDetails, this.content); //Tab 1
            this.getMap().newMarker.addTab(titlePhoneUser, param.assetDriverInfo); //Tab 2

            if (tabJobs != null) {
                this.getMap().newMarker.addTab(titleJobs, tabJobs); //Tab 3
            }
            this.getMap().setCenter(this.position);
            paramtitle = param.title;


        });
    }



    return newMarker;
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

function mileageFormatter(value) {

    var roundoff = Math.round(value * 100) / 100;
    return roundoff + ' Km';
}

function getVideo(assets) {

    var panel1 = $.jsPanel({
        iframe: {
            width: 680,
            height: 580,
            src: 'http://103.228.55.216:8080/demo/demo1x.html?busid=20007',
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
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $.getJSON(url, function (zones) {

        callback(zones);


    });
}

function setZonesFilterMobile(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (zones) {

        callback(zones);


    });
}

function setZonesFilterMobileAsset(map, zones, callback) {

    var getReseller = $('#mobile-load-reseller').val();
    var getCompany = $('#mobile-load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (zones) {

        callback(zones);


    });
}

function setZones(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + '1' + '&CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    $.getJSON(url, function (zones) {

        callback(zones);

    }
)
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


        var coords = perimeter.split(" ");
        var recoords;
        var Pos;
        var zoneCircle;
        var zoneCircle1;

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


        /**
        * Function to Zones
    new algorithm updated by [chi:10may2016]
        */
        $(function () {

            $('.SelectZonesFilter').on('change', function () {

                var selected = $(this).find("option:selected").val();


                for (var b = 0; b < circleCoordinates1.length; b++) {
                    circle1 = circleCoordinates1[b];
                    //alert("trace "+parseInt(circle1.zoneID));
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

/** @this {google.maps.Polygon} */
function showArrays(event) {

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<div><strong data-l11n>Zone:</strong><strong data-l11n="th">โซน:</strong><strong data-l11n="vn">Khu:</strong><strong data-l11n="id">Daerah:</strong>&nbsp;' + this.Name + '<br>' +
        '<strong data-l11n>Company: &nbsp;</strong><strong  data-l11n="th">บริษัท: &nbsp;</strong><strong data-l11n="vn">Công ty: &nbsp;</strong><strong data-l11n="id">Perusahaan: &nbsp;</strong>' + this.Company + '<br>' +
        '<strong data-l11n>Clicked location:</strong><strong data-l11n="th">สถานที่ตั้งคลิก:</strong><strong data-l11n="vn">vị trí nhấp:</strong><strong data-l11n="id">lokasi diklik:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
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

    var contentString = '<div><strong data-l11n>Zone:</strong><strong data-l11n="th">โซน:</strong><strong data-l11n="vn">Khu:</strong><strong data-l11n="id">Daerah:</strong>&nbsp;' + this.Name + '<br>' +
        '<strong data-l11n>Company: &nbsp;</strong><strong  data-l11n="th">บริษัท: &nbsp;</strong><strong data-l11n="vn">Công ty: &nbsp;</strong><strong data-l11n="id">Perusahaan: &nbsp;</strong>' + this.Company + '<br>' +
        '<strong data-l11n>Clicked location:</strong><strong data-l11n="th">สถานที่ตั้งคลิก:</strong><strong data-l11n="vn">vị trí nhấp:</strong><strong data-l11n="id">lokasi diklik:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
        '<br>';

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}

function AutoRefresh() {


    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        if (markers[i] != null) markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];

    //markerCluster1.clearMarkers();
    //markerCluster2.clearMarkers();


    for (var i = 0; i < pulses.length; i++) {
        if (pulses[i] != null) pulses[i].setMap(null);
    }
    pulses = [];

    // Loop through markers and set map to null for each
    for (var i = 0; i < directions.length; i++) {

        if (directions[i] != null) directions[i].setMap(null);
    }

    // Reset the markers array
    directions = [];


    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];

    // Call set markers to re-add markers




    setMarkers(map, assets, updateAssets);
    $('#assetStatus').empty();
   

}

function RemoveInfobox() {

    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
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

function LayersTH() {

    TrafficLayerTH();

    //SEA Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("SEA", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.osm-tools.org/osm_then/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "หลายภาษา", //Multilanguage
        alt: "แสดง มาตรฐาน",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //OSM BW Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OSMBW", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.www.toolserver.org/tiles/bw-mapnik/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "สีดำ และ ขาว", //Black & White
        alt: "แสดง สีดำ และ ขาว",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //OSM Public Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("PublicTransport", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tile.memomaps.de/tilegen/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "สาธารณะ", //Public
        alt: "แสดง ระบบขนส่งสาธารณะ", //Show Public Transport
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Skobbler Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("Skobbler", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tiles1.skobbler.net/osm_tiles2/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Skobbler", //Skobbler
        alt: "แสดง Skobbler แผนที่",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



    //Open Cycle Map Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OpenCycleMap", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/cycle/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "วงจร เปิด", //Open Cycle
        alt: "แสดง แผนที่ วงจร เปิด",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-D", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport-dark/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "มืด", //Dark
        alt: "เปิด แสดง รอบ การขนส่ง แผนที่",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-L", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "แสง", //Light
        alt: "เปิด แสดง รอบ การขนส่ง แผนที่",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMLandscape", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/landscape/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "ภูมิประเทศ", //Landscape
        alt: "แสดง แผนที่ ภูมิทัศน์",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Open Cycle Map Outdoor Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMOutdoor", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/outdoors/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "กลางแจ้ง", //Outdoor
        alt: "แสดง กลางแจ้ง แผนที่",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



}

function LayersEN() {

    TrafficLayerEN();

    //SEA Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("SEA", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.osm-tools.org/osm_then/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Multilanguage", //Multilanguage
        alt: "Multilanguage",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //OSM BW Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OSMBW", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.www.toolserver.org/tiles/bw-mapnik/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Black & White", //Black & White
        alt: "Black & White",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //OSM Public Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("PublicTransport", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tile.memomaps.de/tilegen/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Public", //Public
        alt: "Show Public Transport", //Show Public Transport
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Skobbler Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("Skobbler", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tiles1.skobbler.net/osm_tiles2/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Skobbler", //Skobbler
        alt: "Show Skobbler",
        maxZoom: 20

    }));

    //End
    /*=================================================*/




    //Open Cycle Map Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OpenCycleMap", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/cycle/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Open Cycle", //Open Cycle
        alt: "Show Open Cycle",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-D", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport-dark/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Dark", //Dark
        alt: "Show Dark",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-L", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Light", //Light
        alt: "Show Light",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMLandscape", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/landscape/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Landscape", //Landscape
        alt: "Show Landscape",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Open Cycle Map Outdoor Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMOutdoor", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/outdoors/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Outdoor", //Outdoor
        alt: "Show Outdoor",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

}

function LayersVN() {

    TrafficLayerVN();

    //SEA Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("SEA", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.osm-tools.org/osm_then/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Đa ngôn ngữ", //Multilanguage
        alt: "Đa ngôn ngữ",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //OSM BW Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OSMBW", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.www.toolserver.org/tiles/bw-mapnik/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Đen trắng", //Black & White
        alt: "Đen trắng",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //OSM Public Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("PublicTransport", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tile.memomaps.de/tilegen/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Công cộng", //Public
        alt: "Hiện Công", //Show Public Transport
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Skobbler Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("Skobbler", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tiles1.skobbler.net/osm_tiles2/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Skobbler", //Skobbler
        alt: "Hiện Skobbler",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



    //MapQuest Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("MapQuest", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://otile1.mqcdn.com/tiles/1.0.0/osm/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Quest", //Map Quest
        alt: "Quest",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OpenCycleMap", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/cycle/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Vòng mở", //Open Cycle
        alt: "Vòng mở",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-D", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport-dark/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Bóng tối", //Dark
        alt: "Hiện đậm",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-L", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Ánh sáng", //Light
        alt: "Ánh sáng",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMLandscape", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/landscape/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Cảnh quan", //Landscape
        alt: "Cảnh quan",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Open Cycle Map Outdoor Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMOutdoor", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/outdoors/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Cảnh quan", //Outdoor
        alt: "Cảnh quan",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



}

function LayersID() {

    TrafficLayerID();

    //SEA Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("SEA", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.osm-tools.org/osm_then/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Banyak bahasa", //Multilanguage
        alt: "Banyak bahasa",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //OSM BW Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OSMBW", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.www.toolserver.org/tiles/bw-mapnik/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Putih hitam", //Black & White
        alt: "Putih hitam",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //OSM Public Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("PublicTransport", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tile.memomaps.de/tilegen/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Publik", //Public
        alt: "Tampilkan Angkutan Umum", //Show Public Transport
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Skobbler Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("Skobbler", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tiles1.skobbler.net/osm_tiles2/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Skobbler", //Skobbler
        alt: "Tampilkan Skobbler",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



    //Open Cycle Map Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OpenCycleMap", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/cycle/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "terbuka Cycle", //Open Cycle
        alt: "terbuka Cycle",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-D", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport-dark/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Gelap", //Dark
        alt: "Gelap",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMTransport-L", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/transport/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Cahaya", //Light
        alt: "Cahaya",
        maxZoom: 20

    }));


    //End
    /*=================================================*/


    //Open Cycle Map Transport Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMLandscape", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/landscape/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Pemandangan", //Landscape
        alt: "Pemandangan",
        maxZoom: 20

    }));

    //End
    /*=================================================*/

    //Open Cycle Map Outdoor Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OCMOutdoor", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.thunderforest.com/outdoors/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "luar ruangan", //Outdoor
        alt: "luar ruangan",
        maxZoom: 20

    }));

    //End
    /*=================================================*/



}
function TrafficLayerTH() {

    //Traffic Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
                 .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('การจราจร'); //Traffic
    $(controlDiv).append(controlUI);

    var legend = '<ul>'
               + '<li><span style="background-color: #30ac3e">&nbsp;&nbsp;</span><span style="color: #30ac3e"> &gt; การจราจร ได้อย่างราบรื่น</span></li>'
               + '<li><span style="background-color: #ffcf00">&nbsp;&nbsp;</span><span style="color: #ffcf00"> Slow การย้าย การจราจร</span></li>'
               + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> &lt; จราจรหนาแน่น</span></li>'
               + '<li><span style="background-color: #c0c0c0">&nbsp;&nbsp;</span><span style="color: #c0c0c0"> ไม่มีข้อมูลที่สามารถใช้ได้</span></li>'
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

function TrafficLayerEN() {

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

function TrafficLayerVN() {

    //Traffic Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
                 .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('giao thông'); //Traffic
    $(controlDiv).append(controlUI);

    var legend = '<ul style="width: 200px;">'
               + '<li><span style="background-color: #30ac3e">&nbsp;&nbsp;</span><span style="color: #30ac3e"> &gt; giao thông thông suốt</span></li>'
               + '<li><span style="background-color: #ffcf00">&nbsp;&nbsp;</span><span style="color: #ffcf00"> giao thông di chuyển chậm</span></li>'
               + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> &lt; nhiều Tên lái xe lưu thông</span></li>'
               + '<li><span style="background-color: #c0c0c0">&nbsp;&nbsp;</span><span style="color: #c0c0c0"> Không có dữ liệu</span></li>'
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

function TrafficLayerID() {

    //Traffic Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
                 .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Lalu lintas'); //Traffic
    $(controlDiv).append(controlUI);

    var legend = '<ul style="width: 200px;">'
               + '<li><span style="background-color: #30ac3e">&nbsp;&nbsp;</span><span style="color: #30ac3e"> &gt; Lalu lintas lancar</span></li>'
               + '<li><span style="background-color: #ffcf00">&nbsp;&nbsp;</span><span style="color: #ffcf00"> giao Lalu lintas langsam</span></li>'
               + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> &lt; Lalu lintas pampat</span></li>'
               + '<li><span style="background-color: #c0c0c0">&nbsp;&nbsp;</span><span style="color: #c0c0c0"> Tidak ada data</span></li>'
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

google.load('visualization', '1.0', { 'packages': ['table'] });
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




//Enable/Disable alert
changeCheckbox.onchange = function () {

    if (changeCheckbox.checked)
    {
        loopSound(mySound);
        AutoRefresh();
    }
    else
    {
        soundManager.stop('UIAlertStop');
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

    var isChromium = window.chrome,
                vendorName = window.navigator.vendor,
                isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
                isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;

    //alert('Test: ' + screen.height);

    if (screen.height == 768) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "568px";
                $('#assetStatus').bootstrapTable('resetView', { height: 320 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "560px";
                $('#assetStatus').bootstrapTable('resetView', { height: 335 });
            }

        }, 500);
    }
    else if (screen.height == 720) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "520px";
                $('#assetStatus').bootstrapTable('resetView', { height: 250 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "510px";
                $('#assetStatus').bootstrapTable('resetView', { height: 285 });
            }

        }, 500);
    }
    else if (screen.height == 786) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "560px";
                $('#assetStatus').bootstrapTable('resetView', { height: 338 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "576px";
                $('#assetStatus').bootstrapTable('resetView', { height: 353 });
            }

        }, 500);
    }
    else if (screen.height == 800) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "600px";
                $('#assetStatus').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "590px";
                $('#assetStatus').bootstrapTable('resetView', { height: 360 });
            }

        }, 500);
    }
    else if (screen.height == 864) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "662px";
                $('#assetStatus').bootstrapTable('resetView', { height: 435 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "662px";
                $('#assetStatus').bootstrapTable('resetView', { height: 425 });
            }

        }, 500);
    }
    else if (screen.height == 900) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "732px";
                $('#assetStatus').bootstrapTable('resetView', { height: 450 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "692px";
                $('#assetStatus').bootstrapTable('resetView', { height: 465 });
            }

        }, 500);
    }
    else if (screen.height == 960) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "760px";
                $('#assetStatus').bootstrapTable('resetView', { height: 525 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "747px";
                $('#assetStatus').bootstrapTable('resetView', { height: 520 });
            }

        }, 500);
    }
    else if (screen.height == 1024) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "822px";
                $('#assetStatus').bootstrapTable('resetView', { height: 590 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "812px";
                $('#assetStatus').bootstrapTable('resetView', { height: 580 });
            }

        }, 500);
    }
    else if (screen.height == 1080) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "878px";
                $('#assetStatus').bootstrapTable('resetView', { height: 646 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "868px";
                $('#assetStatus').bootstrapTable('resetView', { height: 636 });
            }

        }, 500);
    }
    else if (screen.height == 1050) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "847px";
                $('#assetStatus').bootstrapTable('resetView', { height: 615 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "840px";
                $('#assetStatus').bootstrapTable('resetView', { height: 605 });
            }

        }, 500);
    }
    else if (screen.height == 1200) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1000px";
                $('#assetStatus').bootstrapTable('resetView', { height: 760 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "990px";
                $('#assetStatus').bootstrapTable('resetView', { height: 755 });
            }

        }, 500);
    }
    else if (screen.height == 1344) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1142px";
                $('#assetStatus').bootstrapTable('resetView', { height: 900 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "1132px";
                $('#assetStatus').bootstrapTable('resetView', { height: 895 });
            }

        }, 500);
    }

    else {
        setTimeout(function () {
            $('#assetStatus').bootstrapTable('resetView', { height: 400 });
        }, 500);
    }
}
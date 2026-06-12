
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

var url = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo';
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

$("#showVideo").hide();


var geocoder;
var map;
var markers = new Array();
var marker;
var direction;
var directions = new Array();
var assets = [];
var MarkerDirection = [];
var infoBoxList = [];

var markersEx = new Array();
var directionsEx = new Array();
var pulsesEx = new Array();

var zones = [];
var polygon;
var pathCoordinates = new google.maps.MVCArray();
var circleCoordinates = new Array();
var polygonCoordinates = new Array();

var circle = {};

var pulses = new Array();
var pulse;
var assetJobInfo, assetVideo;
//var markerCluster1;
//var markerCluster2;

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

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

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

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

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

    $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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

        $("#getMove").hide().html('0').fadeIn('0');
        $("#getIdle").hide().html('0').fadeIn('0');
        $("#getStop").hide().html('0').fadeIn('0');

        $('#assetStatus').bootstrapTable('destroy');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedMobileReseller, function (data) {
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
        $result.text(0)
        $result2.text(0)
        $getGPS.text(0)
        $getGPRS.text(0)

        $("#getMove").hide().html('0').fadeIn('0');
        $("#getIdle").hide().html('0').fadeIn('0');
        $("#getStop").hide().html('0').fadeIn('0');

        $('#assetStatus').bootstrapTable('destroy');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedMobileReseller, function (data) {

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

var icon = "";
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
    coords: [1, 1, 1, 20, 18, 20, 18, 1],
    type: 'poly'
};


function initialize() {

    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(1.3000, 103.8000);
    var mapTypeIds = ["SEA", "OSMBW", "PublicTransport", "Skobbler", "MapQuest", "OpenCycleMap", "OCMTransport-D", "OCMTransport-L", "OCMLandscape", "OCMOutdoor"];
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
        LayersEN();
    }
    else if (getSessionstorageValueLanguage == "en") {
        LayersEN();

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
        $('#assetStatus').bootstrapTable('refresh');
    }, '20000');
}

//Load Table
$(document).ready(function () {

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';
    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $('#assetStatus').bootstrapTable(
        {
            idField: 'AssetID',
            url: WebAPI,
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
                //field: 'LastPos.Engine',
                field: 'Engine',
                title: 'Engine',
                class: 'col-sm-1',
                formatter: 'assetColorStatus'
            }, {
                field: 'Name',
                title: 'Asset'
            }, {
                //field: 'LastPos.FixID',
                field: 'Gps',
                title: 'GPS',
                class: 'col-md-1',
                formatter: 'gpsStatus'
            }, {
                field: 'Gprs',
                title: 'GPRS',
                class: 'col-md-1',
                formatter: 'gprsStatus'
            }], onLoadSuccess: function (row) {
                //$result.text('Event: onLoadSuccess, data: ' + data);
                // var rowCount = $('table#assetStatus tr:last').index() + 1;

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

                    if (row[i].LastPos.FixID < 2) {
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


                document.getElementById("getMove").innerHTML = getCountMove;
                document.getElementById("getIdle").innerHTML = getCountIdle;
                document.getElementById("getStop").innerHTML = getCountStop;
                document.getElementById("getGPS").innerHTML = getCountGPS;
                document.getElementById("getGPRS").innerHTML = getCountGPRS;


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

                for (var i = 0; i < infoBoxList.length; i++) {

                    infoBoxList[i].close();
                }

                // Reset the markers array
                infoBoxList = [];

                if ($($element).hasClass('assetSelectedRow')) {
                    console.log('true');
                }
                else {

                    $('.assetSelectedRow').removeClass('assetSelectedRow');
                    $($element).addClass('assetSelectedRow');

                    var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                    $("#assetStatus").find("tbody tr").each(function (index) {

                        $(this).on(
                            'click',
                            function () {
                                getPos = markers[index].getPosition();
                                map.panTo(markers[index].getPosition());
                                // map.setZoom(14);
                                map.setCenter(markers[index].getPosition());

                            });
                    });


                    var contentStringonload = "<div>" +
                              "<table id='assetDetails'>" +
                              "<tbody>" +
                              "<tr>" +
                              "<td style='width:120px !important;'>" +
                              "<small class='text-primary'><strong>&nbsp;&nbsp;" + row.Name + "</strong></small>" +
                              "</td>" +
                              "</tr>" +
                              "</tbody>" +
                              "</table>" +
                              "</div>";


                    var infoBubble = new InfoBubble({
                        minWidth: 110,
                        minHeight: 40,
                        map: map,
                        content: contentStringonload,
                        shadowStyle: 1,
                        // backgroundColor: 'rgb(57,57,57)',
                        backgroundColor: 'white',
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

                    infoBubble.setPosition(myLatLng);
                    infoBubble.open(map);


                    paramtitle = row.Name;

                    google.maps.event.addListener(infoBubble, 'closeclick', function () {
                        $('.assetSelectedRow').removeClass('assetSelectedRow');
                    });

                }
            }

        });

});

//Dashboard Company
var selectedCompany = "";

/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        if (selectedCompany != 0) {

            clearInterval(assetMarkerInterval);
            clearInterval(IntervalCompanyFilter);
            clearInterval(IntervalCompanyFilterMobile);
            clearInterval(IntervalCompanyFilterMobileAsset);
            AutoRefreshCompanyFilter();


            $('#mobile-load-company').empty();
            $('.MobileSelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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


            var WebAPICompanyFilter = "";

            if (getSessionstorageValueRoleID == 1) {

                if (selectedReseller != "") {
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
                } else {
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }


            //alert(WebAPICompanyFilter);

            setTimeout(function () {

                $('#assetStatus').bootstrapTable('destroy');

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
                          //field: 'LastPos.Engine',
                          field: 'Engine',
                          title: 'Engine',
                          class: 'col-md-2',
                          formatter: 'assetColorStatus'
                      }, {
                          field: 'Name',
                          title: 'Asset'
                      }, {
                          //field: 'LastPos.FixID',
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

                              if (row[i].LastPos.FixID < 2) {
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

                          for (var i = 0; i < infoBoxList.length; i++) {

                              infoBoxList[i].close();
                          }

                          // Reset the markers array
                          infoBoxList = [];

                          if ($($element).hasClass('assetSelectedRow')) {
                              console.log('true');
                          }
                          else {

                              $('.assetSelectedRow').removeClass('assetSelectedRow');
                              $($element).addClass('assetSelectedRow');

                              var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                              $("#assetStatus").find("tbody tr").each(function (index) {

                                  $(this).on(
                                      'click',
                                      function () {
                                          getPos = markers[index].getPosition();
                                          map.panTo(markers[index].getPosition());
                                          // map.setZoom(14);
                                          map.setCenter(markers[index].getPosition());

                                      });
                              });


                              var contentStringonload = "<div>" +
                                        "<table id='assetDetails'>" +
                                        "<tbody>" +
                                        "<tr>" +
                                        "<td style='width:120px !important;'>" +
                                        "<small class='text-primary'><strong>&nbsp;&nbsp;" + row.Name + "</strong></small>" +
                                        "</td>" +
                                        "</tr>" +
                                        "</tbody>" +
                                        "</table>" +
                                        "</div>";


                              var infoBubble = new InfoBubble({
                                  minWidth: 110,
                                  minHeight: 40,
                                  map: map,
                                  content: contentStringonload,
                                  shadowStyle: 1,
                                  // backgroundColor: 'rgb(57,57,57)',
                                  backgroundColor: 'white',
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

                              infoBubble.setPosition(myLatLng);
                              infoBubble.open(map);


                              paramtitle = row.Name;

                              google.maps.event.addListener(infoBubble, 'closeclick', function () {
                                  $('.assetSelectedRow').removeClass('assetSelectedRow');
                              });

                          }
                      }

                  });

            }, 500);


            IntervalCompanyFilter = setInterval(function () { AutoRefreshCompanyFilter(); }, '20000');

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
                var getZoneAPI = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                var getZoneAPI = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + "&CompanyID=" + selectedCompany;
            }

            else if (getSessionstorageValueRoleID >= 3) {
                var getZoneAPI = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }


            $.getJSON(getZoneAPI, function (data) {

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

            //document.getElementById("getMove").innerHTML = "0";
            //document.getElementById("getIdle").innerHTML = "0";
            //document.getElementById("getStop").innerHTML = "0";
            //document.getElementById("getGPS").innerHTML = "0";
            //document.getElementById("getGPRS").innerHTML = "0";

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

            clearInterval(IntervalCompanyFilter);
        }

        AutoAdjustScreen();
        //$('#assetStatus').bootstrapTable('refresh');

    });


    function AutoRefreshCompanyFilter() {


        // Loop through markers and set map to null for each
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
            //markers[i].setVisible(false);
        }

        // Reset the markers array
        markers = [];

        // Clears all clusters and markers from the clusterer.
        //markerCluster1.clearMarkers();
        //markerCluster2.clearMarkers();

        for (var i = 0; i < directions.length; i++) {
            directions[i].setMap(null);
            //directions[i].setVisible(false);
        }

        // Reset the markers array
       directions = [];

        for (var i = 0; i < pulses.length; i++) {
            pulses[i].setMap(null);
            //pulses[i].setVisible(false);
        }
        pulses = [];

        for (var i = 0; i < infoBoxList.length; i++) {

            infoBoxList[i].close();
        }

        // Reset the markers array
        infoBoxList = [];

        setMarkersFilter(map, assets, updateAssets);

        $('#assetStatus').bootstrapTable('refresh');

    }


});


var selectedMobileCompany = "";

//Mobile Company
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedMobileCompany = $(this).find("option:selected").val();
        var getReseller = $('#mobile-load-reseller').val();
        var getCompany = $('#load-company').val();

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
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append(
                             $('<option></option>').val(item.Name).html(item.Name)
                         );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        $('#mobile-load-assets').append(
                             $('<option></option>').val(item.Name).html(item.Name)
                         );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
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
                    //alert('WebAPICompanyFilter1');
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedMobileCompany;
                } else {
                    //alert('WebAPICompanyFilter2');
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            //alert(WebAPICompanyFilter);

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

                         if (row[i].LastPos.FixID < 2) {
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

                     for (var i = 0; i < infoBoxList.length; i++) {

                         infoBoxList[i].close();
                     }

                     // Reset the markers array
                     infoBoxList = [];

                     if ($($element).hasClass('assetSelectedRow')) {
                         console.log('true');
                     }
                     else {

                         $('.assetSelectedRow').removeClass('assetSelectedRow');
                         $($element).addClass('assetSelectedRow');

                         var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                         $("#assetStatus").find("tbody tr").each(function (index) {

                             $(this).on(
                                 'click',
                                 function () {
                                     getPos = markers[index].getPosition();
                                     map.panTo(markers[index].getPosition());
                                     // map.setZoom(14);
                                     map.setCenter(markers[index].getPosition());

                                 });
                         });


                         var contentStringonload = "<div>" +
                                   "<table id='assetDetails'>" +
                                   "<tbody>" +
                                   "<tr>" +
                                   "<td style='width:120px !important;'>" +
                                   "<small class='text-primary'><strong>&nbsp;&nbsp;" + row.Name + "</strong></small>" +
                                   "</td>" +
                                   "</tr>" +
                                   "</tbody>" +
                                   "</table>" +
                                   "</div>";


                         var infoBubble = new InfoBubble({
                             minWidth: 110,
                             minHeight: 40,
                             map: map,
                             content: contentStringonload,
                             shadowStyle: 1,
                             // backgroundColor: 'rgb(57,57,57)',
                             backgroundColor: 'white',
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

                         infoBubble.setPosition(myLatLng);
                         infoBubble.open(map);


                         paramtitle = row.Name;

                         google.maps.event.addListener(infoBubble, 'closeclick', function () {
                             $('.assetSelectedRow').removeClass('assetSelectedRow');
                         });

                     }
                 }

             });


            IntervalCompanyFilterMobile = setInterval(function () { MobileAutoRefreshCompanyFilter(); }, '60000');

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }


            setZonesFilterMobile(map, zones, handleZones);

            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            $.getJSON("http://103.237.168.119/tracksgwebapi/api/zoneinfo?CompanyID=" + selectedMobileCompany, function (data) {

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
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                } else {
                    WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;
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

                         if (row[i].LastPos.FixID < 2) {
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

                     for (var i = 0; i < infoBoxList.length; i++) {

                         infoBoxList[i].close();
                     }

                     // Reset the markers array
                     infoBoxList = [];

                     if ($($element).hasClass('assetSelectedRow')) {
                         console.log('true');
                     }
                     else {

                         $('.assetSelectedRow').removeClass('assetSelectedRow');
                         $($element).addClass('assetSelectedRow');

                         var myLatLng = new google.maps.LatLng(parseFloat(row.LastPos.PosY), parseFloat(row.LastPos.PosX));
                         $("#assetStatus").find("tbody tr").each(function (index) {

                             $(this).on(
                                 'click',
                                 function () {
                                     getPos = markers[index].getPosition();
                                     map.panTo(markers[index].getPosition());
                                     // map.setZoom(14);
                                     map.setCenter(markers[index].getPosition());

                                 });
                         });


                         var contentStringonload = "<div>" +
                                   "<table id='assetDetails'>" +
                                   "<tbody>" +
                                   "<tr>" +
                                   "<td style='width:120px !important;'>" +
                                   "<small class='text-primary'><strong>&nbsp;&nbsp;" + row.Name + "</strong></small>" +
                                   "</td>" +
                                   "</tr>" +
                                   "</tbody>" +
                                   "</table>" +
                                   "</div>";


                         var infoBubble = new InfoBubble({
                             minWidth: 110,
                             minHeight: 40,
                             map: map,
                             content: contentStringonload,
                             shadowStyle: 1,
                             // backgroundColor: 'rgb(57,57,57)',
                             backgroundColor: 'white',
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

                         infoBubble.setPosition(myLatLng);
                         infoBubble.open(map);


                         paramtitle = row.Name;

                         google.maps.event.addListener(infoBubble, 'closeclick', function () {
                             $('.assetSelectedRow').removeClass('assetSelectedRow');
                         });

                     }
                 }

             });


            IntervalCompanyFilterMobileAsset = setInterval(function () { MobileAutoRefreshAssetFilter(); }, '60000');

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }


            setZonesFilterMobileAsset(map, zones, handleZones);

            $('#assetZone').empty();
            $(".SelectZonesFilter").selectpicker('refresh');


            $.getJSON("http://103.237.168.119/tracksgwebapi/api/zoneinfo?CompanyID=" + getCompany, function (data) {

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

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function setMarkersFilterMobile(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;

    }


    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

// infobubble
var paramtitle;
var firstData = true;

function updateAssets(data) {

    var imagePulse = new google.maps.MarkerImage(
    'img/alert.png',
    null, // size
    null, // origin
    new google.maps.Point(8, 8), // anchor (move to center of marker)
    new google.maps.Size(17, 17) // scaled size (required for Retina display icon)
    );
    //first start

    var bounds = new google.maps.LatLngBounds();

    for (var i = 0, length = data.length; i < length; i++) {

        //var assets = data[i];
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
        var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
        var d = new Date();
        var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
        timestamp2 = Date.parse(timestamp2);
        timestamp1 = Date.parse(timestamp1);

        //Convert Timezone
        var Asia = moment.tz.add('Asia/Bangkok|BMT ICT|-6G.4 -70|01|-218SG.4');
        var Bangkok = moment.tz(assetTimestamp, Asia);
        var timestamp;

        if (assets.TagType == "N32A") {
            timestamp = moment.utc(Bangkok.format()).add('hours', 0).format('D-MMM-YYYY, hh:mm:ss A');
        }
        else {
            timestamp = moment.utc(Bangkok.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
        }

        if (data[i].LastPos == null | data[i].LastPos.Engine == null) {
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
            }

            icon = {
                url: iconURL + markerCategory + "-" + icon + ".png", // url
                scaledSize: new google.maps.Size(28, 28), // scaled size
                origin: new google.maps.Point(0, 0), // origin
                anchor: new google.maps.Point(14, 14) // anchor
            };

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
                driverName = "No Driver";
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

            var parseAddress;
            if (address != null) {
                parseAddress = address.match(/.{1,32}/g).join("<br/>");
            }

            var assetContent = "<div id='assetInfo' class='form-group' style='padding:0px !important;'>" +
                       "<h6 style='color:#458FD2;'>" + finaldata + "</h6>" +
                       "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                       "<tbody>" +
                       "<tr>" + "<td>" +
                       "<span data-l11n class='text-bold'>Address:&nbsp;</span>" + address +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Date:&nbsp;</span>" + timestamp +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Category:&nbsp;</span>" + category +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Speed:&nbsp;</span>" + speedFormatter(speed) +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Lat:&nbsp;</span>" + getYPosition +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Long:&nbsp;</span>" + getXPosition +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Engine:&nbsp;</span>" + engine +
                       "<br />" +
                       "<span data-l11n class='text-bold'>Zones:&nbsp;</span>" + zone +
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

            if (data[i].Phone != null && data[i].Phone != "") {

                var assetDriverContent = "<div class='form-group'>" +
                          "<br />" +
                          "<span data-l11n class='text-bold'>" + "SMS Driver" + "</span>" +
                          "<textarea data-l11n rows='5' class='form-control' placeholder='Your message here ..' name='smsMsgDriverEN' id='smsMsgDriverEN' data-by-field='smsMsgDriverEN'></textarea>" +
                          "<br />" +
                          "<button data-l11n onclick='sendSMSEN(\"" + data[i].Phone + "\")' class='btn-dark btn btn-md pull-right'>Send</button>" +
                          "</div>";
            } else {

                var assetDriverContent = "<div class='form-group'>" +
                      "<br />" +
                      "<span class='text-bold'>" + "No Registered Driver Number" + "</span>" +
                      "</div>";
            }

            if (data[i].TagPhoneNo != null && data[i].TagPhoneNo != "") {

                if (data[i].Flag == 0) {

                    var Immobilize = "<div class='form-group'>" +
                                 "<br />" +
                                 "<button disabled='disabled' id='activateImmobilize' onclick='ActivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-success' type='button' style='width:100%; height: 50px; margin-top:40px;'>Activated</button>" +
                                 "<br />" +
                                 "<button id='deactivateImmobilize' onclick='DeactivateImmobilizer(\"" + data[i].AssetID + "\")' class='btn btn-md btn-danger' type='button'  style='width:100%; height: 50px; margin-top:10px;'>Deactivated</button>" +
                                 "</div>";

                }
                else if (data[i].Flag == 1) {

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
                id: id,
                vechs: vechs,
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
                assetDriverInfo: assetDriverInfo,
                assetDriverContent: assetDriverContent,
                Immobilize: Immobilize
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
                    direction.setVisible(true);
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

            } else {
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

                if (paramtitle == vechs) {
                    markers[i].content = assetContent;
                    markers[i].speed = speed;
                    markers[i].engine = engine;
                    markers[i].timestamp = assets.LastPos.Timestamp;
                    pulses[i].speed = speed;
                    pulses[i].engine = engine;
                    pulses[i].gps = gps;
                    pulses[i].gprs = gprs;
                    document.getElementById('assetInfo').innerHTML = assetContent;
                    map.panTo(marker.getPosition());
                }
                else {
                    markers[i].content = assetContent;
                    markers[i].speed = speed;
                    markers[i].engine = engine;
                    markers[i].timestamp = assets.LastPos.Timestamp;
                    pulses[i].speed = speed;
                    pulses[i].engine = engine;
                    pulses[i].gps = gps;
                    pulses[i].gprs = gprs;
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
        map.setZoom(7);
        map.fitBounds(bounds);

        firstData = false;
    }

    //end

}


// infobubble
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
        getHeight = 220;
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
        shape: shape
    });

    var getAssetReseller = $("#load-reseller").val();
    var getAssetCompany = $("#load-company").val();
    var getTimestampDate = moment().format();
    var Timestamp = moment.tz(getTimestampDate, 'Asia/Singapore');
    var getTimestamp = moment.utc(Timestamp.format()).subtract('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
    var getDate = moment().format();
    var RxTime = moment.tz(getDate, 'Asia/Singapore');
    var getRxTime = moment.utc(RxTime.format()).add('month', 12).format('D-MMM-YYYY, HH:mm:ss A');
    var url = "http://103.237.168.119/tracksgwebapi/api/jobinfo?AssetResellerID=" + getAssetReseller + "&AssetCompanyID=" + getAssetCompany + "&AssetID=" + param.id + "&Timestamp=" + getTimestamp + "&RxTime=" + getRxTime;
    var tabJobs;
    $.getJSON(url, function (dataValues) {

        if (dataValues.length > 0) {

            var data = new google.visualization.DataTable();

            data.addColumn('string', 'Company');
            data.addColumn('string', 'Date');
            var jobs;
            // Populate series
            for (i = 0; i < dataValues.length; i++) {

                jobs = dataValues[i];
                var assetTimestamp = jobs.Timestamp;
                var Singapore = moment.tz(assetTimestamp, 'Asia/Singapore');
                //Format UTC
                var timestamp = moment(Singapore.format()).add('hours', 0).format("D-MMM-YYYY, HH:mm:ss A");

                data.addRows([[jobs.Company, timestamp]]);

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
            this.getMap().newMarker.setContent(param.content);
            this.getMap().newMarker.open(this.getMap(), this);
            this.getMap().newMarker.removeTab(5);
            this.getMap().newMarker.removeTab(4);
            this.getMap().newMarker.removeTab(3);
            this.getMap().newMarker.removeTab(2);
            this.getMap().newMarker.removeTab(1);
            this.getMap().newMarker.removeTab(0);
            this.getMap().newMarker.addTab('Details', param.content); //Tab 1
            this.getMap().newMarker.addTab('Driver', param.assetDriverInfo); //Tab 2

            if (tabJobs != null) {
                this.getMap().newMarker.addTab('Jobs', tabJobs); //Tab 3
            }


            if (getSessionstorageValueRoleID == 1 && getSessionstorageValueCompanyID == 3) {
                var title = param.vechs;
                var assetVideo = "video/video.png";
                var assetVideoInfo = "<div>" +
                                     "<br>" +
                                     "<a class='thumbnail' data-style='btn-success'>" +
                                     "<img src='" + assetVideo + "' name='image-swap' class='img-responsive' alt='Video Preview' id='showVideo'>" +
                                     "</a>" +
                                     "<button onclick='getVideo()' class='btn-dark btn btn-md pull-right'>Open</button>" +
                                     "</div>";

                this.getMap().newMarker.addTab('Video', assetVideoInfo); //Tab 4
            }

            if (getSessionstorageValueRoleID == 1) {
                this.getMap().newMarker.addTab('SMS', param.assetDriverContent); //Tab5            
            }

            if (getSessionstorageValueRoleID == 1 || getSessionstorageValueCompanyID == 9 && getSessionstorageValueRoleID == 3) {
                this.getMap().newMarker.addTab('Immobilize', param.Immobilize); //Tab 6
            }

            this.getMap().setCenter(this.position);
            paramtitle = param.title;


        });

    }



    return newMarker;
}


function speedFormatter(value) {

    var convertKmPerHour = value;
    var roundoff = Math.round(convertKmPerHour * 100) / 100;

    return roundoff + ' Km/h';
}

/**
* Function to filter markers by engine
*/
$(function () {

    $('.SelectEngineFilter').on('change', function () {
        var selected = $(this).find("option:selected").val();
        for (i = 0; i < markers.length; i++) {
            marker = markers[i];
            if (marker.engine == selected || selected.length === 0) {
                marker.setVisible(true);
            }
            else {
                marker.setVisible(false);
            }
        }

        for (i = 0; i < directions.length; i++) {
            direction = directions[i];

            if (direction.engine == selected || selected.length === 0) {
                if (direction.speed > 0 && direction.engine == "MOVE") {
                    direction.setVisible(true);
                }
                else {
                    direction.setVisible(false);
                }

            }
            else {
                direction.setVisible(false);

            }
        }

        for (i = 0; i < pulses.length; i++) {
            pulse = pulses[i];

            if (direction.engine == selected)
            {
                if (pulse.gps < 2 || pulse.gprs == 2) {
                    pulse.setVisible(true);
                }
                else {
                    pulse.setVisible(false);

                }
            }
            else
            {
                pulse.setVisible(false);
            }

        }

    });

});

function getVideo() {

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

function sendSMSImmobilizerActivate(phone, assetid, companyid) {


    var msgImmobilizer = {
        Sender: "TRACK",
        Recipients: phone,
        Message: "$SMS,000000;W022,2,0;!",
        Timestamp: moment().format(),
        RxTime: moment().format(),
        Flag: 1,
        CompanyID: companyid,
        AssetID: assetid
    };


    $.ajax({
        url: "http://103.237.168.119/adswebapi/api/messageinfo",
        type: "POST",
        data: JSON.stringify(msgImmobilizer),
        crossDomain: true,
        contentType: 'application/json; charset=utf-8',
        xhrFields: {
            // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
            // This can be used to set the 'withCredentials' property.
            // Set the value to 'true' if you'd like to pass cookies to the server.
            // If this is enabled, your server must respond with the header
            // 'Access-Control-Allow-Credentials: true'.
            withCredentials: false
        },
        permissions: ["http://*.asiacom.co.th"],
        success: function (msgImmobilizer) {
            console.log(msgImmobilizer);
            $('#ImmobilizeForm').modal('toggle');
            alert("Message Sent");
            window.location.reload(true);
        }
    });


}

function sendSMSImmobilizerDeactivate(phone, assetid, companyid) {


    var msgImmobilizer = {
        Sender: "TRACK",
        Recipients: phone,
        Message: "$SMS,000000;W022,2,1;!",
        Timestamp: moment().format(),
        RxTime: moment().format(),
        Flag: 1,
        CompanyID: companyid,
        AssetID: assetid
    };


    $.ajax({
        url: "http://103.237.168.119/adswebapi/api/messageinfo",
        type: "POST",
        data: JSON.stringify(msgImmobilizer),
        crossDomain: true,
        contentType: 'application/json; charset=utf-8',
        xhrFields: {
            // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
            // This can be used to set the 'withCredentials' property.
            // Set the value to 'true' if you'd like to pass cookies to the server.
            // If this is enabled, your server must respond with the header
            // 'Access-Control-Allow-Credentials: true'.
            withCredentials: false
        },
        permissions: ["http://*.asiacom.co.th"],
        success: function (msgImmobilizer) {
            console.log(msgImmobilizer);
            $('#ImmobilizeForm').modal('toggle');
            alert("Message Sent");
            window.location.reload(true);
        }
    });


}

function sendSMSEN(phone) {

    var getMsgEN = document.getElementById('smsMsgDriverEN').value;
    var Message = getMsgEN;

    var msgDriver = {
        Sender: "TRACK",
        Recipients: phone,
        Message: Message,
        Timestamp: moment().format(),
        RxTime: moment().format(),
        Flag: 1,
        CompanyID: this.companyID,
        AssetID: this.id
    };


    $.ajax({
        url: "http://103.237.168.119/adswebapi/api/messageinfo",
        type: "POST",
        data: JSON.stringify(msgDriver),
        crossDomain: true,
        contentType: 'application/json; charset=utf-8',
        xhrFields: {
            // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
            // This can be used to set the 'withCredentials' property.
            // Set the value to 'true' if you'd like to pass cookies to the server.
            // If this is enabled, your server must respond with the header
            // 'Access-Control-Allow-Credentials: true'.
            withCredentials: false
        },
        permissions: ["http://*.asiacom.co.th"],
        success: function (msgDriver) {
            //console.log(msgDriver);
            alert("Message Sent");
        }
    });


}

function ActivateImmobilizer(assetID) {

    $('#ImmobilizeForm').modal("show");
    $("#titleImmobilize").text(function () {
        var text = ' Activate Vehicle';
        return text;
    });

    // =================================================================

    //Immobilizer
    $('#submit-immobilize').on('click', function () {

        getPassword = $('#ImmobilizePassword').val();
        hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);

        var userlogin = {
            User: $('#ImmobilizeUsername').val(),
            Password: hash
        };

        $.ajax({
            url: "http://103.237.168.119/tracksgwebapi/api/login",
            type: "POST",
            data: JSON.stringify(userlogin),
            crossDomain: true,
            contentType: 'application/json; charset=utf-8',
            xhrFields: {
                // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                // This can be used to set the 'withCredentials' property.
                // Set the value to 'true' if you'd like to pass cookies to the server.
                // If this is enabled, your server must respond with the header
                // 'Access-Control-Allow-Credentials: true'.
                withCredentials: false
            },
            permissions: ["http://*.asiacom.co.th"],
            success: function (userlogin) {
                //console.log(userlogin);
                if (userlogin.ErrorMessage == null) {

                    if (userlogin.RoleID <= 3 && userlogin.CompanyID == 9 || userlogin.RoleID <= 3 && userlogin.CompanyID == 0)
                    {
                        bootbox.setDefaults({
                            /**
                             * @optional String
                             * @default: en
                             * which locale settings to use to translate the three
                             * standard button labels: OK, CONFIRM, CANCEL
                             */
                            locale: "en",


                        });

                        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

                            if (result) {

                                $.niftyNoty({
                                    type: 'success',
                                    icon: 'fa fa-check',
                                    message: 'Successful',
                                    container: 'floating',
                                    timer: 3000
                                });

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

                                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo';
                                var xhr = createCORSRequest('GET', url);
                                xhr.send();
                                if (!xhr) {
                                    throw new Error('CORS not supported');
                                }

                                var getFlag = $('#titleImmobilize').text();
                                var flag = "";

                                if (getFlag == " Activate Vehicle") {
                                    flag = "0";
                                } else if (getFlag == " Deactivate Vehicle") {
                                    flag = "1";
                                }

                                var assets = {
                                    AssetID: assetID,
                                    Flag: flag
                                };

                                $.ajax({
                                    url: "http://track.asiacom.co.th/tracksgwebapi/api/updateasset",
                                    type: "POST",
                                    data: JSON.stringify(assets),
                                    crossDomain: true,
                                    contentType: 'application/json; charset=utf-8',
                                    xhrFields: {
                                        // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                                        // This can be used to set the 'withCredentials' property.
                                        // Set the value to 'true' if you'd like to pass cookies to the server.
                                        // If this is enabled, your server must respond with the header
                                        // 'Access-Control-Allow-Credentials: true'.
                                        withCredentials: false
                                    },
                                    permissions: ["http://*.asiacom.co.th"],
                                    success: function (assets) {

                                        sendSMSImmobilizerActivate(assets.TagPhoneNo, assets.AssetID, assets.CompanyID);
                                        //console.log(assets);
                                        //window.location.reload(true);
                                    }

                                });

                            }


                            else {
                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-minus',
                                    message: 'Canceled',
                                    container: 'floating',
                                    timer: 3000
                                });
                            };

                        });


                    }
                    else {
                        alert('User not allowed');
                    }

                }

                else {
                    alert('Username or Password invalid');
                }

            }

        });


    });

}

function DeactivateImmobilizer(assetID) {

    $('#ImmobilizeForm').modal("show");
    $("#titleImmobilize").text(function () {
        var text = ' Deactivate Vehicle';
        return text;
    });


    // =================================================================

    //Immobilizer
    $('#submit-immobilize').on('click', function () {


        getPassword = $('#ImmobilizePassword').val();
        hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);

        var userlogin = {
            User: $('#ImmobilizeUsername').val(),
            Password: hash
        };


        $.ajax({
            url: "http://103.237.168.119/tracksgwebapi/api/login",
            type: "POST",
            data: JSON.stringify(userlogin),
            crossDomain: true,
            contentType: 'application/json; charset=utf-8',
            xhrFields: {
                // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                // This can be used to set the 'withCredentials' property.
                // Set the value to 'true' if you'd like to pass cookies to the server.
                // If this is enabled, your server must respond with the header
                // 'Access-Control-Allow-Credentials: true'.
                withCredentials: false
            },
            permissions: ["http://*.asiacom.co.th"],
            success: function (userlogin) {
                //console.log(userlogin);
                if (userlogin.ErrorMessage == null) {

                    if (userlogin.RoleID <= 3 && userlogin.CompanyID == 9 || userlogin.RoleID <= 3 && userlogin.CompanyID == 0)
                    {

                        bootbox.setDefaults({
                            /**
                             * @optional String
                             * @default: en
                             * which locale settings to use to translate the three
                             * standard button labels: OK, CONFIRM, CANCEL
                             */
                            locale: "en",


                        });

                        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

                            if (result) {

                                $.niftyNoty({
                                    type: 'success',
                                    icon: 'fa fa-check',
                                    message: 'Successful',
                                    container: 'floating',
                                    timer: 3000
                                });

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

                                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo';
                                var xhr = createCORSRequest('GET', url);
                                xhr.send();
                                if (!xhr) {
                                    throw new Error('CORS not supported');
                                }

                                var getFlag = $('#titleImmobilize').text();
                                var flag = "";

                                if (getFlag == " Activate Vehicle") {
                                    flag = "0";
                                } else if (getFlag == " Deactivate Vehicle") {
                                    flag = "1";
                                }

                                var assets = {
                                    AssetID: assetID,
                                    Flag: flag
                                };

                                $.ajax({
                                    url: "http://track.asiacom.co.th/tracksgwebapi/api/updateasset",
                                    type: "POST",
                                    data: JSON.stringify(assets),
                                    crossDomain: true,
                                    contentType: 'application/json; charset=utf-8',
                                    xhrFields: {
                                        // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                                        // This can be used to set the 'withCredentials' property.
                                        // Set the value to 'true' if you'd like to pass cookies to the server.
                                        // If this is enabled, your server must respond with the header
                                        // 'Access-Control-Allow-Credentials: true'.
                                        withCredentials: false
                                    },
                                    permissions: ["http://*.asiacom.co.th"],
                                    success: function (assets) {
                                        //console.log(assets);
                                        sendSMSImmobilizerDeactivate(assets.TagPhoneNo, assets.AssetID, assets.CompanyID);
                               
                                        //window.location.reload(true);
                                    }

                                });

                            }


                            else {
                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-minus',
                                    message: 'Canceled',
                                    container: 'floating',
                                    timer: 3000
                                });
                            };

                        });

                    }
                    else
                    {
                        alert('User not allowed');
                    }

                }

                else {
                    alert('Username or Password invalid');
                }

            }

        });



       


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
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (zones) {

        callback(zones);


    });
}

function setZonesFilterMobile(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        } else {
            url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }


    $.getJSON(url, function (zones) {

        callback(zones);


    });
}

function setZones(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    $.getJSON(url, function (zones) {

        callback(zones);

    }


)
}

function handleZones(zones) {

    var coords;
    var zoneCircle;
    for (var i = 0; i < zones.length; i++) {

        var zone = zones[i];
        var zoneID = zone.ZoneID;
        var name = zone.Name;
        var type = zone.Type;
        var perimeter = zone.Perimeter;
        var company = zone.Company;
        var color = zone.Color;


        coords = perimeter.split(" ");
        var recoords;
        var Pos;

        if (coords.length == 1) {

            for (var k = 0; k < coords.length; k++) {
                recoords = coords[k].split(",");

                circle['Zones'] = {
                    center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
                    radius: recoords[2]
                };
            }

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
                    zoneID: zoneID,
                    center: circle[zone].center,
                    radius: Math.sqrt(circle[zone].radius) * 10
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
                    map.fitBounds(zoneCircle.getBounds());


                }

            })(zoneCircle));

        }

        if (coords.length > 1) {

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
                zoneID: zoneID,
                Pos: coords,
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

            })(polygon, i));


        }


        /**
        * Function to Zones
        */
        $(function () {

            $('.SelectZonesFilter').on('change', function () {
                var selected = $(this).find("option:selected").val();

                for (i = 0; i < zones.length; i++) {

                    if (coords.length == 1) {
                        zoneCircle = circleCoordinates[i];
                        if (zoneCircle.zoneID == selected || selected.length === 0) {
                            map.fitBounds(zoneCircle.getBounds());
                        }
                    }

                    if (coords.length > 1) {

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


        /**
        * Function to Zones
        */
        $(function () {

            $('.SelectZonesFilterEN').on('change', function () {
                var selected = $(this).find("option:selected").val();

                for (i = 0; i < zones.length; i++) {

                    if (coords.length <= 2) {
                        circle = circleCoordinates[i];
                        if (circle.zoneID == selected || selected.length === 0) {
                            map.fitBounds(zoneCircle.getBounds());
                        }
                    }


                    if (coords.length > 2) {

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
        markers[i].setMap(null);
        //markers[i].setVisible(false);
    }

    // Reset the markers array
    markers = [];

    //markerCluster1.clearMarkers();
    //markerCluster2.clearMarkers();


    for (var i = 0; i < pulses.length; i++) {
        pulses[i].setMap(null);
        //pulses[i].setVisible(false);
    }

    // Reset the pulse array
    pulses = [];



    // Loop through markers and set map to null for each
    for (var i = 0; i < directions.length; i++) {

        directions[i].setMap(null);
        //directions[i].setVisible(false);
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
    $('#assetStatus').bootstrapTable('refresh');

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

function Layers() {

    TrafficLayer();

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



    //MapQuest Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("MapQuest", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://otile1.mqcdn.com/tiles/1.0.0/osm/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "แผนที่ การแสวงหา", //Map Quest
        alt: "แสดง แผนที่ การแสวงหา",
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



    //MapQuest Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("MapQuest", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://otile1.mqcdn.com/tiles/1.0.0/osm/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Map Quest", //Map Quest
        alt: "Show Map Quest",
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

function TrafficLayer() {

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

    if (changeCheckbox.checked) {

        loopSound(mySound);

    } else {

        soundManager.stop('UIAlertStop');

    }



};



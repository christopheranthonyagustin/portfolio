var btusername = "systemtrack";
var btpassword = "track101!";

sessionStorage.setItem("setSessionstorageValueDefaultReseller", 4);
sessionStorage.setItem("setSessionstorageValueDefaultCompany", 2);

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

var url = 'https://webapi.systempest.com/api/assetinfo';
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

    WebAPIReseller = 'https://webapi.systempest.com/api/resellerinfo';

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

    WebAPIReseller = 'https://webapi.systempest.com/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + "4", function (data) {

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

    $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("https://webapi.systempest.com/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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
            $.getJSON("https://webapi.systempest.com/api/resellerinfo", function (data) {
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
            $.getJSON("https://webapi.systempest.com/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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

        $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append(
                $('<option></option>').val(0).html("-------")
            );

            $.each(data, function (index, item) {
                $('#load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
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
            $.getJSON("https://webapi.systempest.com/api/resellerinfo", function (data) {
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
            $.getJSON("https://webapi.systempest.com/api/resellerinfo?ResellerID=" + selectedMobileReseller, function (data) {
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

        $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + selectedMobileReseller, function (data) {

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
    //setMarkers(map, assets, handleAssets);
    //setDirection(map, MarkerDirection);

    google.maps.event.addListener(map, 'mousemove', function (event) {
        document.getElementById('panel').innerHTML =
            event.latLng.lat() + ', ' + event.latLng.lng();
    });

    SearchPlaces();

    assetMarkerInterval = setInterval(function () {

        setMarkers(map, assets, updateAssets);

    }, '35000');

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


            $('#mobile-load-company').empty();
            $('.MobileSelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("https://webapi.systempest.com/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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
                var getZoneAPI = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                var getZoneAPI = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + "&CompanyID=" + selectedCompany;
            }

            else if (getSessionstorageValueRoleID >= 3) {
                var getZoneAPI = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
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
                    reloadWebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + sessionStorage.getItem('setSessionstorageValueDefaultReseller') + '&CompanyID=' + sessionStorage.getItem('setSessionstorageValueDefaultCompany');
                } else {
                    reloadWebAPIAsset = '';
                }

            } else if (getSessionstorageValueRoleID == 2) {

                reloadWebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

            } else if (getSessionstorageValueRoleID >= 3) {


                reloadWebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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

            if (getSessionstorageValueLanguage == "th") {
                document.getElementById("getMove").innerHTML = getCountMove;
                document.getElementById("getIdle").innerHTML = getCountMove;
                document.getElementById("getStop").innerHTML = getCountStop;
            } else if (getSessionstorageValueLanguage == "en") {
                document.getElementById("getMoveEN").innerHTML = getCountMove;
                document.getElementById("getIdleEN").innerHTML = getCountIdle;
                document.getElementById("getStopEN").innerHTML = getCountStop;
            }

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
            pulses = [];

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            for (var i = 0; i < polygonCoordinates.length; i++) {
                polygonCoordinates[i].setMap(null);
            }


            for (var i = 0; i < circleCoordinates.length; i++) {
                circleCoordinates[i].setMap(null);
            }

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
                $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + "4", function (data) {

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
                $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("https://webapi.systempest.com/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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

                $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append(
                            $('<option></option>').val(item.Name).html(item.Name)
                        );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        $('#mobile-load-assets').append(
                            $('<option></option>').val(item.Name).html(item.Name)
                        );
                    });
                    $(".selectpicker").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
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
                    WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedMobileCompany;
                } else {
                    WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
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


            $.getJSON("https://webapi.systempest.com/api/zoneinfo?CompanyID=" + selectedMobileCompany, function (data) {

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
                    WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                } else {
                    WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
                }

            }
            else if (getSessionstorageValueRoleID == 2) {

                WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany + '&Assets=' + selectedMobileAsset;
            }
            else if (getSessionstorageValueRoleID >= 3) {

                WebAPICompanyFilter = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&Assets=' + selectedMobileAsset;
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


            $.getJSON("https://webapi.systempest.com/api/zoneinfo?CompanyID=" + getCompany, function (data) {

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
            url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + sessionStorage.getItem('setSessionstorageValueDefaultReseller') + '&CompanyID=' + sessionStorage.getItem('setSessionstorageValueDefaultCompany');
        } else {
            url = '';
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

function setMarkersFilterMobile(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        if (selectedMobileReseller != "") {
            url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
                var Bangkok = moment.tz(assetTimestamp, Asia);
                var timestamp;

                if (assets.TagType == "N32A") {
                    timestamp = moment.utc(Bangkok.format()).add('hours', 0).format('D-MMM-YYYY, hh:mm:ss A');
                }
                else {
                    timestamp = moment.utc(Bangkok.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
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
                    "<h6 style='color:#4286CF;'>" + finaldata + "</h6>" +
                    "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                    "<tbody>" +
                    "<tr>" + "<td>" +
                    "<span data-l11n class='text-bold'>Address:&nbsp;</span>" + address +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Date:&nbsp;</span>" + timestamp +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Speed:&nbsp;</span>" + speedFormatter(speed) +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Lat:&nbsp;</span>" + getYPosition +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Long:&nbsp;</span>" + getXPosition +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Driver:&nbsp;</span>" + driverName +
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
                        if ($('#assetInfo').val() != null || $('#assetInfo').val() != undefined) { document.getElementById('assetInfo').innerHTML = assetContent; }
                        //map.panTo(marker.getPosition());
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

    WebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

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

    WebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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

    WebAPIAsset = 'https://webapi.systempest.com/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + selectedMobileReseller + '&CompanyID=' + selectedMobileCompany;
        } else {
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + selectedMobileCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedMobileCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        } else {
            url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueAssetReseller + '&CompanyID=' + getCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://webapi.systempest.com/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    //alert(url);


    $.getJSON({
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Authorization", "Basic " + btoa(btusername + ":" + btpassword));
        },
    }, function (zones) {

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

    map.mapTypes.set("OSM", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {

            var normalizedCoord = getNormalizedCoord(coord, zoom);
            if (!normalizedCoord) {
                return null;
            }
            var bound = Math.pow(2, zoom);

            return "http://tile.openstreetmap.org/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
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

            return "https://maps-a.onemap.sg/v3/Default/" + zoom + "/" + normalizedCoord.x + "/" + normalizedCoord.y + ".png";
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
                document.getElementById('map-canvas').style.height = "510px";
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
                document.getElementById('map-canvas').style.height = "675px";
                $("#tableContainer").height(450);
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "690px";
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



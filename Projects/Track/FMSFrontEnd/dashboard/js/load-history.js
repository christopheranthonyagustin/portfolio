

var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
//populate the Drop Down List

$(document).ready(function ($) {
    // delegate calls to data-toggle="lightbox"
    $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function (event) {
        event.preventDefault();
        return $(this).ekkoLightbox({
            onShown: function () {
                if (window.console) {
                    return console.log('Checking our the events huh?');
                }
            },
            onNavigate: function (direction, itemIndex) {
                if (window.console) {
                    return console.log('Navigating ' + direction + '. Current item: ' + itemIndex);
                }
            }
        });
    });


    // navigateTo
    $(document).delegate('*[data-gallery="navigateTo"]', 'click', function (event) {
        event.preventDefault();
        return $(this).ekkoLightbox({
            onShown: function () {

                var a = this.modal_content.find('.modal-footer a');
                if (a.length > 0) {

                    a.click(function (e) {

                        e.preventDefault();
                        this.navigateTo(2);

                    }.bind(this));

                }

            }
        });
    });


});


//Load Events
$.getJSON("http://103.237.168.119/tracksgwebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.StatusID != 4 && item.StatusID != 20 && item.StatusID != 21) {
            $('#load-events').append(
                 $('<option></option>').val(item.StatusID).html(item.StatusDesc)
             );
        }
    });

    $(".selectpicker").selectpicker('refresh');
});




//Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + "4" + '&CompanyID=' + "2", function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


/*** Function to filter reseller and companies*/
$(function () {

    var selectedCompany = "";
    var selectedReseller = "";
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

                var getReseller = $("#load-reseller").val();
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

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-load-reseller').remove();
        }

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
        });


        $('#mobile-load-assets').empty();
        $('#mobile-load-assets').append($('<option></option>').val(0).html("-------"));
        $(".MobileSelectVechsFilter").selectpicker('refresh');

        $('#load-assets').empty();
        $('#load-assets').append($('<option></option>').val(0).html("-------"));
        $(".SelectVechsFilter").selectpicker('refresh');

    });


    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        //Select New Company
        $('#mobile-load-company').empty();
        $('.MobileSelectCompanyFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

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
                var getCompany = $("#load-company").val();
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
                $('#mobile-load-company').selectpicker('refresh');

            });
        }

        //Load New Assets
        $('#mobile-load-assets').empty();
        $('.MobileSelectVechsFilter').selectpicker('refresh');
        $('#load-assets').empty();
        $('SelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        var userReseller;
        if (selectedReseller == '' || selectedReseller == null) {
            userReseller = $("#load-reseller").val();
        } else {
            userReseller = selectedReseller;
        }

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }

    });
});


//  Format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {


    return '<a class="btn-link" id="showVehicle" onClick="showVehicle()">' + value + '</a>';
}

//  Format for Mileage Column.
// =================================================================
function mileageFormatter(value, row) {


    return '<span>' + value + ' Km' + '</span>';
}

//  Format for Speed  Column.
// =================================================================
function speedFormatter(value, row) {


    return '<span>' + value + ' Km/h' + '</span>';
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
    if (value == "MOVE") {
        labelColor = "success";
    } else if (value == "IDLE") {
        labelColor = "warning";
    } else if (value == "STOP") {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + value + '</div>';
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


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';


}

function flagFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 0) {
        labelColor = "success";
        text = "Sent";
    } else if (value == 1) {
        labelColor = "warning";
        text = "Pending";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}

function driveridFormatter(value, row) {

    if (value == null) {

        return '<a class="btn-link" id="showVehicle">' + '#' + 'No Driver ID' + '</a>';
    }
    else {
        return '<a class="btn-link" id="showVehicle">' + '#' + value + '</a>';
    }
}

function nameFormatter(value, row) {
    var labelColor;
    var text;

    var getDriverID = row.DriverInfo.DriverID;

    var driverAddress;
    if (row.DriverInfo.Address == '') {
        driverAddress = "No Address";
    } else {
        driverAddress = row.DriverInfo.Address;
    }

    var driverPhone;
    if (row.DriverInfo.Phone == '') {
        driverPhone = "No Phone";
    } else {
        driverPhone = row.DriverInfo.Phone;
    }


    if (row.DriverInfo.DriverID != "0" && row.DriverInfo.ImageFill == "Uniform") {
        text = value;
        return '<center><div style="color:blck;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.DriverInfo.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.DriverInfo.DriverID != "0" && row.DriverInfo.ImageFill == "None") {
        labelColor = "success";
        text = row.DriverInfo.Name;
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } else if (row.DriverInfo.DriverID == "0") {
        labelColor = "dark";
        text = "No Driver";

        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    }
}

function dateFormatter(value, row) {

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Bangkok = moment.tz(value, Asia);

    var timestamp;

    if (row.TagType == "N32A") {
        timestamp = moment.utc(Bangkok.format()).add('hours', 0).format('D-MMM-YYYY');
    }
    else {
        timestamp = moment.utc(Bangkok.format()).add('hours', 8).format('D-MMM-YYYY');
    }


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';


}

function timeFormatter(value, row) {
    //idleduration = idleduration + (yTime-xTime);
    value = value * 60000;
    var seconds2 = 0;
    var minutes2 = 0;
    var hours2 = 0;
    var days2 = 0;
    var hoursDays2 = 0;
    seconds2 = parseInt((value / 1000) % 60);
    minutes2 = parseInt((value / (1000 * 60)) % 60);
    hours2 = parseInt((value / (1000 * 60 * 60)) % 24);
    days2 = parseInt(value / (1000 * 60 * 60 * 24));
    hoursDays2 = parseInt(days2 * 24);
    hours2 += hoursDays2;
    hours2 = (hours2 < 10) ? "0" + hours2 : hours2;
    minutes2 = (minutes2 < 10) ? "0" + minutes2 : minutes2;
    seconds2 = (seconds2 < 10) ? "0" + seconds2 : seconds2;
    TimeString2 = hours2 + ':' + minutes2 + ':' + seconds2;
    return TimeString2;
}

function timeFormatter2(value, row) {


    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Bangkok = moment.tz(value, Asia);

    var timestamp;

    if (row.TagType == "N32A") {
        timestamp = moment.utc(Bangkok.format()).add('hours', 0).format('hh:mm:ss A');
    }
    else {
        timestamp = moment.utc(Bangkok.format()).add('hours', 8).format('hh:mm:ss A');
    }


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';


}

function roundToTwo(num) {
    return +(Math.round(num + "e+2") + "e-2") + ' km';
}

function totalhoursFormatter(value, row) {

    var dateFormat = "HH:mm:ss A";
    var timestamp = moment(row.StartTime).format(dateFormat);
    var rxtime = moment(row.EndTime).format(dateFormat);
    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = '<div>' + moment.duration(convertRxtime - convertTimestamp).humanize() + '</div>';


    return '<div>' + duration + '</div>';

}

function percentFormatter(value, row) {

    return Math.round(value * 100 / 1440) + ' %';
}

function idlingFormatter(value, row) {

    var dateFormat = "D-MMM-YYYY, HH:mm:ss A";

    var timestamp = moment.utc(row.IdleStart).format(dateFormat);
    var rxtime = moment(row.IdleEnd).format(dateFormat);

    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = '<div>' + moment.duration(convertRxtime - convertTimestamp).humanize() + '</div>';

    return '<div>' + duration + '</div>';

}

//<!--Filter-Vehicle-->
(function (document) {
    'use strict';

    var VehicleTableFilter = (function (Arr) {


        var _select;


        function _onSelectEvent(e) {
            _select = e.target;
            var tables = document.getElementsByClassName(_select.getAttribute('data-table'));
            Arr.forEach.call(tables, function (table) {
                Arr.forEach.call(table.tBodies, function (tbody) {
                    Arr.forEach.call(tbody.rows, _filterSelect);
                });
            });
        }

        function _filter(row) {

            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';

        }

        function _filterSelect(row) {

            var text_select = row.textContent.toLowerCase(), val_select = _select.options[_select.selectedIndex].value.toLowerCase();
            row.style.display = text_select.indexOf(val_select) === -1 ? 'none' : 'table-row';

        }


        return {
            init: function () {
                var selects = document.getElementsByClassName('select-vehicle-filter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;


                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            VehicleTableFilter.init();

        }
    });

})(document);


//Hide Elements
$(document).ready(function () {
    options = {
        clearOnHide: true
    }
    $('[visibly]').Visibly();
})


//Select Report                                 
$(function () {

    $("#playback").hide();
    $("#viewLocation").hide();
    
    //Onchange
    $('.SelectReport').on('change', function () {
        var selected = $(this).find("option:selected").val();

        var reports = "";
        switch (selected) {
            case "Positions":
                reports = "positions";
                break;
            case "Speed":
                reports = "speed";
                break;
            case "Mileage":
                reports = "mileage";
                break;
            case "Utilization (Type 1)":
                reports = "utilization";
                break;
            case "Utilization (Type 2)":
                reports = "utilization2";
                break;
            case "Events":
                reports = "events";
                break;
            case "Messages":
                reports = "messages";
                break;
            case "Jobs":
                reports = "jobs";
                break;
            case "Idling":
                reports = "idling";
                break;

        }

        document.getElementById("clickGenerateEN").onclick = GenerateEN;

        function GenerateEN() {


            $("#load-assets :selected").text(); //the text content of the selected option
            var getAsset = $("#load-assets").val(); //the value of the selected option
            var getCompany = $("#load-company").val();
            var getReseller = $("#load-reseller").val();
            var getTimestamp = $("#dateFrom").val();
            var getRxTime = $("#dateTo").val();
            var getSpeed = $("#speedLimit").val();
            var getStatusID = $("#load-events").val();
            var getFlag = $("#load-messages").val();
            var dateFormat = "D-MMM-YYYY, hh:mm:ss A";


            var convertTmestamp = moment(getTimestamp, dateFormat);
            var convertRxtime = moment(getRxTime, dateFormat);

            var timestamp = moment(convertTmestamp).subtract('hours', 8).format(dateFormat);
            var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);


            var duration = '<div style="color:white">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTmestamp).humanize() + ' duration</div>';
            var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
            var validateRxTime = moment(getRxTime, dateFormat).isValid();

            //if (timestamp < rxtime) {

            if (validateTimestamp == true && validateRxTime == true) {

                var GenerateEN = "Generate";
                localStorage.setItem('setLocalstorageValueGenerate', GenerateEN);

                Report = "reports-" + reports;


                localStorage.setItem('setLocalstorageValueReport', Report);
                var getLocalstorageValueReport = localStorage.getItem('setLocalstorageValueReport');

                var WebApi = "http://103.237.168.119/tracksgwebapi/api/posinfo?Asset=" + getAsset + "&Speed=" + getSpeed + "&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                var WebApiEvent = "http://track.asiacom.co.th/tracksgwebapi/api/eventinfo/?Asset=" + getAsset + "&StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                var WebApiMessages = "http://track.asiacom.co.th/tracksgwebapi/api/messageinfo?Asset=" + getAsset + "&Flag=" + getFlag + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                var jobApi = 'http://103.237.168.119/tracksgwebapi/api/jobinfo?AssetResellerID=' + getReseller + '&AssetCompanyID=' + getCompany + '&Asset=' + getAsset + '&Timestamp=' + timestamp + '&RxTime=' + rxtime;
                var WebApiUtilization = "http://103.237.168.119/tracksgwebapi/api/utilizationinfo?Asset=" + getAsset + "&StartTime=" + timestamp + "&EndTime=" + rxtime;
                var WebAPIIdling = "http://103.237.168.119/tracksgwebapi/api/idlinginfo?Asset=" + getAsset + "&IdleStart=" + timestamp + "&IdleEnd=" + rxtime;
                var getEvents = document.getElementById("load-events");
                var strEvent = getEvents.options[getEvents.selectedIndex].value;

                //console.log(jobApi);
                //alert(WebAPIIdling);

                if (reports == "positions") {


                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalPosition").innerHTML = duration;

                    //Positions Table
                    $(document).ready(function () {


                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    //title: 'พาหนะ',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device'
                                    //title: 'เครื่อง'
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Location',
                                    title: 'Location'
                                    //title: 'สถานที่'

                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    sortable: 'true',
                                    //title: 'การประทับเวลา',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Speed',
                                    title: 'Speed',
                                    formatter: speedFormatter
                                    //title: 'แบตเตอรี่'
                                }, {
                                    field: 'Engine',
                                    title: 'Engine',
                                    sortable: 'true',
                                    //title: 'เครื่องยนต์',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    sortable: 'true',
                                    //title: 'การเผาไหม้',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data) {

                                    var rows = document.getElementById('reports-positions').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 1) {

                                        alert('No data!');
                                    }

                                    //To filter Lion Company
                                    if (getSessionstorageValueCompanyID != 6)
                                    {
                                        //Set
                                        sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                        drawPositionChart();
                                    }

                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));


                                    //Then retrieve
                                    var localObj = JSON.parse(localStorage.getItem(row));


                                    //if (Modernizr.localstorage) {
                                    //    $("#Perimeter").text('localStorage is available');
                                    //} else {
                                    //    $("#Perimeter").text('localStorage is not available');
                                    //}

                                    var panel1 = $.jsPanel({
                                        iframe: {
                                            src: "report_map.html",
                                            id: "myFrame",
                                            style: { "display": "none", "border": "10px solid transparent" },
                                            width: '100%',
                                            height: '100%'
                                        },

                                        callback: function () {
                                            document.getElementById("myFrame").onload = function () {
                                                $("#myFrame").fadeIn(1000);
                                            }
                                        },
                                        size: { width: 425, height: 425 },
                                        position: { left: "center", top: 30 },
                                        title: row.Asset, //Position Report
                                        theme: "black"
                                    });

                                },

                            });


                    });


                }

                else if (reports == "speed") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalSpeed").innerHTML = duration;

                    //Speed Table
                    $(document).ready(function () {


                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    //title: 'พาหนะ',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device'
                                    //title: 'เครื่อง'
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Speed',
                                    title: 'Speed',
                                    formatter: speedFormatter
                                    //title: 'ความเร็ว'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    sortable: 'true',
                                    //title: 'การประทับเวลา',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Engine',
                                    title: 'Engine',
                                    sortable: 'true',
                                    //title: 'เครื่องยนต์',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    sortable: 'true',
                                    //title: 'การเผาไหม้',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data) {

                                    var rows = document.getElementById('reports-speed').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 1) {

                                        alert('No data!');
                                    }

                                    //To filter Lion Company
                                    if (getSessionstorageValueCompanyID != 6) {
                                        //Set
                                        sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                        drawSpeedChart();
                                    }

                                },

                                onClickRow: function (row) {
                                    // console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));


                                    //Then retrieve
                                    var localObj = JSON.parse(localStorage.getItem(row));


                                    //if (Modernizr.localstorage) {
                                    //    $("#Perimeter").text('localStorage is available');
                                    //} else {
                                    //    $("#Perimeter").text('localStorage is not available');
                                    //}

                                    var panel1 = $.jsPanel({
                                        iframe: {
                                            src: "report_map.html",
                                            id: "myFrame",
                                            style: { "display": "none", "border": "10px solid transparent" },
                                            width: '100%',
                                            height: '100%'
                                        },

                                        callback: function () {
                                            document.getElementById("myFrame").onload = function () {
                                                $("#myFrame").fadeIn(1000);
                                            }
                                        },
                                        size: { width: 425, height: 425 },
                                        position: { left: "center", top: 30 },
                                        title: row.Asset, //Speed Report
                                        theme: "black"
                                    });

                                },

                            });

                    });
                }


                else if (reports == "mileage") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalMileage").innerHTML = duration;

                    //Mileage Table
                    $(document).ready(function () {


                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'UtilID',
                                url: WebApiUtilization,
                                columns: [{
                                    field: 'Date',
                                    title: 'Date',
                                    formatter: dateFormatter
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle'
                                }, {
                                    field: 'Category',
                                    title: 'Category'
                                }, {
                                    field: 'StartTime',
                                    title: 'Start Time',
                                    formatter: timeFormatter2
                                }, {
                                    field: 'EndTime',
                                    title: 'End Time',
                                    formatter: timeFormatter2
                                }, {
                                    field: 'TotalTime',
                                    title: 'Total Time',
                                    formatter: totalhoursFormatter
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: roundToTwo
                                }, {
                                    field: 'LastIgnition',
                                    title: 'Last Ignition',
                                    formatter: timestampFormatter
                                }],

                                onLoadSuccess: function (row) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                                }

                            });

                    });
                }


                else if (reports == "utilization") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalUtilization").innerHTML = duration;
                    //Utilization Table
                    $(document).ready(function () {

                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'UtilID',
                                url: WebApiUtilization,
                                columns: [{
                                    field: 'Date',
                                    title: 'Date',
                                    formatter: dateFormatter
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle'
                                }, {
                                    field: 'Category',
                                    title: 'Category'
                                }, {
                                    field: 'Idle',
                                    title: 'Idle',
                                    formatter: timeFormatter
                                }, {
                                    field: 'Move',
                                    title: 'Move',
                                    formatter: timeFormatter
                                }, {
                                    field: 'Stop',
                                    title: 'Stop',
                                    formatter: timeFormatter
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: roundToTwo
                                }, {
                                    field: 'LastIgnition',
                                    title: 'Last Ignition',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Location',
                                    title: 'Location'
                                }],

                                onLoadSuccess: function (row) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                                }

                            });

                    });
                }


                else if (reports == "utilization2") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalUtilization").innerHTML = duration;

                    //Utilization Table Type 2
                    $(document).ready(function () {


                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'UtilID',
                                url: WebApiUtilization,
                                columns: [{
                                    field: 'Date',
                                    title: 'Date',
                                    formatter: dateFormatter
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle'
                                }, {
                                    field: 'Category',
                                    title: 'Category'
                                }, {
                                    field: 'Idle',
                                    title: 'Idle',
                                    formatter: percentFormatter
                                }, {
                                    field: 'Move',
                                    title: 'Move',
                                    formatter: percentFormatter
                                }, {
                                    field: 'Stop',
                                    title: 'Stop',
                                    formatter: percentFormatter
                                }, {
                                    field: 'StopCount',
                                    title: 'Stop Count'
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: roundToTwo
                                }, {
                                    field: 'LastIgnition',
                                    title: 'Last Ignition',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Location',
                                    title: 'Location'
                                }],

                                onLoadSuccess: function (row) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));




                                }

                            });

                    });
                }


                else if (reports == "events") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalEvents").innerHTML = duration;

                    //Event Table
                    var getEvents = document.getElementById("load-events");
                    var strEvent = getEvents.options[getEvents.selectedIndex].value;


                    if (strEvent == 12 | strEvent == 13) {
                        //User Log In/Out
                        $(document).ready(function () {

                            $('#' + Report).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: 'http://track.asiacom.co.th/tracksgwebapi/api/eventinfo/?StatusID=' + getStatusID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&CompanyID=' + getCompany + '&AckRoleID=' + getSessionstorageValueRoleID,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Timestamp',
                                        //title: 'การประทับเวลา',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    }]

                                });

                        });
                    }
                    else if (strEvent == 17 | strEvent == 18) {
                        $(document).ready(function () {

                            $('#' + Report).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Timestamp',
                                        //title: 'การประทับเวลา',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    }, {
                                        field: 'Asset',
                                        title: 'Vehicle',
                                        //title: 'พาหนะ',
                                        formatter: vehicleFormatter
                                    }, ],

                                    onLoadSuccess: function (row) {


                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                        //Store
                                        localStorage.setItem("row", JSON.stringify(row));


                                        //Then retrieve
                                        var localObj = JSON.parse(localStorage.getItem(row));


                                        //if (Modernizr.localstorage) {
                                        //    $("#Perimeter").text('localStorage is available');
                                        //} else {
                                        //    $("#Perimeter").text('localStorage is not available');
                                        //}

                                        var panel1 = $.jsPanel({
                                            iframe: {
                                                src: "history_event.html",
                                                id: "myFrame",
                                                style: { "display": "none", "border": "10px solid transparent" },
                                                width: '100%',
                                                height: '100%'
                                            },

                                            callback: function () {
                                                document.getElementById("myFrame").onload = function () {
                                                    $("#myFrame").fadeIn(1000);
                                                }
                                            },
                                            size: { width: 425, height: 425 },
                                            position: { left: "center", top: 30 },
                                            title: row.Asset,
                                            theme: "black"
                                        });

                                    },

                                });

                        });
                    }
                    else if (strEvent == 19) {
                        //Speed Limit Table
                        $(document).ready(function () {

                            $('#' + Report).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Timestamp',
                                        //title: 'การประทับเวลา',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    }, {
                                        field: 'Asset',
                                        title: 'Vehicle',
                                        //title: 'พาหนะ',
                                        formatter: vehicleFormatter
                                    }, ],

                                    onLoadSuccess: function (row) {


                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    }

                                });

                        });
                    }

                }

                else if (reports == "messages") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalMessages").innerHTML = duration;
                    //Event Table
                    $(document).ready(function () {


                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'MessageID',
                                url: WebApiMessages,
                                columns: [{
                                    field: 'MessageID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Flag',
                                    title: 'Status',
                                    formatter: flagFormatter
                                }, {
                                    field: 'Sender',
                                    title: 'From'
                                }, {
                                    field: 'Recipients',
                                    title: 'To'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Message',
                                    title: 'Message'
                                }, ],

                                onLoadSuccess: function (row) {

                                    //console.log('Messages: onLoadSuccess, data: ' + JSON.stringify(row));

                                },

                            });

                    });
                }

                else if (reports == "jobs") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalJobs").innerHTML = duration;
                    //Event Table
                    $(document).ready(function () {

                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobNumber',
                                    title: 'Job Number',
                                    sortable: 'true'
                                }, {
                                    field: 'Company',
                                    title: 'Company Name',
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Delivery Date',
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'DriverInfo.Remarks',
                                    title: 'Driver ID',
                                    sortable: 'true',
                                    formatter: 'driveridFormatter'
                                }, {
                                    field: 'DriverInfo.Image',
                                    title: 'Driver Profile',
                                    formatter: 'nameFormatter',
                                    sortable: 'true'
                                }]

                            });

                    });
                }

                else if (reports == "idling") {

                    $('#' + getLocalstorageValueReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalIdling").innerHTML = duration;

                    //Idling Table
                    $(document).ready(function () {

                        $('#' + Report).bootstrapTable(
                            {
                                idField: 'AssetID',
                                url: WebAPIIdling,
                                columns: [{
                                    field: 'IdleReportID',
                                    // title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle'
                                }, {
                                    field: 'Driver',
                                    title: 'Driver'
                                }, {
                                    field: 'Location',
                                    title: 'Location'
                                }, {
                                    field: 'IdleStart',
                                    title: 'Idling Start',
                                    sortable: 'true',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'IdleEnd',
                                    title: 'Idling End',
                                    sortable: 'true',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Total Idling',
                                    title: 'Total Idling',
                                    sortable: 'true',
                                    formatter: idlingFormatter
                                }],

                                onLoadSuccess: function (row) {


                                },

                            });





                    });
                }

            }

            else {

                alert('Date Invalid');

            }
            //} else {

            //    alert('Date Invalid');

            //}



            //===============================
        }

    });



    //==============================



});


//OnChange Filter
$(document).ready(function () {

    $('#load-report').change(function () {
        var selected = $(this).find("option:selected").val();

        if (selected == "Positions") {
            $("#playback").show();
            $("#viewLocation").show();
            $(".vehicle").show();
        }
        else if (selected == "Speed") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
        }
        else if (selected == "Events") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
        }
        else if (selected == "Utilization (Type 1)") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
        }
        else if (selected == "Messages") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
        } else if (selected == "Jobs") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();

        } else if (selected == "Idling") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();

        } else if (selected == "") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").hide();

        }

    });

    $('#load-messages').change(function () {
        localStorage.setItem("setLocalstorageValueMessages", $(this).val());

    });

    $('#load-events').change(function () {
        localStorage.setItem("setLocalstorageValueEvents", $(this).val());
        var selected = $(this).find("option:selected").html();

        if (selected == "User Logout") {
            $("#historyAssets").hide();
        }
        else if (selected == "User Login") {
            $("#historyAssets").hide();
        }
        else if (selected == "Zone Enter") {
            $("#historyAssets").show();
        }
        else if (selected == "Zone Exit") {
            $("#historyAssets").show();
        }
        else if (selected == "Speeding Report") {
            $("#historyAssets").show();
        }


    });

    $('#load-assets').change(function () {
        localStorage.setItem("setLocalstorageValueAsset", $(this).val());

    });

    $('#load-reseller').change(function () {
        localStorage.setItem("setLocalstorageValueReseller", $(this).val());

    });

    $('#load-company').change(function () {

        localStorage.setItem("setLocalstorageValueCompany", $(this).val());

    });


    $('#speedLimit').change(function () {
        localStorage.setItem("setLocalstorageValueSpeedLimit", $(this).val());

    });


    $('#dateFrom').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateFrom", $(this).val());
    });

    $('#dateTo').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateTo", $(this).val());
    });


});


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

        location.reload();


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

  //  document.getElementById("software").innerHTML = version;
    document.getElementById("softwareEN").innerHTML = version;


});


//Storage
$(document).ready(function () {


    try {

        var getAsset = $("#load-assets").val();
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();

        localStorage.setItem("setLocalstorageValueAsset", getAsset);
        localStorage.setItem("setLocalstorageValueCompany", getCompany);
        localStorage.setItem("setLocalstorageValueReseller", getReseller);


        var getSpeed = $("#speedLimit").val();

        localStorage.setItem("setLocalstorageValueSpeedLimit", getSpeed);
        var getStatusID = $("#load-events").val();
        localStorage.setItem("setLocalstorageValueEvents", getStatusID);

        var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
        var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
        var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');

    }
    catch (e) {

        alert('You got this error: ' + e);
    }



    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == undefined | getSessionstorageValueUser == "") {


        localStorage.clear();
        window.location.href = 'http://track.asiacom.co.th/sg/'; //Login URL
        //window.location.href = '/'; //Login URL

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


    }

});


//Load Report in History
$.getJSON("http://103.237.168.119/tracksgwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-report').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );

    });

    $(".selectpicker").selectpicker('refresh');
});


var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        //$('#load-reseller').append(
        //$('<option></option>').val(0).html("-------")
        //);

        $.each(data, function (index, item) {
            if (item.ResellerID == 4) {
                $('#load-reseller').append(
                     $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                 );
            } else {
                $('#load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
}


//Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?ResellerID=" + "4", function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
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


        $('.selectpicker').selectpicker('refresh');
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




// Mobile Reseller
var MobileWebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    MobileWebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "4") {
                $('#mobile-load-reseller').append(
                     $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)

                 );
            } else {

                $('#mobile-load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)

                );
            }
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID == 2) {

    MobileWebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#mobile-load-reseller').remove();
}


//Mobile Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 2) {

                $('#mobile-load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );

            } else {

                $('#mobile-load-company').append(
                     $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                 );

            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
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

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-company').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );

        });

        $(".selectpicker").selectpicker('refresh');

    });

}


//Mobile Assets
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + '4' + '&CompanyID=' + '2', function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


//Mobile Report
$.getJSON("http://103.237.168.119/tracksgwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#mobile-load-report').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );

    });

    $(".selectpicker").selectpicker('refresh');
});

//Mobile Events
$.getJSON("http://103.237.168.119/tracksgwebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.StatusID != 4 && item.StatusID != 20 && item.StatusID != 21) {
            $('#mobile-load-events').append(
                 $('<option></option>').val(item.StatusID).html(item.StatusDesc)
             );
        }
    });

    $(".selectpicker").selectpicker('refresh');
});




var selectedAsset = "";

//Dashboard Asset
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectVechsFilter').on('change', function () {
        selectedAsset = $(this).find("option:selected").val();

        $('#mobile-load-assets').empty();
        $('.MobileSelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });
        }

    });

});

//====================================================//

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

        $('#mobile-load-assets').empty();
        $(".MobileSelectVechsFilter").selectpicker('refresh');

        $('#load-assets').empty();
        $(".SelectVechsFilter").selectpicker('refresh');

    });

});

var selectedMobileCompany = "";

//Mobile Company
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedMobileCompany = $(this).find("option:selected").val();

        if (selectedMobileCompany != 0) {

            //Select New Company
            $('#load-company').empty();
            $('.SelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

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
                    var getCompany = $("#mobile-load-company").val();
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
                    var getCompany = $("#mobile-load-company").val();
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

                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');

                });
            }

            //Load New Assets
            $('#mobile-load-assets').empty();      
            $('.MobileSelectVechsFilter').selectpicker('refresh');
            $('#load-assets').empty();
            $('.SelectVechsFilter').selectpicker('refresh');
            var getReseller = $('#mobile-load-reseller').val();
            var getCompany = $('#mobile-load-company').val();

            if (getSessionstorageValueRoleID == 1) {

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    });

                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                    });
                    
                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                    $.each(data, function (index, item) {
                       
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                    });
                    
                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });
            }
       
        }

    });


});

var selectedMobileAsset = "";

//Mobile Asset
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectVechsFilter').on('change', function () {
        selectedMobileAsset = $(this).find("option:selected").val();

        $('#load-assets').empty();
        $('.SelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#mobile-load-reseller').val();
        var getCompany = $('#mobile-load-company').val();

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset)
                    {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else
                    {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }
                
                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset) {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset) {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
       
    });

});

//====================================================//

$(function () {

    $("#mobile-assets").hide();
    $('#mobile-events').hide();
    $("#mobile-speed").hide();
    $("#mobile-messages").hide();

    $('#mobile-load-report').change(function () {
        var selected = $(this).find("option:selected").val();

        if (selected == "Positions") {
            $("#playback").show();
            $("#viewLocation").show();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
        }
        else if (selected == "Speed") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").show();
            $("#mobile-messages").hide();
        }
        else if (selected == "Events") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").show();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
        }
        else if (selected == "Utilization (Type 1)") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
        }
        else if (selected == "Messages") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").show();

        } else if (selected == "Jobs") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();

        } else if (selected == "") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").hide();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();

        }

    });

    $('#mobile-load-events').change(function () {
        localStorage.setItem("setLocalstorageValueEvents", $(this).val());
        var selected = $(this).find("option:selected").html();

        if (selected == "User Logout") {
            $("#mobile-assets").hide();
        }
        else if (selected == "User Login") {
            $("#mobile-assets").hide();
        }
        else if (selected == "Zone Enter") {
            $("#mobile-assets").show();
        }
        else if (selected == "Zone Exit") {
            $("#mobile-assets").show();
        }
        else if (selected == "Speeding Report") {
            $("#mobile-assets").show();
        }


    });

});


$('#generatemobile').on('click', function () {

    var reseller = $('#mobile-load-reseller').val();
    var company = $('#mobile-load-company').val();
    var reports = $('#mobile-load-report').val();
    var vehicle = $('#mobile-load-assets').val();
    var speed = $('#mobile-load-speed').val();
    var datefrom = $('#mobile-dateFrom').val();
    var dateto = $('#mobile-dateTo').val();
    var getFlag = $("#mobile-load-messages").val();
    var getStatusID = $("#mobile-load-events").val();

    localStorage.setItem("setLocalstorageValueAsset", vehicle);
    localStorage.setItem("setLocalstorageValueCompany", company);
    localStorage.setItem("setLocalstorageValueDateFrom", datefrom);
    localStorage.setItem("setLocalstorageValueDateTo", dateto);

    var webapiMobile = "http://103.237.168.119/tracksgwebapi/api/posinfo?Asset=" + vehicle + "&Speed=" + speed + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var WebApiEvent = "http://track.asiacom.co.th/tracksgwebapi/api/eventinfo/?Asset=" + vehicle + "&StatusID=" + getStatusID + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var WebApiMessages = "http://track.asiacom.co.th/tracksgwebapi/api/messageinfo?Asset=" + vehicle + "&Flag=" + getFlag + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var jobApi = 'http://103.237.168.119/tracksgwebapi/api/jobinfo?AssetResellerID=' + reseller + '&AssetCompanyID=' + company + '&Asset=' + vehicle + '&Timestamp=' + datefrom + '&RxTime=' + dateto;


    if (reports == "Positions") {

        $("#event-report").hide();
        $("#position-report").show();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-positions').bootstrapTable('destroy');

        $('#reports-positions').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device'
            }, {
                field: 'Driver',
                title: 'Driver'
            }, {
                field: 'Location',
                title: 'Location'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed',
                formatter: speedFormatter
            }, {
                field: 'Engine',
                title: 'Engine',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (data) {

                var rows = document.getElementById('reports-positions').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                if (rows <= 1) {

                    alert('No data!');
                }


                //Set
                sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                drawPositionChart();

            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_map.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Position Report
                    theme: "black"
                });



            }

        });
    }

    else if (reports == "Speed") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").show();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-speed').bootstrapTable('destroy');

        $('#reports-speed').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device'
            }, {
                field: 'Driver',
                title: 'Driver'
            }, {
                field: 'Speed',
                title: 'Speed',
                formatter: speedFormatter
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Engine',
                title: 'Engine',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));


                drawChart();



            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_map.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Speed Report
                    theme: "black"
                });

            },

        });
    } 

    else if (reports == "Mileage")
    {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").show();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-mileage').bootstrapTable('destroy');

        $('#reports-mileage').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device'
            }, {
                field: 'Mileage',
                title: 'Mileage'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed',
                formatter: speedFormatter
            }, {
                field: 'Engine',
                title: 'Engine',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));

                drawChart();


            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_bar.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Mileage Report
                    theme: "black"
                });


            },

        });
    }
    else if (reports == "Utilization (Type 1)")
    {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").show();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-utilization').bootstrapTable('destroy');

        $('#reports-utilization').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed',
                formatter: speedFormatter
            }, {
                field: 'Engine',
                title: 'Engine',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                formatter: ignitionFormatter
            }],
            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));

                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };

                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));

                drawChart();


            },


            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_pie.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Utilization Report
                    theme: "black"
                });

            },

        });
    }

    else if (reports == "Messages") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").show();
        $("#jobs-report").hide();

        $('#reports-messages').bootstrapTable('destroy');

        $('#reports-messages').bootstrapTable({
            idField: 'id',
            url: WebApiMessages,
            columns: [{
                field: 'Timestamp',
                title: 'Timestamp',
                formatter: timestampFormatter
            }, {
                field: 'Flag',
                title: 'Status',
                formatter: flagFormatter
            }, {
                field: 'Sender',
                title: 'From'
            }, {
                field: 'Recipients',
                title: 'To'
            }, {
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Message',
                title: 'Message'
            }, ],

            onLoadSuccess: function (row) {

                console.log('Messages: onLoadSuccess, data: ' + JSON.stringify(row));
                var sent = 0;
                var pending = 0;


                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Flag == 0) {
                        sent++;
                    } else if (row[i].Flag == 1) {
                        pending++;
                    }
                }

                var objMessages = {
                    Sent: sent,
                    Pending: pending
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueMessages", JSON.stringify(objMessages));

                drawMessages();

            }
        });
    }

    else if (reports == "Jobs") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").show();

        $('#reports-jobs').bootstrapTable('destroy');

        $('#reports-jobs').bootstrapTable({
            idField: 'id',
            url: jobApi,
            columns: [{
                field: 'JobNumber',
                title: 'Job Number',
                sortable: 'true'
            }, {
                field: 'Company',
                title: 'Company Name',
                sortable: 'true'
            }, {
                field: 'Asset',
                title: 'Vehicle',
                sortable: 'true'
            }, {
                field: 'Timestamp',
                title: 'Delivery Date',
                sortable: 'true',
                formatter: 'timestampFormatter'
            }, {
                field: 'DriverInfo.Remarks',
                title: 'Driver ID',
                sortable: 'true',
                formatter: 'driveridFormatter'
            }, {
                field: 'DriverInfo.Image',
                title: 'Driver Profile',
                formatter: 'nameFormatter',
                sortable: 'true'
            }]
        });
    }

    else if (reports == "Events") {

        $("#event-report").show();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-events').bootstrapTable('destroy');

        //Event Table
        var getEvents = document.getElementById("mobile-load-events");
        var strEvent = getEvents.options[getEvents.selectedIndex].value;

        if (strEvent == 12 | strEvent == 13) {
            //User Log In/Out
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: 'http://track.asiacom.co.th/tracksgwebapi/api/eventinfo/?StatusID=' + getStatusID + '&Timestamp=' + datefrom + '&RxTime=' + dateto + "&CompanyID=" + company + "&AckRoleID=" + getSessionstorageValueRoleID,
                        columns: [{
                            field: 'Timestamp',
                            title: 'Timestamp',

                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: 'Event'
                        }, {
                            field: 'Remarks',
                            title: 'Remarks'
                        }]

                    });

            });
        }
        else if (strEvent == 17 | strEvent == 18) {
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: WebApiEvent,
                        columns: [{
                            field: 'Timestamp',
                            title: 'Timestamp',
                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: 'Event'
                        }, {
                            field: 'Remarks',
                            title: 'Remarks'
                        }, {
                            field: 'Asset',
                            title: 'Vehicle',
                            formatter: vehicleFormatter
                        }, ],

                        onLoadSuccess: function (row) {

                            //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));
                            var enter = 0;
                            var exit = 0;


                            for (var i = 0; i < row.length; ++i) {
                                if (row[i].Event == "Zone Enter") {
                                    enter++;
                                } else if (row[i].Event == "Zone Exit") {
                                    exit++;
                                }
                            }

                            var objEvent = {
                                ZoneEnter: enter,
                                ZoneExit: exit
                            };


                            //Set
                            sessionStorage.setItem("setSessionstorageValueEvents", JSON.stringify(objEvent));

                            drawEvent();

                        },

                        onClickRow: function (row) {
                            //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                            //Store
                            localStorage.setItem("row", JSON.stringify(row));


                            //Then retrieve
                            var localObj = JSON.parse(localStorage.getItem(row));


                            //if (Modernizr.localstorage) {
                            //    $("#Perimeter").text('localStorage is available');
                            //} else {
                            //    $("#Perimeter").text('localStorage is not available');
                            //}

                            var panel1 = $.jsPanel({
                                iframe: {
                                    src: "history_event.html",
                                    id: "myFrame",
                                    style: { "display": "none", "border": "10px solid transparent" },
                                    width: '100%',
                                    height: '100%'
                                },

                                callback: function () {
                                    document.getElementById("myFrame").onload = function () {
                                        $("#myFrame").fadeIn(1000);
                                    }
                                },
                                size: { width: 425, height: 425 },
                                position: { left: "center", top: 30 },
                                title: row.Asset,
                                theme: "black"
                            });
                        },

                    });

            });
        }
        else if (strEvent == 19) {
            //Speed Limit Table
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: WebApiEvent,
                        columns: [{
                            field: 'Timestamp',
                            title: 'Timestamp',
                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: 'Event'
                        }, {
                            field: 'Remarks',
                            title: 'Remarks'
                        }, {
                            field: 'Asset',
                            title: 'Vehicle',
                            formatter: vehicleFormatter
                        }, ],

                        onLoadSuccess: function (row) {

                            // console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));
                            var speed = 0;


                            for (var i = 0; i < row.length; ++i) {
                                if (row[i].Event == "Speeding Report") {
                                    speed++;
                                }
                            }

                            var objEvent = {
                                SpeedLimit: speed,
                            };


                            //Set
                            sessionStorage.setItem("setSessionstorageValueEvents", JSON.stringify(objEvent));

                            drawEventSpeedLimit();

                        },

                        onClickRow: function (row) {
                            //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                        }

                    });

            });
        }
    }


});
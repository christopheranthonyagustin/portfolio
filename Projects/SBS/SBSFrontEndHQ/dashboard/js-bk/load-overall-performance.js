
var WebApi;
var WebApiErr;

//Overall Performance
$(document).ready(function () {

    var getAsset = $("#vehicle").val(); //the value of the selected option   
    var getTimestamp = $("#dateFrom").val();
    var getRxTime = $("#dateTo").val();
    var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
    var convertTimestamp = moment(getTimestamp, dateFormat);
    var convertRxtime = moment(getRxTime, dateFormat);
    var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
    var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
    var getDriver = $("#driver").val();

    //Filter Checkbox
    var changeCheckbox = document.querySelector('.js-check-change-filter');

    //Onload
    //document.getElementById("posFilter").checked = true;

    //Check Filter 

    if (changeCheckbox.checked) {

        WebApi = "http://172.16.10.110/sbswebapi/api/posinfo?Asset=" + getAsset + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;

    } else {

        WebApi = "http://172.16.10.110/sbswebapi/api/triggerdatainfo?Drv=" + getDriver + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
    }



    $('#tableFooter').hide();
    $('#chartdivOverall').hide();
    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;

    function Generate() {


        if ($('#chartdivOverall').highcharts() != null)
        {
            $('#chartdivOverall').highcharts().destroy();        
        }

        $('.loading').show();
        $('.loader').show();

        $('#tableFooter').show();
        $('#chartdivOverall').show();
        var getAsset = $("#vehicle1").val(); //the value of the selected option   
        var getDriver = $("#driver1").val();

        var getDepot = $('#depot1').val(); //depot
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        var getInterchange = $('#interchange1').val(); //interchange
        var ObjInterchange = JSON.stringify(getInterchange);
        var parseObjInterchange = ObjInterchange.replace(/\[|\"|\]/g, "");

        //var getSvc = $('#svc').val(); //svc
        //var ObjSvc = JSON.stringify(getSvc);
        //var parseObjSvc = ObjSvc.replace(/\[|\"|\]/g, "");
        var getSessionstorageValueOPSvc = sessionStorage.getItem('setSessionstorageValueOPSvc');
 
        var getTimestamp = $("#dateFrom1").val();
        var getRxTime = $("#dateTo1").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);
        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid(); 

        //Filter On/Off 
        if (changeCheckbox.checked)
        {  
            WebApi = "http://172.16.10.110/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }
        else
        {
            //http://172.16.10.110/sbswebapi/api/overallperformanceinfo?DepotID=1&InterchangeID=1&DrvNo=15192&SvcNo=166&Timestamp=31-Aug-2016,%2004:00:00%20PM&RxTime=1-Sep-2016,%2004:00:00%20PM
            //WebApi = "http://172.16.10.110/sbswebapi/api/overallperformanceinfo?DepotID=" + parseObjDepot + "&InterchangeID=" + parseObjInterchange + "&DrvNo=" + getDriver + "&SvcNo=" + getSessionstorageValueOPSvc + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
            //WebApiErr = "http://172.16.10.110/sbswebapi/api/overallperformanceinfo?DepotID=" + parseObjDepot + "&InterchangeID=" + parseObjInterchange + "&DrvNo=&SvcNo=" + getSessionstorageValueOPSvc + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
            WebApi = "http://172.16.10.110/sbswebapi/api/overallperformanceinfo?SessionID=" + sessionStorage.getItem('setSessionstorageValueUserID');
        }

        if (typeof (getDriver) !== "undefined" && getDriver !== null) {

            if (validateTimestamp == true && validateRxTime == true) {

                if (getTimestamp < getRxTime) {
                   
                    var apiSearchSessionID = 'http://172.16.10.110/sbswebapi/api/oaperfparamsinfo?SessionID=' + sessionStorage.getItem('setSessionstorageValueUserID');

                    //Check Session ID
                    $.getJSON(apiSearchSessionID, function (data) {
                        if (data.length > 0)
                        {
                            var sessionid = JSON.stringify({ 'SessionID': sessionStorage.getItem('setSessionstorageValueUserID') });
                            var WebAPIOAPerf = 'http://172.16.10.110/sbswebapi/api/oaperfparamsinfo/' + sessionStorage.getItem('setSessionstorageValueUserID');;

                            $.ajax({
                                url: WebAPIOAPerf,
                                type: "Delete",
                                data: JSON.stringify(sessionid),
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
                                permissions: ["http://http://172.16.10.110"],
                                success: function (sessionid) {
                                    console.log(sessionid);                               

                                    for (i = 1; i < 16; i++) {

                                        var oaperf = {
                                            SessionID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                            ParamID: i,
                                            Timestamp: $('#dateFrom' + i).val(),
                                            RxTime: $('#dateTo' + i).val(),
                                            DepotID: $('#depot' + i).val()
                                        };

                                        $.ajax({
                                            url: "http://172.16.10.110/sbswebapi/api/oaperfparamsinfo",
                                            type: "POST",
                                            data: JSON.stringify(oaperf),
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
                                            permissions: ["http://172.16.10.110"],
                                            success: function (oaperf) {
                                                console.log(oaperf);
                                                //window.location.reload(true);
                                            }
                                        });

                                    }
                                }
                            });

                            var sessionid = JSON.stringify({ 'SessionID': sessionStorage.getItem('setSessionstorageValueUserID') });
                            var WebAPIDrv = 'http://172.16.10.110/sbswebapi/api/oaperfdrvinfo/' + sessionStorage.getItem('setSessionstorageValueUserID');;

                            $.ajax({
                                url: WebAPIDrv,
                                type: "Delete",
                                data: JSON.stringify(sessionid),
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
                                success: function (sessionid) {
                                    console.log(sessionid);

                                    for (i = 1; i < 16; i++) {

                                        var getDriver = $('#driver' + i).val();
                                        if (getDriver != null || getDriver == "") {
                                            if (getDriver.length > 0) {

                                                for (k = 0; k < getDriver.length; k++) {

                                                    var oaperfdrv = {
                                                        SessionID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                                        ParamID: i,
                                                        DrvNo: getDriver[k]
                                                    };

                                                    $.ajax({
                                                        url: "http://172.16.10.110/sbswebapi/api/oaperfdrvinfo",
                                                        type: "POST",
                                                        data: JSON.stringify(oaperfdrv),
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
                                                        success: function (oaperfdrv) {
                                                            console.log(oaperfdrv);

                                                        }
                                                    });

                                                }
                                            }
                                        }

                                    }

                                }
                            });

                        }
                        else
                        {
                            for (i = 1; i < 16; i++) {

                                var oaperf = {
                                    SessionID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                    ParamID: i,
                                    Timestamp: $('#dateFrom' + i).val(),
                                    RxTime: $('#dateTo' + i).val(),
                                    DepotID: $('#depot' + i).val()
                                };

                                $.ajax({
                                    url: "http://172.16.10.110/sbswebapi/api/oaperfparamsinfo",
                                    type: "POST",
                                    data: JSON.stringify(oaperf),
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
                                    success: function (oaperf) {
                                        console.log(oaperf);
                                        //window.location.reload(true);
                                    }
                                });

                                var getDriver = $('#driver' + i).val();
                                if (getDriver != null || getDriver == "")
                                {
                                    if (getDriver.length > 0) {

                                        for (k = 0; k < getDriver.length; k++) {

                                            var oaperfdrv = {
                                                SessionID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                                ParamID: i,
                                                DrvNo: getDriver[k]
                                            };

                                            $.ajax({
                                                url: "http://172.16.10.110/sbswebapi/api/oaperfdrvinfo",
                                                type: "POST",
                                                data: JSON.stringify(oaperfdrv),
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
                                                success: function (oaperfdrv) {
                                                    console.log(oaperfdrv);

                                                }
                                            });

                                        }
                                    }
                                }
                            }
                        }
                    });

                    $.ajax({
                        url: WebApi,
                        type: 'GET',
                        dataType: 'json',
                        crossDomain:true,
                        crossOrigin:true,
                        header:{'Access-Control-Allow-Origin': '*'},
                        success: function (data, textStatus, xhr) {
                            //console.log(data);
                            drawChart(data);
                            $('.loading').hide();
                            $('.loader').hide();
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            console.log('Error in Operation');
                            
                        }
                    });
                }
                else
                {
                    $('.loading').hide();
                    $('.loader').hide();
                    alert('Date Invalid');
                }
            }
            else
            {
                $('.loading').hide();
                $('.loader').hide();
                alert('Date Invalid');
            }

        } else {

            $('.loading').hide();
            $('.loader').hide();
            alert('You must select Vehicle');
        }
    }

});


function eventFormatter(value) {
    
    var text;
    if (value == 83) {
        text = "Speeding";
    } else if (value == 76) {
        text = "LDW";
    } else if (value == 73) {
        text = "Interval";
    } else if (value == 72) {
        text = "HMW";
    } else if (value == 70) {
        text = "FCW";
    } else if (value == 68) {
        text = "PDZ";
    } else if (value == 80) {
        text = "PCW";
    } else if (value == 77) {
        text = "Maintenance";
    } else if (value == 84) {
        text = "Tamper Alert";
    }

    else {
        text = value;
    }

    return text;
}

function valueFormatter(value, row) {

    var text;
    
    if (row.Event == 83 && value == 00) {
        text = "Speed restore";
    } else if (row.Event == 83 && value == 01) {
        text = "Speed exceed 0-5 kmh";
    } else if (row.Event == 83 && value == 02) {
        text = "Speed exceed 5-10 kmh";
    } else if (row.Event == 83 && value == 03) {
        text = "Speed exceed 10-15 kmh";
    } else if (row.Event == 83 && value == 04) {
        text = "Speed exceed 15-20 kmh";
    } else if (row.Event == 83 && value == 05) {
        text = "Speed exceed 20-25 kmh";
    } else if (row.Event == 83 && value == 06) {
        text = "Speed exceed 25-30 kmh";
    } else if (row.Event == 83 && value == 07) {
        text = "Speed exceed > 30 kmh";
    } else if (row.Event == 72 && value == 2) {
        text = "Head way distance > configure distance";
    } else if (row.Event == 72 && value == 1) {
        text = "Head way distance < configure distance or 0.6 second";
    } else if (row.Event == 72 && value == 0) {
        text = "No vehicle detected";
    } else if (row.Event == 70) {
        text = "Forward collision warning";
    } else if (row.Event == 76 && value == 1) {
        text = "Left lane departure";
    } else if (row.Event == 76 && value == 0) {
        text = "Right lane departure";
    } else if (row.Event == 80) {
        text = "Pedestrian forward collision warning";
    } else if (row.Event == 68) {
        text = "Pedestrian in danger zone";
    } else if (row.Event == 77) {
        text = "Maintenance error. Indicate Mobileye internal error";
    } else if (row.Event == 84) {
        text = "Tamper alert. No vehicle or lane detection for more than 10 minute when vehicle drive > 15 kmh";
    } else if (row.Event == 73) {
        text = "Normal time interval logging";
    }

    else {
        text = value;
    }

    return '<div>' + text + '</div>';
}

function hwFormatter(value) {

    var text;

    if (value == 255) {
        text = "0";
    } else if (value == 0) {
        text = "0";
    } else if (value == 25) {
        text = "0";
    } else if (value == "FF") {
        text = "0";
    }
    else {
        text = parseFloat(value / 10).toFixed(1);
    }

    return '<div>' + text + '</div>';
}

function speedFormatter(value) {

    return '<div>' + value + ' km/h' +  '</div>';
}

function BkFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-exclamation-circle fa-lg icon-move"><i>' + '</center></div>';
    } else
    {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function LSLFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-arrow-circle-left fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function RSLFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-arrow-circle-right fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function WifiFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-wifi fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function LBFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-explanation fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function HBFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-explanation-triangle fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function dateFormatter(value, row) {


    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    //var timestamp = moment(Singapore.format()).format("D-MMM-YYYY, hh:mm:ss A");
    var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';


}

function statusFormatter(value, row) {


    return '<div>' + '<span>' + value + '</span>' + '</div>';

}

function brakeFormatter(value) {

    return '<div><center>' + '<i class="fa fa-exclamation-circle fa-lg icon-move"><i>' + '</center></div>';
 
}

function directionFormatter(value) {

    return '<div><center>' + '<i class="fa fa-retweet fa-lg icon-move"><i>' + '</center></div>';

}

function remarkFormatter(value) {

    if (value == "Good") {

        return '<div><center>' + '<i class="fa fa-thumbs-up fa-lg icon-move">&nbsp;' + value + ' <i>' + '</center></div>';
    } else if (value == "Bad") {

        return '<div><center>' + '<i class="fa fa-thumbs-down fa-lg icon-stop">&nbsp;' + value + ' <i>' + '</center></div>';
    }

}

$(function () {

    $.getJSON("http://172.16.10.110/sbswebapi/api/depotinfo", function (data) {

        $.each(data, function (index, item) {
            $('#depot1').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot2').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot3').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot4').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot5').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot6').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot7').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot8').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot9').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot10').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot11').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot12').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot13').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot14').append($('<option></option>').val(item.DepotID).html(item.Name));
            $('#depot15').append($('<option></option>').val(item.DepotID).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');
        $('.loading').hide();
        $('.loader').hide();
    });


    var selectedDepot = "";
    $('.SelectDepotFilter1').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();
       
        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot2 = $(this).find("option:selected").val;
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange1').empty();
            $('#svc1').empty();
            $('#driver1').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange1').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange1').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter1 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }




    });
    $('.SelectDepotFilter2').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange2').empty();
            $('#svc2').empty();
            $('#driver2').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange2').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange2').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter2 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter3').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange3').empty();
            $('#svc3').empty();
            $('#driver3').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange3').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange3').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter3 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter4').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange4').empty();
            $('#svc4').empty();
            $('#driver4').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange4').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange4').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter4 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter5').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange5').empty();
            $('#svc5').empty();
            $('#driver5').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange5').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange5').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter5 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter6').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange6').empty();
            $('#svc6').empty();
            $('#driver6').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange6').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange6').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter6 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter7').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange7').empty();
            $('#svc7').empty();
            $('#driver7').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange7').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange7').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter7 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter8').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange8').empty();
            $('#svc8').empty();
            $('#driver8').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange8').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange8').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter8 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter9').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange9').empty();
            $('#svc9').empty();
            $('#driver9').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange9').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange9').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter9 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter10').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange10').empty();
            $('#svc10').empty();
            $('#driver10').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange10').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange10').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter10 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter11').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange11').empty();
            $('#svc11').empty();
            $('#driver11').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange11').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange11').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter11 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter12').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange12').empty();
            $('#svc12').empty();
            $('#driver12').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange12').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange12').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter12 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter13').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange13').empty();
            $('#svc13').empty();
            $('#driver13').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange13').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange13').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter13 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter14').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange14').empty();
            $('#svc14').empty();
            $('#driver14').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange14').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange14').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter14 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });
    $('.SelectDepotFilter15').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange15').empty();
            $('#svc15').empty();
            $('#driver15').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange15').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange15').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter15 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }
    });

    var selectedInterchange = "";
    $('.SelectInterchangeFilter1').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot1').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom1').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo1').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc1').empty();
            $('#driver1').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc1').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc1').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });
           
            $('#driver1').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter1 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc1").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }




    });
    $('.SelectInterchangeFilter2').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot2').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom2').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo2').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc2').empty();
            $('#driver2').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc2').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc2').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver2').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter2 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc2").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter3').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot3').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom3').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo3').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc3').empty();
            $('#driver3').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc3').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc3').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver3').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter3 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc3").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter4').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot4').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom4').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo4').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc4').empty();
            $('#driver4').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc4').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc4').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver4').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter4 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc4").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter5').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot5').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom5').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo5').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc5').empty();
            $('#driver5').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc5').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc5').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver5').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter5 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc5").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter6').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot6').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom6').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo6').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc6').empty();
            $('#driver6').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc6').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc6').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver6').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter6 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc6").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter7').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot7').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom7').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo7').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc7').empty();
            $('#driver7').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc7').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc7').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver7').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter7 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc7").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter8').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot8').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom8').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo8').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc8').empty();
            $('#driver8').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc8').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc8').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver8').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter8 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc8").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter9').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot9').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom9').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo9').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc9').empty();
            $('#driver9').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc9').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc9').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver9').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter9 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc9").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter10').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot10').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom10').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo10').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc10').empty();
            $('#driver10').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc10').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc10').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver10').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter10 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc10").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter11').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot11').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom11').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo11').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc11').empty();
            $('#driver11').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc11').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc11').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver11').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter11 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc11").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter12').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot12').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom12').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo12').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc12').empty();
            $('#driver12').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc12').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc12').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver12').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter12 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc12").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter13').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot13').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom13').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo13').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc13').empty();
            $('#driver13').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc13').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc13').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver13').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter13 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc13").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter14').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot14').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom14').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo14').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc14').empty();
            $('#driver14').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc14').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc14').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver14').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter14 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc14").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectInterchangeFilter15').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot15').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom15').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo15').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc15').empty();
            $('#driver15').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc15').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc15').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver15').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter15 option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc15").find("option[value='" + this.value + "']").addClass("label-success");
                        }

                    });

                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });

    var selectedSvc = "";
    $('.SelectSvcFilter1').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();        

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot1').val();
        var getInterchange = $('#interchange1').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom1').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo1').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver1').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver1').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver1').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter1 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }




    });
    $('.SelectSvcFilter2').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot2').val();
        var getInterchange = $('#interchange2').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom2').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo2').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver2').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver2').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver2').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter2 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter3').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot3').val();
        var getInterchange = $('#interchange3').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom3').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo3').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver3').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver3').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver3').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter3 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter4').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot4').val();
        var getInterchange = $('#interchange4').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom4').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo4').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver4').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver4').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver4').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter4 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter5').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot5').val();
        var getInterchange = $('#interchange5').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom5').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo5').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver5').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver5').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver5').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter5 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter6').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot6').val();
        var getInterchange = $('#interchange6').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom6').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo6').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver6').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver6').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver6').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter6 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter7').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot7').val();
        var getInterchange = $('#interchange7').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom6').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo7').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver7').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver7').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver7').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter7 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter8').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot8').val();
        var getInterchange = $('#interchange8').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom8').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo8').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver8').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver8').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver8').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter8 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter9').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot9').val();
        var getInterchange = $('#interchange9').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom9').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo9').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver9').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver9').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver9').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter9 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter10').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot10').val();
        var getInterchange = $('#interchange10').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom10').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo10').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver10').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver10').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver10').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter10 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter11').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot11').val();
        var getInterchange = $('#interchange11').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom11').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo11').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver11').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver11').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver11').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter11 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter12').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot12').val();
        var getInterchange = $('#interchange12').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom12').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo12').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver12').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver12').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver12').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter12 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter13').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot13').val();
        var getInterchange = $('#interchange13').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom13').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo13').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver13').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver13').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver13').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter13 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter14').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot14').val();
        var getInterchange = $('#interchange14').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom14').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo14').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver14').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver14').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver14').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter14 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });
    $('.SelectSvcFilter15').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {

            //Filter SVC
            if ($(this).hasClass("label-success")) {
                var strSvcNo = $(this).val();
                if (strSvcNo.match(/[a-z]/i)) {
                    // alphabet letters found
                    arrSelected.push("'" + $(this).val() + "'");
                }
                else {
                    arrSelected.push($(this).val());
                }
            }


        });

        sessionStorage.setItem('setSessionstorageValueOPSvc', arrSelected);

        var getDepot = $('#depot15').val();
        var getInterchange = $('#interchange15').val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getOPDateStart = $('#dateFrom15').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo15').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver15').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver15').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {

                $.each(data, function (index, item) {
                    $('#driver15').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter15 option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }
    });

    var selectedDriver = "";
    $('.SelectBCFilter1').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();
           
        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });


        //alert(arrSelected);



    });
    $('.SelectBCFilter2').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter3').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter4').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter5').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter6').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter7').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter8').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter9').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter10').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter11').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter12').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter13').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter14').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });
    $('.SelectBCFilter15').on('change', function () {

        if ($('#chartdivOverall').highcharts() != null) {
            $('#chartdivOverall').highcharts().destroy();

        }

        //$('.loading').show();
        //$('.loader').show();

        selectedDriver = $(this).find("option:selected");
        var arrSelected = [];
        selectedDriver.each(function () {
            arrSelected.push($(this).val());
        });

        //alert(arrSelected);

    });


    //Wizard
    $('.next').click(function () {

        var nextId = $(this).parents('.tab-pane').next().attr("id");
        $('[href=#' + nextId + ']').tab('show');
        return false;

    })

    $('.previous').click(function () {

        var nextId = $(this).parents('.tab-pane').prev().attr("id");
        $('[href=#' + nextId + ']').tab('show');
        return false;

    })

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

        //update progress
        var step = $(e.target).data('step');
        var percent = (parseInt(step) / 15) * 100;

        $('.progress-bar').css({ width: percent + '%' });
        $('.progress-bar').text(step + " of 15");

        //e.relatedTarget // previous tab

    })

    $('.first').click(function () {

        $('#myWizard a:first').tab('show')

    });

    //var date = new Date();
    //var components = [
    //    date.getYear(),
    //    date.getMonth(),
    //    date.getDate(),
    //    date.getHours(),
    //    date.getMinutes(),
    //    date.getSeconds(),
    //    date.getMilliseconds()
    //];

    //var id = components.join("");

    //alert(id);

});


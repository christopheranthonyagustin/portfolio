
var WebApi;


//Trigger Table
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
    $('#chartdivDaily').hide();
    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;

    function Generate() {


        if ($('#chartdivDaily').highcharts() != null)
        {
            $('#chartdivDaily').highcharts().destroy();
        }

        $('.loading').show();
        $('.loader').show();

        $('#tableFooter').show();
        $('#chartdivDaily').show();
        var getAsset = $("#vehicle").val(); //the value of the selected option   
        var getDriver = $("#driver").val();
        var getDepot = $('#depot').val(); //depot
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        var getInterchange = $('#interchange').val(); //interchange
        var ObjInterchange = JSON.stringify(getInterchange);
        var parseObjInterchange = ObjInterchange.replace(/\[|\"|\]/g, "");

        //var getSvc = $('#svc').val(); //svc
        //var ObjSvc = JSON.stringify(getSvc);
        //var parseObjSvc = ObjSvc.replace(/\[|\"|\]/g, "");
        var getSessionstorageValueDPSvc = sessionStorage.getItem('setSessionstorageValueDPSvc');
        
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
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
            // WebApi = "http://172.16.10.110/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;    
            WebApi = "http://172.16.10.110/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }
        else
        {
            //http://172.16.10.110/sbswebapi/api/dailyperformanceinfo?DepotID=1&InterchangeID=1&DrvNo=15192&SvcNo=166&Timestamp=31-Aug-2016,%2004:00:00%20PM&RxTime=1-Sep-2016,%2004:00:00%20PM
            WebApi = "http://172.16.10.110/sbswebapi/api/dailyperformanceinfo?DepotID=" + parseObjDepot + "&InterchangeID=" + parseObjInterchange + "&DrvNo=" + getDriver + "&SvcNo=" + getSessionstorageValueDPSvc + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }

        if (typeof (getDriver) !== "undefined" && getDriver !== null) {


            if (validateTimestamp == true && validateRxTime == true) {


                if (getTimestamp < getRxTime) {

                    $.ajax({
                        url: WebApi,
                        type: 'GET',
                        dataType: 'json',
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
            alert('You must select Driver');
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
            $('#depot').append($('<option></option>').val(item.DepotID).html(item.Name));
            
        });

        $('.selectpicker').selectpicker('refresh');
        $('.loading').hide();
        $('.loader').hide();
    });


    var selectedDepot = "";
    $('.SelectDepotFilter').on('change', function () {

        if ($('#chartdivDaily').highcharts() != null) {
            $('#chartdivDaily').highcharts().destroy();       
        }

        $('.loading').show();
        $('.loader').show();

        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange').empty();
            $('#svc').empty();
            $('#driver').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
                $('.loading').hide();
                $('.loader').hide();
            });
        }




    });

    var selectedInterchange = "";
    $('.SelectInterchangeFilter').on('change', function () {

        if ($('#chartdivDaily').highcharts() != null) {
            $('#chartdivDaily').highcharts().destroy();
        }

        $('.loading').show();
        $('.loader').show();

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

        //var getOPDate = "19-Oct-2016";
        var getOPDateStart = $('#dateFrom').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');


        if (arrSelectedInterchange == "" || arrSelectedInterchange == null) {

            $('#svc').empty();
            $('#driver').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#svc').empty();

            $.getJSON("http://172.16.10.110/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016   
            $.getJSON("http://172.16.10.110/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

                $.each(data, function (index, item) {

                    $(".SelectSvcFilter option").each(function () {

                        if (item.SVC_NO == this.value) {
                            $("#svc").find("option[value='" + this.value + "']").addClass("label-success");
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
    $('.SelectSvcFilter').on('change', function () {

        if ($('#chartdivDaily').highcharts() != null) {
            $('#chartdivDaily').highcharts().destroy();
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

        sessionStorage.setItem('setSessionstorageValueDPSvc', arrSelected);

        var getDepot = $('#depot').val();
        var getInterchange = $('#interchange').val();

        var getOPDateStart = $('#dateFrom').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null) {
            $('#driver').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else {

            $('#driver').empty();
            //http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016 
            var WebAPISvc = "http://172.16.10.110/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {


                $.each(data, function (index, item) {

                    $('#driver').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                $(".SelectBCFilter option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }




    });

    var selectedDriver = "";
    $('.SelectBCFilter').on('change', function () {

        if ($('#chartdivDaily').highcharts() != null) {
            $('#chartdivDaily').highcharts().destroy();
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

});
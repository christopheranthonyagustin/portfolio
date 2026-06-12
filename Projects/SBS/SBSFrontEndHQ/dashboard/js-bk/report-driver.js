


//Positions Table
$(document).ready(function () {

    $('#fixFooter').hide();

    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;



    function Generate() {

        $('#fixFooter').show();

        var getAsset = $("#eventlog").val(); //the value of the selected option   
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid();

        var WebApi = 'http://66.96.208.81/sbswebapi/api/posinfo/?Asset=' + getAsset + '&Speed=&CompanyID=1&Timestamp=' + getTimestamp + '&RxTime=' + getRxTime;

        //alert(WebApi);

        if (getAsset != "") {

            if (validateTimestamp == true && validateRxTime == true) {

                $('#triggerData').bootstrapTable('destroy');

                $('#triggerData').bootstrapTable(
                    {
                        idField: 'PosID',
                        url: WebApi,
                        columns: [{
                            field: 'PosID',
                            title: 'id',
                            class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                        }, {
                            field: 'Timestamp',
                            title: 'Start Time',
                            sortable: 'true',
                            formatter: 'dateFormatter'
                        }, {
                            field: 'RxTime',
                            title: 'End Time',
                            sortable: 'true',
                            formatter: 'dateFormatter'
                        }, {
                            field: 'Asset',
                            title: 'Bus No.'
                        },  {
                            field: 'Tag',
                            title: 'Device',
                            class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                        }, {
                            field: 'Driver',
                            title: 'Driver',
                            class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                        }, {
                            field: 'Location',
                            title: 'Location',
                            class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                        },  {
                            field: 'Headway',
                            title: 'HW',
                            sortable: 'true',
                            formatter: 'hwFormatter'
                        }, {
                            field: 'Headway',
                            title: 'FCW',
                            sortable: 'true',
                            formatter: 'hwFormatter'
                        }, {
                            field: 'Headway',
                            title: 'PCW',
                            sortable: 'true',
                            formatter: 'hwFormatter'
                        }, {
                            field: 'Headway',
                            title: 'LDW',
                            sortable: 'true',
                            formatter: 'hwFormatter'
                        }, {
                            field: 'Event',
                            title: 'Event',
                            sortable: 'true',
                            formatter: 'eventFormatter'
                        }, {
                            field: 'EventValue',
                            title: 'EventValue',
                            sortable: 'true'
                        }],

                        onLoadSuccess: function (row) {

                            var speed = 0;
                            var ldw = 0;
                            var interval = 0;
                            var hw = 0;
                            var fcw = 0;

                            for (var i = 0; i < row.length; ++i) {
                                if (row[i].Event == "83") {
                                    speed++;
                                } else if (row[i].Event == "76") {
                                    ldw++;
                                } else if (row[i].Event == "73") {
                                    interval++;
                                } else if (row[i].Event == "72") {
                                    hw++;
                                } else if (row[i].Event == "70") {
                                    fcw++;
                                }

                            }

                            var objEvent = {
                                Speed: speed,
                                LDW: ldw,
                                Interval: interval,
                                HW: hw,
                                FCW: fcw,
                            };


                            //Set
                            sessionStorage.setItem("setSessionstorageValueEvent", JSON.stringify(objEvent));

                            drawChart();
                            AutoRefresh();
                            initialize();

                        },

                    });
            }
            else {

                alert('Date Invalid');
            }

        } else {

            alert('You must select Vehicle');
        }
    }
});

function AutoRefresh() {


    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];


}

function eventFormatter(value) {

    var text;
    if (value == 83) {
        text = "Speed";
    } else if (value == 76) {
        text = "LDW";
    } else if (value == 73) {
        text = "Interval";
    } else if (value == 72) {
        text = "HW";
    } else if (value == 70) {
        text = "FCW";
    }

    else {
        text = value;
    }

    return '<div>' + text + '</div>';
}

function valueFormatter(value, row) {

    var text;

    if (row.event == 83 && value == 00) {
        text = "Speed restore";
    } else if (row.event == 83 && value == 01) {
        text = "Speed exceed 0-5 kmh";
    } else if (row.event == 83 && value == 02) {
        text = "Speed exceed 5-10 kmh";
    } else if (row.event == 83 && value == 03) {
        text = "Speed exceed 10-15 kmh";
    } else if (row.event == 83 && value == 04) {
        text = "Speed exceed 15-20 kmh";
    } else if (row.event == 83 && value == 05) {
        text = "Speed exceed 20-25 kmh";
    } else if (row.event == 83 && value == 06) {
        text = "Speed exceed 25-30 kmh";
    } else if (row.event == 83 && value == 07) {
        text = "Speed exceed > 30 kmh";
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

    return '<div>' + value + ' km/h' + '</div>';
}

function BkFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-exclamation-circle fa-lg icon-move"><i>' + '</center></div>';
    } else {
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


// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {


    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment.utc(Singapore.format()).subtract('hours', 0).format('D-MMM-YYYY, hh:mm:ss A');


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

    $.getJSON("http://66.96.208.81/sbswebapi/api/assetinfo", function (data) {

        $.each(data, function (index, item) {

            if (item.Name == "Mobile Eye")

                $('#eventlog').append($('<option></option>').val(item.Name).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });


    $.getJSON("http://66.96.208.81/sbswebapi/api/driverinfo", function (data) {

        $.each(data, function (index, item) {

           if (item.Name == "Demo Driver")

                $('#driverlog').append($('<option></option>').val(item.Name).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });



});







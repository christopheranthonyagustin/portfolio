
var WebApi;


//Trip Data Table
$(document).ready(function () {


    $('#tableFooter').hide();
    $('#chartdivPie').hide();

    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;



    function Generate() {

        $('#tableFooter').show();
        $('#chartdivPie').show();
        var getAsset = $("#eventlog").val(); //the value of the selected option   
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
	    var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);
        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid();

        
        WebApi = "http://66.96.208.81/sbswebapi/api/safetyeventsinfo?Asset=" + getAsset + "&StartTime=" + timestamp + "&EndTime=" + rxtime;
        //alert(WebApi);

        if (getAsset != "") {

            if (validateTimestamp == true && validateRxTime == true) {

                //Data Table
                var table = $("#driverAverage").DataTable({
                    "destroy": true,
                    "responsive": false,
                    "select": true,
                    "colReorder": false,
                    "rowReorder": true,
                    "keys": true,
                    "scrollX": true,
                    //"scrollY": '50vh',
                    "scrollCollapse": true,
                    "paging": true,
                    "pagingType": "full_numbers",
                    "searching": true,
                    "ordering": true,
                    "order": [[0, 'asc']],
                    "info": true,
                    //"stateSave": true,
                    "dom": '<"floatRight"B><"top"l>rti<"bottom"p><"clear">',
                    "language": {
                        "lengthMenu": "Display _MENU_ events per page",
                        "zeroRecords": "Nothing found - sorry",
                        "info": "Showing page _PAGE_ of _PAGES_",
                        "infoEmpty": "No events available",
                        "infoFiltered": "(filtered from _MAX_ total events)"
                    },
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    "buttons": [
                          'copy', 'csv', 'excel', 'pdf', 'print', 'colvis'
                    ],
                    "columns": [
                        { data: "Date", title: "Date", className: 'reorder' },
                        { data: "DriverID", title: "BC No." },
                        { data: "AssetID", title: "Svc. No." },
                        { data: "FCWCount", title: "FCW" },
                        { data: "PCWCount", title: "PCW" },
                        { data: "HMWCount", title: "HMW" },
                        { data: "LDWCount", title: "LDW" },
                        { data: "Total ex LDW", title: "Total ex LDW" },
                        { data: "Total", title: "Total" },
                        { data: "FCWCount", title: "Ave FCW" },
                        { data: "PCWCount", title: "Ave PCW" },
                        { data: "HMWCount", title: "Ave HMW" },
                        { data: "LDWCount", title: "Ave LDW" },
                        { data: "Ave Total less LDW", title: "Ave Total less LDW" },
                        { data: "Ave Total", title: "Ave Total" },
                        { data: "Mileage", title: "Mileage" },
                        { data: "Mileage", title: "Ave FCW/100KM" },
                        { data: "Mileage", title: "Ave PCW/100KM" },
                        { data: "Mileage", title: "Ave HMW/100KM" },
                        { data: "Mileage", title: "Ave LDW/100KM" },
                        { data: "Mileage", title: "Ave Total Alert/100KM Less LDW" },
                        { data: "Mileage", title: "Ave Total Alert/100KM" },
                    ],
                    "ajax": {
                        url: WebApi,
                        type: 'GET',
                        dataType: 'json',
                        dataSrc: ''
                    },
                    "initComplete": function (data, type, row) {

                        var speed = 0;
                        var ldw = 0;
                        var interval = 0;
                        var hw = 0;
                        var fcw = 0;
                        var pdz = 0;
                        var pcw = 0;

                        var api = this.api(), data;

                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ?
                                i : 0;
                        };

                        // Total over all pages
                        fcw = api
                            .column(3)
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);

                        pcw = api
                              .column(4)
                              .data()
                              .reduce(function (a, b) {
                                  return intVal(a) + intVal(b);
                              }, 0);


                        hw = api
                              .column(5)
                              .data()
                              .reduce(function (a, b) {
                                  return intVal(a) + intVal(b);
                              }, 0);


                        ldw = api
                              .column(6)
                              .data()
                              .reduce(function (a, b) {
                                  return intVal(a) + intVal(b);
                              }, 0);


                        var objEvent = {
                            LDW: ldw,
                            HW: hw,
                            FCW: fcw,
                            PCW: pcw,
                        };


                        //Set
                        sessionStorage.setItem("setSessionstorageValueEvent", JSON.stringify(objEvent));
                        drawChart();

                        // Find a <table> element with id="myTable":
                        var driverAveTable = document.getElementById("driverAverage");

                        // Create an empty <tfoot> element and add it to the table:
                        var footer = driverAveTable.createTFoot();

                        // Create an empty <tr> element and add it to the first position of <tfoot>:
                        var row = footer.insertRow(0);

                        // Insert a new cell (<td>) at the first position of the "new" <tr> element:
                        var cell0 = row.insertCell(0);
                        var cell1 = row.insertCell(1);
                        var cell2 = row.insertCell(2);
                        var cell3 = row.insertCell(3);
                        var cell4 = row.insertCell(4);
                        var cell5 = row.insertCell(5);
                        var cell6 = row.insertCell(6);
                        var cell7 = row.insertCell(7);
                        var cell8 = row.insertCell(8);
                        var cell9 = row.insertCell(9);
                        var cell10 = row.insertCell(10);
                        var cell11 = row.insertCell(11);
                        var cell12 = row.insertCell(12);
                        var cell13 = row.insertCell(13);
                        var cell14 = row.insertCell(14);
                        var cell15 = row.insertCell(15);
                        var cell16 = row.insertCell(16);
                        var cell17 = row.insertCell(17);
                        var cell18 = row.insertCell(18);
                        var cell19 = row.insertCell(19);
                        var cell20 = row.insertCell(20);
                        var cell21 = row.insertCell(21);
  
                        // Add some bold text in the new cell:
                        cell0.innerHTML = "<b></b>";
                        cell1.innerHTML = "<b>SBST</b>";
                        cell2.innerHTML = "<b>" + getAsset + "</b>";
                        cell3.innerHTML = "<b>" + fcw + "</b>";
                        cell4.innerHTML = "<b>" + pcw + "</b>";
                        cell5.innerHTML = "<b>" + hw + "</b>";
                        cell6.innerHTML = "<b>" + ldw + "</b>";
                        var totalexldw = fcw + pcw + hw;
                        cell7.innerHTML = "<b>" + totalexldw + "</b>";
                        var total = fcw + pcw + hw + ldw;
                        cell8.innerHTML = "<b>" + total + "</b>";
                        cell9.innerHTML = "<b>" + Math.round(fcw / 12 * 100) / 100 + "</b>";
                        cell10.innerHTML = "<b>" + Math.round(pcw / 12 * 100) / 100 + "</b>";
                        cell11.innerHTML = "<b>" + Math.round(hw / 12 * 100) / 100 + "</b>";
                        cell12.innerHTML = "<b>" + Math.round(ldw / 12 * 100) / 100 + "</b>";
                        var avetotalexldw = fcw / 12 + pcw / 12 + hw / 12;
                        cell13.innerHTML = "<b>" + Math.round(avetotalexldw * 100) / 100 + "</b>";
                        var avetotal = fcw / 12 + pcw / 12 + hw / 12 + ldw /12;
                        cell14.innerHTML = "<b>" + Math.round(avetotal * 100) / 100 + "</b>";
                        cell15.innerHTML = "<b>0</b>";
                        cell16.innerHTML = "<b>0</b>";
                        cell17.innerHTML = "<b>0</b>";
                        cell18.innerHTML = "<b>0</b>";
                        cell19.innerHTML = "<b>0</b>";
                        cell20.innerHTML = "<b>0</b>";
                        cell21.innerHTML = "<b>0</b>";
                        
                    },

                    "columnDefs": [

                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return dateFormatter(data);
                        },
                        "targets": 0
                    },
                    {
                        "targets": 1,
                        "visible": true,
                        "searchable": true
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return data;
                        },
                        "targets": 2
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return fcwFormatter(data, row);
                        },
                        "targets": 3
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return pcwFormatter(data, row);
                        },
                        "targets": 4
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return hwFormatter(data, row);
                        },
                        "targets": 5
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return ldwFormatter(data, row);
                        },
                        "targets": 6
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return totalExLDWFormatter(data, row);
                        },
                        "targets": 7
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return totalFormatter(data, row);
                        },
                        "targets": 8
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return aveEventsFormatter(data, row);
                        },
                        "targets": 9
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return aveEventsFormatter(data, row);
                        },
                        "targets": 10
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return aveEventsFormatter(data, row);
                        },
                        "targets": 11
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return aveEventsFormatter(data, row);
                        },
                        "targets": 12
                    },
                    {
                         // The `data` parameter refers to the data for the cell (defined by the
                         // `data` option, which defaults to the column being worked with, in
                         // this case `data: 0`.
                         "render": function (data, type, row) {
                             return totalLessLDWFormatter(data, row);
                         },
                         "targets": 13
                    },
                    {
                         // The `data` parameter refers to the data for the cell (defined by the
                         // `data` option, which defaults to the column being worked with, in
                         // this case `data: 0`.
                         "render": function (data, type, row) {
                             return avetotalFormatter(data, row);
                         },
                         "targets": 14
                    },
                    ],
                    "footerCallback": function (row, data, start, end, display) {

                        var getTimestamp = $("#dateFrom").val();
                        var getRxTime = $("#dateTo").val();
                        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                        var convertTimestamp = moment(getTimestamp, dateFormat);
                        var convertRxtime = moment(getRxTime, dateFormat);
                        var duration = '<div style="color:#333333">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration</div>';

                        document.getElementById("timeIntervalTripData").innerHTML = duration;
                    }
                });
		        //Buttons
                //table.buttons().container().appendTo($('.col-sm-6:eq(0)', table.table().container()));

                //Multiple Select
                $('#driverAverage tbody').on('click', 'tr', function () {
                    $(this).toggleClass('selected');
                });

                table.on('row-reorder', function (e, diff, edit) {
                    for (var i = 0, ien = diff.length ; i < ien ; i++) {
                        $(diff[i].node).addClass("reordered");
                    }
                });


                // Invoke Buttons plugin (Bfrtip...)
                $.extend($.fn.dataTable.defaults, {
                    "dom": '<"floatRight"B><"top"l>rti<"bottom"p><"clear">',
                    "buttons": [
                          'copy', 'csv', 'excel', 'pdf', 'print', 'colvis'
                    ]
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

function fcwFormatter(value, row) {


    return '<div>' + value + '</div>';
}

function pcwFormatter(value, row) {


    return '<div>' + value + '</div>';
}

function hwFormatter(value, row) {

 
    return '<div>' + value + '</div>';
}

function ldwFormatter(value, row) {


    return '<div>' + value + '</div>';
}

function aveEventsFormatter(value, row) {

    var number = value / 12;
    var roundoff = Math.round(number * 10) / 10;

    return '<div>' + roundoff + '</div>';
}

function totalExLDWFormatter(value, row) {


    var total = row.FCWCount + row.PCWCount + row.HMWCount;

    return '<div>' + total + '</div>';
}

function totalLessLDWFormatter(value, row) {

    var total = row.FCWCount / 12 + row.PCWCount / 12 + row.HMWCount / 12;
    var roundoff = Math.round(total * 10) / 10;
    return '<div>' + roundoff + '</div>';
}

function totalFormatter(value, row) {

    var total = row.FCWCount + row.PCWCount + row.HMWCount + row.LDWCount;

    return '<div>' + total + '</div>';
}

function avetotalFormatter(value, row) {

    var total = row.FCWCount / 12 + row.PCWCount / 12 + row.HMWCount / 12 + row.LDWCount / 12;
    var roundoff = Math.round(total * 10) / 10;
    return '<div>' + roundoff + '</div>';
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


// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {


    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment.utc(Singapore.format()).subtract('hours', 0).format('D-MMM-YYYY');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}

function startTimeFormatter(value, row) {


    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment.utc(Singapore.format()).subtract('hours', 0).format('hh:mm:ss A');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}

function endTimeFormatter(value, row) {


    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('hh:mm:ss A');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}

function numberHoursFormatter(value, row) {

    var dateFormat = "HH:mm:ss A";
    var timestamp = moment(row.Timestamp).subtract('hours', 0).format(dateFormat);
    var rxtime = moment(row.RxTime).add('hours', 8).format(dateFormat);

    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = '<div>' + moment.duration(convertRxtime - convertTimestamp).humanize() + '</div>';

    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + duration + '</span>' + '</div>';

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

                $('#eventlog').append($('<option></option>').val(item.Name).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });


});



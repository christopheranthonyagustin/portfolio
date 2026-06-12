
var WebApi;


//BC Ranking Table
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
    //http://103.237.168.119/sbswebapi/api/bcrankinginfo?DepotID=1&InterchangeID=1&Criteria=LDW&Performance=ASC&LIMIT=5&Timestamp=31-Aug-2016,%2004:00:00%20AM%20&RxTime=1-Sep-2016,%2016:00:00%20PM



    if (changeCheckbox.checked) {

        WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;

    } else {

        WebApi = "http://103.237.168.119/sbswebapi/api/triggerdatainfo?Drv=" + getDriver + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
    }



    $('#tableFooter').hide();
    $('#bcRanking').hide();
    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;

    function Generate() {


        if ($('#chartdivBcRanking').highcharts() != null)
        {
            $('#chartdivBcRanking').highcharts().destroy();
            $('.tableClass').hide();

        }
        else
        {
            $('.tableClass').hide();
        }

        $('.loading').show();
        $('.loader').show();

        $('#tableFooter').show();
        $('#bcRanking').show();
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
        var getSessionstorageValueBCRankSvc = sessionStorage.getItem('setSessionstorageValueBCRankSvc');
 
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);
        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid();

        var getPerformance = $("#performance").val();
        var getBC = $("#bc").val();
        var getCriteria = $("#criteria").val();

        //Filter On/Off 
        if (changeCheckbox.checked)
        {
            // WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;    
            WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }
        else
        {
            //http://103.237.168.119/sbswebapi/api/bcrankinginfo?DepotID=1&InterchangeID=1&SvcNo=166&Criteria=FCW&Performance=DESC&LIMIT=15&Timestamp=31-Aug-2016,%2004:00:00%20PM&RxTime=1-Sep-2016,%2004:00:00%20PM
            WebApi = "http://103.237.168.119/sbswebapi/api/bcrankinginfo?DepotID=" + parseObjDepot + "&InterchangeID=" + parseObjInterchange + "&SvcNo=" + getSessionstorageValueBCRankSvc + "&Criteria=" + getCriteria + "&Performance=" + getPerformance + "&LIMIT=" + getBC + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }


            if (validateTimestamp == true && validateRxTime == true) {

                if (getTimestamp < getRxTime) {

                    //Data Table
                    var table = $("#bcRanking").DataTable({
                        "destroy": true,
                        "responsive": true,
                        "select": true,
                        "rowReorder": true,
                        "keys": true,
                        //"scrollY": '50vh',                      
                        "fixedHeader": {
                            "header": true,
                            "footer": true
                        },
                        "scrollCollapse": true,
                        "paging": false,
                        "pagingType": "full_numbers",
                        "searching": true,
                        "ordering": true,
                        "order": [[0, 'asc']],
                        "info": true,
                        //"stateSave": true,
                        "dom": '<"floatRight"B><"top"l>frti<"bottom"p><"clear">',
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
                            { title: "No." },
                            { data: "DrvNo", title: "Driver No." },
                            { data: "FCW", title: "FCW/100km" },
                            { data: "LDW", title: "LDW/100km" },
                            { data: "HW", title: "HW/100km" },
                            { data: "PCW", title: "PCW/100km" },
                            { data: "TotalLDW", title: "Total Less LDW" },
                            { data: "TotalEvents", title: "Total Events" },
                        ],
                        "ajax": {
                            url: WebApi,
                            type: 'GET',
                            dataType: 'json',
                            dataSrc: ''
                        },
                        "initComplete": function (data, type, row) {

                            $('.dataTables_filter').addClass('pull-left'); //Place search in top left

                            if (type != 0) {

                                localStorage.setItem("setLocalstorageValueWebAPI", WebApi);

                                //Filter Chart in days
                                if (moment.duration(convertRxtime - convertTimestamp) <= moment.duration(4, 'days')) {
                                    console.log('more than 4 days');
                                }

                                drawChart(JSON.stringify(type));

                                $('.tableClass').show();
                                $('.loading').hide();
                                $('.loader').hide();
                            }
                            else {
                                $('.tableClass').hide();
                                $('.loading').hide();
                                $('.loader').hide();
                                alert('No Data Found');
                            }


                        },

                        "columnDefs": [
                        {
                            "defaultContent": "-",
                            "targets": "_all"
                        },{
                            "targets": 1,
                            "visible": true,
                            "searchable": true
                        }, {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return fcwFormatter(data);
                            },
                            "targets": 2,
                            "visible": true,
                            "searchable": true
                        }, {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return ldwFormatter(data);
                            },
                            "targets": 3,
                            "visible": true,
                            "searchable": true
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return hwFormatter(data);
                            },
                            "targets": 4,
                            "visible": true,
                            "searchable": true
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return pcwFormatter(data);
                            },
                            "targets": 5,
                            "visible": true,
                            "searchable": true
                        },
                         {
                             // The `data` parameter refers to the data for the cell (defined by the
                             // `data` option, which defaults to the column being worked with, in
                             // this case `data: 0`.
                             "render": function (data, type, row) {
                                 return totalldwFormatter(data);
                             },
                             "targets": 6,
                             "visible": true,
                             "searchable": true
                         },
                          {
                              // The `data` parameter refers to the data for the cell (defined by the
                              // `data` option, which defaults to the column being worked with, in
                              // this case `data: 0`.
                              "render": function (data, type, row) {
                                  return totaleventsFormatter(data);
                              },
                              "targets": 7,
                              "visible": true,
                              "searchable": true
                          },
                        ],
                        "footerCallback": function (row, data, start, end, display) {

                            var getTimestamp = $("#dateFrom").val();
                            var getRxTime = $("#dateTo").val();
                            var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                            var convertTimestamp = moment(getTimestamp, dateFormat);
                            var convertRxtime = moment(getRxTime, dateFormat);
                            var duration = '<div style="color:#333333">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration</div>';

                            document.getElementById("timeIntervalBcRanking").innerHTML = duration;
                        }
                    });

                    //Add Counting Numbers
                    table.on('order.dt search.dt', function () {
                        table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                            cell.innerHTML = i + 1;
                        });
                    }).draw();

                    //Multiple Select
                    $('#bcRanking tbody').on('click', 'tr', function () {
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
                else
                {
                    $('.tableClass').hide();
                    $('.loading').hide();
                    $('.loader').hide();
                    alert('Date Invalid');
                }
            }
            else
            {
                $('.tableClass').hide();
                $('.loading').hide();
                $('.loader').hide();
                alert('Date Invalid');
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


function fcwFormatter(value) {

    return '<div>' + value + '</div>';
}


function ldwFormatter(value) {

    return '<div>' + value + '</div>';
}

function hwFormatter(value) {

    return '<div>' + value + '</div>';
}

function pcwFormatter(value) {

    return '<div>' + value + '</div>';
}

function totalldwFormatter(value) {

    return '<div>' + value + '</div>';
}

function totaleventsFormatter(value) {

    return '<div>' + value + '</div>';
}


$(function () {

    $.getJSON("http://103.237.168.119/sbswebapi/api/depotinfo", function (data) {

        $.each(data, function (index, item) {
            $('#depot').append($('<option></option>').val(item.DepotID).html(item.Name));
            
        });

        $('.selectpicker').selectpicker('refresh');
        $('.loading').hide();
        $('.loader').hide();
    });


    var selectedDepot = "";
    $('.SelectDepotFilter').on('change', function () {

        if ($('#bcRanking').highcharts() != null)
        {
            $('#bcRanking').highcharts().destroy();
            $('.tableClass').hide();

        }

        $('.loading').show();
        $('.loader').show();
        selectedDepot2 = $(this).find("option:selected").val;
        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null)
        {
            $('#interchange').empty();
            $('#svc').empty();
            $('#driver').empty();


            $('.loading').hide();
            $('.loader').hide();
            $('.selectpicker').selectpicker('refresh');
        }
        else
        {
            $('#interchange').empty();

            $.getJSON("http://103.237.168.119/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

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

        if ($('#chartdivBcRanking').highcharts() != null) {
            $('#chartdivBcRanking').highcharts().destroy();
            $('.tableClass').hide();

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

            $.getJSON("http://103.237.168.119/sbswebapi/api/svcinfo?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange, function (data) {

                $.each(data, function (index, item) {
                    $('#svc').append($('<option></option>').val(item.SvcNo).html(item.SvcNo));

                });

                $('.selectpicker').selectpicker('refresh');

            });

            $('#driver').empty();
            //http://103.237.168.119/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016         
            $.getJSON("http://103.237.168.119/sbswebapi/api/scsarchiveinfoex?Depot=" + parseObjDepot + "&Interchange=" + arrSelectedInterchange + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime, function (data) {

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

        if ($('#chartdivBcRanking').highcharts() != null) {
            $('#chartdivBcRanking').highcharts().destroy();
        }

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {
            //Filter SVC
            if ($(this).hasClass("label-success")) {
                arrSelected.push($(this).val());
            }

        });

        sessionStorage.setItem('setSessionstorageValueBCRankSvc', arrSelected);


    });

});
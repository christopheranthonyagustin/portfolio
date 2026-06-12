var map;
var markers = new Array();
var marker;
var infoBoxList = [];
var assets = [];
var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&' + 'chco=FFFFFF,008CFF,000000&ext=.png';
var markerImage = new google.maps.MarkerImage(imageUrl, new google.maps.Size(24, 32));
var contentString;
var WebApi;

$(document).ready(function () {

   // $('#assetForm').hide();

    //On Load
    var gatReports = $('#getReports').val();

    if (gatReports == "Data Error") {
        $('#assetForm').hide();
    }
    else if (gatReports == "Footbrake Usage") {
        $('#assetForm').hide();
    }
    else if (gatReports == "Direction Light Usage") {
        $('#assetForm').hide();
    }
    else if (gatReports == "") {
        $('#assetForm').hide();
    }


});

$(document).ready(function () {

    // On Change
   $('#getReports').change(function () {
       var selected = $(this).find("option:selected").val();

       //alert(selected);
       if (selected == "Data Error") {
           $('#assetForm').hide();
       }
       else if (selected == "Footbrake Usage") {
           $('#assetForm').hide();
       }
       else if (selected == "Direction Light Usage") {
           $('#assetForm').hide();
       }
       else if (selected == "") {
           $('#assetForm').hide();
       }
    });

});


//Report Table
$(document).ready(function () {

    var getAsset = $("#getAssets").val(); //the value of the selected option   
    var getTimestamp = $("#dateFrom").val();
    var getRxTime = $("#dateTo").val();
    var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
    var convertTimestamp = moment(getTimestamp, dateFormat);
    var convertRxtime = moment(getRxTime, dateFormat);
    var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
    var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);



    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;



    function Generate() {

        var reports = $('#getReports').val();
        var getAsset = $("#getAssets").val(); //the value of the selected option   
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
	    var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);
        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid();

        WebApi = 'http://172.16.10.110/sbswebapi/api/assetinfo';

        //alert(WebApi);

        if (validateTimestamp == true && validateRxTime == true) {


            if (reports == "Data Error") {

                //Data Table
                var table = $("#DataError").DataTable({
                    "destroy": true,
                    "responsive": true,
                    "select": true,
                    "colReorder": false,
                    "rowReorder": true,
                    "keys": true,
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
                        { data: "Name", title: "License Plate" },
                        { data: "Tag", title: "Device" },
                        { data: "LastPos.Timestamp", title: "Timestamp", className: 'reorder' },
                        { data: "LastPos.RxTime", title: "Last Saving Time", className: 'reorder' },
                        { data: "DownTime", title: "Down Time" },      
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

                        for (var i = 0; i < type.length; ++i) {
                            if (type[i].LastPos.Event == "83") {
                                speed++;
                            } else if (type[i].LastPos.Event == "76") {
                                ldw++;
                            } else if (type[i].LastPos.Event == "73") {
                                interval++;
                            } else if (type[i].LastPos.Event == "72") {
                                hw++;
                            } else if (type[i].LastPos.Event == "70") {
                                fcw++;
                            } else if (type[i].LastPos.Event == "68") {
                                pdz++;
                            }

                        }

                        var objEvent = {
                            Speed: speed,
                            LDW: ldw,
                            Interval: interval,
                            HW: hw,
                            FCW: fcw,
                            PDZ: pdz,
                        };


                        //Set
                        sessionStorage.setItem("setSessionstorageValueEvent", JSON.stringify(objEvent));

                        drawChart();
                        AutoRefresh();
                        initialize();

                    },
                    "columnDefs": [
                    {
                        "targets": 0,
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
                       "targets": 1
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return dateFormatter(data);
                        },
                        "targets": 2
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return dateFormatter(data);
                        },
                        "targets": 3
                    },
                    {
                        // The `data` parameter refers to the data for the cell (defined by the
                        // `data` option, which defaults to the column being worked with, in
                        // this case `data: 0`.
                        "render": function (data, type, row) {
                            return downtimeFormatter(data, row);
                        },
                       "targets": 4
                    }            
                    ],
                    "footerCallback": function (row, data, start, end, display) {

                        var getTimestamp = $("#dateFrom").val();
                        var getRxTime = $("#dateTo").val();
                        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                        var convertTimestamp = moment(getTimestamp, dateFormat);
                        var convertRxtime = moment(getRxTime, dateFormat);
                        var duration = '<div style="color:#333333">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration</div>';

                        document.getElementById("timeIntervalDataError").innerHTML = duration;
                    }
                });
                
            }




        }
        else {

            alert('Date Invalid');
        }


    }
});

function initialize() {
    var center = new google.maps.LatLng(1.3000, 103.8000);

    var mapTypeIds = ["SEA", "OSMBW", "PublicTransport", "Skobbler", "MapQuest", "OpenCycleMap", "OCMTransport-D", "OCMTransport-L", "OCMLandscape", "OCMOutdoor"];
    for (var type in google.maps.MapTypeId) {
        mapTypeIds.push(google.maps.MapTypeId[type]);
    }
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: center,
        mapTypeControl: false,

        mapTypeId: "SEA",

        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            //style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
            mapTypeIds: mapTypeIds,
            position: google.maps.ControlPosition.TOP_LEFT
        },
    });

    LayersEN();

    setMarkers(map, assets, handleAssets);

}

function setMarkers(map, assets, callback) {

    $.getJSON(WebApi, function (assets) {

        callback(assets);

    });


}

function handleAssets(assets) {

    for (var i = 0; i < assets.length; i++) {
        var asset = assets[i];
        if (assets.indexOf(i) !== -1) continue;
        if (asset.LastPos.PosX == 0) continue;
        if (asset.LastPos.PosY == 0) continue;

        var getDownTimeDuration = downtimeDurationFormatter(asset.LastPos.Timestamp);

        var myLatLng = new google.maps.LatLng(parseFloat(asset.LastPos.PosY), parseFloat(asset.LastPos.PosX));
        var marker = new google.maps.Marker({
            position: myLatLng,
            icon: markerImage,
            title: asset.Name
        });

        markers.push(marker);

        var assetTimestamp = asset.LastPos.Timestamp;

        //Convert Timezone
        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
        var Singapore = moment.tz(assetTimestamp, Asia);
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');

        contentString = '<div id="content">' +
                        '<h5 class="text-primary"><strong>' + asset.Name + '</strong></h5>' +
                        '<strong>Timestamp: </strong>' + timestamp +
                        '<br />' +
                        '<strong>Down Time: </strong>' + getDownTimeDuration +
                        '</div>';

        setInfoBubble(marker, asset);

    }

    var markerCluster = new MarkerClusterer(map, markers);


}

function setInfoBubble(marker, asset) {

    var infoBubble = new InfoBubble({
        minWidth: 225,
        minHeight: 100,
        map: map,
        content: contentString,
        shadowStyle: 1,
        borderRadius: 4,
        arrowSize: 15,
        borderWidth: 1,
        disableAutoPan: false,
        hideCloseButton: false,
        arrowPosition: 30,
        arrowStyle: 2,
    });

    infoBoxList.push(infoBubble);

    marker.addListener('click', function () {
        infoBubble.open(marker.get('map'), marker);
    });
}

function AutoRefresh() {


    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];

    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];


}

function LayersEN() {

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

function downtimeFormatter(value, row) {


    var dateFormat = "D-MMM-YYYY, HH:mm:ss A";
    var timestamp = moment(row.LastPos.RxTime).format(dateFormat);
    var rxtime = moment().format(dateFormat);

    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = '<div>' + moment.duration(convertRxtime - convertTimestamp).humanize() + '</div>';

    return '<div>' + duration + '</div>';

}

function downtimeDurationFormatter(value) {


    var dateFormat = "D-MMM-YYYY, HH:mm:ss A";
    var timestamp = moment(value).format(dateFormat);
    var rxtime = moment().format(dateFormat);

    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = moment.duration(convertRxtime - convertTimestamp).humanize();

    return duration;

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

    $.getJSON("http://172.16.10.110/sbswebapi/api/assetinfo", function (data) {

        $.each(data, function (index, item) {

            if (item.Name == "Mobile Eye" || item.Name == "00002" || item.Name == "00003" || item.Name == "00099" || item.Name == "SBS3277A" || item.Name == "SBS3849A" || item.Name == "SBS6670C" || item.Name == "SBS3803G" || item.Name == "SBS3885U" || item.Name == "SBS6010H" || item.Name == "SBS6011E" || item.Name == "SBS6671A" || item.Name == "SBS6613T" || item.Name == "SBS3822B")

                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });


});







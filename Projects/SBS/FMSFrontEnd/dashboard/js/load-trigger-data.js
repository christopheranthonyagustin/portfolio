var map;
var markers = new Array();
var marker;
var infoBoxList = [];
var assets = [];
var contentString;
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

        WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;

    } else {

        WebApi = "http://103.237.168.119/sbswebapi/api/triggerdatainfo?Drv=" + getDriver + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
    }



    $('#tableFooter').hide();
    $('#chartdivPie').hide();
    //Click Refresh
    document.getElementById("submitReport").onclick = Generate;

    function Generate() {


        if ($('#chartdivPie').highcharts() != null)
        {
            $('#chartdivPie').highcharts().destroy();
            $('#map').hide();
            $('.tableClass').hide();

        }
        else
        {
            $('.tableClass').hide();
        }

        $('.loading').show();
        $('.loader').show();

        $('#tableFooter').show();
        $('#chartdivPie').show();
        var getAsset = $("#vehicle").val(); //the value of the selected option   
        var getDriver = $("#driver").val();
        var getSvc = $("#svc").val();

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
            // WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;    
            WebApi = "http://103.237.168.119/sbswebapi/api/posinfo?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }
        else
        {
            //WebApi = "http://103.237.168.119/sbswebapi/api/posinfoex?Asset=" + getAsset + "&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;    
            WebApi = "http://103.237.168.119/sbswebapi/api/triggerdatainfo?Drv=" + getDriver + "&Speed=&CompanyID=1&Timestamp=" + timestamp + "&RxTime=" + rxtime;
        }


        if (typeof (getDriver) !== "undefined" && getDriver !== null) {


            if (validateTimestamp == true && validateRxTime == true) {


                if (getTimestamp < getRxTime) {

                    //Data Table
                    var table = $("#triggerData").DataTable({
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
                            { data: "DrvNo", title: "Driver No." },
                            { data: "Timestamp", title: "Timestamp", className: 'reorder' },
                            { data: "Speed", title: "Speed", "width": "110px" },
                            { data: "Headway", title: "Headway", "width": "120px" },
                            { data: "Event", title: "Event" },
                            { data: "EventValue", title: "Event Value" },
                        ],
                        "ajax": {
                            url: WebApi,
                            type: 'GET',
                            dataType: 'json',
                            dataSrc: ''
                        },
                        "initComplete": function (data, type, row) {

                            if (type != 0) {

                                var speed = 0;
                                var ldw = 0;
                                var interval = 0;
                                var hw = 0;
                                var fcw = 0;
                                var pdz = 0;
                                var pcw = 0;

                                for (var i = 0; i < type.length; ++i) {
                                    if (type[i].Event == "83") {
                                        speed++;
                                    } else if (type[i].Event == "76") {
                                        ldw++;
                                    } else if (type[i].Event == "73") {
                                        interval++;
                                    } else if (type[i].Event == "72") {
                                        hw++;
                                    } else if (type[i].Event == "70") {
                                        fcw++;
                                    } else if (type[i].Event == "68") {
                                        pdz++;
                                    } else if (type[i].Event == "80") {
                                        pcw++;
                                    }

                                }

                                var objEvent = {
                                    Speed: speed,
                                    LDW: ldw,
                                    Interval: interval,
                                    HW: hw,
                                    FCW: fcw,
                                    PDZ: pdz,
                                    PCW: pcw,
                                };


                                //Set
                                //localStorage.setItem("setLocalstorageValueMap", JSON.stringify(type));
                                localStorage.setItem("setLocalstorageValueWebAPI", WebApi);

                                if (moment.duration(convertRxtime - convertTimestamp) <= moment.duration(8, 'days')) {
                                    drawChart(JSON.stringify(objEvent));
                                }
                               
                                                          
                                if (moment.duration(convertRxtime - convertTimestamp) <= moment.duration(24, 'hours') && getSvc.length == 1) {
                                    $('#map').show();
                                    AutoRefresh();
                                    initialize(type);
                                }

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
                            "targets": 0,
                            "visible": true,
                            "searchable": true
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return dateFormatter(data);
                            },
                            "targets": 1
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return speedFormatter(data);
                            },
                            "targets": 2,
                            "orderable": false
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return hwFormatter(data);
                            },
                            "targets": 3,
                            "orderable": false
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return eventFormatter(data);
                            },
                            "type": "html",
                            "targets": 4,
                            "visible": false,
                            "orderable": false
                        },
                        {
                            // The `data` parameter refers to the data for the cell (defined by the
                            // `data` option, which defaults to the column being worked with, in
                            // this case `data: 0`.
                            "render": function (data, type, row) {
                                return valueFormatter(data, row);
                            },
                            "targets": 5,
                            "orderable": false
                        }
                        ],
                        "footerCallback": function (row, data, start, end, display) {

                            var getTimestamp = $("#dateFrom").val();
                            var getRxTime = $("#dateTo").val();
                            var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                            var convertTimestamp = moment(getTimestamp, dateFormat);
                            var convertRxtime = moment(getRxTime, dateFormat);
                            var duration = '<div style="color:#333333">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration</div>';

                            document.getElementById("timeIntervalTriggerData").innerHTML = duration;
                        }
                    });

                    //Buttons
                    //table.buttons().container().appendTo($('.col-sm-6:eq(0)', table.table().container()));

                    //Multiple Select
                    $('#triggerData tbody').on('click', 'tr', function () {
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


                    // Setup - add a text input to each footer cell
                    $('#triggerData thead th').each(function () {
                        var title = $(this).text();

                        if (title == "Speed") {
                            $(this).html('Speed<br />From:&nbsp; <input class="form-control" type="text" style="color:black;" placeholder="Min ' + title + '" id="min"/> <br/>To: <input class="form-control" type="text" style="color:black;" placeholder="Max ' + title + '" id="max"/>');
                        }
                        else if (title == "Headway") {
                            $(this).html('Headway<br />From:&nbsp; <input class="form-control" type="text" style="color:black;" placeholder="Min ' + title + '" id="minHeadway"/> <br/>To: <input class="form-control" type="text" style="color:black;" placeholder="Max ' + title + '" id="maxHeadway"/>');
                        }
                        else if (title == "Event") {
                            $(this).html('Search Event:&nbsp; <input class="form-control" type="text" style="color:black;" placeholder="Search ' + title + '"/>');
                        }
                        else if (title == "Event Value") {
                            $(this).html('Event Value&nbsp;<br /> <select id="eventvalue" multiple="multiple" class="form-control" type="text" style="color:black;">' +
                                //'<option value="">ALL</option>' +
                                //'<option>Normal time interval logging</option>' +
                                //'<option>Tamper alert</option>' +
                                //'<option>Maintenance error</option>' +
                                //'<option>Pedestrian in danger zone</option>' +
                                '<option value="Pedestrian forward collision warning">Pedestrian forward collision warning</option>' +
                                '<option value="Right lane departure">Right lane departure</option>' +
                                '<option value="Left lane departure">Left lane departure</option>' +
                                '<option value="Forward collision warning">Forward collision warning</option>' +
                                //'<option>No vehicle detected</option>' +
                                '<option value="Head way distance < or 0.6 sec">HW distance < configure distance or 0.6 sec</option>' +
                                '<option value="Head way distance > configure distance">HW distance > configure distance</option>' +
                                //'<option>Speed exceed > 30 km/h</option>' +
                                //'<option>Speed exceed 25-30 km/h</option>' +
                                //'<option>Speed exceed 20-25 km/h</option>' +
                                //'<option>Speed exceed 15-20 km/h</option>' +
                                //'<option>Speed exceed 10-15 km/h</option>' +
                                //'<option>Speed exceed 5-10 km/h</option>' +
                                '<select>');
                        }

                    });


                    $('#eventvalue').multiselect({
                        includeSelectAllOption: true,
                        buttonText: function (options) {
                            if (options.length == 0) {
                                return 'Nothing selected';
                            } else {
                                var selected = 0;
                                options.each(function () {
                                    selected += 1;
                                });
                                return selected + ' Selected';
                            }
                        }
                    });


                    $.fn.dataTable.ext.search.push(
                        function (settings, data, dataIndex) {
                            var min = parseInt($('#min').val(), 10);
                            var max = parseInt($('#max').val(), 10);
                            var speed = parseFloat(data[2]) || 0; // use data for the speed column

                            if ((isNaN(min) && isNaN(max)) ||
                                 (isNaN(min) && speed <= max) ||
                                 (min <= speed && isNaN(max)) ||
                                 (min <= speed && speed <= max)) {
                                return true;
                            }


                            return false;
                        }
                    );

                    // Event listener to the two range filtering inputs to redraw on input
                    $('#min, #max').keyup(function () {
                        table.draw();
                    });

                    $.fn.dataTable.ext.search.push(
                        function (settings, data, dataIndex) {

                            var minHeadway = parseInt($('#minHeadway').val(), 10);
                            var maxHeadway = parseInt($('#maxHeadway').val(), 10);
                            var headway = parseFloat(data[3]) || 0; // use data for the headway column

                            if ((isNaN(minHeadway) && isNaN(maxHeadway)) ||
                                 (isNaN(minHeadway) && headway <= maxHeadway) ||
                                 (minHeadway <= headway && isNaN(maxHeadway)) ||
                                 (minHeadway <= headway && headway <= maxHeadway)) {
                                return true;
                            }


                            return false;
                        }
                    );

                    $('#minHeadway, #maxHeadway').keyup(function () {
                        table.draw();
                    });


                    $('#event').on('keyup change', function () {
                        if (this.search() !== this.value) {

                            table.search(this.value)
                            table.draw();
                        }
                    });

                    // Apply the filter - Search Box
                    $("#triggerData thead input").on('keyup change', function () {

                        if (this.placeholder == "Search Event") {
                            table
                             .column($(this).parent().index() + ':visible')
                             .search(this.value)
                             .draw();
                        }

                    });

                    // Apply the filter - Dropdown
                    $("#triggerData thead select").on('change', function () {

                        selectedEvent = $(this).find("option:selected");
                        var arrSelected = [];
                        selectedEvent.each(function () {
                            arrSelected.push($(this).val());
                        });

                        var arrToString = arrSelected.toString();
                        var parseString = arrToString.replace(/,/g, "|");

                        var query = "";
                        if (parseString == "")
                            query = "";                       
                        else
                            query = "((  )|^)" + parseString + "((  )|$)";
                                           
                        //console.log(parseString);
                        //  .search('Forward collision warning|Head way distance > configure distance', true, false) - Apply multiple search in frontend
                        table
                        //.column($(this).parent().index() + ':visible')
                        .search(query, true, false)
                        .draw();

                        function regex_escape(text) {
                            return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
                        }

                       
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

        } else {

            $('.tableClass').hide();
            $('.loading').hide();
            $('.loader').hide();
            alert('You must select Driver');
        }
    }

});

function initialize(assets) {
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
            mapTypeIds: mapTypeIds,
            position: google.maps.ControlPosition.TOP_LEFT
        },
    });

   
    LayersEN();

    handleAssets(assets);

}


function handleAssets(assets) {

   // var bounds = new google.maps.LatLngBounds();

    for (var i = 0; i < assets.length; i++) {
        var asset = assets[i];
        if (assets.indexOf(i) !== -1) continue;
        if (assets.PosX == 0) continue;
        if (assets.PosY == 0) continue;
        if (asset.Event == 83 || asset.Event == 68 || asset.Event == 77 || asset.Event == 84 || asset.Event == 73) continue;
        var getEvent = eventFormatter(asset.Event);

        //Tools to generate different marker colors
        //var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&' + 'chco=FFFFFF,' + icon + ',000000&ext=.png';

        var imageUrl = 'img/markers/' + getEvent + '.png';
        var markerImage = new google.maps.MarkerImage(imageUrl, new google.maps.Size(24, 32));

        var myLatLng = new google.maps.LatLng(parseFloat(asset.PosY), parseFloat(asset.PosX));
        var marker = new google.maps.Marker({
            position: myLatLng,
            icon: markerImage,
            title: asset.Asset
        });


        markers.push(marker);

        var assetTimestamp = asset.Timestamp;

        //Convert Timezone
        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
        var Singapore = moment.tz(assetTimestamp, Asia);
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');

        contentString = '<div id="content">' +
                        '<h5 class="text-primary"><strong>' + asset.Asset + '</strong></h5>' +
                        '<strong>Event: </strong>' + getEvent +
                        '<br />' +
                        '<strong>Speed: </strong>' + asset.Speed + ' km/h' +
                        '<br />' +
                        '<strong>Timestamp: </strong>' + timestamp +
                        '</p>' +
                        '</div>';

        setInfoBubble(marker, asset);

    }

    var markerCluster = new MarkerClusterer(map, markers, {
        maxZoom: 13,
        zoomOnClick: true
    });


}

function setInfoBubble(marker, asset) {

    var infoBubble = new InfoBubble({
        minWidth: 225,
        minHeight: 115,
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

    EnlargeMap();

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

function EnlargeMap() {

    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
                 .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Enlarge Map');
    $(controlDiv).append(controlUI);


    google.maps.event.addDomListener(controlUI, 'click', function () {
     
        var win = window.open('map.html', '_blank');
        if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }

    });

    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlDiv);

    //Traffic Layer - On
    //End
    /*=================================================*/

}

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

        if ($('#chartdivPie').highcharts() != null)
        {
            $('#chartdivPie').highcharts().destroy();
            $('#map').hide();
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

        if ($('#chartdivPie').highcharts() != null) {
            $('#chartdivPie').highcharts().destroy();
            $('#map').hide();
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

        if ($('#chartdivPie').highcharts() != null) {
            $('#chartdivPie').highcharts().destroy();
            $('#map').hide();
            $('.tableClass').hide();

        }

        $('.loading').show();
        $('.loader').show();

        selectedSvc = $(this).find("option:selected");
        var arrSelected = [];
        selectedSvc.each(function () {
            //Filter SVC
            if ($(this).hasClass("label-success")) {              
                arrSelected.push($(this).val());
            }
            

        });

        var getDepot = $('#depot').val();
        var getInterchange = $('#interchange').val();

        var getOPDateStart = $('#dateFrom').val();
        var convertTimestamp = moment(getOPDateStart, dateFormat);
        var timestamp = moment.utc(convertTimestamp).add('hours', 8).format('D-MMM-YYYY');

        var getOPDateEnd = $('#dateTo').val();
        var convertRxTime = moment(getOPDateEnd, dateFormat);
        var rxtime = moment.utc(convertRxTime).add('hours', 8).format('D-MMM-YYYY');

        if (arrSelected == "" || arrSelected == null)
        {
            $('#driver').empty();
            $('.selectpicker').selectpicker('refresh');

            $('.loading').hide();
            $('.loader').hide();
        }
        else
        {

            $('#driver').empty();
            //http://103.237.168.119/sbswebapi/api/scsarchiveinfo?Depot=1,2&Interchange=1,2&Interchange=1&OP_DATE_START=01-Sep-2016&OP_DATE_END=05-Sep-2016
            var WebAPISvc = "http://track.asiacom.co.th/sbswebapi/api/scsarchiveinfo?Depot=" + getDepot + "&Interchange=" + getInterchange + "&SVC_NO=" + arrSelected + "&OP_DATE_START=" + timestamp + "&OP_DATE_END=" + rxtime;

            $.getJSON(WebAPISvc, function (data) {


                $.each(data, function (index, item) {
                    $('#driver').append($('<option></option>').val(item.DRV_NO).html(item.DRV_NO));
                });

                //Remove Duplicate values
                //$(".SelectBCFilter option").each(function () {
                //    $(this).siblings("[value='" + this.value + "']").remove();
                //});


                $('.selectpicker').selectpicker('refresh');

                $('.loading').hide();
                $('.loader').hide();

            });
        }




    });

    var selectedDriver = "";
    $('.SelectBCFilter').on('change', function () {

        if ($('#chartdivPie').highcharts() != null) {
            $('#chartdivPie').highcharts().destroy();
            $('#map').hide();
            $('.tableClass').hide();

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
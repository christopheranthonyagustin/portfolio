
function initialize() {

    var latlng = new google.maps.LatLng(1.3000, 103.8000);

    var mapTypeIds = ["OSM", "SEA", "OSMBW", "PublicTransport", "Skobbler", "MapQuest", "OpenCycleMap", "OCMTransport-D", "OCMTransport-L", "OCMLandscape", "OCMOutdoor"];
    for (var type in google.maps.MapTypeId) {
        mapTypeIds.push(google.maps.MapTypeId[type]);
    }
 

    var mapOptions = {
        zoom: 12,
        center: latlng,


        panControl: false,
        zoomControl: false,


        mapTypeControl: true,

        mapTypeId: "OSM",

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


    var map = new google.maps.Map(document.getElementById('map-canvas'),
                                mapOptions);

     
    //Transit Layer - off
    //Start
    /*=================================================*/
    //var transitLayer = new google.maps.TransitLayer();
    //transitLayer.setMap(map);
    /*=================================================*/
    //End


    //Traffic Layer - On
    //Start
    /*=================================================*/
    var controlDiv = document.createElement('DIV');
    $(controlDiv).addClass('gmap-control-container')
                 .addClass('gmnoprint');

    var controlUI = document.createElement('DIV');
    $(controlUI).addClass('gmap-control');
    $(controlUI).text('Traffic');
    $(controlDiv).append(controlUI);

    var legend = '<ul>'
               + '<li><span style="background-color: #30ac3e">&nbsp;&nbsp;</span><span style="color: #30ac3e"> &gt; 80 km per hour</span></li>'
               + '<li><span style="background-color: #ffcf00">&nbsp;&nbsp;</span><span style="color: #ffcf00"> 40 - 80 km per hour</span></li>'
               + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> &lt; 40 km per hour</span></li>'
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

  
    //Open Street Map Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("OSM", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://tile.openstreetmap.org/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "Standard",
        alt: "Show Open Street Map",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    //SEA Layer - On
    /*=================================================*/
    //Start

    map.mapTypes.set("SEA", new google.maps.ImageMapType({
        getTileUrl: function (coord, zoom) {
            return "http://a.tile.osm-tools.org/osm_then/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "SEA",
        alt: "Show SEA",
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
        name: "Black & White",
        alt: "Show OSM Map Black & White",
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
        name: "Public",
        alt: "Show Public Transport",
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
        name: "Skobbler",
        alt: "Show Skobbler Map",
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
        name: "Map Quest",
        alt: "Show Map Quest-OSM",
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
        name: "Open Cycle",
        alt: "Show Open Cycle Map",
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
        name: "Dark",
        alt: "Show Open Cycle Transport Map",
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
        name: "Light",
        alt: "Show Open Cycle Transport Map",
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
        name: "Landscape",
        alt: "Show Landscape Map",
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
        name: "Outdoor",
        alt: "Show Outdoor Map",
        maxZoom: 20

    }));

    //End
    /*=================================================*/


    marker(map, vehicles);

    map.setTilt(45);
    map.setHeading(90); 


}


/**
* Data for the markers consisting of a name, a LatLng and a zIndex for
* the order in which these markers should display on top of each
* other.
*/
var vehicles = [
  ['Lorong Ah Soo', 1.3000, 103.8000, 4],
  ['31 Admiralty Road', 1.3000, 103.8564, 5],
  ['30 Tuas Avenue 9', 1.3580, 103.8652, 3],
  ['35 Sungei Kadut Street 1', 1.3960, 103.8632, 2],
  ['Pasir Ris', 1.3724, 103.9494, 1]
];

function marker(map, locations) {

    //Searchbox
    /*=================================================*/
    //Start
    // Create the search box and link it to the UI element.
    var input = /** @type {HTMLInputElement} */(
        document.getElementById('pac-input'));
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);

    //End
    /*=================================================*/

    // Add markers to the map

    // Marker sizes are expressed as a Size of X,Y
    // where the origin of the image (0,0) is located
    // in the top left of the image.

    // Origins, anchor positions and coordinates of the marker
    // increase in the X direction to the right and in
    // the Y direction down.
    var image = {
        url: 'img/move.png',
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(28, 32),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(0, 32)
    };
    // Shapes define the clickable region of the icon.
    // The type defines an HTML &lt;area&gt; element 'poly' which
    // traces out a polygon as a series of X,Y points. The final
    // coordinate closes the poly by connecting to the first
    // coordinate.
    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly'
    };


    for (var i = 0; i < locations.length; i++) {
        var vehicle = locations[i];
        var myLatLng = new google.maps.LatLng(vehicle[1], vehicle[2]);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            animation: google.maps.Animation.DROP,
            icon: image,
            shape: shape,
            title: vehicle[0],
            zIndex: vehicle[3]
        });



        //Marker Details
        /*=================================================*/
        //Start
        var contentString = '<div id="content">' +
         '<div id="siteNotice">' +
         '</div>' +
         '<h4 id="firstHeading" class="firstHeading">Test</h4>' +
         '<div id="bodyContent">' +
         '<p>This is a test ' +
         '</div>' +
         '</div>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });


        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
            maxWidth: 200
        });
        //End
        /*=================================================*/


    }
}


//Marker Animations
/*=================================================*/
//Start
function toggleBounce() {

    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}
//End
/*=================================================*/


//Marker Autorotate
/*=================================================*/
//Start
function autoRotate() {
    // Determine if we're showing aerial imagery
    if (map.getTilt() != 0) {
        map.setHeading(180);
        setTimeout('map.setHeading(270)', 3000);
        setTimeout('map.setHeading(0)', 6000);
        setTimeout('map.setHeading(90)', 9000);
    }
}

//End
/*=================================================*/


google.maps.event.addDomListener(window, 'load', initialize);

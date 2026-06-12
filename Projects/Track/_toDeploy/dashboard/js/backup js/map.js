
function initialize() {
    var mapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(1.3000, 103.8000)
    }
    var map = new google.maps.Map(document.getElementById('map-canvas'),
                                mapOptions);

    setMarkers(map, vehicles);


    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, setMarkers);
    });
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

function setMarkers(map, locations) {
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
            icon: image,
            shape: shape,
            title: vehicle[0],
            zIndex: vehicle[3]
        });
    }
}

google.maps.event.addDomListener(window, 'load', initialize);
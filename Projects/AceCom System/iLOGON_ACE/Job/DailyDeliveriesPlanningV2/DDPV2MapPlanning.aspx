<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2MapPlanning.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2MapPlanning" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MapPlanning @ DailyDeliveriesPlanning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="FromDateLbl" runat="server" Text="Delivery Date" />
                    <br />
                    <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                    <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDatePicker_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="FromDateNextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <span>Filter Veh no</span>
                    <br />
                    <input type="text" runat="server" clientidmode="Static" id="MPFilterVehNoCB_value" style="display: none" />
                    <telerik:RadComboBox runat="server" ID="MPFilterVehNoCB" OnLoad="MPVehNoCB_Load" RenderMode="Lightweight"
                        DataTextField="descr" DataValueField="item" Skin="WebBlue" Width="140px" AutoPostBack="true" Height="200px" AllowCustomText="true"
                        HighlightTemplatedItems="true" Filter="Contains" OnClientSelectedIndexChanged="MPFilterVehNoCB_IndexChanged" OnSelectedIndexChanged="MPFilterVehNoCB_SelectedIndexChanged">
                    </telerik:RadComboBox>
                </td>
                <td>
                    <br />
                    <br />
                    &nbsp;
                    <asp:Button ID="MPRefereshBtn" class="white" runat="server" OnClick="MPRefereshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="MPAssignBtn" runat="server" CssClass="blue" OnClick="MPAssignBtn_Click" Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="MPUnAssignBtn" runat="server" CssClass="white" OnClick="MPUnAssignBtn_Click" Text="Unassign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    &nbsp;
                    <span>Veh no</span>
                    <br />
                    <input type="text" runat="server" clientidmode="Static" id="hdnMPVehNo" style="display: none" />
                    &nbsp;
                    <telerik:RadComboBox runat="server" ID="MPVehNoCB" OnLoad="MPVehNoCB_Load" RenderMode="Lightweight" OnItemDataBound="MPVehNoCB_ItemDataBound"
                        DataTextField="descr" DataValueField="item" Skin="WebBlue" Width="140px" Height="200px" AllowCustomText="true"
                        HighlightTemplatedItems="true" Filter="Contains" OnClientSelectedIndexChanged="MPVehNoCB_IndexChanged">
                    </telerik:RadComboBox>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <span>Driver</span>
                    <br />
                    <input type="text" runat="server" clientidmode="Static" id="hdnMPDriver" style="display: none" />
                    &nbsp;
                    <telerik:RadComboBox runat="server" ID="MPDriverCB" OnLoad="MPDriverCB_Load" RenderMode="Lightweight"
                        DataTextField="descr" DataValueField="item" Skin="WebBlue" Width="140px" Height="200px" AllowCustomText="true"
                        HighlightTemplatedItems="true" Filter="Contains" OnClientSelectedIndexChanged="MPDriverCB_IndexChanged">
                    </telerik:RadComboBox>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <span>Route</span>
                    <br />
                    <input type="text" runat="server" clientidmode="Static" id="hdnMPRoute" style="display: none" />
                    &nbsp;
                    <telerik:RadComboBox runat="server" ID="MPRouteCB" OnLoad="MPRouteCB_Load" RenderMode="Lightweight" AutoPostBack="true"
                        DataTextField="descr" DataValueField="item" Skin="WebBlue" Width="140px" Height="200px" AllowCustomText="true"
                        HighlightTemplatedItems="true" Filter="Contains" OnClientSelectedIndexChanged="MPRouteCB_IndexChanged" OnSelectedIndexChanged="MPRouteCB_SelectedIndexChanged">
                    </telerik:RadComboBox>
                </td>
                <td>
                    <br />
                    <br />
                    <span id="MPSelectedCount" style="padding-left: 4px">0</span> Selected
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <%= "" %>
                <% foreach (var color in (Dictionary<string, string>)ViewState[DISTINCT_VEHNO_COLOR])
                    { %>
                <td style="width: 15px; height: 15px; background-color: <%=color.Value%>"></td>
                <td><%=string.IsNullOrEmpty(color.Key) ? "Unassigned" : color.Key %></td>
                <td style="width: 15px"></td>
                <% } %>
            </tr>
        </table>
        <input type="text" runat="server" clientidmode="Static" id="MPSelectedTripId" style="display: none" />
        <div runat="server" style="height: 80%; width: 100%;" id="MapPlanningGmap"></div>

        <script type="text/javascript">
            function MPFilterVehNoCB_IndexChanged(sender, eventArgs){
                var item = eventArgs.get_item();
                document.getElementById('MPFilterVehNoCB_value').value = item.get_value();
            }
            function MPVehNoCB_IndexChanged(sender, eventArgs){
                var item = eventArgs.get_item();
                document.getElementById('hdnMPVehNo').value = item.get_value();

                // Set default driver in MPDriverCB
                var newValue = sender.get_selectedItem().get_attributes().getAttribute('perid');console.log(newValue);console.log('a',sender.get_selectedItem().get_attributes())
                var control = $find('MPDriverCB');
                if (control.findItemByValue(newValue))
                    control.findItemByValue(newValue).select();
                else {
                    if (!newValue) {
                        if (control.findItemByText(''))
                            control.findItemByText('').select();
                        else
                            control.set_text('');
                    } else
                        control.set_value(newValue);
                }
            }
            function MPDriverCB_IndexChanged(sender, eventArgs){
                var item = eventArgs.get_item();
                document.getElementById('hdnMPDriver').value = item.get_value();
            }
            function MPRouteCB_IndexChanged(sender, eventArgs){
                var item = eventArgs.get_item();
                document.getElementById('hdnMPRoute').value = item.get_value();
            }

            var shiftPressed = false; // whether user is holding shift key

            function loadScript() {
                var script = document.createElement('script');
                script.src = 'https://maps.googleapis.com/maps/api/js?v=3.31' +
                    '&key=' + '<%=googleMapApiKey %>' + '&callback=initMap&async defer';
                document.body.appendChild(script);
            }
            window.onload = loadScript;

                    <% if (ViewState[GMAP_MARKERS] != null)
            { %>
            var markers = <%= ViewState[GMAP_MARKERS].ToString() %>;
            <% } %>
                    <% if (ViewState[INFO_CONTENT] != null)
            { %>
            var infoContents = <%= ViewState[INFO_CONTENT].ToString() %>;
            <% } %>
                    <% if (ViewState[GMAP_LINKS] != null)
            { %>
            var Links = <%= ViewState[GMAP_LINKS].ToString() %>;
            <% } %>
                    <% if (ViewState[DISTINCT_VEHNO] != null)
            { %>
            var DistinctVehNo = <%= ViewState[DISTINCT_VEHNO].ToString() %>;
                    <% } %>

            function countSelectedMarker(){
                if (markers) {
                    var selectedCount = 0;
                    var selectedId = null;

                    for (var i = 0; i < markers.length; i++) {
                        if (markers[i].selected) {
                            selectedCount++;

                            if (!selectedId)
                                selectedId = markers[i].id;
                            else
                                selectedId += ','+markers[i].id;
                        }
                    }

                    document.getElementById('MPSelectedCount').textContent = selectedCount;
                    document.getElementById('MPSelectedTripId').value = selectedId;
                }
            }

            function initMap() {
                // for marker icon
                var pinSVGHole = "M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z";
                var labelOriginHole = new google.maps.Point(12,15);
                var pinSVGFilled = "M 12,2 C 8.1340068,2 5,5.1340068 5,9 c 0,5.25 7,13 7,13 0,0 7,-7.75 7,-13 0,-3.8659932 -3.134007,-7 -7,-7 z";
                var labelOriginFilled =  new google.maps.Point(12,9);

                var mapPlanningGmap = new google.maps.Map(
                    (document.getElementById("MapPlanningGmap")),
                    {
                        zoom: 11.5,
                        styles: [
                            { "elementType": "geometry", "stylers": [{ "color": "#f5f5f5" }] }, { "elementType": "geometry.fill", "stylers": [{ "color": "#d6f5d6" }] }, { "elementType": "labels.icon", "stylers": [{ "visibility": "off" }] }, { "elementType": "labels.text.fill", "stylers": [{ "color": "#2e2e2e" }, { "lightness": 15 }, { "weight": 4.5 }] }, { "elementType": "labels.text.stroke", "stylers": [{ "color": "#ffffff" }] }, { "featureType": "administrative.land_parcel", "elementType": "labels", "stylers": [{ "visibility": "off" }] }, { "featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [{ "color": "#bdbdbd" }] }, { "featureType": "poi", "elementType": "geometry", "stylers": [{ "color": "#eeeeee" }] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [{ "color": "#757575" }] }, { "featureType": "poi.business", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.park", "elementType": "labels.text", "stylers": [{ "visibility": "off" }] }, { "featureType": "road", "elementType": "geometry", "stylers": [{ "color": "#ffffff" }] }, { "featureType": "road.arterial", "elementType": "geometry.fill", "stylers": [{ "color": "#c683e2" }, { "saturation": 65 }, { "lightness": 50 }] }, { "featureType": "road.arterial", "elementType": "labels.text.fill", "stylers": [{ "color": "#4f4f4f" }] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [{ "color": "#dadada" }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#7acefc" }, { "lightness": 65 }] }, { "featureType": "road.highway", "elementType": "labels.text.fill", "stylers": [{ "color": "#616161" }] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry.fill", "stylers": [{ "color": "#7acefc" }, { "saturation": 60 }] }, { "featureType": "road.local", "elementType": "geometry.fill", "stylers": [{ "color": "#f49395" }, { "lightness": 50 }] }, { "featureType": "road.local", "elementType": "labels", "stylers": [{ "visibility": "off" }] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{ "color": "#9e9e9e" }] }, { "featureType": "water", "elementType": "geometry", "stylers": [{ "color": "#007acc" }] }, { "featureType": "water", "elementType": "geometry.fill", "stylers": [{ "color": "#007acc" }, { "saturation": -10 }, { "lightness": 70 }, { "weight": 2 }] }, { "featureType": "water", "elementType": "labels.text", "stylers": [{ "color": "#007acc" }, { "weight": 3.5 }] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [{ "color": "#007acc" }] }, { "featureType": "water", "elementType": "labels.text.stroke", "stylers": [{ "color": "#007acc" }, { "weight": 3 }] }
                        ],
                        center: { lat: 1.3521, lng: 103.8198 },
                        mapTypeControl: false,
                        streetViewControl: false,
                    }
                );

                if (markers)
                    for (var i = 0; i < markers.length; i++){
                        // set marker color. Ref: https://stackoverflow.com/questions/2472957/how-can-i-change-the-color-of-a-google-maps-marker/23163930#23163930
                        // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                        if(markers[i].vehno == "" || markers[i].vehno == null)
                        {
                            var markerImage = { 
                                path: pinSVGHole,
                                anchor: new google.maps.Point(12,17),
                                fillOpacity: 1,
                                fillColor: markers[i].color,
                                strokeWeight: 2,
                                strokeColor: "white",
                                scale: 2,
                                labelOrigin: labelOriginHole
                            };
                        }
                        else
                        {
                            var markerImage = { 
                                path: pinSVGFilled,
                                anchor: new google.maps.Point(12,17),
                                fillOpacity: 1,
                                fillColor: markers[i].color,
                                strokeWeight: 2,
                                strokeColor: "white",
                                scale: 2,
                                labelOrigin: labelOriginFilled
                            };
                        }

                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(markers[i].lat, markers[i].lng),
                            map: mapPlanningGmap,
                            icon: markerImage,
                            label: {
                                text: markers[i].seqno,
                                color: "Red",
                                fontWeight: "bold",
                                fontSize: "20px"
                            }
                        });
                        markers[i].marker = marker;

                        // display popup info when mouse over the marker
                        var infoWindow = new google.maps.InfoWindow(), marker, i;
                        google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                            return function () {
                                var content = '<div class="info_content">' +
                                    '<p>' +
                                    'Address: ' + infoContents[i].toaddr + '</p>' +
                                    '<p>' +
                                    'Vehno: ' + infoContents[i].vehno + '</p>' +
                                    '<p>' +
                                    'Driver: ' + infoContents[i].driver + '</p>' +
                                    '<p>' +
                                    'Trip Packages : ' + infoContents[i].TripPackages + '</p>' +
                                    '<p>' +
                                    'Total Drop Points : ' + infoContents[i].TotalDropPoints + '</p>' +
                                    '<p>' +
                                    'Total Packages : ' + infoContents[i].TotalPackages + '</p>' +
                                    '</div>';
                                infoWindow.setContent(content);
                                infoWindow.open(mapPlanningGmap, marker);
                            }
                        })(marker, i));
                        google.maps.event.addListener(marker, 'mouseout', (function (marker, i) {
                            return function () {
                                infoWindow.close();
                            }
                        })(marker, i));

                        // select marker if user click while holding shift
                        google.maps.event.addListener(marker, 'click', (function (marker, i) {
                            return function () {
                                if (shiftPressed){
                                    if (markers[i].selected) {
                                        // unselect this marker
                                        markers[i].selected = false;
                                        if(markers[i].vehno == "" || markers[i].vehno == null)
                                        {
                                            var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                                path: pinSVGHole,
                                                anchor: new google.maps.Point(12,17),
                                                fillOpacity: 1,
                                                fillColor: markers[i].color,
                                                strokeWeight: 2,
                                                strokeColor: "white",
                                                scale: 2,
                                                labelOrigin: labelOriginHole
                                            };
                                        }
                                        else
                                        {
                                            var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                                path: pinSVGFilled,
                                                anchor: new google.maps.Point(12,17),
                                                fillOpacity: 1,
                                                fillColor: markers[i].color,
                                                strokeWeight: 2,
                                                strokeColor: "white",
                                                scale: 2,
                                                labelOrigin: labelOriginFilled
                                            };
                                        }

                                        markers[i].marker.setIcon(markerImage);
                                    } else {
                                        // select this marker
                                        markers[i].selected = true;

                                        var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                            path: pinSVGFilled,
                                            anchor: new google.maps.Point(12,17),
                                            fillOpacity: 1,
                                            fillColor: markers[i].color,
                                            strokeWeight: 4, // to make it differenate that this is selected
                                            strokeColor: "black",
                                            scale: 2,
                                            labelOrigin: labelOriginFilled
                                        };

                                        markers[i].marker.setIcon(markerImage);
                                    }

                                    countSelectedMarker();
                                }
                            }
                        })(marker, i));
                    }

                if(markers.length > 0){
                    for(var i=0; i < DistinctVehNo.length; i++){
                        var latlng = "";
                        for(var k=0; k < Links.length; k++){
                            if(DistinctVehNo[i].vehno == Links[k].vehno)
                            {
                                if(latlng == "" || latlng == null){
                                    latlng = Links[k].lat + "," + Links[k].lng;
                                }
                                else {
                                    latlng = latlng + "|" + Links[k].lat + "," + Links[k].lng;
                                }
                            }
                        }

                        var r=[latlng];
                        var coordinates = r[0].split("|");
                        var LinkPathCoordinates = new Array();
                        for(j=0; j < coordinates.length; j++)
                        {  
                            var point =new google.maps.LatLng(coordinates[j].split(',')[0],coordinates[j].split(',')[1]);
                            LinkPathCoordinates.push(point);   
                        } 

                        for (var j = 0; j < markers.length; j++)
                        {
                            var LinkLine = markers[j].vehno.includes(DistinctVehNo[i].vehno);
                            if(LinkLine)
                            {
                                var LinkPath = new google.maps.Polyline({
                                    path: LinkPathCoordinates,
                                    geodesic: true,
                                    strokeColor: markers[j].color,
                                    strokeOpacity: 1.0,
                                    strokeWeight: 2,
                                });
                            }
                        }

                        LinkPath.setMap(mapPlanningGmap);
                    }
                }

                document.addEventListener("keydown", function(evt) {
                    if (evt.which === 16) { // shift
                        shiftPressed = true;
                    }
                });
                document.addEventListener("keyup",function(evt) {
                    if (evt.which === 16) { // shift
                        shiftPressed = false;
                    }
                });

                var mouseDownPos, gribBoundingBox = null, mouseIsDown = 0;
                google.maps.event.addListener(mapPlanningGmap, 'mousemove', function(e) {
                    if (mouseIsDown && (shiftPressed|| gribBoundingBox != null) ) {
                        if (gribBoundingBox !== null) // box exists
                        {
                            var newbounds = new google.maps.LatLngBounds(mouseDownPos,null);
                            newbounds.extend(e.latLng);
                            gribBoundingBox.setBounds(newbounds); // If this statement is enabled, I lose mouseUp events

                        } else // create bounding box
                        {
                            gribBoundingBox = new google.maps.Rectangle({
                                map: mapPlanningGmap,
                                bounds: null,//bounds,
                                fillOpacity: 0.15,
                                strokeWeight: 0.9,
                                clickable: false
                            });
                        }
                    }
                });

                google.maps.event.addListener(mapPlanningGmap, 'mousedown', function(e) {
                    if (shiftPressed) {

                        mouseIsDown = 1;
                        mouseDownPos = e.latLng;
                        mapPlanningGmap.setOptions({
                            draggable: false
                        });
                    }
                });

                google.maps.event.addListener(mapPlanningGmap, 'mouseup', function(e) {
                    if (mouseIsDown && (shiftPressed|| gribBoundingBox != null)) {
                        mouseIsDown = 0;
                        if (gribBoundingBox !== null) // box exists
                        {
                            var boundsSelectionArea = new google.maps.LatLngBounds(gribBoundingBox.getBounds().getSouthWest(), gribBoundingBox.getBounds().getNorthEast());
                            var SelectedIds = document.getElementById('MPSelectedTripId').value;
                            var Id = new Array();
                            Id = SelectedIds.split(",");
                            for (var i=0; i < markers.length; i++) { // looping through my Markers Collection 

                                if (gribBoundingBox.getBounds().contains(markers[i].marker.getPosition())) {
                                    var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                        path: pinSVGFilled,
                                        anchor: new google.maps.Point(12,17),
                                        fillOpacity: 1,
                                        fillColor: markers[i].color,
                                        strokeWeight: 4, // to make it differenate that this is selected
                                        strokeColor: "black",
                                        scale: 2,
                                        labelOrigin: labelOriginFilled
                                    };

                                    markers[i].marker.setIcon(markerImage);
                                    markers[i].selected = true;
                                }
                                else {
                                    var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                        path: pinSVGHole,
                                        anchor: new google.maps.Point(12,17),
                                        fillOpacity: 1,
                                        fillColor: markers[i].color,
                                        strokeWeight: 2,
                                        strokeColor: "white",
                                        scale: 2,
                                        labelOrigin: labelOriginHole
                                    };

                                    markers[i].marker.setIcon(markerImage)
                                    markers[i].selected = false;
                                }

                                for(var j=0; j < Id.length ; j++)
                                {
                                    if(Id != "" && Id != null && markers[i].id.includes(Id[j]))
                                    {
                                        var markerImage = {  // https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerLabel
                                            path: pinSVGFilled,
                                            anchor: new google.maps.Point(12,17),
                                            fillOpacity: 1,
                                            fillColor: markers[i].color,
                                            strokeWeight: 4, // to make it differenate that this is selected
                                            strokeColor: "black",
                                            scale: 2,
                                            labelOrigin: labelOriginFilled
                                        };

                                        markers[i].marker.setIcon(markerImage);
                                        markers[i].selected = true;
                                    }
                                }
                            }

                            gribBoundingBox.setMap(null); // remove the rectangle

                            countSelectedMarker();
                        }
                        gribBoundingBox = null;
                    }
                    mapPlanningGmap.setOptions({
                        draggable: true
                    });
                });
              <%-- End of drag rectangle to select markers --%>
            }
        </script>
    </form>
</body>
</html>

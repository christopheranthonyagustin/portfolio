<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliverySchedulingWorkbenchSectorCoverage.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliverySchedulingWorkbench.DailyDeliverySchedulingWorkbenchSectorCoverage" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sector Coverage</title>
    <link type="text/css" rel="stylesheet" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .MapDiv {
            height: 80%;
            width: 100%;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function initMap() {
                var pinSVGHole = "M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z";
                var labelOriginHole = new google.maps.Point(60, 22);

                var LocationGmap = new google.maps.Map(
                    document.getElementById("GoogleMap"),
                    {
                        zoom: 8,
                        styles: [
                            {
                                "elementType": "labels.icon",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "administrative.land_parcel",
                                "elementType": "labels",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "elementType": "labels.text.stroke",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            // Style for roads with red border
                            {
                                "featureType": "road",
                                "elementType": "geometry.stroke",
                                "stylers": [
                                    { "color": "#D2D2D2" } // Set the desired color for road border (red)
                                ]
                            },
                            // Add style for roads
                            {
                                "featureType": "road",
                                "elementType": "geometry.fill",
                                "stylers": [
                                    { "color": "#F1F2F1" } // Set the desired color for roads
                                ]
                            },
                            // Hide specific road labels
                            {
                                "featureType": "road",
                                "elementType": "labels.text",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            // Hide "SINGAPORE" label
                            {
                                "featureType": "administrative.locality",
                                "elementType": "labels.text",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            // Hide other labels as needed...
                            {
                                "featureType": "poi",
                                "elementType": "labels.text",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "poi.business",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "poi.park",
                                "elementType": "labels.text",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "road.highway",
                                "elementType": "labels.text.fill",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "road.local",
                                "elementType": "labels",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "water",
                                "elementType": "labels.text",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "featureType": "administrative.land_parcel",
                                "elementType": "labels",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                            {
                                "elementType": "labels.text.stroke",
                                "stylers": [
                                    { "visibility": "off" }
                                ]
                            },
                        ],
                        center: { lat: 1.3521, lng: 103.8198 }
                    }
                );

                var bounds = new google.maps.LatLngBounds();
                var markers = []; var infoWindowContent = []; var ImageMakers = [];

                <% if (ViewState[MAP_POINTS_COORDS] != null)
            { %>
                var coordinates = <%= ViewState[MAP_POINTS_COORDS].ToString() %>;
                <% } %>

                 <% if (ViewState[MAP_POINTS_COLOR] != null)
            { %>
                var PointsColor = <%= ViewState[MAP_POINTS_COLOR].ToString() %>;
                <% } %>

                <% if (ViewState[INFO_CONTENT] != null)
            { %>
                var info = <%= ViewState[INFO_CONTENT].ToString() %>;
                <% } %>

                for (var i = 0; i < coordinates.length; i++) {
                    markers.push([coordinates[i][0], coordinates[i][1]]);

                    var markerImage = {
                        path: pinSVGHole,
                        anchor: new google.maps.Point(12, 17),
                        fillOpacity: 1,
                        fillColor: PointsColor[i][0],
                        strokeWeight: 2,
                        strokeColor: "white",
                        scale: 2,
                        labelOrigin: labelOriginHole
                    };

                    ImageMakers.push([markerImage]);

                    infoWindowContent.push([' ' + info[i][0] + ' '])
                }
                for (i = 0; i < markers.length; i++) {
                    var position = new google.maps.LatLng(markers[i][0], markers[i][1]);
                    bounds.extend(position);
                    marker = new google.maps.Marker({
                        position: position,
                        icon: ImageMakers[i][0],
                        map: LocationGmap,
                        label: {
                            text: infoWindowContent[i][0],
                            color: "#00000",
                            fontWeight: "bold",
                            fontSize: "14px"
                        }
                    });

                    LocationGmap.fitBounds(bounds);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </td>
                    <td>
                        <br />
                        <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="white" OnClick="SearchBtn_Click"
                            OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    </td>
                    <td style="padding-left:20px">
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="CoveredLbl" runat="server" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="CoveringLbl" runat="server" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id="GoogleMap" class="MapDiv" runat="server">
            <script type="text/javascript">
                var GoogleMapApiKey = '<%=GoogleMapApiKey%>';
                function LoadMapScript() {
                    var Script = document.createElement('script');
                    Script.src = 'https://maps.googleapis.com/maps/api/js?v=3.37' + '&key=' + GoogleMapApiKey + '&callback=initMap';
                    document.body.appendChild(Script);
                }
                window.onload = LoadMapScript();
            </script>
        </div>
    </form>
</body>
</html>

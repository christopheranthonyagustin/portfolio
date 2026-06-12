<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterMapPoints.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterMapPoints" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MapPoints</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">            
            function initMap() {
                '<%Session["refreshTrigger"] = "No";%>';
                var assetLocationGmap = new google.maps.Map(
                    (document.getElementById("AssetLocationGmap")),
                    {
                        zoom: 12,
                        styles: [
                            { "elementType": "geometry", "stylers": [{ "color": "#f5f5f5" }] }, { "elementType": "geometry.fill", "stylers": [{ "color": "#d6f5d6" }] }, { "elementType": "labels.icon", "stylers": [{ "visibility": "off" }] }, { "elementType": "labels.text.fill", "stylers": [{ "color": "#2e2e2e" }, { "lightness": 15 }, { "weight": 4.5 }] }, { "elementType": "labels.text.stroke", "stylers": [{ "color": "#ffffff" }] }, { "featureType": "administrative.land_parcel", "elementType": "labels", "stylers": [{ "visibility": "off" }] }, { "featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [{ "color": "#bdbdbd" }] }, { "featureType": "poi", "elementType": "geometry", "stylers": [{ "color": "#eeeeee" }] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [{ "color": "#757575" }] }, { "featureType": "poi.business", "stylers": [{ "visibility": "off" }] }, { "featureType": "poi.park", "elementType": "labels.text", "stylers": [{ "visibility": "off" }] }, { "featureType": "road", "elementType": "geometry", "stylers": [{ "color": "#ffffff" }] }, { "featureType": "road.arterial", "elementType": "geometry.fill", "stylers": [{ "color": "#c683e2" }, { "saturation": 65 }, { "lightness": 50 }] }, { "featureType": "road.arterial", "elementType": "labels.text.fill", "stylers": [{ "color": "#4f4f4f" }] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [{ "color": "#dadada" }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#7acefc" }, { "lightness": 65 }] }, { "featureType": "road.highway", "elementType": "labels.text.fill", "stylers": [{ "color": "#616161" }] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry.fill", "stylers": [{ "color": "#7acefc" }, { "saturation": 60 }] }, { "featureType": "road.local", "elementType": "geometry.fill", "stylers": [{ "color": "#f49395" }, { "lightness": 50 }] }, { "featureType": "road.local", "elementType": "labels", "stylers": [{ "visibility": "off" }] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{ "color": "#9e9e9e" }] }, { "featureType": "water", "elementType": "geometry", "stylers": [{ "color": "#007acc" }] }, { "featureType": "water", "elementType": "geometry.fill", "stylers": [{ "color": "#007acc" }, { "saturation": -10 }, { "lightness": 70 }, { "weight": 2 }] }, { "featureType": "water", "elementType": "labels.text", "stylers": [{ "color": "#007acc" }, { "weight": 3.5 }] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [{ "color": "#007acc" }] }, { "featureType": "water", "elementType": "labels.text.stroke", "stylers": [{ "color": "#007acc" }, { "weight": 3 }] }
                        ],
                        center: { lat: 1.3521, lng: 103.8198 }
                    }
                );

                var trafficLayer = new google.maps.TrafficLayer();
                trafficLayer.setMap(assetLocationGmap);

                var bounds = new google.maps.LatLngBounds();
                var markers = []; var infoWindowContent = [];

            <%double[][] coordinates = (double[][])Session["MapPointsCoords"];
            string[][] info = (string[][])Session["MapPointsInfo"];
            string[] imagepath = (string[])Session["MapPointsImagePath"];
            if(coordinates == null) { return; }
            for (var i = 0; i < coordinates.Length; i++)
            {%>
                markers.push([<%=coordinates[i][0]%>, <%=coordinates[i][1]%>, '<%=imagepath[i]%>']);
                infoWindowContent.push([
                    '<div class="info_content">' +
                    '<p>Info:</p>' +
                    '<p>' +
                    ' ' + '<%=info[i][0]%>' + '</p>' +
                    '<p>' +
                    ' ' + '<%=info[i][1]%>' + '</p>' +
                    '<p>' +
                    ' ' + '<%=info[i][2]%>' + '</p>' +
                    '<p>' +
                    ' ' + '<%=info[i][3]%>' + '</p>' +
                    '</div>'
                ])
		    <%}%>
                var infoWindow = new google.maps.InfoWindow(), marker, i;
                var geocoder = new google.maps.Geocoder();
                <%int markerCount = 0;%>
                for (i = 0; i < markers.length; i++) {
                    var position = new google.maps.LatLng(markers[i][0], markers[i][1]);

                    var image = "DeliveryJobRegisterMapPointsMakeThumbNail.aspx?file=" + markers[i][2];
                    var ServicePtImage = image.includes("ServicePtCompleted", 0) || image.includes("ServicePtNotCompleted", 0);
                    if (ServicePtImage == true)
                    {
                        var iconBase = {
                            url: image,
                            scaledSize: new google.maps.Size(13, 13), // scaled size
                            origin: new google.maps.Point(0, 0), // origin
                            anchor: new google.maps.Point(0, 0) // anchor
                        };
                    }
                    else
                    {
                        var iconBase = {
                            url: image,
                            scaledSize: new google.maps.Size(25, 25), // scaled size
                            origin: new google.maps.Point(0, 0), // origin
                            anchor: new google.maps.Point(0, 0) // anchor
                        };
                    }

                    bounds.extend(position);
                    marker = new google.maps.Marker({
                        position: position,
                        icon: iconBase,
                        map: assetLocationGmap 
                    });
                    marker
                    google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                        return function () {
                            infoWindow.setContent(infoWindowContent[i][0]);
                            infoWindow.open(assetLocationGmap, marker);
                        }
                    })(marker, i));
                    google.maps.event.addListener(marker, 'mouseout', (function (marker, i) {
                        return function () {
                            infoWindow.close();
                        }
                    })(marker, i));
                    assetLocationGmap.fitBounds(bounds);
                    <%markerCount++;%>
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .assetLocationButtonOverview {
            width: 100%;
            padding: 5px 5px 5px 5px;
            display: inline-block;
        }

        .assetLocationMapOverview {
            width: 100%;
            height: 70%;
        }

        .assetLocationMapContent {
            height: 80%;
            width: 100%;
        }
    </style>
</head>
<body style="margin: 0px;">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <div runat="server" class="assetLocationMapContent" id="AssetLocationGmap">
            <script type="text/javascript">
                var key = '<%=Session["Key"]%>';
                function loadScript() {
                    var script = document.createElement('script');
                    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.31' +
                        '&key=' + key +'&callback=initMap';
                    document.body.appendChild(script);
                }
                window.onload = loadScript;
            </script>
        </div>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

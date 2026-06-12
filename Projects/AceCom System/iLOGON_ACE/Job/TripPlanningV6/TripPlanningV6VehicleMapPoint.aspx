<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6VehicleMapPoint.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6VehicleMapPoint" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Map Point</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        #assetLocationGmap {
            height: 100%;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            let assetLocationGmap;
            function initMap() {
                assetLocationGmap = new google.maps.Map(
                     (document.getElementById("AssetLocationGmap")),
                     {
                         center: { lat: 1.3521, lng: 103.8198 },
                         zoom: 8
                     }
                 );

                var Bounds = new google.maps.LatLngBounds();
                var MarkerArr = []; var VehicleInfo = [];

            <%double[][] Coordinates = (double[][])ViewState["MapPointsCoords"];
            string[] MapPointsAddress = (string[])ViewState["MapPointsAddress"];
            for (var i = 0; i < Coordinates.Length; i++)
            {%>
                MarkerArr.push([<%=Coordinates[i][0]%>, <%=Coordinates[i][1]%>]);
                VehicleInfo.push([
                    '<div class="info_content">' +
                    '<p>' +
                    'Address: ' + '<%=MapPointsAddress[i]%>' + '</p>' +
                    '</div>'
                ]);
		    <%}%>
                var infoWindow = new google.maps.InfoWindow(), marker, i;
                var geocoder = new google.maps.Geocoder();
                <%int markerCount = 0;%>
                for (i = 0; i < MarkerArr.length; i++) {
                    var position = new google.maps.LatLng(MarkerArr[i][0], MarkerArr[i][1]);
                    Bounds.extend(position);

                    var IconBase = {
                        url: "../../Image/end.png",
                        scaledSize: new google.maps.Size(30, 30), // scaled size
                        origin: new google.maps.Point(0, 0), // origin
                        anchor: new google.maps.Point(0, 0) // anchor
                    };

                    marker = new google.maps.Marker({
                        position: position,
                        icon: IconBase,
                        map: assetLocationGmap
                    });
                    marker
                    google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                        return function () {
                            infoWindow.setContent(VehicleInfo[i][0]);
                            infoWindow.open(AssetLocationGmap, marker);
                        }
                    })(marker, i));
                    google.maps.event.addListener(marker, 'mouseout', (function (marker, i) {
                        return function () {
                            infoWindow.close();
                        }
                    })(marker, i));

                    assetLocationGmap.fitBounds(Bounds);

                    <%markerCount++;%>
                }
            }

        </script>
    </telerik:RadCodeBlock>
</head>
<body style="margin: 0px;">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <div runat="server" id="AssetLocationGmap">
            <script type="text/javascript">
                var Key = '<%=ViewState["Key"].ToString()%>';
                function ShowMap() {
                    var script = document.createElement('script');
                    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.31' +
                        '&key=' + Key + '&callback=initMap';
                    document.body.appendChild(script);
                }
                window.onload = ShowMap;
            </script>
        </div>
    </form>
</body>
</html>

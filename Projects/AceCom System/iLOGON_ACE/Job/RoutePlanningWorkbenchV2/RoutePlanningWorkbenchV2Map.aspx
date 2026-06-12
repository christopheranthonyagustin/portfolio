<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoutePlanningWorkbenchV2Map.aspx.cs" 
    Inherits="iWMS.Web.Job.RoutePlanningWorkbenchV2.WebForm1" %>

<!DOCTYPE html>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<html>
<head>
    <title>RoutePlanningWorkbenchV2Map</title>
    <style dir="rtl">
        #main-content {
            height: 500px;
            width: auto;
        }
    </style>
</head>
<body id="main-content">

    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="2" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Workbench" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Workbench2" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Map" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TripInfo" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Unplanned" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </form>

    <%string startPostal = (string)Session["StartPostalCode"];
      string[] temp = (string[])Session["route"];%>

    <div id="map1" class="maps" style="height: 100%; width: auto;"></div>
    <div id="right-panel" style="height: 100%; width: 40%;"></div>
    <script>

        function initMap(){
            var routeStr = '<%=temp%>';
            var maps = document.getElementsByClassName("maps");
            var mapId = document.getElementById(maps[0].id);
            mapFunction(mapId, routeStr);
        }
            
        function mapFunction(mapId, routeStr) {
			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay1 = new google.maps.DirectionsRenderer;

			var map = new google.maps.Map(mapId, {
				zoom: 13,
				center: {lat: 1.35208, lng: 103.81983}
            });

			var wps = [];
            <%for (var j = 0; j < temp.Length-1; j++) {%>
                wps.push({
				    location: '<%=temp[j]%>',
					stopover: true
				});
			<%}%>
			directionsService.route({
			    origin: '<%=startPostal%>',
				destination: '<%=temp[temp.Length-1]%>',
				waypoints: wps,
				optimizeWaypoints: true,
				travelMode: 'DRIVING'
			}, function(response, status) {
				if (status === 'OK') {
					directionsDisplay1.setDirections(response);
					directionsDisplay1.setMap(map);
				}
				else {
					window.alert('Directions request failed due to ' + status);
				}
			});
		}
    </script>

    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5X-m4VnNgtfLN4K5mPsIaYCNL2Rn2occ&callback=initMap">
    </script>
</body>
</html>
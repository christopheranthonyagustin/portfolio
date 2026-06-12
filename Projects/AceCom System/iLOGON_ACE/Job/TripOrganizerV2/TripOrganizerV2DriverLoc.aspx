<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripOrganizerV2DriverLoc.aspx.cs" Inherits="iWMS.Web.Job.TripOrganizerV2.TripOrganizerV2DriverLoc" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Driver Loc</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh">
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

            <%double[][] coordinates = (double[][])Session["LocateAssetCoords"];
            string[] coordsTitle = (string[])Session["LocateAssetCoordsTitle"];
            string[] coordsCont = (string[])Session["LocateAssetCoordsCont"];
            string[] formattedaddress = (string[])Session["LocateAssetFormattedAddress"];
            string[] vehno = (string[])Session["LocateAssetVehno"];
            string[] perid = (string[])Session["LocateAssetperid"];
            string[] partner = (string[])Session["LocateAssetPartner"];
            string[] avatarpath = (string[])Session["AvatarPath"]; //Added by HH 18/Nov/2019 Ticket:#9269 pt 20
            string[] islatestpath = (string[])Session["IsLatest"];
            for (var i = 0; i < coordinates.Length; i++)
            {%>
                markers.push(['<%=coordsTitle[i]%>', <%=coordinates[i][0]%>, <%=coordinates[i][1]%>, '<%=avatarpath[i]%>', '<%=islatestpath[i]%>']);
                infoWindowContent.push([
                    '<div class="info_content">' +
                    '<p>' + '<b>' +
                    '<%=partner[i]%>' + ' ' + '|' + ' ' +
                    '<%=vehno[i]%>' + ' ' + '|' + ' ' +
                    '<%=perid[i]%>' + '</b>' +
                    '</p>' +
                    '<p>' + '</p>' +
                    '<p>' +
                    'Address: ' + '<%=formattedaddress[i]%>' + '</p>' +
                    '<p>' +
                    <%--'Raw Coordinates: ' + '<%=coordinates[i][0]%>' + ', ' + '<%=coordinates[i][1]%>' + '<br />' +--%>
                    'Timestamp: ' + '<%=coordsCont[i]%>' + '</p>' +
                    '</div>'
                ])
		    <%}%>
                var infoWindow = new google.maps.InfoWindow(), marker, i;
                var geocoder = new google.maps.Geocoder();
                <%int markerCount = 0;%>
                for (i = 0; i < markers.length; i++) {
                    var position = new google.maps.LatLng(markers[i][1], markers[i][2]);

                    var image = "TripOrganizerV2MapThumbNail.aspx?file=" + markers[i][3];
                    var defaultimage = image.includes("DefaultPositionAvatar", 0);
                    var size = 15;

                    if (markers[i][4] === "Y") {
                        size = 30
                    }

                    if (defaultimage == true) {
                        //Added by HH 18/Nov/2019 Ticket:#9269 pt 20 
                        var iconBase = {
                            url: image,
                            scaledSize: new google.maps.Size(size, size), // scaled size
                            origin: new google.maps.Point(0, 0), // origin
                            anchor: new google.maps.Point(0, 0) // anchor
                        }; //
                    }
                    else {
                        //Added by HH 18/Nov/2019 Ticket:#9269 pt 20 
                        var iconBase = {
                            url: image,
                            scaledSize: new google.maps.Size(25, 25), // scaled size
                            origin: new google.maps.Point(0, 0), // origin
                            anchor: new google.maps.Point(0, 0) // anchor
                        }; //
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
    <form id="form1" runat="server" method="post" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />      
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <div class="assetLocationButtonOverview">
                                <asp:Label ID="Label1" runat="server" Visible="False" />
                                <asp:Label ID="lblProcessID" runat="server" Visible="False" />
                                <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                                    OnClientClick="disableBtn(this.id, true)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                                &nbsp;                       
                        <asp:Button ID="NowBtn" runat="server" Text="Now" OnClick="NowBtn_Click" CausesValidation="false"
                            OnClientClick="disableBtn(this.id, false)" ToolTip="Now" UseSubmitBehavior="false" CssClass="white" />
                                &nbsp;
                        Last Refreshed: 
                        <asp:Label ID="RefreshedLbl" runat="server" Text="-NIL-"></asp:Label>
                                <asp:Timer ID="RefreshTimer" runat="server" OnTick="RefreshTimer_Tick" Interval="120"></asp:Timer>
                            </div>
                        </td>                      
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <%--<td>
                    <label for="ddlRefresh">Interval</label><br>
                    <telerik:RadDropDownList ID="ddlRefresh" runat="server">
                        <Items>
                            <telerik:DropDownListItem Text="5 min" Value="300000" />
                            <telerik:DropDownListItem Text="1 min" Value="60000" />
                            <telerik:DropDownListItem Text="30 sec" Value="30000" />
                            <telerik:DropDownListItem Text="10 sec" Value="10000" />
                        </Items>
                    </telerik:RadDropDownList>
                </td>--%>
                    </tr>
                </table>
                <div runat="server" class="assetLocationMapContent" id="AssetLocationGmap">
                    <script type="text/javascript">
                        var key = '<%=Session["Key"]%>';
                        function loadScript() {
                            var script = document.createElement('script');
                            script.src = 'https://maps.googleapis.com/maps/api/js?v=3.31' +
                                '&key=' + key + '&callback=initMap';
                            document.body.appendChild(script);
                        }
                        window.onload = loadScript;
                    </script>
                </div>

                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional" Visible='<%# (Eval("id")==DBNull.Value ? false : true) %>'>
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                            ItemStyle-Wrap="true" OnGridExporting="ResultDG_GridExporting" GridLines="Both" Width="100%" Height="50%">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true"></HeaderStyle>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="50%" TableLayout="Fixed">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <%--<HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" CssClass="BigCheckBox" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox" />
                                        </ItemTemplate>--%>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>


                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

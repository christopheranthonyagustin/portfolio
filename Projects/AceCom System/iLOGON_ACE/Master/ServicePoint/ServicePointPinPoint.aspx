<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePointPinPoint.aspx.cs" Inherits="iWMS.Web.Master.ServicePoint.ServicePointPinPoint" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServicePointPinPoint</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

    <style>
        .separator {
            margin: 1rem 0 0 0;
        }

        #map {
            height: 80%;
        }

        #action {
            display: flex;
            flex-direction: row;
        }

        #addrLbl {
            display: flex;
            flex-direction: column;
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="action">
            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                Text="Update" UseSubmitBehavior="false" />
        </div>
        <div class="separator" />
        <div id="addrLbl">
            <asp:Label runat="server" ID="MainLbl" Font-Bold="true" Font-Size="Large" />
            <asp:Label runat="server" ID="AddressLbl" Font-Bold="false" Font-Size="Medium" />
        </div>
        <div class="separator"></div>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

        <div id="map"></div>
        <asp:HiddenField runat="server" ID="latField" Value="" />
        <asp:HiddenField runat="server" ID="lngField" Value="" />
    </form>
    <script type="text/javascript">
        let map
        let marker
        function initMap() {
            let defaultCenter = {
                lat: <%=centerGeocode[0] %>,
                lng: <%=centerGeocode[1] %>
            };

            map = new google.maps.Map(document.getElementById('map'), {
                center: defaultCenter,
                zoom: 7
            });

            marker = new google.maps.Marker({
                position: defaultCenter,
                map: map,
                draggable: true
            });

            google.maps.event.addListener(marker, 'dragend', function (marker) {
                var latLng = marker.latLng;
                console.log(`${latLng.lat()} | ${latLng.lng()}`);

                // store geocode for behind
                document.getElementById("<%=latField.ClientID%>").value = latLng.lat();
                document.getElementById("<%=lngField.ClientID%>").value = latLng.lng();

                document.getElementById('formCtl_TEXT_latitude').value = latLng.lat();
                document.getElementById('formCtl_TEXT_longitude').value = latLng.lng();
            });

            document.getElementById('formCtl_TEXT_latitude').onblur = setMarker;
            document.getElementById('formCtl_TEXT_longitude').onblur = setMarker;
        }

        function setMarker() {
            let newPos = {
                lat: document.getElementById('formCtl_TEXT_latitude').value,
                lng: document.getElementById('formCtl_TEXT_longitude').value
            }

            let latlng = new google.maps.LatLng(newPos.lat, newPos.lng);
            marker.setPosition(latlng);
            map.panTo(latlng);

            document.getElementById("<%=latField.ClientID%>").value = latlng.lat();
            document.getElementById("<%=lngField.ClientID%>").value = latlng.lng();
        }
    </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=<%= ApiKey %>&callback=initMap">
    </script>
</body>
</html>

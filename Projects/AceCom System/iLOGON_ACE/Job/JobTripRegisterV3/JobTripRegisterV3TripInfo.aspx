<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV3TripInfo.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV3.JobTripRegisterV3TripInfo" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">   
    <title id="JTListTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">    
</head>
<body id="main-content">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />       
        <table id="table" width="100%" border="0" runat="server" cellspacing="3" cellpadding="3">
            <tr>
                <td>
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>  
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>                                  
                </td>
            </tr>          
        </table>   
        <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <input type="hidden" id="ToPostalCodetxt" runat="server" />
                <input type="hidden" id="toGeoLatitude" runat="server" />
                <input type="hidden" id="toGeolongitude" runat="server" />                  
                <input type="hidden" id="FrPostalCodetxt" runat="server" />
                <input type="hidden" id="frGeoLatitude" runat="server" />
                <input type="hidden" id="frGeolongitude" runat="server" /> 
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl_JBCtnr" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>            
    </form>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyB5X-m4VnNgtfLN4K5mPsIaYCNL2Rn2occ"></script>
    <script type="text/javascript" language="javascript">
    <!-- 
        function GetLatLongValueTo() {
            var geocoder = new google.maps.Geocoder();
            var toaddress = document.getElementById("ToPostalCodetxt").value;
            geocoder.geocode({ 'address': toaddress }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('toGeoLatitude').value = latitude;
                    document.getElementById('toGeolongitude').value = longitude;
                }
            });          
        };

        function GetLatLongValueFr() {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById("FrPostalCodetxt").value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    document.getElementById('frGeoLatitude').value = latitude;
                    document.getElementById('frGeolongitude').value = longitude;
                }
            });
        };
        //-->
    </script>
</body>
</html>

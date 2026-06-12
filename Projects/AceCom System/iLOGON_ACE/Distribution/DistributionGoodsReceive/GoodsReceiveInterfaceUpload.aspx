<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsReceiveInterfaceUpload.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionGoodsReceive.GoodsReceiveInterfaceUpload" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase Order InterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <br />
                <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                &nbsp;
        <iwms:MsgPopup ID="MsgPopup" runat="server"></iwms:MsgPopup>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

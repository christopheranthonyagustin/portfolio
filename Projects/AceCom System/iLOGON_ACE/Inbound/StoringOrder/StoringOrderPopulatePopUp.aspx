<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoringOrderPopulatePopUp.aspx.cs"
    Inherits="iWMS.Web.Inbound.StoringOrder.StoringOrderPopulatePopUp" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Storing Order Populate</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>

<script type="text/javascript">
    function BusyBox(sender, args) {
        busyBox.Show();
    }
</script>

<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Storing Order Populate</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="40%">
                    <asp:Label ID="ReasonLbl" runat="server">ReleaseOrderType</asp:Label>
                </td>
                <td width="60%">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                        <telerik:RadDropDownList RenderMode="Lightweight" DataSource='<%# ReleaseOrderType%>' ID="ReleaseOrderTypeDDL" Skin="Sunset"
                         DropDownHeight="150px" DataTextField="descr" DataValueField="item"  runat="server">
                        </telerik:RadDropDownList>
                    </telerik:RadAjaxPanel>
                </td>
            </tr>
            <tr>
                <td >
                    <telerik:RadButton Skin="WebBlue" ID="Populate" runat="server" Text="Populate" OnClientClick="BusyBox"
                        OnClick="PopulateBtn_Click">
                    </telerik:RadButton>
                    <telerik:RadButton Skin="WebBlue" ID="cancelBtn" runat="server" Text="Cancel" OnClientClick="BusyBox"
                        OnClick="CancelBtn_Click">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>

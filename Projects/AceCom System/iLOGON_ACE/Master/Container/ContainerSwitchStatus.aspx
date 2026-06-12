<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerSwitchStatus.aspx.cs"
    Inherits="iWMS.Web.Master.Container.ContainerSwitchStatus" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Switch Status for Container</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<script type="text/javascript">
    function GetRadWindow() {
        var oWindow = null; if (window.radWindow)
            oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
    }

    function closeWin(url) {
        GetRadWindow().BrowserWindow.location.href = url;
        GetRadWindow().close();
    }

    function close() {
        GetRadWindow().close();
    }
</script>

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
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Switch Status for Container</asp:Label>
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
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    </td>
                    <td width="60%">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                            <telerik:RadTextBox RenderMode="Lightweight" ID="reason" BackColor="Yellow"
                                runat="server" Width="155px">
                            </telerik:RadTextBox>
                        </telerik:RadAjaxPanel>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                    <td width="60%" align="left">
                        <telerik:RadButton Skin="WebBlue" ID="SwitchStatusBtn" runat="server" Text="SwitchStatus" OnClientClick="BusyBox"
                            OnClick="SwitchStatusBtn_Click">
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

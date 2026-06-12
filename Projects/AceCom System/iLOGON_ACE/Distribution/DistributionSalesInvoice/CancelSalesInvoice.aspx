<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelSalesInvoice.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesInvoice.CancelSalesInvoice" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Cancel @Sales Invoice</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

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

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Sales Invoice Cancellation</asp:Label>
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
                    <td width="60%">:
                    <asp:TextBox ID="ReasonTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                    <td width="60%" align="left">
                        <br />
                        <br />
                        <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" OnClientClick="return busyBox.Show();"
                            OnClick="ConfirmBtn_Click"></asp:Button>
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

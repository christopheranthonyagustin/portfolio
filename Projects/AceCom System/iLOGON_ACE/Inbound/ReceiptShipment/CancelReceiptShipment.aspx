<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelReceiptShipment.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.CancelReceiptShipment" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Cancel Receipt Shipment</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Receipt Shipment Cancellation</asp:Label>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReopenReceiptShipment.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ReopenReceiptShipment" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Reinstate Cancellation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
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
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" Font-Bold="true" Font-Size="Small" />
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="ReasonTxt" runat="server"  Width="200" Height="100"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            OnClick="ConfirmBtn_Click" CssClass="white"></asp:Button>
                         <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            OnClick="CancelBtn_Click" CssClass="white"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

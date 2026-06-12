<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentCancelIssue.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentCancelIssue" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Cancel @ Goods Issue</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                    <td width="40%">&nbsp;
                    </td> 
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td> 
                </tr>
                <tr>
                    <td width="40%" align="left">
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    </td> 
                </tr>
                <tr>
                    <td width="60%" align="left">
                    <asp:TextBox ID="ReasonTxt" runat="server" Width="150" Height="100"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td> 
                </tr>
                <tr>
                    <td width="60%" align="left">    
                     <asp:Button ID="ConfirmBtn" runat="server" Text="Submit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            OnClick="SubmitBtn_Click" CssClass="white" Width="150"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderRegisterNonBillable.aspx.cs" Inherits="iWMS.Web.Job.WorkOrderRegister.WorkOrderRegisterNonBillable" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>WorkOrderRegister Non-Billable</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" Font-Size="Small" runat="server" />
                        <br /><br />
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    </td>                    
                    <td width="70%">:
                    <asp:TextBox ID="ReasonTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                    <td width="60%" align="left">
                        <br /><br />
                        <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" CssClass="white"
                            OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>


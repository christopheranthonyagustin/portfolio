<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueReopenChargeSheet.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueReopenChargeSheet" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Reopen Charge Sheet @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" Font-Bold="true" />
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
                        <asp:TextBox ID="ReasonTxt" runat="server" TextMode="MultiLine" Width="150" Height="100"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                            OnClick="SubmitBtn_Click" CssClass="white"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

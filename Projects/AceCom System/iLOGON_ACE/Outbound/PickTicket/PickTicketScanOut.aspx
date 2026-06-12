<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickTicketScanOut.aspx.cs" Inherits="iWMS.Web.Outbound.PickTicket.PickTicketScanOut" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PTScanOut</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="ScanOutLbl" runat="server" CssClass="pagetitle">Picking Completed - CheckOut</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="PickTicketLbl" runat="server">Pick Ticket No.</asp:Label>
                    <br />
                    <asp:TextBox ID="PtIdTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="PtIdTxt_TextChanged"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="StatusMsgLbl" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <%--<asp:Button ID="ScanOutBtn" runat="server" Enabled="False" CssClass="detailbutton"
                        Text="Scan Out" OnClick="ScanOutBtn_Click"></asp:Button>&nbsp;
                    <asp:CheckBox Style="z-index: 0" ID="AutoPackChkBox" runat="server" Text="Auto Pack"
                        Checked="True"></asp:CheckBox>--%>
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="ConfirmPickPanel" runat="server" Visible="False">
        <table cellspacing="2" cellpadding="2">
            <tr>
                <td>
                    <asp:Label ID="InfoLbl" runat="server">Are all items in the Pick Ticket picked?</asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Button ID="YesBtn" runat="server" CssClass="detailbutton" Text="Yes" OnClick="YesBtn_Click">
                    </asp:Button>&nbsp;
                    <asp:Button ID="NoBtn" runat="server" CssClass="detailbutton" Text=" No " OnClick="NoBtn_Click">
                    </asp:Button>&nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>

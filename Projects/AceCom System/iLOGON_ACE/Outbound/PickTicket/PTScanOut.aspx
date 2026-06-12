<%@ Page Language="c#" CodeBehind="PTScanOut.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PickTicket.PTScanOut" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Check-Out @ Register Pick</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="PickTicketLbl" runat="server">Pick Ticket No.</asp:Label>
                    <br />
                    <asp:TextBox ID="PtIdTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="PtIdTxt_TextChanged" Width="300" Height="50" Font-Size="30"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="StatusMsgLbl" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                </td>
            </tr>
        </table>
        <table cellspacing="2" cellpadding="2" width="100%" runat="server" id="tbl">
            <tr>
                <td>
                    <asp:CheckBox Text="Auto Pack" ID="AutoPackCB" runat="server" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">Message
                        <br />
                    <telerik:RadTextBox ID="totIssuetxt" runat="server" Height="90px" Width="249px"
                        TextMode="MultiLine" Text="Total No of Issue :  ">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

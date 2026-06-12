<%@ Page Language="c#" CodeBehind="PollWRRPoll.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PollWRR.PollWRRSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PollWRRSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <span class="pagetitle">&nbsp;Poll for Warehouse Replenishment Receipt</span><br>
    <br>
    <table>
        <tr>
            <td class="boldtext">
                Poll For Account:
            </td>
            <td>
                <asp:DropDownList ID="ddlAccount" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="PollBtn" runat="server" Text="Poll" CssClass="formbtn" OnClick="PollBtn_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    <br>
    </form>
</body>
</html>

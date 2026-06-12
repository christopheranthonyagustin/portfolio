<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterReopen.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterReopen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ServiceRegisterReopen</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="JbNoLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td width="40%">
                <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ReasonTxt" runat="server" TextMode="MultiLine" Width="200px" Height="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="ReOpenBtn" runat="server" CssClass="detailButton" OnClick="ReOpenBtn_Click"
                    Text="ReOpen" Visible="true" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

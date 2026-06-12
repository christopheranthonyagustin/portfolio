<%@ Page Language="c#" CodeBehind="DetailInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.Adjustment.DetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iInput" Src="../../Control/iInputCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DetailInput</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body leftmargin="0" topmargin="0" onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>&nbsp;Detail&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;Reason :
                <asp:DropDownList ID="TEXT_Reason" runat="server">
                </asp:DropDownList>
                <iWMS:iInput ID="iInput" runat="server"></iWMS:iInput>
                <br>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" CssClass="formbtn"
                    OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button ID="SaveBtn" runat="server"
                        Text="Save &amp; Close" CssClass="formbtn" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="formbtn" OnClick="CloseBtn_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

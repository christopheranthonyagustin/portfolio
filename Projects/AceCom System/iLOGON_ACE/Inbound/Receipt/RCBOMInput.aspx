<%@ Page Language="c#" CodeBehind="RCBOMInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.RCBOMInput" %>

<%@ Register TagPrefix="iWMS" TagName="iInput" Src="../../Control/iInputCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RCBOMInput</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="DetailLbl" runat="server">Detail</asp:Label>&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iInput ID="iInput" runat="server"></iWMS:iInput>
                <br>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                &nbsp;<asp:Button ID="SaveBtn" runat="server" Text="Save &amp; Close" CssClass="formbtn"
                    OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="formbtn" OnClick="CloseBtn_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

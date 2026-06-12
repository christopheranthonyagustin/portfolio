<%@ Page Language="c#" CodeBehind="IssueCopy.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.IssueCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy@Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                    <asp:Button ID="CopyBtn" runat="server" Text="Submit" OnClick="CopyBtn_Click" CssClass="white"></asp:Button>
                </td>
            </tr>
            <tr>
                <td valign="top" align="right" colspan="2">
                    <asp:Label ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueShipPOD.aspx.cs" Inherits="iWMS.Web.Outbound.IssueShipPOD.IssueShipPOD" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Shipped / POD</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

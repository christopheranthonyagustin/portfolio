<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueShipPODMenu.aspx.cs"
    Inherits="iWMS.Web.Outbound.IssueShipPOD.IssueShipPODMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>IssueShipPOD</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <%---     Ticket #4940: DNKH : Enhancement to Issue Ship / POD Added By SAN 03/01/19----%>
        <tr>
            <td class="NewModuleTitle" align="left">
             <asp:Label ID="ReportNameLbl" runat="server">Issue Ship/POD</asp:Label>               
            </td>
            <td>
                <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

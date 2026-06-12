<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionV2Menu.aspx.cs" Inherits="iWMS.Web.Adm.ConnectionV2.ConnectionV2Menu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ConnectionV2Menu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="9" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr>
            <td>
                <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
            </td>
            <td class="NewModuleTitle" align="right">
                <asp:Label ID="AppLbl" runat="server">ConnectionV2</asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountMenu.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CustomerAccountMenu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1">
                    <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td class="NewModuleTitle" align="right">
                    <asp:Label ID="VehicleLbl" labelclass="NewModuleTitle" runat="server">CustomerAccount</asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginLogMenu.aspx.cs" Inherits="iWMS.Web.Adm.LoginLog.LoginLogMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>LoginLogMenu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runast="server" />
    <table width="100%">
        <tr>
            <td>
                <input type="hidden" id="tb1" value="1">
                <iWMS:Tabs ID="MenuTabs" runat="server">
                </iWMS:Tabs>
            </td>
            <td class="NewModuleTitle" align="right">
                <asp:Label ID="LoginLogLbl" labelclass="NewModuleTitle" runat="server">LoginLog</asp:Label></div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripStatusQueryMenu.aspx.cs" Inherits="iWMS.Web.Job.TripStatusQuery.TripStatusQueryMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Status Query</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td class="ModuleTitle" align="right">
                    <asp:Label ID="Label1" Style="color: Black; font-size: medium; font-weight: bold" runat="server">Trip Status Query&nbsp;&nbsp;</asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

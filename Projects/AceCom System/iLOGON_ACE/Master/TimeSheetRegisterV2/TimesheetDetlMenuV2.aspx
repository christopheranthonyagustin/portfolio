<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimesheetDetlMenuV2.aspx.cs" Inherits="iWMS.Web.Master.TimeSheetRegisterV2.TimesheetDetlMenuV2" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script src="../../js/Script.js" type="text/javascript"></script>
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
                    <asp:Label ID="MenuLbl" Style="color: Black; font-size: medium; font-weight: bold" runat="server"></asp:Label>
                </td>
                <asp:Label id="test" Visible="false" runat="server" ></asp:Label>
            </tr>
        </table>
    </form>
</body>
</html>

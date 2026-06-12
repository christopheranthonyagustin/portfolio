<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="c#" CodeBehind="ControlMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Control.ControlMenu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ControlMenu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body style="border-bottom: #d5d5d5 1px solid" bottommargin="0" leftmargin="0" rightmargin="8"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table width="100%">
            <tr>
                <td>
                    <input id="tb1" value="1" type="hidden"><iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td class="NewModuleTitle" align="right">
                    <div style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px; padding-top: 3px; left: 2px">
                        <asp:Label ID="MenuLbl" runat="server">Control</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

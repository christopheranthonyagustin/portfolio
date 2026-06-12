<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="c#" CodeBehind="AllocationMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Logic.Allocation.AllocationMenu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AllocationMenu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">

        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table width="100%">
            <tr>
                <td>
                    <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td class="ModuleTitle" align="right">

                    <div class="NewModuleTitle">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

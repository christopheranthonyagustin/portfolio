<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccountMenu.aspx.cs" Inherits="iWMS.Web.Adm.UserAccount.UserAccountMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="6" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <input type="hidden" id="tb1" value="1">
                <iWMS:Tabs ID="MenuTabs" runat="server">
                </iWMS:Tabs>
            </td>
            <td class="ModuleTitle" align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="UserLbl" runat="server"></asp:Label></div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

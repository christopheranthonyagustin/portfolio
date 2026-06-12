<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankStoringOrderMenu.aspx.cs"
    Inherits="iWMS.Web.Inbound.TankStoringOrder.TankStoringOrderMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title></title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <a onclick="document.getElementById('tb1').value=1;">
                        <iWMS:Tabs ID="MenuTabs2" runat="server"></iWMS:Tabs>
                    </a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWMenu.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="7" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1" />
                    <a onclick="document.getElementById('tb1').value=1;">
                        <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

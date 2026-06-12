<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessPointManagerMenu.aspx.cs" Inherits="iWMS.Web.VLMTask.AccessPointManager.AccessPointManagerMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager" />
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1">
                    <a onclick="document.getElementById('tb1').value=1;">
                        <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

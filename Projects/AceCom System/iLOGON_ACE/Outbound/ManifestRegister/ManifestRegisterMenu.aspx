<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterMenu.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ManifestRegisterMenu</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr>
            <td>
                <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
            </td>
            <td align="right">
                <div class="NewModuleTitle">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Manifest Register</asp:Label>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
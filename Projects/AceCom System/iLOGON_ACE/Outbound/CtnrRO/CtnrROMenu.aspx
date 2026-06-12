<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrROMenu.aspx.cs" Inherits="iWMS.Web.Outbound.CtnrRO.CtnrROMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >

<html >
<head runat="server">
    <title>CtnrROMenu</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Container Release Order</asp:Label>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

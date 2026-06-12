<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVMenu.aspx.cs"
    Inherits="iWMS.Web.Sales.Quotation_V.QuotationVMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title></title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #d5d5d5 1px solid">
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
            <td align="right">
                <div class="NewModuleTitle">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server"></asp:Label>
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

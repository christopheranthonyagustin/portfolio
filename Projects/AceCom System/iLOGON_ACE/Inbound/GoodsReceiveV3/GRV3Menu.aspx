<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3Menu.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3Menu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Menu @ GoodsReceiveV3</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
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
                        <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Goods Receive V3</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

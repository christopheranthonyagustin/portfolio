<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="c#" CodeBehind="ReleaseOrderMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrderMenu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="7" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a></td>
                <td class="NewModuleTitle" align="right">
                    <div style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px; padding-top: 3px; left: 2px">
                        <asp:Label ID="MenuLbl" runat="server">Release Order</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

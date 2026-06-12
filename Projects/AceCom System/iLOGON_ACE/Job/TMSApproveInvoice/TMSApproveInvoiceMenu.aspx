<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSApproveInvoiceMenu.aspx.cs" Inherits="iWMS.Web.Job.TMSApproveInvoice.TMSApproveInvoiceMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMSTripQueue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="15" style="border-bottom: #D5D5D5 1px solid;" onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style1">
                    <input type="hidden" id="tb1" value="1" /><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="NewModuleTitle" align="right" valign="bottom">
                    <asp:Label ID="MenuLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

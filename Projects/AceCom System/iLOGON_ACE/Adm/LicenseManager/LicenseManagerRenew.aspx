<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicenseManagerRenew.aspx.cs" Inherits="iWMS.Web.Adm.LicenseManager.LicenseManagerRenew" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Renew License @ License Manager</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <base target="_self">   
</head>
<body onload="javascript:window.focus();">
    <form id="form1" method="post" runat="server">    
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 2px"></td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                    &nbsp;
                    <asp:Button ID="GenerateBtn" CssClass="white" runat="server" OnClick="GenerateBtn_Click" Text="Generate" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr style="height: 3px"></tr>
            <tr>
                <td style="width: 2px"></td>
                <td>
                    <asp:Label ID="LicenseKeyLbl" runat="server" Text="License Key" Font-Bold="true"></asp:Label>
                    <br />
                    <telerik:RadTextBox ID="LicenseKeyTxt" runat="server" ReadOnly="true" 
                        Skin="WebBlue" Width="520px">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterFreightDetlForm.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterFreightDetlForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ManifestRegisterFreightDetlForm</title>
    <base target="_self" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id ="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Manifest Register Freight Detail</asp:Label>
            </td>
        </tr>
    </table>
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td width="5%">
            </td>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"  
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

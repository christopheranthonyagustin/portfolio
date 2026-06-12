<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="TransferCandSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.HouseKeeping.Transfer.TransferCandDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransferDetlSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Inventory Transfer (Step 1 of 3)</asp:Label>
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td align="left">
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true"></asp:Button>
                &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    </form>
</body>
</html>

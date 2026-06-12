<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionStockAdjustmentCandSearch.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionStockAdjustment.DistributionStockAdjustmentCandSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransferDetlSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <td>
            <br />
            <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Adjustment (Step 1 of 3)</asp:Label>
        </td>
        <br />
        <br />
        <telerik:RadButton ID="SearchBtn" runat="server" Text="Search" CssClass="detailButton"
            OnClick="SearchBtn_Click" Skin="WebBlue">
        </telerik:RadButton>
        <br />
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
    </form>
</body>
</html>


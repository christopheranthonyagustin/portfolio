<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentLoadPlanSearch.aspx.cs" Inherits="iWMS.Web.Outbound.ShipmentLoadPlan.ShipmentLoadPlanSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Shipment Load Plan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br /> 
        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Visible="true"  
            Text="Search" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Search" />
    <br />
    <iwms:iform id="formCtl" runat="server"></iwms:iform>
    &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>

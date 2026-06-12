<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayWorkbenchDashboard.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayWorkbenchDashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WavePickingWorkbenchDashboard</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <br />
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_Click">
            <Tabs>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PutawayPlanTab" Text="Putaway Plan" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PutawayPoolTab" Text="Putaway Pool" Value="100" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Id="PendingPutawayRequestTab" Text="Pending Putaway Request" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ShortPutAwayTab" Text="Short Putaway" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="DashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PutawayPlanRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PutawayPoolRadPageView" ContentUrl="PutawayWorkbenchPutawayPool.aspx" />
             <telerik:RadPageView runat="server" Height="90%" ID="PendingPutawayRequestRadPageView"/>
            <telerik:RadPageView runat="server" Height="90%" ID="ShortPutAwayRadPageView"/>

            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

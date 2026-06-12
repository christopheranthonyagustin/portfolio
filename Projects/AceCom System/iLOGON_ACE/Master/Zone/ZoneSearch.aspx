<%@ Page Language="c#" CodeBehind="ZoneSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Zone.ZoneSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ZoneSearch</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="OccupancyTab" Text="Occupancy" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="HealthCheckTab" Text="Health Check" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="670px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="670px" ID="ZoneDashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="670px" ID="OccupancyRadPageView" />
            <telerik:RadPageView runat="server" Height="850px" ID="HealthCheckRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

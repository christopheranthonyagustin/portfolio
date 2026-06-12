<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Search.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvCountV3Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="Schedule" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Location Count Overview" Value="15" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <span class="pagetitle">&nbsp;</span>
                <iWMS:iForm id="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ReplenishDashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ScheduleRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LocationCountOverviewRadPageView" />
        </telerik:RadMultiPage>
    </form>
    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
</body>
</html>

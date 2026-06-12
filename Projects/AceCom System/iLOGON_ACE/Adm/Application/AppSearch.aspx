<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="AppSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Application.AppSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AppSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab Text="Dashboard" Value="10" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                &nbsp;<asp:Button ID="SearchImgBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AppDashboardRadPageView" />
        </telerik:RadMultiPage>
        &nbsp;
    </form>
</body>
</html>

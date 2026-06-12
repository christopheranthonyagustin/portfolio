<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="PurchaseOrderSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.PurchaseOrder.PurchaseOrderSearch" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>PurchaseOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Button ID="SearchImgBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" Text="Search" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ></asp:Button>
                &nbsp;
        <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
            CssClass="green" ToolTip="Export To Excel" /> 
                <br>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ReplenishDashboardRadPageView" />
        </telerik:RadMultiPage>
        &nbsp;&nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
        CssClass="errorLabel"></asp:Label>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

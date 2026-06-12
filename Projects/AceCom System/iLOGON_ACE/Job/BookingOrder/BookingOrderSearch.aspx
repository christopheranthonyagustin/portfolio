<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderSearch.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
</head>
<body>
    <form defaultbutton="SearchBtn" id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="SearchRadPageView">
                <br />
                <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </table>
                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

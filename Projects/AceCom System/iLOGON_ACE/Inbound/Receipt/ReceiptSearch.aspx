<%@ Page Language="c#" CodeBehind="ReceiptSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.Receipt.ReceiptSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptSearch</title>
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload" Value="30" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" CssClass="searchbtn" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                &nbsp;
                <asp:Button ID="Button1" runat="server" Text="Interface" OnClick="InterfaceBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="green" />
                &nbsp;
                <asp:Button ID="MassPrintBtn" runat="server" Text="Mass Print" OnClick="MassPrintBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" Enabled="false" UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

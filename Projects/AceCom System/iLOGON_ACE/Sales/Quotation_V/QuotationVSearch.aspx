<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVSearch.aspx.cs"
    Inherits="iWMS.Web.Sales.Quotation_V.QuotationVSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorQuotationSearch</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Header" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

       <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <br />
        <asp:Button ID="SearchImgBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Search" UseSubmitBehavior="false" />&nbsp;
    
        <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="green" ToolTip="Excel" UseSubmitBehavior="false" />&nbsp;
       <br />
        <br />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>

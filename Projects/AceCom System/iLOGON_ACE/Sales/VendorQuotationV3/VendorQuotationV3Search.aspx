<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorQuotationV3Search.aspx.cs" Inherits="iWMS.Web.Sales.VendorQuotationV3.VendorQuotationV3Search" %>

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
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Button ID="SearchImgBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Search" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="green" ToolTip="Excel" UseSubmitBehavior="false" />
            <br />
    <br />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Header" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView"><br />
                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        
    </form>
</body>
</html>


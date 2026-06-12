<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TradingPartnerSearch.aspx.cs" Inherits="iWMS.Web.Accounting.TradingPartner.TradingPartnerSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TradingPartnerSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Customer" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Supplier" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                 <asp:Button ID="ExportExcelBtn" class="green" runat="server" OnClick="ExportExcelBtn_Click" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="Cutomer_RadPageView">
                <br />
                <asp:Panel runat="server" ID="Panel1">
                    <asp:Button ID="Cust_SearchBtn" runat="server" CssClass="white" Text="Search"
                        OnClick="Customer_SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                       &nbsp;&nbsp;   &nbsp;&nbsp;
                                &nbsp;&nbsp;             
               <asp:Button ID="Customer_excelImgBtn" class="green" runat="server" OnClick="Customer_ExportExcel" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </asp:Panel>
                <br />
                <iWMS:iForm ID="Cust_formCtl" runat="server"></iWMS:iForm>
                <br />
                <br />
                &nbsp;<asp:Label Style="z-index: 0" ID="Label1" runat="server" Visible="False" CssClass="errorLabel" />
                <br />
                <br />
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="Supplier_RadPageView">
                <br />
                <asp:Panel runat="server" ID="Panelbtn">
                    <asp:Button ID="Sup_SearchBtn" runat="server" CssClass="white" Text="Search"
                        OnClick="Supplier_SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                       &nbsp;&nbsp;   &nbsp;&nbsp;
              <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="Supplier_ExportExcel" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </asp:Panel>
                <br />
                <iWMS:iForm ID="Sup_formCtl" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<asp:Label Style="z-index: 0" ID="Label2" runat="server" Visible="False" CssClass="errorLabel" />
                <br />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVAdd.aspx.cs"
    Inherits="iWMS.Web.Sales.Quotation_V.QuotationVAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorQuotationAdd</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>

    </telerik:RadScriptBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
<%--    <telerik:RadButton ID="AddBtn" runat="server" Text="  Add  " Skin="WebBlue" OnClick="AddBtn_Click"
        OnClientClicked="DisableSubmitBtn" UseSubmitBehavior="false">
    </telerik:RadButton>--%>
         <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white"
             OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false"></asp:Button>
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
                <iWMS:iForm ID="formCtl" runat="server" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
            CssClass="RedText" />
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportQuotationPricingDetlSearch.aspx.cs" Inherits="iWMS.Web.Sales.TransportQuotationPricing.TransportQuotationPricingDetlSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesDetlSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
             <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="LineSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />
                    <asp:Button ID="SearchImgBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Search" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 10px">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

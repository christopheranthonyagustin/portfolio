<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportQuotationPricingForm.aspx.cs" Inherits="iWMS.Web.Sales.TransportQuotationPricing.TransportQuotationPricingForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form @ TransportQuotationPricing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Line" Value="100" runat="server" ID="LineTab">
                </telerik:RadTab>
                <telerik:RadTab Text="Project" Value="110" runat="server" ID="ProjectTab">
                </telerik:RadTab>
                <telerik:RadTab Text="QRCode" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="QuoteLineRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="ProjectRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="QRCodeRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

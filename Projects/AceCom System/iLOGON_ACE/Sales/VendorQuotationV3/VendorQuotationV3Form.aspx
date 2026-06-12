<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorQuotationV3Form.aspx.cs" Inherits="iWMS.Web.Sales.VendorQuotationV3.VendorQuotationV3Form" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorQuotationForm</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Line" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td width="45%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                &nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView"><br />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" ToolTip="Update" UseSubmitBehavior="false"></asp:Button>
                &nbsp;&nbsp;
            <br />
            <br />
                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="QuoteLineRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>

    </form>
</body>
</html>

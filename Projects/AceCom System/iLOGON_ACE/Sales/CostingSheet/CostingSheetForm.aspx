<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetForm.aspx.cs"
    Inherits="iWMS.Web.Sales.CostingSheet.CostingSheetForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CostingSheetForm</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Line" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
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
                <td width="45%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                &nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="false"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="QuoteLineRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="errorLabel" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>

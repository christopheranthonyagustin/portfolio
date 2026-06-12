<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARSubledgerSOA.aspx.cs" Inherits="iWMS.Web.Accounting.ARSubledger.ARSubledgerSOA" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ARSubledgerSOA</title>
    <meta id="RefreshMeta" http-equiv="Refresh" runat="server" content=""/>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="SOA" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <table border="0" style="border-spacing: 0px;">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="compile_Click" runat="server" Text="Run" CssClass="white" ToolTip="Run"
                                OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                <br />
                            &nbsp;&nbsp;
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <table style="width: 100%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label7" Text="Selection of TransactionCurrency will only list transactions in that selected currency. " Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;
                        <br />
                        &nbsp;<asp:Label ID="Label12" Text="Selection of ReportInBaseCurrency will list all outstanding transactions in base currency amount. " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="compile_Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

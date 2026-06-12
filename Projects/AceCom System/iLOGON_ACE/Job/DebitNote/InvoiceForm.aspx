<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="InvoiceForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.DebitNote.InvoiceForm" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>InvoiceForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="BillingTypes" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Storage" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="System" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Adhoc" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Fixed" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="FreightIn" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="FreightOut" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Transport" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Manual" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Summary" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Job" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="JobAttc" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="730" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Equipment" Value="750" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="SplitTab" Text="Split" Value="800" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><br />&nbsp;
                            <asp:Button ID="PrintBth" runat="server" Text="Invoice" CssClass="blue" CausesValidation="false"
                                OnClick="PrintInvoice_Click" ToolTip="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                    &nbsp;
                            <asp:Button ID="DReBillImgBtn" runat="server" Text="eBilling" OnClick="DReBillImgBtn_Click"
                                CssClass="green" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td><br />&nbsp;
                        <asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white"
                            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id, true)" Visible="false"
                            ToolTip="Update" UseSubmitBehavior="false"></asp:Button>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="BillingTypesRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="StorageRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SystemRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AdhocRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FixedRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FreightInRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="FreightOutRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TransportRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ManualRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SummaryRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="JobRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="JobAttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="EquipmentRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SplitRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
            CssClass="RedText" />
    </form>
</body>
</html>

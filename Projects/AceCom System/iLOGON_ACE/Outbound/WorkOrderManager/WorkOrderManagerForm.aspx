<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerForm.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>WorkOrderManagerForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab ID="MainTab" Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="BillofMaterialTab" Text="Bill of Material" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="WithdrawRecordsTab" Text="Withdraw Records" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="DepositRecordsTab" Text="Deposit Records" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="LogTab" Text="Log" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td width="45%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <br>
                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br>
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="BillofMaterialTabRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="WithdrawRecordsRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="DepositRecordsRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="WorkOrderManagerLog" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderSearch.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSBookingOrderSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form defaultbutton="SearchBtn" id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge sheet ready for approval" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge sheet ready for billing" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ChargeSearch" Value="30" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                                OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel"
                                OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="ChargeSheetReadyForApproval"/>
            <telerik:RadPageView runat="server" Height="600px" ID="ChargeSheetReadyForBilling" />
            <telerik:RadPageView runat="server" Height="600px" ID="ChargeSearchRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

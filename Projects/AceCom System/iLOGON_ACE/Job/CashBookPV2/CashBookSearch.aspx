<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="CashBookSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.CashBookPV2.CashBookSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" ID="SearchTab" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" ID="DashboardTab" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">&nbsp;
               <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                   OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
               <asp:Button ID="Excelbtn" runat="server" Text="Excel" OnClick="Excelbtn_Click"
                   OnClientClick="disableBtn(this.id)" ToolTip="Export to Excel" UseSubmitBehavior="false" CssClass="green" />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td><br />
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CashBookDashboardRadPageView" />
        </telerik:RadMultiPage>
        <%-- <asp:ImageButton ID="SearchImgBtn" runat="server" ImageUrl="../../Image/Search.png"
            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />--%>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="False"
            CssClass="errorLabel"></asp:Label>
        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

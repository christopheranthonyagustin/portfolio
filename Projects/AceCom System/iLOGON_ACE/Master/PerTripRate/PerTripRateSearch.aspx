<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerTripRateSearch.aspx.cs"
    Inherits="iWMS.Web.Master.PerTripRate.PerTripRateSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PerVoidServiceChit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" style="z-index: 0" defaultbutton="btnsearch">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="SearchBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                &nbsp;<%--<asp:ImageButton ID="btnExcel" runat="server" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" OnClick="ExportExcel" BackColor="Transparent" ImageUrl="../../Image/Excel.png" />--%>
                <asp:Button ID="btnExcel" runat="server" Text="Excel" OnClick="ExportExcel"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="Excel" UseSubmitBehavior="false" CssClass="green" />
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                            <tr>
                                <td class="style1">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

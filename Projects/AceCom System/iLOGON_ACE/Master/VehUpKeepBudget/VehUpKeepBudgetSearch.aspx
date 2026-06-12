<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehUpKeepBudgetSearch.aspx.cs"
    Inherits="iWMS.Web.Master.VehUpKeepBudget.VehUpKeepBudgetSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VehUpKeepBudget</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" style="z-index: 0" defaultbutton="btnsearch">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <%-- <asp:ImageButton ID="btnsearch" runat="server" ImageUrl="../../Image/Search.png"
            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" ToolTip="Search" OnClick="SearchBtn_Click" />--%>
        <asp:Button ID="btnsearch" class="white" runat="server" OnClick="SearchBtn_Click" 
            Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <%--    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main Info" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;
    </form>
</body>
</html>

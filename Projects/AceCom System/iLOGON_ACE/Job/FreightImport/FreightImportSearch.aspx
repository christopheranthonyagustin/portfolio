<%@ Page Language="c#" CodeBehind="FreightImportSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.FreightImport.FreightImportSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightImportSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="True"
            SelectedIndex="0" CausesValidation="False" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server" Selected="True"></telerik:RadTab>
                <telerik:RadTab Text="Party" Value="100" runat="server"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
        &nbsp;
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenImageSearch.aspx.cs" Inherits="iWMS.Web.Master.GeneralAttached.GenImageSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>GenImageSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <form id="Form1" method="post" runat="server">
        <br />&nbsp;
        <telerik:RadButton Style="z-index: 0" ID="SearchBtn" runat="server" CssClass="detailbutton" Skin="WebBlue"
            Text="Search" OnClick="SearchBtn_Click">
        </telerik:RadButton>
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>

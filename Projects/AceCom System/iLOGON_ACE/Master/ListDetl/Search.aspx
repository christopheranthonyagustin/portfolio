<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.ListDetl.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListDetlSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click"
                    Text="Search" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                &nbsp;
                     <asp:Button ID="excelBtn" class="green" runat="server" OnClick="ExportExcel"
                         Text="Excel" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Export To Excel" />

                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                <br>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

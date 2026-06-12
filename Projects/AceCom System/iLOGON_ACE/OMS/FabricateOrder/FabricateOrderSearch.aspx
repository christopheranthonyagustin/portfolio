<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricateOrderSearch.aspx.cs" Inherits="iWMS.Web.OMS.FabricateOrder.FabricateOrderSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Fabricate Order Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" ID="SearchTab" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchBtn" runat="server" CssClass="searchbtn" Text="Search"
                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                    CssClass="green" ToolTip="Export To Excel" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,false)" /> 
                <br />
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterSearch.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>ServiceRegisterSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Button ID="SearchImgBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        &nbsp;
        <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Book-a-Date" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="RadPageView1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="100%" ID="BookADateRadPageView" />
        </telerik:RadMultiPage>
        &nbsp;
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label></form>
</body>
</html>

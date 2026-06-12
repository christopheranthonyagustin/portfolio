<%@ Page Language="c#" CodeBehind="PTSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PickTicket.PTSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PTSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />        <%--    <asp:ImageButton ID="SearchImgBtn" runat="server" ImageUrl="../../Image/Search.png"
            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />--%>
        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp; 
        <%--<telerik:RadButton ID="SearchBtn" runat="server" Text="Search" Skin ="WebBlue" CssClass="detailbutton" OnClick="SearchBtn_Click">
    </telerik:RadButton>--%><br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;&nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

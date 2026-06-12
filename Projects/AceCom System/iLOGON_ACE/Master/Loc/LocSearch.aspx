<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="LocSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Loc.LocSearch" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Location</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Button1">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ListLookuptab" Text="List Lookup" Value="15" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="Button1" class="searchbtn" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> <!--changed class to searchbtn CT Ticket #17381 28 Dec 2023-->
                &nbsp;

                <asp:Button ID="excelImgBtn" CssClass="green" runat="server" OnClick="ExportExcel"
                                    Text="Excel" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                &nbsp; &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LocDashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LocListLookupRadPageView"/>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

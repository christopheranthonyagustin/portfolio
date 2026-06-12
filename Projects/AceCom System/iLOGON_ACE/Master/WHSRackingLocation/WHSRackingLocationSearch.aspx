<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSRackingLocationSearch.aspx.cs" Inherits="iWMS.Web.Master.WarehouseRackingLocation.WarehouseRackingLocationSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>WarehouseRackingLocationSearch</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Button1">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="Button1" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>

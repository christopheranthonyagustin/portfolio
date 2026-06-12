<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrReleaseOrderAdd.aspx.cs"
    Inherits="iWMS.Web.Outbound.CtnrReleaseOrder.CtnrReleaseOrderAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReleaseOrderAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
        <br />
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
            OnClientClick="disableBtn(this.id,false)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />
            <br />
            <iWMS:iForm ID="formCtl" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>

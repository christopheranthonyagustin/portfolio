<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderAdd.aspx.cs" Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TankReleaseOrderAdd</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body>
    <form id="form" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;   
        <asp:Button ID="addBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="true"  
            Text="Add" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
    <br />
    <br />
    <br />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <iWMS:iForm ID="formCtl" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>


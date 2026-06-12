<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV2Add.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV2.InvCountV2Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>AdjustmentAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="AddBtn" class="white" runat="server" Visible="true" OnClick="AddBtn_Click" Text="Add" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
        <br />
        <span class="pagetitle">&nbsp;</span>
        <iWMS:iForm id="formCtl" runat="server"></iWMS:iForm>&nbsp;
			<asp:Button ID="UpdateBtn" class="white" runat="server" Visible="False" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

        &nbsp;
            <asp:Button ID="AddDetailBtn" class="white" runat="server" Visible="False" OnClick="AddDetailBtn_Click" Text="Add Detail" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

    </form>
</body>
</html>

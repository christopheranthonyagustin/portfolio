<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageTypeSKUGroupAdd.aspx.cs" Inherits="iWMS.Web.Master.StorageTypeSKUGroup.StorageTypeSKUGroupAdd" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>StorageTypeSkuGroupAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
            Text="Add" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
        <br />
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br>       
        <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
            Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
        <asp:Button Style="z-index: 0" ID="AddDetailBtn" runat="server" Text="+ More Functions"
            Visible="False" CssClass="detailButton" OnClick="AddDetailBtn_Click"></asp:Button>
    </form>
</body>
</html>


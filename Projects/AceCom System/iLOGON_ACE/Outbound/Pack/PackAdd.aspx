<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="PackAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
        <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
        <br />
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white"
            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
        &nbsp;
    <asp:Button ID="AddDetailBtn" runat="server" Text="+Detail" Visible="False" CssClass="white"
        OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
    </form>
</body>
</html>

<%@ Page Language="c#" CodeBehind="CashBookAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CashBookPV.CashBookAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <p>
            &nbsp;<asp:Button ID="AddBtn" runat="server" Text="  Add  " CssClass="white" OnClick="AddBtn_Click"
                OnClientClick="this.disabled = true;  this.value = 'Processing...';" UseSubmitBehavior="False"></asp:Button>
            <br />
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            &nbsp; &nbsp;
        </p>
        <p>
            <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
                HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
                EnableClientScript="true"></asp:ValidationSummary>
        </p>
    </form>
</body>
</html>

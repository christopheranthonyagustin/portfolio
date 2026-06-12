<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APSubledgerCopy.aspx.cs" Inherits="iWMS.Web.Accounting.APSubledger.APSubledgerCopy" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Copy @ AP Subsidiary Ledger</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache" />
    <base target="_self" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        &nbsp;
        <asp:Label ID="MsgLbl" Font-Size="110%" runat="server" Visible="true" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy "
            OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
    </form>
</body>
</html>

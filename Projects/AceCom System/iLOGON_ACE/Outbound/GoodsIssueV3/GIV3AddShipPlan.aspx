<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3AddShipPlan.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3AddShipPlan" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Ship Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
</head>
<script type="text/javascript">
    function GetRadWindow() {
        var oWindow = null; if (window.radWindow)
            oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
    }

    function closeWin(url) {
        GetRadWindow().BrowserWindow.location.href = url;
        GetRadWindow().close();
    }

    function close() {
        GetRadWindow().close();
    }
</script>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <span class="pagetitle">&nbsp;
        <asp:Label ID="IssueLbl" runat="server" CssClass="pagetitle">Ship Issue #</asp:Label></span><br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
    <table width="80%" cellpadding="0" cellspacing="0">
        <tr align="right">
            <td>
                <asp:Button ID="BackOrderBtn" runat="server" Text="Backorder" OnClick="BackOrderBtn_Click" Visible="false"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="Confirm" OnClick="AddBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

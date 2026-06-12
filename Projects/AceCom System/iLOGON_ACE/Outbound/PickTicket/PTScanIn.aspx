<%@ Page Language="c#" CodeBehind="PTScanIn.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.PickTicket.PTScanIn" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Check-In @ Register Pick</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="ScansInBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%" cellpadding="2" cellspacing="2">
             <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            <tr>
                <td>
                    <asp:Button ID="ScansInBtn" class="white" runat="server" OnClick="ScanInBtn_Click" Text="CheckIn" 
                          OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="ResetBtn" class="white" runat="server" OnClick="ResetBtn_Click" Text="Reset" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

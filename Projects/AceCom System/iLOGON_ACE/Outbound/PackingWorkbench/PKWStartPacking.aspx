<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWStartPacking.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWStartPacking" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Start Packing @ Packing Workbench</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
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
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </tr>
            <tr>                
                <td><br />
                    &nbsp;<asp:Button ID="ProceedBtn" CssClass="white" runat="server" OnClick="ProceedBtn_Click" Text="Proceed"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;<asp:Button ID="CloseBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseBtn_Click" Text="Close Window"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br />
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>


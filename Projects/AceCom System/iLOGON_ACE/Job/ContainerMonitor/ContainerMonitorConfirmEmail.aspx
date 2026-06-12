<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorConfirmEmail.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitor.ContainerMonitorConfirmEmail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>Container Monitor Confirm Email</title>
    <%--<base target="_self" />--%>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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
    <form id="form1"  method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click" CausesValidation="false"
            Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    </form>
</body>
</html>

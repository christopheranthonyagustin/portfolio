<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3NotifyTransport.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3NotifyTransport" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Notify Transport</title>
    <base target="_self" />
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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />&nbsp;&nbsp;
         <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click" CausesValidation="true" Text="Confirm"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
    </form>
</body>
</html>

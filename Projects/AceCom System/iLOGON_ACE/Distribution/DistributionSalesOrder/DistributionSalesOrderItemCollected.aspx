<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderItemCollected.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderItemCollected" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DistributionSalesOrderItemCollected</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />

        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm"
                        OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="CloseBtn_Click" Text="Close"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

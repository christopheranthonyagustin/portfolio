<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderContainerTransferEqp.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderContainerTransferEqp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transfer Equipment @TMSBookingOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self"/>
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
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <br />
                &nbsp;&nbsp;<asp:Label ID="jbnolbl" runat="server" Font-Size="Small">ToJobNo</asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;<telerik:RadTextBox ID="JbNoTxt" runat="server" Style="z-index: 0" Width="155px">
                </telerik:RadTextBox>
            </tr>
            <tr>
                <br />
                <br />
                <br />
                <br />
                <td>&nbsp;&nbsp;
                <asp:Button ID="TransferTripsBtn" runat="server" CssClass="white" Text="Transfer"
                    OnClick="TransferTripsBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

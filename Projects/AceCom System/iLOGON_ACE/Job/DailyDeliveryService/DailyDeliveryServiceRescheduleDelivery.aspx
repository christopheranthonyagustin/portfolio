<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceRescheduleDelivery.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceRescheduleDelivery" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Redeliver @ Daily Delivery Service</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Label ID="MessageLbl" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <div>
            <table border="0" cellspacing="2" cellpadding="2" style="float: left">                
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                       
                        <br/>
                        <asp:Button ID="RescheduleBtn" runat="server" Text="Redeliver" ToolTip="Reschedule" OnClick="RescheduleBtn_Click" class="white" CausesValidation="false" />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="CancelBtn" runat="server" CssClass="LongLabelWhite" Text=" Close Window " ToolTip="CloseWindow" OnClick="CancelBtn_Click" class="white" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

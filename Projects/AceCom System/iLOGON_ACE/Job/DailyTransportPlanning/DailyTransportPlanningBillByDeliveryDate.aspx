<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningBillByDeliveryDate.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningBillByDeliveryDate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Bill @ Daily Transport Planning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
        <div>
            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
<%--                <tr>
                    <td>
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit" ToolTip="Submit" OnClick="SubmitBtn_Click" class="white" CausesValidation="false" />

                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" ToolTip="Cancel" OnClick="CancelBtn_Click" class="white" />
                        <br /><br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>--%>
            </table>
        </div>
    </form>
</body>
</html>
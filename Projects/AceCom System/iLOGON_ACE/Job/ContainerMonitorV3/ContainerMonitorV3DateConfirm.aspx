<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorV3DateConfirm.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitorV3.ContainerMonitorV3DateConfirm" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>ConfirmDate @ ContainerMonitorV3</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="frdatelbl" runat="server" Text="ReadyDate"> 
                        </asp:Label>
                        <br />
                        <telerik:RadDateTimePicker ID="FromDateTxt" runat="server" Width="170" AutoPostBack="true"
                            DateInput-DateFormat="dd/MMM/yyyy HH:mm" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" PopupDirection="BottomRight" Skin="Office2007">
                        </telerik:RadDateTimePicker>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" OnClientClick="disableBtn(this.id)" OnClick="ConfirmBtn_Click" UseSubmitBehavior="false" />
        </asp:Panel>
    </form>
</body>
</html>

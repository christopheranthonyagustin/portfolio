<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderCtnrSwitchPOD.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderCtnrSwitchPOD" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SwitchPODDepot</title>
    <base target="_self" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

         <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

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
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0">
            <tr>
                <td>
                    &nbsp; &nbsp;
                    <telerik:RadButton ID="SwitchBtn" runat="server" OnClick="SwitchBtn_OnClick" Text="Switch" Skin="WebBlue"
                        SingleClick="true" SingleClickText="Processing...">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <b>
                        Please select the new POD Depot to switch to for the selected Tanks.
                    </b>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

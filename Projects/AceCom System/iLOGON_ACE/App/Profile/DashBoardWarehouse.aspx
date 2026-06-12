<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardWarehouse.aspx.cs" Inherits="iWMS.Web.App.Profile.DashBoardWarehouse" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Warehouse Dashboard</title>
    <link rel="stylesheet" href="../../css/Dashboard.css" type="text/css" />
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="width: 100%; display: block;">
            <tr>
                <td>
                    <div id="OutstandingPO" class="ReadyToExport" onclick="OpenRadWindow('OutstandingPO')">
                        Outstanding PO
                        <br />
                        <asp:Label ID="OutstandingPOLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="OutstandingPOLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
                <td>
                    <div id="OutstandingGRToday" class="ReadyToExport" onclick="OpenRadWindow('OutstandingGRToday')">
                        Outstanding GR Today
                        <br />
                        <asp:Label ID="OutstandingGRTodayLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="OutstandingGRTodayLbl1" runat="server" Text="container(s)" Font-Bold="false" CssClass="ContainerLbl"></asp:Label>
                    </div>
                </td>
                <td>
                    <div id="OutstandingGIToday" class="ReadyToExport" onclick="OpenRadWindow('OutstandingGIToday')">
                        Outstanding GI Today
                        <br />
                        <asp:Label ID="OutstandingGItodayLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="OutstandingGItodayLbl1" runat="server" Text="container(s)" Font-Bold="false" CssClass="ContainerLbl"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="750px" Height="620px" Left="170px" Top="15px"
            Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false">
        </telerik:RadWindowManager>
        <script type="text/javascript">
            function OpenRadWindow(DivId) {
                var Value = DivId;
                if (Value == "OutstandingPO") {
                    window.radopen("../Profile/DashBoardShowWarehouse.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "OutstandingGRToday") {
                    window.radopen("../Profile/DashBoardShowWarehouse.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "OutstandingGIToday") {
                    window.radopen("../Profile/DashBoardShowWarehouse.aspx?DashBoardVal=" + Value);
                }
            }
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </form>
</body>
</html>

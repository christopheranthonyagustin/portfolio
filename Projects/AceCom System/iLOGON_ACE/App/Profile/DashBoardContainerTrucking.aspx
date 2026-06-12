<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardContainerTrucking.aspx.cs" Inherits="iWMS.Web.App.Profile.DashBoardContainerTrucking" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Trucking Dashboard</title>
    <link rel="stylesheet" href="../../css/Dashboard.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="width: 100%; display: block;">
            <tr>
                <td>
                    <div id="ReadyToExport" class="ReadyToExport" onclick="OpenRadWindow('ReadyToExport')">
                        Ready To Export
                        <br />
                        <asp:Label ID="ReadyToExportLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ReadyToExportLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    <br />
                </td>
                <td>
                    <div id="ReadyToImport" class="ReadyToImport" onclick="OpenRadWindow('ReadyToImport')">
                        Ready To Import
                        <br />
                        <asp:Label ID="ReadyToImportLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ReadyToImportLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
                <td>
                    <div id="ReadyToCollect" class="ReadyToCollect" onclick="OpenRadWindow('ReadyToCollect')">
                        Ready To Collect
                        <br />
                        <asp:Label ID="ReadyToCollectLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ReadyToCollectLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="ReadyToReturn" class="ReadyToReturn" onclick="OpenRadWindow('ReadyToReturn')">
                        Ready To Return
                        <br />
                        <asp:Label ID="ReadyToReturnLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ReadyToReturnLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <div id="ContainersDueToday" class="ReadyToExport" onclick="OpenRadWindow('ContainersDueToday')">
                        Containers Required Date Due Today
                        <br />
                        <asp:Label ID="ContainersDueTodayLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ContainersDueTodayLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <div id="ListofVesselETAToday" class="ReadyToExport" onclick="OpenRadWindow('ListofVesselETAToday')">
                        List of Vessel ETA Today
                        <br />
                        <asp:Label ID="ListOfVesselETATodayLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="ListOfVesselETATodayLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="InternalShifting" class="ReadyToExport" onclick="OpenRadWindow('InternalShifting')">
                        Internal Shifting Due Today
                        <br />
                        <asp:Label ID="InternalShiftingLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="InternalShiftingLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
                 <td>
                    <div id="DetourJobDueToday" class="ReadyToExport" onclick="OpenRadWindow('DetourJobDueToday')">
                        Detour Jobs Due Today
                        <br />
                        <asp:Label ID="DetourJobDueTodayLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="DetourJobDueTodayLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
                  <td>
                    <div id="Detentionin24Hours" class="ReadyToExport" onclick="OpenRadWindow('Detentionin24Hours')">
                        Detention in 24 Hrs
                        <br />
                        <asp:Label ID="Detention24HrsLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="Detention24HrsLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
            </tr> 
            <tr>               
                 <td>
                    <div id="Detentionin48Hours" class="ReadyToExport" onclick="OpenRadWindow('Detentionin48Hours')">
                        Detention in 48 Hrs
                        <br />
                        <asp:Label ID="Detention48HrsLbl" runat="server" CssClass="ParentContainerLbl"></asp:Label><br />
                        <asp:Label ID="Detention48HrsLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
            </tr> 
        </table>
        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="750px" Height="620px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
        <script type="text/javascript">
            function OpenRadWindow(DivId) {
                var Value = DivId;
                if (Value == "ReadyToExport") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToImport") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToCollect") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToReturn") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ContainersDueToday") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ListofVesselETAToday") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "InternalShifting") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "DetourJobDueToday") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "Detentionin24Hours") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "Detentionin48Hours") {
                    window.radopen("../Profile/DashBoardShowContainers.aspx?DashBoardVal=" + Value);
                }
            }
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </form>
</body>
</html>

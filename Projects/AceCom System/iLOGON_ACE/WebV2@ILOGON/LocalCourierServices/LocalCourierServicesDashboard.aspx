<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesDashboard.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.LocalCourierServices.LocalCourierServicesDashboard" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuSO" Src="~/WebV2@ILOGON/Control/LocalCourierServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Dashboard @ LocalCourierServices</title>
    <link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <iWMS:WebV2MenuSO ID="WebV2MenuSO" runat="server"></iWMS:WebV2MenuSO>

        <div id="SubMenuDiv" class="submenu">
            <a href="LocalCourierServicesShipmentOrder.aspx" id="All" runat="server">All</a>
            <a href="LocalCourierServicesSubmitted.aspx" id="Submitted" runat="server">Order Submitted</a>
            <a href="LocalCourierServicesAccepted.aspx" id="Accepted" runat="server">Order Accepted</a>
            <a href="LocalCourierServicesWIP.aspx" id="WIP" runat="server">To Be Delivered</a>
            <a href="LocalCourierServicesCompleted.aspx" id="Completed" runat="server">Delivered</a>
            <a class="active" href="LocalCourierServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <table style="width: 100%; display: flex; height: auto; background: white; justify-content: space-around;">
            <tr>
                <td>
                    <div id="ALLDiv" class="ParentDashboard" style="border-top: 7px solid #7b79c7;">
                        <asp:Label runat="server" Text="ALL" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 72%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="ALLLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="SubmittedDiv" class="ParentDashboard" style="border-top: 7px solid #ff4d4d;">
                        <asp:Label runat="server" Text="Order Submitted" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 32%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="SubmittedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="AcceptedDiv" class="ParentDashboard" style="border-top: 7px solid #66ff66;">
                        <asp:Label runat="server" Text="Order Accepted" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 35%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="AcceptedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="WIPDiv" class="ParentDashboard" style="border-top: 7px solid #ffff33;">
                        <asp:Label runat="server" Text="To Be Delivered" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 35%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="WIPLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="CompletedDiv" class="ParentDashboard" style="border-top: 7px solid #ff66a3;">
                        <asp:Label runat="server" Text="Delivered" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 55%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="CompletedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

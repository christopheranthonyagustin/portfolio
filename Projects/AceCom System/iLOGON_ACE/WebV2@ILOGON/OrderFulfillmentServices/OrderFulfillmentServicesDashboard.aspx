<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderFulfillmentServicesDashboard.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.OrderFulfillmentServices.OrderFulfillmentServicesDashboard" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuRO" Src="~/WebV2@ILOGON/Control/OrderFulfillmentServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Dashboard @ Order Fulfillment Services</title>
    <link rel="stylesheet" href="../Style/OrderFulfillmentServices.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Script/OrderFulfillmentServices.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <iWMS:WebV2MenuRO ID="WebV2MenuRO" runat="server"></iWMS:WebV2MenuRO>

        <div id="SubMenuDiv" class="submenu">
            <a href="OrderFulfillmentServicesReleaseOrder.aspx" id="All" runat="server">All</a>
            <a href="OrderFulfillmentServicesDraft.aspx" id="Draft" runat="server">Draft</a>
            <a href="OrderFulfillmentServicesSubmitted.aspx" id="Submitted" runat="server">Submitted</a>
            <a href="OrderFulfillmentServicesAccepted.aspx" id="Accepted" runat="server">Accepted</a>
            <a href="OrderFulfillmentServicesCompleted.aspx" id="Completed" runat="server">Completed</a>
            <a href="OrderFulfillmentServicesRejected.aspx" id="Rejected" runat="server">Rejected</a>
            <a href="OrderFulfillmentServicesCancelled.aspx" id="Cancelled" runat="server">Cancelled</a>
            <a class="active" href="OrderFulfillmentServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <table style="width: 100%; display: flex; height: auto; background: white; justify-content: space-around;">
            <tr>
                <td>
                    <div id="DraftDiv" class="ParentDashboard" style="border-top: 7px solid #7b79c7;">
                        <asp:Label runat="server" Text="Draft" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 68%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="DraftLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="SubmittedDiv" class="ParentDashboard" style="border-top: 7px solid #ff4d4d;">
                        <asp:Label runat="server" Text="Submitted" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 50%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="SubmittedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="RejectedDiv" class="ParentDashboard" style="border-top: 7px solid #66ff66;">
                        <asp:Label runat="server" Text="Rejected" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 50%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="RejectedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="AcceptedDiv" class="ParentDashboard" style="border-top: 7px solid #ffff33;">
                        <asp:Label runat="server" Text="Accepted" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 50%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="AcceptedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="CompletedDiv" class="ParentDashboard" style="border-top: 7px solid #ff66a3;">
                        <asp:Label runat="server" Text="Completed" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 50%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="CompletedLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
                            <br />
                            <asp:Label runat="server" Text="Orders(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                        </div>
                    </div>
                </td>

                <td>
                    <div id="CancelledDiv" class="ParentDashboard" style="border-top: 7px solid #ff66a3;">
                        <asp:Label runat="server" Text="Cancelled" CssClass="ParentDashboardLbl"></asp:Label>
                        <i class="fa fa-file-text-o" style="font-size: 30px; margin-left: 50%; margin-top: 5%;"></i>
                        <div class="ChildDashboard">
                            <br />
                            <asp:Label ID="CancelledLbl" runat="server" CssClass="ChildDashboardLbl"></asp:Label><br />
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

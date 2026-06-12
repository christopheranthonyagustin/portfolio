<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReleaseOrderDashBoard.aspx.cs" Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrderDashBoard" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Trucking Dashboard</title>
    <style>
        .Draft {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: white;
            margin-bottom: 20px;
            margin-top: 10px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .Accepted {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: white;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .Submitted {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: #990000;
            color: white;
            margin-bottom: 20px;
            margin-top: 10px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .Completed {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: orangered;
            color: white;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;

        }
          .DashBoardlbl {
            float: right;
            margin-top: 1px;
            margin-right: 70px;
            font-size: xx-large;
            font-weight: bold;
            text-align: right;
        }

        .OrderLbl {
            font-size: large;
            text-align: right;
            margin-left: 200px;      
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="width: 100%; display: block;">
            <tr>
                <td>
                    <div id="Draft" class="Draft" onclick="OpenRadWindow('StatusDraft')">
                        Draft
                        <br />
                        <asp:Label ID="DraftLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="DraftLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                    <div id="Accepted" class="Accepted" onclick="OpenRadWindow('StatusAccepted')">
                        Accepted - For Delivery
                        <br />
                        <asp:Label ID="AcceptedLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="AcceptedLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                </td>
                <td style="padding-left: 15px">
                    <div id="Submitted" class="Submitted" onclick="OpenRadWindow('StatusSubmitted')">
                        Submitted - Pending Approval
                        <br />
                        <asp:Label ID="SubmittedLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="SubmittedLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                    <div id="Completed" class="Completed" onclick="OpenRadWindow('StatusCompleted')">
                        Delivery Completed
                        <br />
                        <asp:Label ID="CompletedLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="CompletedLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                </td>
                <td style="padding-left: 15px">
                    <div id="Rejected" class="Draft" onclick="OpenRadWindow('StatusRejected')">
                        Rejected
                        <br />
                        <asp:Label ID="RejectedLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="RejectedLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                    <div id="Cancelled" class="Draft" onclick="OpenRadWindow('StatusCancelled')">
                        Cancelled
                        <br />
                        <asp:Label ID="CancelledLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="CancelledLbl1" runat="server" Text="order(s)" Font-Bold="false" class="OrderLbl"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="1050px" Height="620px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
     <script type="text/javascript">
            function OpenRadWindow(DivId) {
                var Value = DivId;
                if (Value == "StatusDraft") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "StatusAccepted") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "StatusSubmitted") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "StatusCompleted") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "StatusRejected") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "StatusCancelled") {
                    window.radopen("../ReleaseOrder/DashBoardShowOrders.aspx?DashBoardVal=" + Value);
                }
            }
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </form>
</body>
</html>

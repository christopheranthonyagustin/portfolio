<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningFailed.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningFailed" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Failed @ Daily Transport Planning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RedeliverBtn" runat="server" CssClass="white" OnClick="RedeliverBtn_Click"
                        Text="Redeliver" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="false" EnableLinqExpressions="false" AllowFilteringByColumn="true" AllowPaging="true" Skin="Metro"
            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="480px" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="FailedGrid" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" ItemStyle-Width="60px" HeaderStyle-Width="60px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" ID="EditImgBtn" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="EditImgBtn_Click" ToolTip="Edit Booking"></asp:ImageButton>&nbsp;                                           
                            <asp:ImageButton runat="server" ID="AttcImgBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0" OnClick="AttcImgBtn_Click"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" Visible="false"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="JobNo_OrderNo" HeaderText="JobNo <br/> OrderNo" ItemStyle-Width="140px" HeaderStyle-Width="140px"
                        DataField="JobNo_OrderNo" AutoPostBackOnFilter="true" SortExpression="JobNo_OrderNo">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("JobNo_OrderNo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Pickup" HeaderText="Pickup" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="PickupInfo">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("PickupInfo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Dropoff" HeaderText="Dropoff" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="DropoffInfo">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("DropoffInfo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver"
                        ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false" DataField="VehicleNo_DeliveryAgentName">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("VehicleNo_DeliveryAgentName")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="DeliveryWindow" HeaderText="Delivery Window" ItemStyle-Width="130px" HeaderStyle-Width="130px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="CODInfo" HeaderText="COD Info" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false" DataField="CODInfo">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("CODInfo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="CargoInfo" HeaderText="Cargo Info" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" ItemStyle-Width="180px" HeaderStyle-Width="180px" AllowFiltering="false" DataField="CargoInfo">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("CargoInfo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="OrderStatus" HeaderText="Order Status" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false" DataField="FriendlyOrderStatus">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("FriendlyOrderStatus")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="DriverRemarks" HeaderText="Driver Remarks" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="DriverRemarks">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("DriverRemarks")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="OrderStatusColourCode" UniqueName="OrderStatusColourCode" Display="False" />
                    <telerik:GridBoundColumn DataField="JobId" UniqueName="JobId" Display="False" />
                    <telerik:GridBoundColumn DataField="JBCtnrId" Display="False" />
                    <telerik:GridBoundColumn DataField="JobAttachment" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

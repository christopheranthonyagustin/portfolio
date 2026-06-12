<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderFulfillmentServicesReleaseOrder.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.OrderFulfillmentServices.OrderFulfillmentServicesReleaseOrder" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuRO" Src="~/WebV2@ILOGON/Control/OrderFulfillmentServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReleaseOrder @ Order Fulfillment Services</title>
    <link rel="stylesheet" href="../Style/OrderFulfillmentServices.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Script/OrderFulfillmentServices.js"></script>
    <style type="text/css">
        body {
            font-family: Arial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <iWMS:WebV2MenuRO ID="WebV2MenuRO" runat="server"></iWMS:WebV2MenuRO>

        <table style="background-color: white; width: 100%; margin-top: 1%; margin-bottom: 10px; margin-left: 75px;">
            <tr style="font-family: Arial; font-size: 16.5px;">
                <td style="width: 23%;">
                    <asp:Label runat="server" Text="Your Order No"></asp:Label>
                    <asp:TextBox ID="OrderNoTxt" runat="server" placeholder="Enter Your Order No" CssClass="form-control input-box" Width="170px" Height="30px" Style="border-radius: 5px; font-size: 14px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" Text="Date"></asp:Label><br />
                    <telerik:RadDatePicker runat="server" RenderMode="Lightweight" ID="DatePicker" Width="170px" Height="30px" Skin="Bootstrap" DateInput-EmptyMessage="No selected Date" DateInput-DateFormat="dd/MMM/yyyy" Font-Size="14px"
                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                </td>
                <td style="float: right; padding-top: 15px; padding-right: 45%;">
                    <asp:LinkButton ID="FilterROBtn" OnClientClick="DisableBtn(this.id, false);" OnClick="FilterBtn_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-filter fa_custom"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Filter</span></asp:LinkButton>
                </td>
            </tr>
        </table>

        <div id="SubMenuDiv" class="submenu">
            <a class="active" href="OrderFulfillmentServicesReleaseOrder.aspx" id="All" runat="server">All</a>
            <a href="OrderFulfillmentServicesDraft.aspx" id="Draft" runat="server">Draft</a>
            <a href="OrderFulfillmentServicesSubmitted.aspx" id="Submitted" runat="server">Submitted</a>
            <a href="OrderFulfillmentServicesAccepted.aspx" id="Accepted" runat="server">Accepted</a>
            <a href="OrderFulfillmentServicesCompleted.aspx" id="Completed" runat="server">Completed</a>
            <a href="OrderFulfillmentServicesRejected.aspx" id="Rejected" runat="server">Rejected</a>
            <a href="OrderFulfillmentServicesCancelled.aspx" id="Cancelled" runat="server">Cancelled</a>
            <a href="OrderFulfillmentServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <telerik:RadGrid ID="AllRadGrid" runat="server" OnNeedDataSource="AllRadGrid_NeedDataSource" AutoGenerateColumns="false" Skin="Office2010Blue" RenderMode="Lightweight"
            AllowSorting="true" AllowPaging="true" GridLines="None" Style="width: 90%; position: fixed; margin-left: 5%; margin-right: 0; font-family: Arial; font-size: 13px;">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ROId" PageSize="50" TableLayout="Fixed">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ReleaseOrderNo" UniqueName="ReleaseOrderNo" SortExpression="ReleaseOrderNo" HeaderText="Release Order No" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="YourOrderNo" UniqueName="YourOrderNo" SortExpression="YourOrderNo" HeaderText="Your Order No" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" HeaderText="Type" HeaderStyle-Width="125px" ItemStyle-Width="125px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerCode" UniqueName="CustomerCode" SortExpression="CustomerCode" HeaderText="Customer Code" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" HeaderText="Customer Name" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Priority" UniqueName="Priority" SortExpression="Priority" HeaderText="Priority" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExpectedDate" SortExpression="ExpectedDate" HeaderText="Expected Date" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                        DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryTiming" UniqueName="DeliveryTiming" SortExpression="DeliveryTiming" HeaderText="Delivery Timing" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" SortExpression="Status" HeaderText="Status" HeaderStyle-Width="95px" ItemStyle-Width="95px">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

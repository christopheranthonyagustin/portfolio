<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderFulfillmentServicesCancelled.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.OrderFulfillmentServices.OrderFulfillmentServicesCancelled" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuRO" Src="~/WebV2@ILOGON/Control/OrderFulfillmentServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancelled @ Order Fulfillment Services</title>
    <link rel="stylesheet" href="../Style/OrderFulfillmentServices.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Script/OrderFulfillmentServices.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
            <a class="active" href="OrderFulfillmentServicesCancelled.aspx" id="Cancelled" runat="server">Cancelled</a>
            <a href="OrderFulfillmentServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <telerik:RadGrid ID="ResultDG" runat="server" OnNeedDataSource="ResultDG_NeedDataSource" AutoGenerateColumns="false" Skin="Office2010Blue" RenderMode="Lightweight"
            AllowSorting="true" AllowPaging="true" GridLines="None" Style="width: 90%; position: fixed; margin-left: 5%; margin-right: 0; font-family: Arial; font-size: 13px;">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ROId" PageSize="50" TableLayout="Fixed" Width="100%" Font-Size="13px">
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

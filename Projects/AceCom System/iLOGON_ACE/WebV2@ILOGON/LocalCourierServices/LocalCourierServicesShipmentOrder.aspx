<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesShipmentOrder.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.LocalCourierServices.LocalCourierServicesShipmentOrder" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuSO" Src="~/WebV2@ILOGON/Control/LocalCourierServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShipmentOrder @ LocalCourierServices</title>
    <link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <iWMS:WebV2MenuSO ID="WebV2MenuSO" runat="server"></iWMS:WebV2MenuSO>

        <table style="background-color: white; width: 98%; margin-top: 1%; margin-bottom: 10px; margin-left: 75px;">
            <tr style="font-family: Arial; font-size: 16.5px;">
                <td>
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
                <td>
                    <asp:Label runat="server" Text="Status"></asp:Label><br />
                    <asp:DropDownList ID="StatusDDL" runat="server" AutoPostBack="false" CssClass="custom-select input-dropdown" DataTextField="Item" DataValueField="Descr" CausesValidation="false" Width="170px" Height="30px" Font-Size="14px" Style="border-radius: 5px;">
                    </asp:DropDownList>
                </td>
                <td style="float: right; padding-top: 15px; padding-right: 27%;">
                    <asp:LinkButton ID="FilterSOBtn" OnClientClick="DisableBtn(this.id, false);" OnClick="FilterBtn_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-filter fa_custom"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Filter</span></asp:LinkButton>
                    <asp:LinkButton ID="PrintShLblBtn" OnClientClick="DisableBtn(this.id, false);" OnClick="PrintShippingLblBtn_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-print"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Print Shipping Label</span></asp:LinkButton>
                </td>
            </tr>
        </table>

        <div id="SubMenuDiv" class="submenu">
            <a class="active" href="LocalCourierServicesShipmentOrder.aspx" id="All" runat="server">All</a>
            <a href="LocalCourierServicesSubmitted.aspx" id="Submitted" runat="server">Order Submitted</a>
            <a href="LocalCourierServicesAccepted.aspx" id="Accepted" runat="server">Order Accepted</a>
            <a href="LocalCourierServicesWIP.aspx" id="WIP" runat="server">To Be Delivered</a>
            <a href="LocalCourierServicesCompleted.aspx" id="Completed" runat="server">Delivered</a>
            <a href="LocalCourierServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <telerik:RadGrid ID="AllRadGrid" runat="server" OnNeedDataSource="AllRadGrid_NeedDataSource" AutoGenerateColumns="false" Skin="Office2010Blue" RenderMode="Lightweight"
            AllowSorting="true" AllowPaging="true" GridLines="None" Style="width: 90%; margin-left: 5%; margin-right: 0; font-family: Arial; font-size: 13px;">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBId" PageSize="50" TableLayout="Fixed" Width="100%">
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
                    <telerik:GridBoundColumn DataField="OrderNo" UniqueName="OrderNo" SortExpression="OrderNo" HeaderText="Job No" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="YourOrderNo" UniqueName="YourOrderNo" SortExpression="YourOrderNo" HeaderText="Your Order No" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ParcelSizeType" UniqueName="ParcelSizeType" SortExpression="ParcelSizeType" HeaderText="Parcel Size Type" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryOption" UniqueName="DeliveryOption" SortExpression="DeliveryOption" HeaderText="Delivery Option" HeaderStyle-Width="170px" ItemStyle-Width="170px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="Delivery Address" HeaderStyle-Width="200px" ItemStyle-Width="200px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryRoute" UniqueName="DeliveryRoute" SortExpression="DeliveryRoute" HeaderText="Route" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" SortExpression="Status" HeaderText="Status" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalCourierServicesSubmitted.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.LocalCourierServices.LocalCourierServicesSubmitted" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="WebV2MenuSO" Src="~/WebV2@ILOGON/Control/LocalCourierServicesMenu.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Submitted @ LocalCourierServices</title>
    <link rel="stylesheet" href="../Style/LocalCourierServices.css" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Script/LocalCourierServices.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <iWMS:WebV2MenuSO ID="WebV2MenuSO" runat="server"></iWMS:WebV2MenuSO>

        <table style="background-color: white; width: 98%; margin-top: 0%; margin-bottom: 10px; margin-left: 75px;">
            <tr>
                <td style="float: right; padding-top: 15px; padding-right: 8.5%;">
                    <asp:LinkButton ID="PrintShLblBtn" OnClientClick="DisableBtn(this.id, false);" OnClick="PrintShippingLblBtn_ServerClick" CssClass="btn btn-primary" AutoPostBack="true" CausesValidation="false" runat="server" Font-Size="13px"><span class="fa fa-print"/>&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Print Shipping Label</span></asp:LinkButton>
                </td>
            </tr>
        </table>

        <div id="SubMenuDiv" class="submenu">
            <a href="LocalCourierServicesShipmentOrder.aspx" id="All" runat="server">All</a>
            <a class="active" href="LocalCourierServicesSubmitted.aspx" id="Submitted" runat="server">Order Submitted</a>
            <a href="LocalCourierServicesAccepted.aspx" id="Accepted" runat="server">Order Accepted</a>
            <a href="LocalCourierServicesWIP.aspx" id="WIP" runat="server">To Be Delivered</a>
            <a href="LocalCourierServicesCompleted.aspx" id="Completed" runat="server">Delivered</a>
            <a href="LocalCourierServicesDashboard.aspx" id="Dashboard" runat="server">Dashboard</a>
        </div>

        <telerik:RadGrid ID="SubmittedRadGrid" runat="server" OnNeedDataSource="SubmittedRadGrid_NeedDataSource" AutoGenerateColumns="false" Skin="Office2010Blue" RenderMode="Lightweight" OnItemCommand="SubmittedRadGrid_ItemCommand"
            AllowSorting="true" AllowPaging="true" GridLines="None" Style="width: 90%; margin-left: 5%; margin-right: 0; font-family: Arial; font-size: 13px;">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="true"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBId" PageSize="50" TableLayout="Fixed" Width="100%">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        <ItemStyle Wrap="True"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="False" ID="OrderCancel" ImageUrl="../../image/bin.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="OrderCancel"
                                OnClick="ldCancel_Click" CausesValidation="False" OnClientClick="return confirm('Confirm cancel?')"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="OrderNo" UniqueName="OrderNo" SortExpression="OrderNo" HeaderText="Job No" HeaderStyle-Width="13%" ItemStyle-Width="13%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="YourOrderNo" UniqueName="YourOrderNo" SortExpression="YourOrderNo" HeaderText="Order No" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ParcelSizeType" UniqueName="ParcelSizeType" SortExpression="ParcelSizeType" HeaderText="Parcel Size Type" HeaderStyle-Width="20%" ItemStyle-Width="20%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryOption" UniqueName="DeliveryOption" SortExpression="DeliveryOption" HeaderText="Delivery Option" HeaderStyle-Width="19%" ItemStyle-Width="19%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="Delivery Address" HeaderStyle-Width="25%" ItemStyle-Width="25%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryRoute" UniqueName="DeliveryRoute" SortExpression="DeliveryRoute" HeaderText="Route" HeaderStyle-Width="78px" ItemStyle-Width="78px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" SortExpression="Status" HeaderText="Status" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Cancel" FilterControlAltText="OrderCancel" ImageUrl="../../Image/Cancel_Button.png" Text="Cancel" UniqueName="OrderCancel" ConfirmDialogType="RadWindow" HeaderStyle-Width="12%" ItemStyle-Width="11%" Resizable="False" ConfirmText="Confirm Cancel?">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

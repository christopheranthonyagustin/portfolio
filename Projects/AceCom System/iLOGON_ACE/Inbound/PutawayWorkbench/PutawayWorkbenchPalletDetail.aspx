<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayWorkbenchPalletDetail.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayWorkbenchPalletDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Pallet Detail @ Putaway Workbench</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="SKU" UniqueName="SKU" SortExpression="SKU" HeaderText="SKU" HeaderStyle-Width="250px" ItemStyle-Width="250px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescription" UniqueName="SKUDescription" SortExpression="SKUDescription" HeaderText="SKUDescription" HeaderStyle-Width="250px" ItemStyle-Width="250px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" SortExpression="UOM" HeaderText="UOM" HeaderStyle-Width="140px" ItemStyle-Width="140px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReceivedQty" UniqueName="ReceivedQty" SortExpression="ReceivedQty" HeaderText="ReceivedQty" HeaderStyle-Width="110px" ItemStyle-Width="110px" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CurrentLocation" UniqueName="CurrentLocation" SortExpression="CurrentLocation" HeaderText="CurrentLocation" HeaderStyle-Width="150px" ItemStyle-Width="150px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PutawayLocation" UniqueName="PutawayLocation" SortExpression="PutawayLocation" HeaderText="PutawayLocation" HeaderStyle-Width="150px" ItemStyle-Width="150px" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceV3IR.aspx.cs" Inherits="iWMS.Web.Interface.InterfaceV3.InterfaceV3IR" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GM @ Interface</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="420" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Filename" HeaderText="FileName" SortExpression="FileName" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" SortExpression="SKU" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUDescription" HeaderText="SKUDescription" SortExpression="SKUDescription" HeaderStyle-Width="180px" ItemStyle-Width="180px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CostCentre" HeaderText="CostCentre" SortExpression="CostCentre" HeaderStyle-Width="140px" ItemStyle-Width="140px" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReservationNo" HeaderText="ReservationNo" SortExpression="ReservationNo" HeaderStyle-Width="180px" ItemStyle-Width="180px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Plant" HeaderText="Plant" SortExpression="Plant" HeaderStyle-Width="220px" ItemStyle-Width="220px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StorageLocation" HeaderText="StorageLocation" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PONumber" HeaderText="PONumber" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OrderType" HeaderText="OrderType" SortExpression="OrderType" HeaderStyle-Width="130px" ItemStyle-Width="130px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" SortExpression="UOM" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadDate" HeaderText="UploadDate" SortExpression="UploadDate" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" HeaderStyle-Width="250px" ItemStyle-Width="250px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadStatus" HeaderText="UploadStatus" SortExpression="UploadStatus" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UploadRemarks" HeaderText="UploadRemarks" SortExpression="UploadRemarks" HeaderStyle-Width="140px" ItemStyle-Width="140px"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

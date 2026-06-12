<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysisWMSContainerDetail.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysisWMSContainerDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iWMSContainer @ Dashboard</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" RenderMode="Lightweight"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" GridLines="None"
            AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" AllowFilteringByColumn="true">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" ScrollHeight="500px" UseStaticHeaders="true" />
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" HeaderText="Account" />
                    <telerik:GridBoundColumn DataField="Number" UniqueName="Number" HeaderText="Number" ItemStyle-Width="150px" HeaderStyle-Width="150px" />
                    <telerik:GridBoundColumn DataField="ContainerNo" UniqueName="ContainerNo" HeaderText="ContainerNo" ItemStyle-Width="150px" HeaderStyle-Width="150px" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

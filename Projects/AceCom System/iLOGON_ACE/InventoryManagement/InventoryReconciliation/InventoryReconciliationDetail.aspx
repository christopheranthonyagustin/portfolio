<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryReconciliationDetail.aspx.cs" Inherits="iWMS.Web.InventoryManagement.InventoryReconciliation.InventoryReconciliationDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">

                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>

                            <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SLLTId" HeaderText="SKU Code" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Geek Qty" SortExpression="Geek Qty" HeaderText="Geek Qty" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="iWMS Qty" SortExpression="iWMS Qty" HeaderText="iWMS Qty" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Lot1" DataField="Lot1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot1" UniqueName="Lot1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot2" UniqueName="Lot2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot5" UniqueName="Lot5" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot6" UniqueName="Lot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot9" UniqueName="Lot9" Reorderable="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

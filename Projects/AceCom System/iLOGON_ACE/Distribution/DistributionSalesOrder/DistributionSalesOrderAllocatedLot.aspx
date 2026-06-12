<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderAllocatedLot.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderAllocatedLot" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Sales Order Allocated Lot</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
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
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>

                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            S/No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="ItemCode" UniqueName="ItemCode" HeaderText="ItemCode" ShowFilterIcon="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemDescription" UniqueName="ItemDescription" HeaderText="ItemDescription" ShowFilterIcon="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemType" UniqueName="ItemType" SortExpression="ItemType" AllowFiltering="true"
                        HeaderText="ItemType" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemUOM" UniqueName="ItemUOM" HeaderText="ItemUOM" ShowFilterIcon="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemUnitPrice" UniqueName="ItemUnitPrice" HeaderText="ItemUnitPrice" ShowFilterIcon="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="IsNonStock" DataField="IsNonStockItem" SortExpression="IsNonStockItem" UniqueName="IsNonStockItem"
                        AllowFiltering="true" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExpectedItemAllocatedQty" UniqueName="ItemAllocatedQty" SortExpression="ItemAllocatedQty" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="AllocatedQty">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExpectedItemDeliveredQty" UniqueName="ItemDeliveredQty" SortExpression="ItemDeliveredQty" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="DeliveredQty">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LocationBinCode" UniqueName="LocationBinCode" SortExpression="LocationBinCode" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="LocationBinCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StorageLocationCode" UniqueName="StorageLocationCode" SortExpression="StorageLocationCode" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="StorageLocationCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderItemId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderAllocatedLotId" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesInvoice.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesInvoice" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Sales Invoice</title>
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
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesInvoiceId">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle Wrap="False"></ItemStyle>
                        
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridBoundColumn DataField="SalesInvoiceNo" UniqueName="SalesInvoiceNo" SortExpression="SalesInvoiceNo" ShowFilterIcon="true" AllowFiltering="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="SalesInvoiceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesInvoiceDate" UniqueName="SalesInvoiceDate" SortExpression="SalesInvoiceDate" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="SalesInvoiceDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesInvoiceReferenceNo" UniqueName="SalesInvoiceReferenceNo" SortExpression="SalesInvoiceReferenceNo" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="SalesInvoiceReferenceNo" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="CustomerName" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryOrderNo" UniqueName="DeliveryOrderNo" SortExpression="DeliveryOrderNo" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="DeliveryOrderDate" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryOrderDate" UniqueName="DeliveryOrderDate" SortExpression="DeliveryOrderDate" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="DeliveryOrderDate" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderNo" UniqueName="SalesOrderNo" SortExpression="SalesOrderNo" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="SalesOrderNo" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderDate" UniqueName="SalesOrderDate" SortExpression="SalesOrderDate" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="SalesOrderDate" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="Remarks1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesInvoiceStatusDescr" UniqueName="SalesInvoiceStatusDescr" SortExpression="SalesInvoiceStatusDescr" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn"
                        HeaderText="ModifiedOn" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate"
                        HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate"
                        HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" ShowFilterIcon="false" AllowFiltering="false"
                        HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EntityId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesInvoiceId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesInvoiceNo" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

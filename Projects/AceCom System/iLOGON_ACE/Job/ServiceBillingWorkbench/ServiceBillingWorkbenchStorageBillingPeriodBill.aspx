<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceBillingWorkbenchStorageBillingPeriodBill.aspx.cs" Inherits="iWMS.Web.Job.ServiceBillingWorkbench.ServiceBillingWorkbenchStorageBillingPeriodBill" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill @ StorageBillingPeriod</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" Font-Bold="true" Font-Size="Small">GR Balance Inventory</asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadGrid ID="GRBalInvResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="GRBalInvResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="LotGRNo" HeaderText="LotGRNo" SortExpression="LotGRNo" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RCDate" HeaderText="RCDate" SortExpression="RCDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"
                                    HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LotUOM" HeaderText="LotUOM" SortExpression="LotUOM" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Qty" HeaderText="Qty" SortExpression="Qty" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" Font-Bold="true" Font-Size="Small">Last Invoice Billed</asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadGrid ID="LastInvBilledResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="LastInvBilledResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="InvoiceNumber" HeaderText="InvoiceNumber" SortExpression="InvoiceNumber" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="InvoiceDate" HeaderText="InvoiceDate" SortExpression="InvoiceDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"
                                    HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ChargeCode" HeaderText="ChargeCode" SortExpression="ChargeCode" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ChargeDescription" HeaderText="ChargeDescription" SortExpression="ChargeDescription" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="280px" ItemStyle-Width="280px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitRate" HeaderText="UnitRate" SortExpression="UnitRate" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitRateUOM" HeaderText="UnitRateUOM" SortExpression="UnitRateUOM" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BillingQuantity" HeaderText="BillingQuantity" SortExpression="BillingQuantity" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BillingAmount" HeaderText="BillingAmount" SortExpression="BillingAmount" AllowFiltering="false"
                                    HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="From Date"> 
                                </asp:Label>
                                <br />
                                <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                                    DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                    <Calendar runat="server">
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="To Date"> 
                                </asp:Label>
                                <br />
                                <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155"
                                    DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                    <Calendar runat="server">
                                        <SpecialDays>
                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                        </SpecialDays>
                                    </Calendar>
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="GenerateChargeBtn" CssClass="LongLabelWhite" runat="server" OnClick="GenerateChargeBtn_Click"
                                    Text="Generate Charge" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                <asp:Button ID="CreateInvoiceBtn" CssClass="LongLabelWhite" runat="server" OnClick="CreateInvoiceBtn_Click"
                                    Text="Create Invoice" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                <asp:Button ID="PrintInvoiceBtn" CssClass="LongLabelBlue" runat="server" OnClick="PrintInvoiceBtn_Click"
                                    Text="Print Invoice" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="RCChargeId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Charge" HeaderText="Charge" SortExpression="Charge" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ChargeDescription" HeaderText="ChargeDescription" SortExpression="ChargeDescription" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UOM" HeaderText="UOM" SortExpression="UOM" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitRate" HeaderText="UnitRate" SortExpression="UnitRate" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Currency" HeaderText="Currency" SortExpression="Currency" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TaxType" HeaderText="TaxType" SortExpression="TaxType" AllowFiltering="false"
                                    HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Amount" HeaderText="Amount" SortExpression="Amount" AllowFiltering="false"
                                    HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" AutoPostBackOnFilter="true"
                                    HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

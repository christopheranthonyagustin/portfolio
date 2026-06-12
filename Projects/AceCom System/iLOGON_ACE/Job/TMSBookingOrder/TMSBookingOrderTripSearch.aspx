<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderTripSearch.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderTripSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Search @ TMSBookingOrder</title>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="TripSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table>
                    <tr>
                        <td>&nbsp;
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;              
                    <asp:Button ID="ExcelBtn" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    </td>
                                    <td>
                                        <br />
                                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="ResultDGUpdatePanel" runat="server">
                    <ContentTemplate>
                        <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                        </td>
                        <br />
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" Visible="false"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="430px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" PageSize="50" Width="200%">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="EditIcon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ContainerEditImgBtn"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                OnClick="ContainerEditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" HeaderStyle-Width="250px" ItemStyle-Width="250px" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderNo" UniqueName="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PIC" UniqueName="PIC" SortExpression="PIC" HeaderText="PIC" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesMan" UniqueName="SalesMan" SortExpression="SalesMan" HeaderText="SalesMan" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ShipmentType" UniqueName="ShipmentType" SortExpression="ShipmentType" HeaderText="Shipment Type" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransportType" UniqueName="TransportType" SortExpression="TransportType" HeaderText="Transport Type" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="Job Type" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="Bill Size Type" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ExpectedDate" UniqueName="ExpectedDate" SortExpression="ExpectedDate" HeaderText="Expected Date" DataFormatString="{0:dd/MMM/yyyy}" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromExpectedTime" UniqueName="FromExpectedTime" SortExpression="FromExpectedTime" HeaderText="From Expected Time" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToExpectedTime" UniqueName="ToExpectedTime" SortExpression="ToExpectedTime" HeaderText="To Expected Time"  AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromActualTime" UniqueName="FromActualTime" SortExpression="FromActualTime" HeaderText="From Actual Time" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToActualTime" UniqueName="ToActualTime" SortExpression="ToActualTime" HeaderText="To Actual Time" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NonBillable" UniqueName="NonBillable" SortExpression="NonBillable" HeaderText="Non Billable" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FromAddress" UniqueName="FromAddress" SortExpression="FromAddress" HeaderText="From Address" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="To Address" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" SortExpression="Status" HeaderText="Status" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Vehicle" UniqueName="Vehicle" SortExpression="Vehicle" HeaderText="Vehicle" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Driver" UniqueName="Driver" SortExpression="Driver" HeaderText="Driver">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GoodsDescription" UniqueName="GoodsDescription" SortExpression="GoodsDescription" HeaderText="Goods Description">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TripDescription" UniqueName="TripDescription" SortExpression="TripDescription" HeaderText="Trip Description">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SpecialInstruction" UniqueName="SpecialInstruction" SortExpression="SpecialInstruction" HeaderText="Special Instruction">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DoNo" UniqueName="DoNo" SortExpression="DoNo" HeaderText="Do No">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="Order By">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBCtnrId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

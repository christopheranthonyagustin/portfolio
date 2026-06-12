<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryStockonhand.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryStockonhand" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Outbound Delivery Stock onhand</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="StockonhandDashboardRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Stockonhand" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="RequestBintoBinBtn" runat="server" CssClass="LongLabelWhite" Text=" &nbsp;  &nbsp; Request  &nbsp; &nbsp; &nbsp; Bin to Bin"
                                OnClick="RequestBintoBinBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />                       
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowKeyboardNavigation="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="380px" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="StockId"
                         CommandItemDisplay="None">
                        <BatchEditingSettings EditType="Row" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="BatchStockId" DataField="StockId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StockId" SortExpression="StockId" HeaderText="StockId" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUCode" SortExpression="SKUCode" HeaderText="SKUCode">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Description" SortExpression="Description" HeaderText="Description">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OnhandQty" SortExpression="OnhandQty" HeaderText="OnhandQty" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AvailableQty" SortExpression="AvailableQty" HeaderText="AvailableQty" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="RequestQty" HeaderStyle-HorizontalAlign="Center"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="requestqtytxt" Text='<%# DataBinder.Eval(Container.DataItem, "RequestQty", "{0:#.##}") %>'
                                        Skin="WebBlue" Width="80">
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Location" SortExpression="Location" HeaderText="Location">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LockedForCount" SortExpression="LockedForCount" HeaderText="LockedForCount" AllowFiltering="false"> 
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TUNO" SortExpression="TUNO" HeaderText="TUNO" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRDate" SortExpression="GRDate" HeaderText="GRDate" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn HeaderText="Lot1" DataField="Lot1" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot1" UniqueName="Lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot2" UniqueName="Lot2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot3" DataField="Lot3" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot3" UniqueName="Lot3" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot4" DataField="Lot4" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot4" UniqueName="Lot4" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot5" UniqueName="Lot5" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot6" UniqueName="Lot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot7" DataField="Lot7" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot7" UniqueName="Lot7" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot8" DataField="Lot8" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot8" UniqueName="Lot8" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot9" UniqueName="Lot9" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot10" DataField="Lot10" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot10" UniqueName="Lot10" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot11" DataField="Lot11" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot11" UniqueName="Lot11" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot12" UniqueName="Lot12" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot13" DataField="Lot13" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot13" UniqueName="Lot13" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot14" DataField="Lot14" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot14" UniqueName="Lot14" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot15" DataField="Lot15" AllowFiltering="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot15" UniqueName="Lot15" Reorderable="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
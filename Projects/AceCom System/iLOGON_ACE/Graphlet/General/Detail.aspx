<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="iWMS.Web.Graphlet.General.Detail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LocOccupancyDetails</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div id="div-datagrid">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="invbalance" runat="server" Text="Inventory Balance"></asp:Label>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="Both"
                            AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            Skin="Office2007" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound" UseAccessibleHeader="True" HorizontalAlign="Center"
                            PageSize="20" CellPadding="2">
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <ExportSettings UseItemStyles="True">
                            </ExportSettings>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <PagerStyle Mode="NumericPages" HorizontalAlign="Left" Position="TopAndBottom" ForeColor="Black" />
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <asp:Label ID="ImgIdLbl" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container,"DataItem.skuimgId")%>' />
                                            <asp:Image ID="SkuImg" runat="server" ImageAlign="Top" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="skucode" HeaderText="Sku" SortExpression="skucode">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skudescr" HeaderText="SKU Descr" SortExpression="skudescr">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="wholeonhandqty" HeaderText="WholeQty" SortExpression="wholeonhandqty"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Looseonhandqty" HeaderText="LooseQty" SortExpression="Looseonhandqty"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="onhandqty" HeaderText="LHUQty" SortExpression="onhandqty"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skugrpdescr" HeaderText="SKU Group" SortExpression="skugrpdescr">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skugrptype" HeaderText="SKU Type" SortExpression="skugrptype">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalVol" HeaderText="Total Vol" SortExpression="TotalVol"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalWt" HeaderText="Total Wt" SortExpression="TotalWt"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1" DataFormatString="{0:dd/MMM/yyyy}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2" DataFormatString="{0:dd/MMM/yyyy}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3" DataFormatString="{0:dd/MMM/yyyy}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    <td />
                    <tr />
                <tr>
                    <td>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pp" runat="server" Text="Pending Putaway"></asp:Label>
                        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="Both"
                            AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            Skin="Office2007" AllowPaging="true" OnItemDataBound="ResultDG2_ItemDataBound" UseAccessibleHeader="True" HorizontalAlign="Center"
                            PageSize="20" CellPadding="2">
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <ExportSettings UseItemStyles="True">
                            </ExportSettings>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <PagerStyle Mode="NumericPages" HorizontalAlign="Left" Position="TopAndBottom" ForeColor="Black" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="GRGINo" HeaderText="GRGINo" SortExpression="GRGINo">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skucode" HeaderText="SkuCode" SortExpression="skucode">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skudescr" HeaderText="SKU Descr" SortExpression="skudescr">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="qty" HeaderText="Qty" SortExpression="qty"
                                        DataFormatString="{0:#,0.##}">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="tuno1" HeaderText="TUNO1" SortExpression="tuno1">
                                        <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

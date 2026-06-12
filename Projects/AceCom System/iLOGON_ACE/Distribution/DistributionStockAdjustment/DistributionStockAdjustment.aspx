<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionStockAdjustment.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionStockAdjustment.DistributionStockAdjustment" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Adjustment</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Adjustment (Step 3 of 3)</asp:Label>
                </td>
                <td align="right">&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text=" Save " OnClick="SaveBtn_Click"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro"  OnItemDataBound="ResultDG_ItemDataBound">

                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="LotInventoryId" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="ItemCode">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemDescription" SortExpression="ItemDescription" HeaderText="ItemDescription">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="LocationBinCode" SortExpression="LocationBinCode" HeaderText="LocationBinCode">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StorageLocationCode" SortExpression="StorageLocationCode" HeaderText="StorageLocationCode">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemOnhandQty" SortExpression="ItemOnhandQty" HeaderText="On Hand Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemReservedQty" SortExpression="ItemReservedQty" HeaderText="Reserved Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemAllocatedQty" SortExpression="ItemAllocatedQty" HeaderText="Allocated Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ItemAvailableQty" SortExpression="ItemAvailableQty" HeaderText="Available Qty">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="AdjQty" SortExpression="adjustedqty">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="60px" ID="QtyTxt" BackColor="Yellow"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="QtyTxt">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="ItemUOM">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDropDownList ID="UOMList" DataTextField="descr" DataValueField="item"
                                                runat="server" Width="100" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ItemCost" SortExpression="ItemCost" HeaderText="ItemCost">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="GoodsReceiveDate" SortExpression="GoodsReceiveDate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Reason" SortExpression="adjustedqty">
                            <ItemTemplate>
                                <telerik:RadDropDownList ID="ReasonList" Enabled="True" DataTextField="Descr" DataValueField="Item" runat="server"
                                    DataSource='<%# reasonListDS%>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Remarks" SortExpression="Remarks">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="120px" ID="RemarksTxt"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="LotInventoryId" Display="false" />
                        <telerik:GridBoundColumn DataField="ItemId" Display="false" />
                        <telerik:GridBoundColumn DataField="ItemUOM" Display="false" />

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

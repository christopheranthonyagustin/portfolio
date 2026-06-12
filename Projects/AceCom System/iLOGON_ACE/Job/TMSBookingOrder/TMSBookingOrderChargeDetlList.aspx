<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderChargeDetlList.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderChargeDetlList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS Booking Order ChargeList</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ChargeSearch Results" Value="0" runat="server" readonly="readonly">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;                 
                        </td>
                    </tr>
                </table>
                <div id="div3" style="height: 100%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" EnableLinqExpressions="false" AllowFilteringByColumn="true"
                        AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TMSBookingOrderEdit"
                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                            OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn AllowFiltering="false">
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="BillAcCode" SortExpression="acid" HeaderText="Account" AllowFiltering="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="JobNo" SortExpression="jbid" HeaderText="JobNo" AllowFiltering="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo" AllowFiltering="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="ChargeDescription" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                        <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="Description" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DescrTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "jbchargedescr") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="QtyTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Disc1" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis1txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount1", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Disc2" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis2txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount2", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="DiscountAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DiscountAmtTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="BillingAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="TaxType" DataField="TaxTypeDescr" HeaderStyle-HorizontalAlign="Center" AllowFiltering="true"
                                    ItemStyle-HorizontalAlign="Center">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="VehNo" DataField="jbchargevehno" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="drdtid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="crossvehno">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="jbid" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="false"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>


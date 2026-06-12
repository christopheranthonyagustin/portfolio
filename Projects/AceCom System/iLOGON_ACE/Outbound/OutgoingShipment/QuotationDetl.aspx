<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationDetl.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.QuotationDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>QuotationDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td>
                <asp:Button ID="serarchBtn" runat="server" CssClass="detailButton" Text="Search"
                    OnClick="serachBtn_Click"></asp:Button>
                &nbsp;<asp:Button ID="AddBtn" runat="server" CssClass="detailButton" Text="Add" OnClick="AddBtn_Click">
                </asp:Button>&nbsp;<asp:Button ID="CloseBtn" runat="server" CssClass="detailButton"
                    Text="Close" OnClick="CloseBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ISChargeDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false" OnPreRender="ISChargeDG_PreRender"
        Skin="Office2007" OnItemDataBound="ISChargeDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn HeaderText="id" HeaderStyle-HorizontalAlign="Center" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                        <asp:Label ID="QuDtTaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' />
                        <asp:Label ID="SeqNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="chargedescr" HeaderText="Charge" ItemStyle-Font-Bold="true" />
                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center" UniqueName ="Uom">
                    <ItemTemplate>
                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrateuom") %>' display ="true"></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center" UniqueName="Currency">
                        <ItemTemplate>
                            <asp:Label ID="CurrCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" UniqueName ="URate">
                    <ItemTemplate>
                        <asp:TextBox ID="UnitRateTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>' ></asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" UniqueName="UEstqty">
                    <ItemTemplate>
                        <asp:Label ID="estqtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center" UniqueName="UEstunitcostuom">
                    <ItemTemplate>
                        <asp:Label ID="estunitcostuomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcostuom") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="estunitcost" HeaderStyle-HorizontalAlign="Center" UniqueName="UEstunitcost">
                    <ItemTemplate>
                        <asp:Label ID="estunitcostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" UniqueName="MinCharge">
                    <ItemTemplate>
                        <asp:Label ID="minchargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center" UniqueName="UMinchargetype">
                    <ItemTemplate>
                        <asp:Label ID="minchargetypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                  <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center" UniqueName="UMincharge2">
                    <ItemTemplate>
                        <asp:Label ID="mincharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

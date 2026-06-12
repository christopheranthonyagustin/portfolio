<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3InvoiceListingViewChange.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3InvoiceListingViewChange" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice Listing View Change</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" OnItemDataBound="ResultDG_ItemDataBound"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="ChargeDescription" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="ChargeDescription" AllowFiltering="false" ReadOnly="true">
                            <ItemTemplate>
                                <asp:Label ID="ChargeDescriptionTxt" runat="server" Width="400" Height="70px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Type" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="Type" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="TypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Type")%>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="BeforeVaue" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="BeforeVaue" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="BeforeVaueLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BeforeVaue")%>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AfterValue" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="AfterValue" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="AfterValueLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AfterValue")%>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AddUser" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="AddUser" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="AddUserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AddUser")%>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

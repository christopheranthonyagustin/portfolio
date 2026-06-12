<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3InvoiceListing.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3InvoiceListing" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice Listing @ GoodsIssueV3</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript">
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="left">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Save" CssClass="white" UseSubmitBehavior="false" />
                    <asp:Button ID="ViewChangeBtn" runat="server" Text="ViewChange" OnClick="ViewChangeBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="ViewChange" CssClass="white" UseSubmitBehavior="false" />
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" Width="600px" Name="ParentGrid">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="GINumber" HeaderText="GINumber" DataField="GINumber" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="JobNumber" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="JobNumber" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="JobNumberLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JobNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="InvoiceNumber" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="InvoiceNumber" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="InvoiceNumberLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InvoiceNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ExpectedDate" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ExpectedDate" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExpectedDateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExpectedDate","{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ChargeDescription" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ChargeDescription" AllowFiltering="false" ReadOnly="true">
                        <ItemTemplate>
                            <asp:Label ID="ChargeDescriptionLbl" runat="server" Width="400" Height="70px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="Quantity" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="QuantityLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="UnitRate" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="UnitRate" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="UnitRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UnitRate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="TaxType" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TaxType") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="Currency" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="CurrencyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Currency") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="Amount" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="AmountLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Amount") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="AddDate" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="AddDate" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="AddDateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AddDate","{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="AddUser" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="AddUser" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="AddUserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AddUser") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EditDate" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="EditDate" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="EditDateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EditDate","{0:dd/MMM/yyyy hh:mm}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EditUser" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="EditUser" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="EditUserLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EditUser") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="QtyUnitRateChanged" UniqueName="QtyUnitRateChanged" Display="False" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

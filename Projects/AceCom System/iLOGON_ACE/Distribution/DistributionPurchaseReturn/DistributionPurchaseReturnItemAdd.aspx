<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseReturnItemAdd.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseReturn.DistributionPurchaseReturnItemAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DistributionPurchaseReturnItemAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function clientValidation(sender, args) {
                var grid = $find("<%=ResultDG.ClientID %>");
                var tableView = grid.get_masterTableView();
                var items = tableView.get_dataItems();

                for (var i = 0; i < items.length; i++) {
                    var rowValues = items[i];
                    var ItemQty = rowValues.findElement("ItemQtyLbl").innerHTML;
                    var NewItemQty = rowValues.findElement("ItemQtyTxt").value;
                    if (NewItemQty > ItemQty) {
                        args.IsValid = false;
                        break;
                    }
                    else
                        args.IsValid = true;
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="StepLbl" runat="server">Return Purchase Order Item (Step 3 of 3)</asp:Label><br />
                    </div>
                </td>
                <td align="right">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="white" OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            Skin="Office2007" AllowPaging="true" OnNeedDataSource="ResultDG_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="LotInventoryId" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="No" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="PurchaseOrderNo" SortExpression="PurchaseOrderNo" HeaderText="PurchaseOrderNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PurchaseOrderDate" SortExpression="PurchaseOrderDate" HeaderText="PurchaseOrderDate" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GoodsReceiveNo" SortExpression="GoodsReceiveNo" HeaderText="GoodsReceiveNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GoodsReceiveDate" SortExpression="GoodsReceiveDate" HeaderText="GoodsReceiveDate" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="ItemCode" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemDescription" SortExpression="ItemDescription" HeaderText="ItemDescription" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemQty" SortExpression="ItemUOMQty" AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadLabel runat="server" ID="ItemQtyLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ItemUOMQty","{0:0.00}") %>'></telerik:RadLabel>
                            <br />
                            <telerik:RadTextBox runat="server" ID="ItemQtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ItemUOMQty","{0:0.00}") %>' Width="120px" Skin="Sunset" BackColor="#ded7c6"></telerik:RadTextBox>
                            <asp:CustomValidator ID="ItemQtyTxtReqVal" ControlToValidate="ItemQtyTxt" runat="server" ErrorMessage="Exceed"
                                Font-Bold="true" ForeColor="Red" ClientValidationFunction="clientValidation" ValidateEmptyText="true" />
                            <asp:RequiredFieldValidator ControlToValidate="ItemQtyTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ControlToValidate="ItemQtyTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ItemUOM" SortExpression="ItemUOM" HeaderText="ItemUOM" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" HeaderText="ItemUnitPrice" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemUnitLandedCost" SortExpression="ItemUnitLandedCost" HeaderText="ItemUnitLandedCost" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="WarehouseCode" SortExpression="WarehouseCode" HeaderText="WarehouseCode" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LocationBinCode" SortExpression="LocationBinCode" HeaderText="LocationBin" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StorageLocationCode" SortExpression="StorageLocationCode" HeaderText="StorageLocation" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Notes" SortExpression="Notes" AllowFiltering="false">
                        <ItemTemplate>
                            <br />
                            <telerik:RadTextBox runat="server" ID="NotesTxt" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Notes") %>'></telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="PurchaseOrderStatusDescr" SortExpression="PurchaseOrderStatus" HeaderText="PurchaseOrderStatus" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemId" Display="false" />
                    <telerik:GridBoundColumn DataField="WarehouseInventoryId" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

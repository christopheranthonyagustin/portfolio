<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPackingNewPacking.aspx.cs" Inherits="iWMS.Web.Outbound.OrderPacking.OrderPackingNewPacking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Packing @ Order Packing</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .TotalPKCtn {
            white-space: nowrap;
            line-break: unset;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: left;
            margin-top: 3px;
            margin-left: 3px;
        }

        .RadGridTable {
            width: 30% !important;
            height: 30% !important;
            border: thin;
            background-color: #cce6ff;
            border-radius: 7px;
            margin-right: 10px;
            float: left;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
            margin-top: 10px;
            overflow: auto;
        }
    </style>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(Id) {
                var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var Row = MasterTable.get_dataItems();
                if (Id.checked == true) {
                    for (var i = 0; i < Row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("CHKObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < Row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("CHKObjective").checked = false;
                    }
                }
            }

            function OnClientClose(sender, args) {
                var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                MasterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" CausesValidation="true"
                        OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label runat="server" Text="Picking Cart Number"></asp:Label><br />
                    &nbsp;
                    <telerik:RadTextBox ID="PickingCartNumberTxtBox" runat="server" Skin="WebBlue" Width="155" AutoPostBack="true"
                        CausesValidation="false" OnTextChanged="PickingCartNumberTxtBox_TextChanged">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server" Visible="false"></iWMS:iForm>
                    <br />
                </td>
            </tr>
        </table>

        <asp:Panel ID="ItemPackedPanel" runat="server" Visible="false">
            <table style="width: 100%">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="EditPackUnitBtn" CssClass="LongLabelWhite" runat="server" Text="Edit Pack Unit"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="EditPackUnitBtn_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="RemovePackUnitBtn" CssClass="LongLabelWhite" runat="server" Text="Remove Pack Unit"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="RemovePackUnitBtn_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="DOBtn" runat="server" CssClass="blue" Text="DO" OnClick="DOBtn_Click"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                </td>
                                <td>
                                    <asp:Button ID="PULabelBtn" runat="server" CssClass="blue" OnClientClick="disableBtn(this.id)"
                                        UseSubmitBehavior="false" CausesValidation="false" Text="PULabel" OnClick="PULabelBtn_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="PackListBtn" runat="server" CssClass="blue" OnClientClick="disableBtn(this.id)"
                                        UseSubmitBehavior="false" CausesValidation="false" Text="Pack List" OnClick="PackListBtn_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="BookTransportBtn" runat="server" Text="Book Transport" OnClick="BookTransportBtn_Click"
                                        OnClientClick="disableBtn(this.id, true)"
                                        UseSubmitBehavior="false" CssClass="LongLabelGreen" />
                                </td>
                                 <td>
                                    <asp:Button ID="SelectAllBtn" runat="server" Text="Select All" OnClick="SelectAllBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" ToolTip="Select All" />
                                 </td>
                            </tr>
                        </table>
                    </td>

                    <td align="right">
                        <asp:Label runat="server" ID="LblTotalPKCtn" Font-Bold="true" Font-Size="Large" CssClass="TotalPKCtn"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PKCtnPlaceHolder" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>

        <asp:Panel ID="ItemNotPackedPanel" runat="server" Visible="false">
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7">
                <Tabs>
                    <telerik:RadTab Text="Item Not Packed" Value="0" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="PTDTId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                    <HeaderTemplate>
                                        <input id="SelectAll" name="SelectAll" type="checkbox" onclick="CheckAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CHKObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="No"
                                    HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Exline" UniqueName="Exline" SortExpression="Exline" HeaderText="ExLine"
                                    ItemStyle-Width="60px" HeaderStyle-Width="60px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="IsNumber" UniqueName="IsNumber" SortExpression="IsNumber" HeaderText="GINumber"
                                    ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SKUCode" UniqueName="SKUCode" SortExpression="SKUCode" HeaderText="Sku"
                                    ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SKUDescr" UniqueName="SKUDescr" SortExpression="SKUDescr" HeaderText="Description"
                                    ItemStyle-Width="200px" HeaderStyle-Width="200px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                                    ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridNumericColumn DataField="Qty" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderText="Total Picked Quantity"
                                    SortExpression="Qty" UniqueName="Qty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right">
                                </telerik:GridNumericColumn>
                                <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM" UniqueName="uomdescr"
                                    ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridNumericColumn DataField="PackedQty" HeaderStyle-Width="150px" ItemStyle-Width="150px" HeaderText="Total Packed Quantity"
                                    SortExpression="PackedQty" UniqueName="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right">
                                </telerik:GridNumericColumn>
                                <telerik:GridTemplateColumn HeaderText="Outstanding Quantity" ItemStyle-Width="170px" HeaderStyle-Width="170px">
                                    <ItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="OutstandingQtyTxtBox" Text='<%# DataBinder.Eval(Container.DataItem, "OutstandingQty", "{0:#,0.##}") %>'
                                            Skin="WebBlue" Width="120">
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="StorageZone" SortExpression="StorageZone" HeaderText="Storage Zone" UniqueName="StorageZone"
                                    ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StorageCategory" SortExpression="StorageCategory" HeaderText="Storage Category" UniqueName="StorageCategory"
                                    ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true"
                                    SortExpression="Lot6" UniqueName="Lot6" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot7" DataField="Lot7" AllowFiltering="true"
                                    SortExpression="Lot7" UniqueName="Lot7" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="true"
                                    SortExpression="Lot2" UniqueName="Lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot3" DataField="Lot3" AllowFiltering="true"
                                    SortExpression="Lot3" UniqueName="Lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="true"
                                    SortExpression="Lot9" UniqueName="Lot9" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot10" DataField="Lot10" AllowFiltering="true"
                                    SortExpression="Lot10" UniqueName="Lot10" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot11" DataField="Lot11" AllowFiltering="true"
                                    SortExpression="Lot11" UniqueName="Lot11" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="true"
                                    SortExpression="Lot12" UniqueName="Lot12" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot13" DataField="Lot13" AllowFiltering="true"
                                    SortExpression="Lot13" UniqueName="Lot13" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot14" DataField="Lot14" AllowFiltering="true"
                                    SortExpression="Lot14" UniqueName="Lot14" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot15" DataField="Lot15" AllowFiltering="true"
                                    SortExpression="Lot15" UniqueName="Lot15" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot16" DataField="Lot16" AllowFiltering="true"
                                    SortExpression="Lot16" UniqueName="Lot16" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot17" DataField="Lot17" AllowFiltering="true"
                                    SortExpression="Lot17" UniqueName="Lot17" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot18" DataField="Lot18" AllowFiltering="true"
                                    SortExpression="Lot18" UniqueName="Lot18" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot19" DataField="Lot19" AllowFiltering="true"
                                    SortExpression="Lot19" UniqueName="Lot19" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot20" DataField="Lot20" AllowFiltering="true"
                                    SortExpression="Lot20" UniqueName="Lot20" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot21" DataField="Lot21" AllowFiltering="true"
                                    SortExpression="Lot21" UniqueName="Lot21" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot22" DataField="Lot22" AllowFiltering="true"
                                    SortExpression="Lot22" UniqueName="Lot22" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot23" DataField="Lot23" AllowFiltering="true"
                                    SortExpression="Lot23" UniqueName="Lot23" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot24" DataField="Lot24" AllowFiltering="true"
                                    SortExpression="Lot24" UniqueName="Lot24" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot25" DataField="Lot25" AllowFiltering="true"
                                    SortExpression="Lot25" UniqueName="Lot25" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot26" DataField="Lot26" AllowFiltering="true"
                                    SortExpression="Lot26" UniqueName="Lot26" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot27" DataField="Lot27" AllowFiltering="true"
                                    SortExpression="Lot27" UniqueName="Lot27" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot28" DataField="Lot28" AllowFiltering="true"
                                    SortExpression="Lot28" UniqueName="Lot28" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot29" DataField="Lot29" AllowFiltering="true"
                                    SortExpression="Lot29" UniqueName="Lot29" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot30" DataField="Lot30" AllowFiltering="true"
                                    SortExpression="Lot30" UniqueName="Lot30" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot31" DataField="Lot31" AllowFiltering="true"
                                    SortExpression="Lot31" UniqueName="Lot31" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot32" DataField="Lot32" AllowFiltering="true"
                                    SortExpression="Lot32" UniqueName="Lot32" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot33" DataField="Lot33" AllowFiltering="true"
                                    SortExpression="Lot33" UniqueName="Lot33" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot34" DataField="Lot34" AllowFiltering="true"
                                    SortExpression="Lot34" UniqueName="Lot34" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot35" DataField="Lot35" AllowFiltering="true"
                                    SortExpression="Lot35" UniqueName="Lot35" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot36" DataField="Lot36" AllowFiltering="true"
                                    SortExpression="Lot36" UniqueName="Lot36" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot37" DataField="Lot37" AllowFiltering="true"
                                    SortExpression="Lot37" UniqueName="Lot37" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot38" DataField="Lot38" AllowFiltering="true"
                                    SortExpression="Lot38" UniqueName="Lot38" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot39" DataField="Lot39" AllowFiltering="true"
                                    SortExpression="Lot39" UniqueName="Lot39" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot40" DataField="Lot40" AllowFiltering="true"
                                    SortExpression="Lot40" UniqueName="Lot40" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot41" DataField="Lot41" AllowFiltering="true"
                                    SortExpression="Lot41" UniqueName="Lot41" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot42" DataField="Lot42" AllowFiltering="true"
                                    SortExpression="Lot42" UniqueName="Lot42" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot43" DataField="Lot43" AllowFiltering="true"
                                    SortExpression="Lot43" UniqueName="Lot43" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot44" DataField="Lot44" AllowFiltering="true"
                                    SortExpression="Lot44" UniqueName="Lot44" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot45" DataField="Lot45" AllowFiltering="true"
                                    SortExpression="Lot45" UniqueName="Lot45" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot46" DataField="Lot46" AllowFiltering="true"
                                    SortExpression="Lot46" UniqueName="Lot46" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot47" DataField="Lot47" AllowFiltering="true"
                                    SortExpression="Lot47" UniqueName="Lot47" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot48" DataField="Lot48" AllowFiltering="true"
                                    SortExpression="Lot48" UniqueName="Lot48" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot49" DataField="Lot49" AllowFiltering="true"
                                    SortExpression="Lot49" UniqueName="Lot49" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot50" DataField="Lot50" AllowFiltering="true"
                                    SortExpression="Lot50" UniqueName="Lot50" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot51" DataField="Lot51" AllowFiltering="true"
                                    SortExpression="Lot51" UniqueName="Lot51" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot52" DataField="Lot52" AllowFiltering="true"
                                    SortExpression="Lot52" UniqueName="Lot52" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot53" DataField="Lot53" AllowFiltering="true"
                                    SortExpression="Lot53" UniqueName="Lot53" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot54" DataField="Lot54" AllowFiltering="true"
                                    SortExpression="Lot54" UniqueName="Lot54" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot55" DataField="Lot55" AllowFiltering="true"
                                    SortExpression="Lot55" UniqueName="Lot55" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot56" DataField="Lot56" AllowFiltering="true"
                                    SortExpression="Lot56" UniqueName="Lot56" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot57" DataField="Lot57" AllowFiltering="true"
                                    SortExpression="Lot57" UniqueName="Lot57" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot58" DataField="Lot58" AllowFiltering="true"
                                    SortExpression="Lot58" UniqueName="Lot58" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot59" DataField="Lot59" AllowFiltering="true"
                                    SortExpression="Lot59" UniqueName="Lot59" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Lot60" DataField="Lot60" AllowFiltering="true"
                                    SortExpression="Lot60" UniqueName="Lot60" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UOM" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AcId" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Lot1" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Lot4" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Lot5" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Lot6" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Lot8" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PTHId" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AvailQty" Display="false">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="ISId" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </asp:Panel>
    </form>
</body>
</html>

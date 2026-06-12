<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceBillingWorkbenchGIBillableItems.aspx.cs" Inherits="iWMS.Web.Job.ServiceBillingWorkbench.ServiceBillingWorkbenchGIBillableItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIBillableItems @ ServiceBillingWorkbench</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
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

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }

            function DoPostBackWithRowIndex(rowIndex) {
                if (document.getElementById('<%=HdnSelectedRowIndex.ClientID%>') != null) {
                    document.getElementById('<%=HdnSelectedRowIndex.ClientID%>').value = rowIndex;
                }
                return true;
            }

            function DoPostBackWithRowIndex2(rowIndex) {
                if (document.getElementById('<%=HdnSelectedRowIndex2.ClientID%>') != null) {
                    document.getElementById('<%=HdnSelectedRowIndex2.ClientID%>').value = rowIndex;
                }
                return true;
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
                    &nbsp;
                    <asp:Label ID="GIInformationLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td align="left">
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" OnClick="NextItemBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label>
                    <asp:HiddenField ID="HdnSelectedRowIndex" runat="server" />
                    <asp:HiddenField ID="HdnSelectedRowIndex2" runat="server" />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <div id="div3" style="height: 100%">
        <telerik:RadGrid ID="SKULineResultGrid" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" Skin="Metro" 
            OnNeedDataSource="SKULineResultGrid_NeedDataSource" OnItemDataBound="SKULineResultGrid_ItemDataBound" >
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="IsDtId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="false"
                        SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sku" DataField="SkuCode" AllowFiltering="true"
                        SortExpression="SkuCode" UniqueName="SkuCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="SkuDescr" AllowFiltering="true"
                        SortExpression="SkuDescr" UniqueName="SkuDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" AllowFiltering="false"
                        SortExpression="StatusDescr" UniqueName="StatusDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="UomDescr" AllowFiltering="false"
                        SortExpression="UomDescr" UniqueName="UomDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Expected" DataField="ExpectedUomQty" AllowFiltering="false"
                        SortExpression="ExpectedUomQty" UniqueName="ExpectedUomQty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Allocated" DataField="AllocatedUomQty" AllowFiltering="false"
                        SortExpression="AllocatedUomQty" UniqueName="AllocatedUomQty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Picked" DataField="PickedUomQty" AllowFiltering="false"
                        SortExpression="PickedUomQty" UniqueName="PickedUomQty" Reorderable="true" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Packed" DataField="PackedUomQty" AllowFiltering="false"
                        SortExpression="PackedUomQty" UniqueName="PackedUomQty" Reorderable="true" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Shipped" DataField="ShippedUomQty" AllowFiltering="false"
                        SortExpression="ShippedUomQty" UniqueName="ShippedUomQty" Reorderable="true"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="RcDate" AllowFiltering="true"
                        SortExpression="RcDate" UniqueName="RcDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 4" DataField="Lot4" AllowFiltering="true"
                        SortExpression="Lot4" UniqueName="Lot4" Reorderable="true" DataFormatString="&nbsp;{0}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 1" DataField="Lot1" AllowFiltering="true"
                        SortExpression="Lot1" UniqueName="Lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 5" DataField="Lot5" AllowFiltering="true"
                        SortExpression="Lot5" UniqueName="Lot5" Reorderable="true" DataFormatString="&nbsp;{0}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 6" DataField="Lot6" AllowFiltering="true"
                        SortExpression="Lot6" UniqueName="Lot6" Reorderable="true" DataFormatString="&nbsp;{0}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 7" DataField="Lot7" AllowFiltering="true"
                        SortExpression="Lot7" UniqueName="Lot7" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 2" DataField="Lot2" AllowFiltering="true"
                        SortExpression="Lot2" UniqueName="Lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 3" DataField="Lot3" AllowFiltering="true"
                        SortExpression="Lot3" UniqueName="Lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot 8" DataField="Lot8" AllowFiltering="true"
                        SortExpression="Lot8" UniqueName="Lot8" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="LocCode" AllowFiltering="true"
                        SortExpression="LocCode" UniqueName="LocCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TuNo1" DataField="TUNo1" AllowFiltering="true"
                        SortExpression="TUNo1" UniqueName="TUNo1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TuNo2" DataField="TUNo2" AllowFiltering="true"
                        SortExpression="TUNo2" UniqueName="TUNo2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VAS" DataField="VasDescr" AllowFiltering="true"
                        SortExpression="VasDescr" UniqueName="VasDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="Rem1" AllowFiltering="true"
                        SortExpression="Rem1" UniqueName="Rem1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Shelf Life" DataField="ShelfLife" AllowFiltering="true"
                        SortExpression="ShelfLife" UniqueName="ShelfLife" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtInvNo" DataField="ExtInvNo" AllowFiltering="true"
                        SortExpression="ExtInvNo" UniqueName="ExtInvNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtPoNo" DataField="ExtPoNo" AllowFiltering="true"
                        SortExpression="ExtPoNo" UniqueName="ExtPoNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtRef" DataField="ExtRefNo" AllowFiltering="true"
                        SortExpression="ExtRefNo" UniqueName="ExtRefNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ToLot6" DataField="ToLot6" AllowFiltering="true"
                        SortExpression="ToLot6" UniqueName="ToLot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtSKU" DataField="ExtSkuCode" AllowFiltering="true"
                        SortExpression="ExtSkuCode" UniqueName="ExtSkuCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtStatus" DataField="ExtStatus" AllowFiltering="true"
                        SortExpression="ExtStatus" UniqueName="ExtStatus" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="AddDate" AllowFiltering="true"
                        SortExpression="AddDate" UniqueName="AddDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add User" DataField="AddUser" AllowFiltering="true"
                        SortExpression="AddUser" UniqueName="AddUser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="EditDate" AllowFiltering="true"
                        SortExpression="EditDate" UniqueName="EditDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="EditUser" AllowFiltering="true"
                        SortExpression="EditUser" UniqueName="EditUser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SkuId" DataField="SkuId" AllowFiltering="true"
                        SortExpression="SkuId" UniqueName="SkuId" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="Status" AllowFiltering="true"
                        SortExpression="Status" UniqueName="Status" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="StatusColor" DataField="StatusColor" AllowFiltering="true"
                        SortExpression="StatusColor" UniqueName="StatusColor" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="IsDtId" SortExpression="IsDtId" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <table>
            <tr>
                <td align="left">
                    <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" CausesValidation="false"
                        Visible="true" Text="Save" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="GenerateBtn" CssClass="white" runat="server"
                        OnClick="GenerateBtn_Click" Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="AddChargeBtn" CssClass="white" runat="server"
                        OnClick="AddChargeBtn_Click" Text="Add" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                   
                    <asp:Button ID="DelImgBtn" CssClass="white" runat="server"
                        OnClick="DeleteBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                      <asp:Label ID="GoodsReceiveNoLbl" runat="server" CssClass="pagetitle"></asp:Label>
                     &nbsp;
                     <asp:Button ID="GRNonBillableBtn" CssClass="LongLabelWhite" runat="server"
                            OnClick="GRNonBillableBtn_Click" Text="GR-NonBillable" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ISChargeResultGrid" runat="server" AutoGenerateColumns="false" GridLines="None" Skin="Metro" 
            EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false"
            OnNeedDataSource="ISChargeResultGrid_NeedDataSource" OnItemDataBound="ISChargeResultGrid_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="IsChargeId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InvNo") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Display="false">
                        <ItemTemplate>
                            <asp:Label ID="IsChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IsChargeId") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Display="false">
                        <ItemTemplate>
                            <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "QuDtId") %>'></asp:Label>
                            <asp:Label ID="DrDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DrDtId") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="SeqNo" SortExpression="SeqNo" HeaderText="Qu.S/n"></telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "IsSeqNo") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ChargeDescription" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeCode") %>'></asp:Label>
                            <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescr") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ISChargeDescr" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ISChargeDescrTxt" runat="server" Width="400" Height="70px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescr") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="QtyTxt" Width="50px" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Qty") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged"></asp:TextBox>
                            <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Uom") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="UnitRateTxt" Width="60px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UnitRate","{0:#,0.0000}") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Discount" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="Discount1Txt" Width="50px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Discount1") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="Discount1TxtCompVal" runat="server" ControlToValidate="Discount1Txt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="CurrCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CurrCode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="FCAmt" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="FCurrAmtTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FcurrAmt") %>'
                                OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="FCurrAmtTxtCompVal" runat="server" ControlToValidate="FCurrAmtTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="ExchRateTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExchRate") %>'
                                OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="ExchRateTxtCompVal" runat="server" ControlToValidate="ExchRateTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="LCurrAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LcurrAmt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# TaxTypeDS%>' DataTextField="Descr"
                                DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS, DataBinder.Eval(Container.DataItem, "TaxType").ToString())%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstQty") %>'></asp:TextBox>
                            <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# UomDS%>' DataTextField="Descr"
                                DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UomDS, DataBinder.Eval(Container.DataItem, "EstUnitCostUom").ToString())%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstUnitCost") %>'></asp:TextBox>
                            <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumCharge", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumChargeType") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumCharge2", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="FreeDays" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysLbl2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FreeDays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="RemarksTxt" runat="server" Width="350" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="unitrate" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="UnitRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UnitRate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="fcurramt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FCurrAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FcurrAmt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="totdutyamt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TotDutyAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotDutyAmt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="tottaxamt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TotTaxAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotTaxAmt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="freedays" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FreeDays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="freedaysoption" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysOptLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FreeDaysOption") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="proratedays" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="ProRateDaysLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProRateDays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="daysinperiod" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="DaysInPerLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DaysInPeriod") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="exchrate" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="ExchRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExchRate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="taxtype" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TaxType") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="discount1" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="Discount1Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Discount1") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="estunitcost" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="EstUnitCostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstUnitCost") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="estqty" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="EstQtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstQty", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumcharge" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumCharge", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumchargetype" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumChargeType") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumcharge2" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MinimumCharge2", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="DrDtId" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2Charge.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2Charge" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Charge @ GoodsReceiveV2</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <script type="text/javascript" language="javascript">

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
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" Visible="false"
                            OnClientClick="disableBtn(this.id,false)" ToolTip="Save" CssClass="white" UseSubmitBehavior="false" />&nbsp;
                               <asp:Button ID="GenerateBtn" runat="server" Text="Generate Charge" OnClick="GenerateBtn_Click"
                                   OnClientClick="disableBtn(this.id,false)" ToolTip="Generate" CssClass="LongLabelWhite" UseSubmitBehavior="false" />&nbsp;
                               <asp:Button ID="QuBtn" runat="server" Text="Add" OnClick="QuBtnBtn_Click" Visible="false"
                                   OnClientClick="disableBtn(this.id,false)" ToolTip="Save" CssClass="white" UseSubmitBehavior="false" />&nbsp;
                         <asp:Button ID="DelImgBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click" Visible="true"
                             OnClientClick="disableBtn(this.id,false)" ToolTip="Delete" CssClass="white" UseSubmitBehavior="false" />&nbsp;
                        <asp:HiddenField ID="HdnSelectedRowIndex" runat="server" />
                        <asp:HiddenField ID="HdnSelectedRowIndex2" runat="server" />
                    </div>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td align="left">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="RCChargeDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false"
            Skin="Metro" OnNeedDataSource="RCChargeDG_NeedDataSource" OnItemDataBound="RCChargeDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="rcchargeid">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Display="false">
                        <ItemTemplate>
                            <asp:Label ID="RcChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rcchargeid") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Display="false">
                        <ItemTemplate>
                            <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                            <asp:Label ID="DrDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "drdtid") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="seqno" SortExpression="seqno" HeaderText="Qu.S/n"></telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "rcseqno") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ChargeDescription" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                            <asp:Label ID="Descrlbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="RCChargeDescr" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="RCChargeDescrTxt" runat="server" Width="400" Height="70px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeDescr") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="QtyTxt" Width="50px" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged"></asp:TextBox>
                            <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="UnitRateTxt" Width="60px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate","{0:#,0.0000}") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="UnitRateTxtCompVal" runat="server" ControlToValidate="UnitRateTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Discount" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="Discount1Txt" Width="50px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "discount1") %>'
                                OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="Discount1TxtCompVal" runat="server" ControlToValidate="Discount1Txt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="CurrCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="FCurrAmtTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt") %>'
                                OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="FCurrAmtTxtCompVal" runat="server" ControlToValidate="FCurrAmtTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ExchRateTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>'
                                OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:CompareValidator ID="ExchRateTxtCompVal" runat="server" ControlToValidate="ExchRateTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="LCurrAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%-- Changed by XR 12/05/2016--%>
                    <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                                DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                            <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# uomDS%>' DataTextField="Descr"
                                DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                            <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Visible="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="MinimumCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="FreeDays" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysLbl2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "freedays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="RemarksTxt" runat="server" Width="350" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="unitrate" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="UnitRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="fcurramt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FCurrAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="totdutyamt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TotDutyAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totdutyamt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="tottaxamt" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TotTaxAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tottaxamt") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="freedays" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "freedays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="freedaysoption" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="FreeDaysOptLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "freedaysoption") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="proratedays" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="ProRateDaysLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "proratedays") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="daysinperiod" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="DaysInPerLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "daysinperiod") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="exchrate" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="ExchRateLbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="taxtype" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="discount1" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="Discount1Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "discount1") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="estunitcost" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="EstUnitCostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="estqty" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="EstQtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="estunitcostuom" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="EstUnitCostUOMLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcostuom") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumcharge" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumchargetype" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="minimumcharge2" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="minCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2", "{0:#,0.00}")  %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="drdtid" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

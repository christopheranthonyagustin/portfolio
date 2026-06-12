<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="IssueCharge.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueCharge" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IssueCharge</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
 <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick" Style="height: 26px">
            <Tabs>
                <telerik:RadTab Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>            
            <Tabs>
                <telerik:RadTab ID="LogTab" Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
         <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" OnClick="SaveBtn_Click">
                    </asp:Button>&nbsp;
                    <asp:Button ID="GenerateBtn" runat="server" CssClass="LongLabelWhite" Text="Generate Charge"
                        OnClick="GenerateBtn_Click"></asp:Button>&nbsp;
                    <asp:Button ID="QuBtn" runat="server" CssClass="white" OnClick="QuBtnBtn_Click"
                        Text="Add" />&nbsp;
                     <asp:Button ID="DelImgBtn" runat="server" CssClass="white" OnClick="DeleteBtn_Click"
                 ToolTip="Delete Selected Charges(s)"        Text="Delete" /><br /><br />
                     <asp:Label ID="CSLSLbl" runat="server" font-size="9">Charge Sheet Status</asp:Label><br />
                     <asp:TextBox ID="CSLStatustxt" runat="server" width="200" Height="25" Enabled="false"></asp:TextBox>
                       <%--   <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/delete.png"
                    Visible="true" OnClick="DeleteBtn_Click" BackColor="Transparent"
                    BorderWidth="0" ImageAlign="AbsMiddle" ToolTip="Delete Selected Charges(s)" />--%>
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
    <%-- <asp:UpdatePanel ID="UpdatePanel" runat="server">
         <ContentTemplate>--%>
    <telerik:RadGrid ID="ISChargeDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnPreRender="ISChargeDG_PreRender"
        EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false" 
        Skin="Metro" OnNeedDataSource="ISChargeDG_NeedDataSource" OnItemDataBound="ISChargeDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="ischargeid">
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
                        <asp:Label ID="IsChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ischargeid") %>'></asp:Label>
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
                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false" >
                        <ItemTemplate>
                            <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "isseqno") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <%--<telerik:GridBoundColumn HeaderText="Charge" DataField="chargedescr" ItemStyle-Font-Bold="true" />--%>
                 <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ChargeDescription" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                            <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
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
                        <asp:TextBox ID="QtyTxt" Width="50px" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>'
                            OnTextChanged="QtyRateDiscount_TextChanged"></asp:TextBox>
                        <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" UniqueName="Rate">
                    <ItemTemplate>
                        <asp:TextBox ID="UnitRateTxt" Width="60px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate","{0:#,0.0000}") %>'
                            OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
     <%--                   <asp:CompareValidator ID="UnitRateTxtCompVal" runat="server" ControlToValidate="UnitRateTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />--%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Discount" HeaderStyle-HorizontalAlign="Center" UniqueName="Discount">
                    <ItemTemplate>
                        <asp:TextBox ID="Discount1Txt" Width="50px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "discount1") %>'
                            OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:CompareValidator ID="Discount1TxtCompVal" runat="server" ControlToValidate="Discount1Txt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center" UniqueName="Currency">
                    <ItemTemplate>
                        <asp:Label ID="CurrCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="FCAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="FCAmt">
                    <ItemTemplate>
                        <asp:TextBox ID="FCurrAmtTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt") %>'
                            OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:CompareValidator ID="FCurrAmtTxtCompVal" runat="server" ControlToValidate="FCurrAmtTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center" UniqueName="ExchRate">
                    <ItemTemplate>
                        <asp:TextBox ID="ExchRateTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>'
                            OnTextChanged="FcAmtExchRate_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:CompareValidator ID="ExchRateTxtCompVal" runat="server" ControlToValidate="ExchRateTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="LCAmt">
                    <ItemTemplate>
                        <asp:Label ID="LCurrAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="LCAmt" Display="false">
                    <ItemTemplate>
                        <asp:TextBox ID="LCurrAmtTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt") %>'
                             AutoPostBack="true"></asp:TextBox>  
                        <asp:CompareValidator ID="LCurrAmtTxtCompVal" runat="server" ControlToValidate="LCurrAmtTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />                     
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center" UniqueName="TaxType">
                    <ItemTemplate>
                        <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false" UniqueName="EstQty">
                    <ItemTemplate>
                        <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                        <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false" UniqueName="EstUnitCostUOM">
                    <ItemTemplate>
                        <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# uomDS%>' DataTextField="Descr"
                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center" UniqueName="EstUnitCost">
                    <ItemTemplate>
                        <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                        <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false" UniqueName="MinCharge">
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
                <telerik:GridTemplateColumn HeaderText="FreeDays" HeaderStyle-HorizontalAlign="Center" UniqueName="FreeDays">
                    <ItemTemplate>
                        <asp:Label ID="FreeDaysLbl2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "freedays") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="OpsPerformed" UniqueName="OpsPerformed" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="OpsPerformedYCbx" runat="server" Text="Yes" Checked='<%# DataBinder.Eval(Container.DataItem, "OpsPerformed").ToString().Equals("Y", StringComparison.OrdinalIgnoreCase) %>' Enabled="false" />
                        <asp:CheckBox ID="OpsPerformedNCbx" runat="server" Text="No" Checked='<%# DataBinder.Eval(Container.DataItem, "OpsPerformed").ToString().Equals("N", StringComparison.OrdinalIgnoreCase) %>' Enabled="false" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="RemarksTxt" runat="server" Width="350" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <%--<telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />--%>
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
                        <asp:Label ID="ExchRateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>'></asp:Label>
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
                        <asp:Label ID="EstUnitCostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="estqty" HeaderStyle-HorizontalAlign="Center" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="EstQtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty", "{0:#,0.00}")  %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
           <%--     <telerik:GridTemplateColumn HeaderText="estunitcostuom" HeaderStyle-HorizontalAlign="Center" Display="false">
                    <ItemTemplate>
                        <asp:DropDownList ID="EstUnitCostUOMLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcostuom") %>'/>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>--%>
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
                </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="90%" ID="LogPageView" />
              </telerik:RadMultiPage>
      <%--   </ContentTemplate>
     </asp:UpdatePanel>--%>
    </form>
</body>
</html>

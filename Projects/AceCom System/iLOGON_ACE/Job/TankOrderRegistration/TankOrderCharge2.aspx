<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderCharge2.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderCharge2" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TransportCharge</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%" id="btntable" runat="server">
            <tr>
                <td align="left" valign="top">
                    <telerik:RadButton ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                        Skin="WebBlue">
                    </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="GenerateBtn" runat="server" Text="Conversion From CS" OnClick="GenerateBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="AdditionalChargesBtn" runat="server" Text="Additional Charges" OnClick="AdditionalChargesBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="QuBtn" runat="server" Text="Add From Quotation" OnClick="QuBtnBtn_Click"
                    Skin="WebBlue" Visible="false">
                </telerik:RadButton>
                    &nbsp;
                <asp:Button ID="DelImgBtn" CssClass="white" runat="server" OnClick="DeleteBtn_Click" ToolTip="Delete Selected Charges(s)"
                    Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <telerik:RadButton ID="GenerateInvBtn" runat="server" Text="Generate Invoice" OnClick="GenerateInvBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                &nbsp;
                <telerik:RadButton ID="UndoInvBtn" runat="server" Text="Amend Invoice" OnClick="UndoInvBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                    &nbsp;
                 <asp:Button ID="PrintInvBtn" CssClass="blue" runat="server" OnClick="PrintInvBtn_Click1" ToolTip="Print Invoice"
                    Text="Print Invoice" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
               
               <%-- <asp:ImageButton ID="PrintInvImgBtn" runat="server" ImageUrl="../../Image/Inv.png" Height="30"
                    Visible="true" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                    ToolTip="MassInvoicePrint" OnClick="PrintInvImgBtn_Click" />--%>
                    &nbsp;
                <telerik:RadComboBox ID="InvNoList" runat="server" AutoPostBack="false" Skin="WebBlue"
                    Width="180px" DropDownWidth="180px" CausesValidation="false" Filter="Contains"
                    RenderMode="Lightweight">
                    <%--OnSelectedIndexChanged="InvNoList_SelectedIndexChanged"--%>
                </telerik:RadComboBox>
                    &nbsp;
                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                    &nbsp; &nbsp;
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <div id="div3" style="height: 100%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
                                <asp:Label ID="invdateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "InvDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="billacid" SortExpression="billacid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="drdtid" SortExpression="drdtid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="jbchargeid" HeaderStyle-HorizontalAlign="Center"
                            Display="false">
                            <ItemTemplate>
                                <asp:Label ID="jbchargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "jbchargeid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="qudtid" HeaderStyle-HorizontalAlign="Center"
                            Display="false">
                            <ItemTemplate>
                                <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                                <asp:Label ID="DrDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "drdtid") %>'></asp:Label>
                                <asp:Label ID="BillAcidLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billacid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="BillAccount" UniqueName="billaccode" DataField="billacid"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <telerik:RadDropDownList ID="billAccDDL" runat="server" DataTextField="code" ExpandDirection="Up"
                                    DataValueField="acid" DataSource='<%# billAccDS%>' Skin="WebBlue" Width="150px"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(billAccDS,DataBinder.Eval(Container.DataItem, "billacid").ToString())%>'
                                    DropDownWidth="150px">
                                </telerik:RadDropDownList>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "sno") %>'></asp:TextBox>
                                <asp:Label ID="quseqnoLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "quseqno") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                            UniqueName="ChargeDescription" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="arglcodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "arglcodedescr") %>'></asp:Label>
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
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="QtyTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnQtyTextChanged"
                                    AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnRateTextChanged"
                                    AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:TextBox>
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
                        <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="InvoiceCurrency" DataField="invcurrcode" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" />
                        <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
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
                            AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:TextBox ID="DiscountAmtTxt" Width="70px" runat="server" OnTextChanged="ResultDG_OnDiscountTextChanged"
                                    AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>'></asp:TextBox>
                                <asp:CompareValidator ID="DiscountAmtCompVal" runat="server" ControlToValidate="DiscountAmtTxt"
                                    EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--<telerik:GridTemplateColumn HeaderText="BillAmt" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="BillAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billamt", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                        <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false" ItemStyle-HorizontalAlign="Right" Display="false">
                            <ItemTemplate>
                                <asp:Label ID="BillingAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <telerik:RadDropDownList ID="TaxType_ddl" runat="server" DataTextField="Descr" ExpandDirection="Up"
                                    DataValueField="Item" DataSource='<%# taxTypeDS%>' Skin="WebBlue" Width="150px"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                    DropDownWidth="150px">
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxType_ddl"
                                    ErrorMessage="*" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn HeaderText="Waived" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <telerik:RadDropDownList ID="Waived_ddl" runat="server" DataTextField="Descr" ExpandDirection="Up"
                                    DataValueField="Item" DataSource='<%# waivedDS%>' Skin="WebBlue" Width="150px"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(waivedDS,DataBinder.Eval(Container.DataItem, "minimumchargetype").ToString())%>'
                                    DropDownWidth="150px">
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="WaivedReqVal" runat="server" ControlToValidate="Waived_ddl"
                                    ErrorMessage="*" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                                <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                    EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# uomDS%>'
                                    DataTextField="Descr" DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center"
                            AllowFiltering="false" Display="false">
                            <ItemTemplate>
                                <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                                <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                    EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" Display="false" />
                        <telerik:GridBoundColumn DataField="drdtid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="currcode" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="AddDate" HeaderStyle-HorizontalAlign="Center" Display="false" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="adddateLbl" runat="server" display="false" Text='<%# DataBinder.Eval(Container.DataItem, "adddate") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AddUser" HeaderStyle-HorizontalAlign="Center" Display="false" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="adduserLbl" runat="server" display="false" Text='<%# DataBinder.Eval(Container.DataItem, "adduser") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

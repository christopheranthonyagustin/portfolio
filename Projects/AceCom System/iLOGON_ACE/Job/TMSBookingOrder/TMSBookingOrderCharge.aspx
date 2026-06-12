<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderCharge.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderCharge" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookingOrderCharge</title>
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
        </script>

    </telerik:RadCodeBlock>
    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 28px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                display: none;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #A8A8A8;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 22px;
                width: 28px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #393;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1" Width="125%"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" Style="height: 26px" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="CombinedChargeViewTab" Text="Combined charge view" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="SplitRatioTab" Text="SplitRatio" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
                    <tr>
                        <td align="left">
                            <br />
                            <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                                Visible="true" Text="Save" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="GenerateBtn" CssClass="white" runat="server"
                                OnClick="GenerateBtn_Click" Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="QuBtn" CssClass="white" runat="server"
                                OnClick="QuBtnBtn_Click" Text="Add" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="DelImgBtn" CssClass="white" runat="server"
                                OnClick="DeleteBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="BillBtn" CssClass="white" runat="server" OnClick="BillBtn_Click" Visible="True" Text="Bill" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UndoBillBtn" CssClass="white" runat="server" OnClick="UndoBillBtn_Click" Visible="True" Text="UndoBill" CausesValidation="false"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="InvoiceBtn" runat="server" CssClass="longlabelblue" ToolTip="Invoice" UseSubmitBehavior="false" CausesValidation="false"
                                OnClick="InvoiceBtn_Click" Text="Print Invoice" OnClientClick="disableBtn(this.id)" />
                            &nbsp;
                            <asp:Button ID="ChangeAccountBtn" runat="server" CssClass="LongLabelWhite" ToolTip="Change Account" UseSubmitBehavior="false" CausesValidation="false"
                                OnClick="ChangeAccountBtn_Click" Text="Change Account" OnClientClick="disableBtn(this.id)" />
                            &nbsp;&nbsp;
                            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td align="left">
                            <asp:Button ID="ChargeSheetBtn" CssClass="LongLabelBlue" runat="server" OnClick="ChargesSheetBtn_Click"
                                Text="Charge Sheet" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;
                             <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click"
                                 Text="Refresh" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CombineBtn" CssClass="white" runat="server" OnClick="CombineBtn_Click"
                                Text="Combine" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div3" style="height: 100%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Width="125%"
                        AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender" 
                        OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center" UniqueName="SeqNo"
                                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "sno") %>'></asp:TextBox>
                                        <asp:Label ID="quseqnoLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "quseqno") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="ChargeDescription" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="chargecodeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="chargeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                                        <br />
                                        <asp:TextBox ID="chargeaccode" runat="server" ReadOnly="true" Width="200" Value='<%# DataBinder.Eval(Container.DataItem, "ChargeAcCode") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" UniqueName="Description" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DescrTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "jbchargedescr") %>'></asp:TextBox>
                                        <br />
                                        <telerik:RadDatePicker ID="FrExpTxt" Width="110px" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-EmptyMessage="Date"
                                            DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Visible="true">
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                        <telerik:RadTextBox ID="FrTimeTxt" Width="65px" runat="server" Visible="true" EmptyMessage="Start" Text='<%# DataBinder.Eval(Container.DataItem, "frtime") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="ToTimeTxt" Width="65px" runat="server" Visible="true" EmptyMessage="End" Text='<%# DataBinder.Eval(Container.DataItem, "totime") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="VehnoTxt" Width="70px" runat="server" Visible="true" EmptyMessage="VehNo" Text='<%# DataBinder.Eval(Container.DataItem, "jbchargevehno") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox ID="donoTxt" Width="70px" runat="server" Visible="true" EmptyMessage="DONo" Text='<%# DataBinder.Eval(Container.DataItem, "dono") %>'></telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Combine" HeaderStyle-HorizontalAlign="Center" UniqueName="Combine"
                                    AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective2" runat="server" />
                                        <asp:Label ID="ChargeGrpCodeLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "ChargeGrpcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" UniqueName="Qty"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="QtyTxt" runat="server" Width="60"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" UniqueName="Rate"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnitRateTxt" runat="server" Width="60"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>'></asp:TextBox>
                                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Disc1" HeaderStyle-HorizontalAlign="Center" UniqueName="Disc1"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis1txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount1", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Disc2" HeaderStyle-HorizontalAlign="Center" UniqueName="Disc2"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="dis2txt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "discount2", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center" UniqueName="Amount"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center" UniqueName="ExchRate"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="LCAmt"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" UniqueName="MinCharge"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center" UniqueName="MinChargeType"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinChargeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center" UniqueName="MinCharge2"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="MinCharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="DiscountAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="DiscountAmt"
                                    AllowFiltering="false" Display="true">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DiscountAmtTxt" Width="70px" runat="server"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Internal" HeaderStyle-HorizontalAlign="Center" UniqueName="Internal"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <label class="switch">
                                            <input id="ChargeTypecb" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "chargeoption") %>'>
                                            <div class="slider round"></div>
                                        </label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="VehNo" HeaderStyle-HorizontalAlign="Center" UniqueName="VehNo"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="VehNoDDL" runat="server" DataSource='<%# VehNoDS%>' DataTextField="Descr"
                                            DataValueField="Item" RenderMode="Lightweight" Skin="WebBlue" Filter="Contains" />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ChargeGrpCodeDDL" runat="server" DataSource='<%# ChargeGrpDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeGrpDS,DataBinder.Eval(Container.DataItem, "CrossChargeGrpCode").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="BillingAmt"
                                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="BillingAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" UniqueName="TaxType">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxType_ddl"
                                            ErrorMessage="*" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="WMSJobNo" HeaderStyle-HorizontalAlign="Center" UniqueName="WMSJobNo"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="WMSJobNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "WMSJobNo", "{0:}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" UniqueName="EstQty"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# uomDS%>'
                                            DataTextField="Descr" DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center" UniqueName="EstUnitCost"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" UniqueName="Remarks"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

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
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="invno" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="jbid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="frexpdate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="chargeoption">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="drdtid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="crossvehno" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="qudtid" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmGenerateChargesBtn" Text="" Style="display: none;" OnClick="ConfirmGenerateChargesBtn_Click" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="CombinedChargeViewTabRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="SplitRatioView" />
            <telerik:RadPageView runat="server" Height="70%" ID="ContainerNoPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

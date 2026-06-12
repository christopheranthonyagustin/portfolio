<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportCharge2.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportCharge2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TransportCharge</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
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

    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick" Style="height: 26px">
            <Tabs>
                <telerik:RadTab Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab ID="CtnrNoTab" Text="ContainerNo" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab ID="SplitRatioTab" Text="SplitRatio" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab ID="LogTab" Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td align="left">
                            <%-- <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="../../Image/Save.png" Visible="true"
                    OnClick="SaveBtn_Click" BackColor="Transparent" BorderWidth="0" ImageAlign="Middle"
                    ToolTip="Delete Selected Charges(s)" />
                &nbsp;
                <telerik:RadButton ID="GenerateBtn" runat="server" CssClass="detailButton" Text="Generate"
                    OnClick="GenerateBtn_Click" Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="QuBtn" runat="server" CssClass="detailButton" OnClick="QuBtnBtn_Click"
                    Text="Add From Quotation" Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/delete.png"
                    Visible="true" OnClick="DeleteBtn_Click" BackColor="Transparent" BorderWidth="0"
                    ImageAlign="Middle" ToolTip="Delete Selected Charges(s)" />--%>
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
                            &nbsp; &nbsp;
                        </td>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <%--<div id="div3" style="height: 100%">--%>
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
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid">
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
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "sno") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="SeqNoVal" runat="server" ControlToValidate="SeqNoTxt"
                                            EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                        <asp:Label ID="quseqnoLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "quseqno") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="ChargeDescription" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="chargecodeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                        <asp:Label ID="chargeLbl" runat="server" Width="160" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
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
                                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" UniqueName="Rate"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnRateTextChanged"
                                            AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>'></asp:TextBox>
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
                                <telerik:GridTemplateColumn HeaderText="Cny" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center" UniqueName="Amount"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="FcAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.00}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
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
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DiscountAmtTxt" Width="70px" runat="server" OnTextChanged="ResultDG_OnDiscountTextChanged"
                                            AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="DiscountAmtCompVal" runat="server" ControlToValidate="DiscountAmtTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center" UniqueName="BillingAmt"
                                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="BillingAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxType_ddl"
                                            ErrorMessage="*" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstQtyTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstQtyTxtCompVal" runat="server" ControlToValidate="EstQtyTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# uomDS%>'
                                            DataTextField="Descr" DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomDS,DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="EstUnitCostTxt" Width="70px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="EstUnitCostTxtCompVal" runat="server" ControlToValidate="EstUnitCostTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" Display="false" />
                                <telerik:GridBoundColumn DataField="drdtid" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="ContainerNoPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="SplitRatioView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogPageView" />
        </telerik:RadMultiPage>
        <%--</div>--%>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOK">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>

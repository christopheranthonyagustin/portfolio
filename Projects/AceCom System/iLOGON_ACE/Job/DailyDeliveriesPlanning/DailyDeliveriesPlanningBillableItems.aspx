<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveriesPlanningBillableItems.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanning.DailyDeliveriesPlanningBillableItems" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyDeliveriesPlanningBillableItems</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table><br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
                    <tr>
                        <td align="left">
                            <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" CausesValidation="false"
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
                         <asp:Button ID="ReadyBtn" CssClass="white" runat="server"
                             OnClick="ReadyBtn_Click" Text="Ready" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                         <asp:Button ID="PendingBtn" CssClass="white" runat="server"
                             OnClick="PendingBtn_Click" Text="Pending" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="BillBtn" CssClass="white" runat="server" OnClick="BillBtn_Click" Visible="True" Text="Bill" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="UndoBillBtn" CssClass="white" runat="server" OnClick="UndoBillBtn_Click" Visible="True" Text="UndoBill" CausesValidation="false" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                                <br />
                                <br />
                        <asp:Button ID="InvoiceBtn" runat="server" CssClass="blue" ToolTip="Invoice" UseSubmitBehavior="false" CausesValidation="false"
                            OnClick="InvoiceBtn_Click" Text="Invoice" OnClientClick="disableBtn(this.id)" />
                            &nbsp;
                        <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="NextItemBtn" CssClass="white" runat="server" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;
                        </td>
                        <td align="right">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>                                             
                        </td>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <div id="div3" style="height: 100%">
                    <%--                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>--%>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                        AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
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
                                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
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
                                <telerik:GridBoundColumn Display="False" DataField="frexpdate" SortExpression="frexpdate" HeaderText="frexpdate">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="chargeoption" SortExpression="chargeoption" HeaderText="chargeoption">
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
                                <telerik:GridTemplateColumn HeaderText="SeqNo <br /> Status" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "sno") %>'></asp:TextBox>
                                        <br />
                                        <asp:Label ID="quseqnoLbl" runat="server" Width="50" Text='<%# DataBinder.Eval(Container.DataItem, "quseqno") %>'></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="statusLbL" runat="server" Enabled="false" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "JBChargeStatusDescr") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center"
                                    UniqueName="ChargeDescription" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="chargecodeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                        <asp:Label ID="chargeLbl" runat="server" Width="200" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
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
                                            <Calendar>
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
                                <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="QtyTxt" runat="server" Width="60" OnTextChanged="ResultDG_QtyTextChanged"
                                            Value='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}") %>' AutoPostBack="true"></asp:TextBox>
                                        <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="UnitRateTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnUnitRateTextChanged"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>' AutoPostBack="true">></asp:TextBox>
                                        <asp:Label ID="CurrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="DiscountAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="DiscountAmtTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnDiscountAmtTextChanged"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "DiscountAmt", "{0:#,0.00}") %>' AutoPostBack="true"></asp:TextBox>
                                        <asp:CompareValidator ID="DiscountAmtVal" runat="server" ControlToValidate="DiscountAmtTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
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
                                <telerik:GridTemplateColumn HeaderText="Internal" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
                                    <ItemTemplate>
                                        <label class="switch">
                                            <input id="ChargeTypecb" runat="server" type="checkbox" name="switch" value='<%# DataBinder.Eval(Container.DataItem, "chargeoption") %>'>
                                            <div class="slider round"></div>
                                        </label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="VehNo" HeaderStyle-HorizontalAlign="Center"
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
                                <telerik:GridTemplateColumn HeaderText="BillingAmt" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="BillingAmtTxt" runat="server" Width="60" OnTextChanged="ResultDG_OnBillingAmtTextChanged"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "billingamt", "{0:#,0.00}") %>' AutoPostBack="true"></asp:TextBox>
                                        <asp:CompareValidator ID="BillingAmtVal" runat="server" ControlToValidate="BillingAmtTxt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="TaxType  <br/> AutoGen" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# taxTypeDS%>' DataTextField="Descr"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxType_ddl"
                                            ErrorMessage="*" />
                                        <br />
                                        <asp:DropDownList ID="AutoGen_ddl" runat="server" DataSource='<%# autoGenDS%>' DataTextField="Descr" Width="110px"
                                            DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(autoGenDS,DataBinder.Eval(Container.DataItem, "AutoGen").ToString())%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center"
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
                                <telerik:GridTemplateColumn HeaderText="EstUnitCost" HeaderStyle-HorizontalAlign="Center"
                                    AllowFiltering="false" Display="false">
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
                                <telerik:GridTemplateColumn HeaderText="JbCtnrTripID" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="JbCtnrTripIDLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "JbCtnrTripID") %>'></asp:Label>
                                        <asp:Label ID="statusTxt" runat="server" Enabled="false" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "JBChargeStatus") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="invno" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" Display="false" />
                                <telerik:GridBoundColumn DataField="drdtid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="crossvehno">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="False" DataField="JBChargeStatusColourCode">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <%--                        </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="ContainerNoPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="SplitRatioView" />
        </telerik:RadMultiPage>
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

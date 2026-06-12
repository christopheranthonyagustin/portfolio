<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceBillingWorkbenchGRBillableItems.aspx.cs" Inherits="iWMS.Web.Job.ServiceBillingWorkbench.ServiceBillingWorkbenchGRBillableItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GRBillableItems @ Service Billing Workbench</title>
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
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
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
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;
                    <asp:Label ID="GRInformationLbl" runat="server" CssClass="pagetitle"></asp:Label>
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
                OnNeedDataSource="SKULineResultGrid_NeedDataSource" BorderStyle="Solid" Skin="Metro"
                AllowSorting="true" AllowFilteringByColumn="true" OnItemDataBound="SKULineResultGrid_ItemDataBound" AllowPaging="true" PageSize="50">
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="rcdtid">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# (Container.ItemIndex + (SKULineResultGrid.CurrentPageIndex * SKULineResultGrid.PageSize) + 1).ToString()%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="Line" AllowFiltering="false" Visible="false"
                            SortExpression="line" UniqueName="line" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Sku" DataField="SkuCode" AllowFiltering="true"
                            SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="SkuDescr" AllowFiltering="true"
                            SortExpression="rcsskudescr" UniqueName="rcsskudescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Packing" DataField="packing" AllowFiltering="true"
                            SortExpression="packing" UniqueName="packing" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillGroup" DataField="BillingGrpDescr" AllowFiltering="true"
                            SortExpression="BillingGrpDescr" UniqueName="BillingGrpDescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UOM" DataField="UomDescr" AllowFiltering="false"
                            SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Expected" DataField="ExpectedUomQty" AllowFiltering="false"
                            SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                            DataFormatString="{0:#,0.##}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="InTransit" DataField="IntransitUomQty" AllowFiltering="false"
                            SortExpression="intransituomqty" UniqueName="intransituomqty" Reorderable="true"
                            DataFormatString="{0:#,0.##}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Received" DataField="ReceivedUomQty" AllowFiltering="true"
                            SortExpression="receiveduomqty" UniqueName="receiveduomqty" Reorderable="true"
                            DataFormatString="{0:#,0.##}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotalSerialNo" DataField="CntSNo" AllowFiltering="true"
                            SortExpression="CntSNo" UniqueName="CntSNo" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToLoc" DataField="loccode" AllowFiltering="true"
                            SortExpression="loccode" UniqueName="LocCode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="PaLoc" HeaderText="PaLoc">
                            <ItemTemplate>
                                <asp:TextBox ID="palocTxt" runat="server" Visible="false" Text='<%# Eval("PaLocCode") %>'>
                                </asp:TextBox>
                                <asp:Label ID="Ploc" Text='<%#DataBinder.Eval(Container.DataItem, "PaLocCode")%>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="checkdigit" HeaderText="Checkdigits">
                            <ItemTemplate>
                                <asp:TextBox ID="checkdigitText" runat="server" Text='<%# Eval("LocCheckDigit") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="RCSStatus" DataField="StatusDescr" AllowFiltering="true"
                            SortExpression="statusdescr" UniqueName="RcsStatus" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TUNo1" DataField="TUNo1" AllowFiltering="true"
                            SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LotRemarks" DataField="LotRemarks" AllowFiltering="true"
                            SortExpression="LotRemarks" UniqueName="LotRemarks" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LotId" DataField="LotId" AllowFiltering="true"
                            SortExpression="LotId" UniqueName="LotId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="RcvDate" DataField="rcdate" AllowFiltering="true"
                            SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Length" DataField="Length" AllowFiltering="true"
                            SortExpression="Length" UniqueName="Length" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Width" DataField="Width" AllowFiltering="true"
                            SortExpression="Length" UniqueName="Width" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Height" DataField="Height" AllowFiltering="true"
                            SortExpression="Length" UniqueName="Height" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Volume" DataField="vol" AllowFiltering="true"
                            SortExpression="vol" UniqueName="vol" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Weight" DataField="WT" AllowFiltering="true"
                            SortExpression="wt" UniqueName="wt" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                            SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                            SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                            SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                            SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true"
                            SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true"
                            SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true"
                            SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true"
                            SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                            SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                            SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                            SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                            SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotExpNetWt" DataField="totexpnetwt" AllowFiltering="true"
                            SortExpression="totexpnetwt" UniqueName="totexpnetwt" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TUNo2" DataField="tuno2" AllowFiltering="true"
                            SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExRef" DataField="RDExRef" AllowFiltering="true"
                            SortExpression="RDExRef" UniqueName="RDExRef" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="true"
                            SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotalWt" DataField="RCSTotWt" AllowFiltering="true"
                            SortExpression="RCSTotWt" UniqueName="RCSTotWt" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotalVol" DataField="RCSTotVol" AllowFiltering="true"
                            SortExpression="RCSTotVol" UniqueName="RCSTotVol" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Area(L)" DataField="arealength" AllowFiltering="true"
                            SortExpression="arealength" UniqueName="arealength" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Area(W)" DataField="areawidth" AllowFiltering="true"
                            SortExpression="areawidth" UniqueName="areawidth" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Area" DataField="area" AllowFiltering="true"
                            SortExpression="area" UniqueName="area" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                            SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                            SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                            SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                            SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="Id" SortExpression="id" HeaderText="id" />
                        <telerik:GridBoundColumn Display="False" DataField="skuid" />
                        <telerik:GridBoundColumn Display="False" DataField="rcdstatus" />
                        <telerik:GridBoundColumn Display="False" DataField="rcid" />
                        <telerik:GridBoundColumn Display="False" DataField="RcdStatusColor" />
                        <telerik:GridBoundColumn Display="False" DataField="expectedqty" />
                        <telerik:GridBoundColumn Display="False" DataField="intransitqty" />
                        <telerik:GridBoundColumn Display="False" DataField="receivedqty" />
                        <telerik:GridBoundColumn DataField="BillingGrp"
                            SortExpression="BillingGrp" UniqueName="BillingGrp" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="status" />
                        <telerik:GridBoundColumn Display="False" DataField="DirectDischargeQty" UniqueName="DirectDischargeQty" />
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
                        <asp:Label ID="IssueNoLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        &nbsp;
                        <asp:Button ID="GINonBillableBtn" CssClass="LongLabelWhite" runat="server"
                            OnClick="GINonBillableBtn_Click" Text="GI-NonBillable" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <telerik:RadGrid ID="RCChargeResultGrid" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false"
                Skin="Metro" OnNeedDataSource="RCChargeResultGrid_NeedDataSource" OnItemDataBound="RCChargeResultGrid_ItemDataBound">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="RcChargeId" Width="600px">
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
                                <asp:Label ID="RcChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RcChargeId") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Display="false">
                            <ItemTemplate>
                                <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                                <asp:Label ID="DrDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "drdtid") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="S/N" HeaderText="S/N" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:TextBox ID="SeqNoTxt" runat="server" Width="50" Value='<%# DataBinder.Eval(Container.DataItem, "seqno") %>'></asp:TextBox>
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
                                <asp:TextBox ID="RCChargeDescrTxt" runat="server" Width="400" Height="70px" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "RCChargeDescr") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:TextBox ID="QtyTxt" Width="50px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty","{0:#,0.0000}") %>'
                                    OnTextChanged="QtyRateDiscount_TextChanged" AutoPostBack="true"></asp:TextBox>
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
                        <telerik:GridTemplateColumn HeaderText="TaxType" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:DropDownList ID="TaxType_ddl" runat="server" DataSource='<%# TaxTypeDS%>' DataTextField="Descr"
                                    DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeDS, DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="TMSInvoiceNo" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="TMSInvoiceNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
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
                                <asp:DropDownList ID="EstUnitCostUOM_ddl" runat="server" DataSource='<%# UomDS%>' DataTextField="Descr"
                                    DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UomDS, DataBinder.Eval(Container.DataItem, "estunitcostuom").ToString())%>' />
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
        </div>
    </form>
</body>
</html>

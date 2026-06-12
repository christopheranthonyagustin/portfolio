<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2DetlHead.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2DetlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>CostingSheetDetlHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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

    <style type="text/css">
        .div-radgrid {
            height: 82%;
            width: 89%;
            overflow: auto;
            position: relative;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="LineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="True"
                        ToolTip="Update Selected QuDetl(s)" CssClass="white" />&nbsp;
                <asp:Button ID="MergeBtn" runat="server" Text="Merge" OnClick="MergeBtn_Click" Visible="True"
                    ToolTip="Merge Costing Sheet Line(s)" CssClass="white" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div-radgrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true"
                Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QuDetail_Edit"
                                    runat="server">
                                    <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                        title="Edit" runat="server" /></a>

                                <a id="ldPriceBreak" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="PriceBreak_Click" visible="false"
                                    runat="server">
                                    <img id="Img1" src="../../image/detail.gif" width="15" height="15" border="0" alt="Price Break"
                                        title="Price Break" runat="server" /></a>
                                <%--<asp:ImageButton runat="server" Visible="false" ID="PriceBreakBtn" ImageUrl="'../../image/detail.gif'"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Price Break"
                                OnClick="PriceBreakBtn_Click" CausesValidation="False"></asp:ImageButton>--%>
                            </ItemTemplate>
                            <ItemStyle Wrap="false" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                S/N
                            </HeaderTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="QuotationNumber" DataField="qunumber" AllowFiltering="true"
                            ColumnGroupName="qunumber" SortExpression="qunumber" UniqueName="qunumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                            ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                            ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                            ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingGrp" DataField="billinggrpdescr" AllowFiltering="true"
                            ColumnGroupName="billinggrpdescr" SortExpression="billinggrpdescr" UniqueName="billinggrpdescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="true"
                            ColumnGroupName="poldescr" SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="true"
                            ColumnGroupName="poddescr" SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DefaultQty" DataField="defaultqty" AllowFiltering="true"
                            ColumnGroupName="defaultqty" SortExpression="defaultqty" UniqueName="defaultqty"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitRate" DataField="unitrate" AllowFiltering="true"
                            ColumnGroupName="unitrate" SortExpression="unitrate" UniqueName="unitrate" Reorderable="true"
                            DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitRateUOM" DataField="unitrateuomdescr" AllowFiltering="true"
                            AllowSorting="true" ColumnGroupName="unitrateuomdescr" SortExpression="unitrateuomdescr"
                            UniqueName="unitrateuomdescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vendor" DataField="VendorName" AllowFiltering="true"
                            ColumnGroupName="VendorName" SortExpression="VendorName" UniqueName="VendorName"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="VendorSrc" DataField="VendorSrc" AllowFiltering="true"
                            ColumnGroupName="VendorSrc" SortExpression="VendorSrc" UniqueName="VendorSrc"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CostQty" DataField="estqty" AllowFiltering="true"
                            ColumnGroupName="estqty" SortExpression="estqty" UniqueName="estqty" Reorderable="true"
                            DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitCost" DataField="estunitcost" AllowFiltering="true"
                            ColumnGroupName="estunitcost" SortExpression="estunitcost" UniqueName="estunitcost"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitCostUOM" DataField="estunitcostuom" AllowFiltering="true"
                            AllowSorting="true" ColumnGroupName="estunitcostuom" SortExpression="estunitcostuom"
                            UniqueName="estunitcostuom" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillAccount" DataField="billaccode" AllowFiltering="true"
                            ColumnGroupName="billaccode" SortExpression="billaccode" UniqueName="billaccode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillAccSrc" DataField="billacsrc" AllowFiltering="true"
                            ColumnGroupName="billacsrc" SortExpression="billacsrc" UniqueName="billacsrc"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                            AllowFiltering="true" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                            UniqueName="billingmethoddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="true"
                            ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethoddescr"
                            AllowFiltering="true" ColumnGroupName="billingcalcmethoddescr" SortExpression="billingcalcmethoddescr"
                            UniqueName="billingcalcmethoddescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="false"
                            ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MinCharge" DataField="minimumcharge" AllowFiltering="true"
                            ColumnGroupName="minimumcharge" SortExpression="minimumcharge" UniqueName="minimumcharge"
                            Reorderable="true" DataFormatString="{0:#,0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MinChargeType" DataField="minimumchargetypedescr"
                            AllowFiltering="true" ColumnGroupName="minimumchargetypedescr" SortExpression="minimumchargetypedescr"
                            UniqueName="minimumchargetypedescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="true"
                            ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                            Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="DateOption" DataField="dateoptiondescr" AllowFiltering="true"
                            ColumnGroupName="dateoptiondescr" SortExpression="dateoptiondescr" UniqueName="dateoptiondescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                            ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor"
                            HeaderText="Statuscolor" />
                        <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                            ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                            ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                            ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                            ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="QuId" SortExpression="QuId" />
                        
                        <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

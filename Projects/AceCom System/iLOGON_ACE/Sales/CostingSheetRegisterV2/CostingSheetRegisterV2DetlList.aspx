<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2DetlList.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2DetlList" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>CostingSheetRegisterV2DetlList</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

    <script language="javascript" type="text/javascript">
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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AddDetailBtn" runat="server" Text="New" OnClick="AddDetailBtn_Click" Visible="true"
                        CssClass="white"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="reseqBtn" runat="server" Text="Re-Seq" OnClick="ReSeqBtn_Click" Visible="true"
                        CssClass="white"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="EditBtn" runat="server" Text="Edit" OnClick="EditBtn_Click" CssClass="white" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="DelImgBtn" runat="server" Text="Delete" OnClick="DeleteAllBtn_Click" Visible="true"
                        ToolTip="Delete Selected Costing Sheet Line(s)" CssClass="white"></asp:Button>
                </td>
                <td>
                    <telerik:RadMenu ID="RadMenu1" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                        OnItemClick="FreightRadMenu_ItemClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="From VQ" PostBack="false"
                                Value="FromVQ" GroupSettings-Width="100px">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Agency" Text="AgencyFee"
                                        Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Freight" Text="Freight"
                                        Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Others" Text="Others"
                                        Visible="True" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                    &nbsp;                
                </td>
                <td>
                    <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ButtonExcel_Click"
                                  UseSubmitBehavior="false" />&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" 
           ExportSettings-UseItemStyles ="true"  UseAccessibleHeader="True">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QuDetail_Edit"
                                runat="server">
                                <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                    title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="QUDetail_Copy" runat="server">
                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                            title="Copy" runat="server" /></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete?')" onserverclick="QuDetail_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                                    title="Delete Detail" runat="server" /></a>
                            <asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>
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
                    <telerik:GridBoundColumn HeaderText="SeqNo" DataField="seqno" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="seqno" SortExpression="seqno" UniqueName="seqno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingGrp" DataField="billinggrpdescr" AllowFiltering="false"
                        ColumnGroupName="billinggrpdescr" SortExpression="billinggrpdescr" UniqueName="billinggrpdescr"
                        Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingGrp1" DataField="billinggrp" AllowFiltering="true"
                        ColumnGroupName="billinggrp" SortExpression="billinggrp" UniqueName="billinggrp"
                        Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="false"
                        ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="false"
                        ColumnGroupName="poldescr" SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="false"
                        ColumnGroupName="poddescr" SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TradingCompany" DataField="SellBuyTradingCompany" AllowFiltering="true"
                        ColumnGroupName="SellBuyTradingCompany" SortExpression="SellBuyTradingCompany" UniqueName="SellBuyTradingCompany" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="SellBuyQty" AllowFiltering="true"
                        ColumnGroupName="SellBuyQty" SortExpression="SellBuyQty" UniqueName="SellBuyQty" Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CNY" DataField="SellBuyCurrCode" AllowFiltering="true"
                        ColumnGroupName="SellBuyCurrCode" SortExpression="SellBuyCurrCode" UniqueName="SellBuyCurrCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitRate" DataField="SellBuyUnitRate" AllowFiltering="true"
                        ColumnGroupName="SellBuyUnitRate" SortExpression="SellBuyUnitRate" UniqueName="SellBuyUnitRate" Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitRateUOM" DataField="SellBuyUnitRateUOM" AllowFiltering="true"
                        ColumnGroupName="SellBuyUnitRateUOM" SortExpression="SellBuyUnitRateUOM" UniqueName="SellBuyUnitRateUOM" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VendorName" DataField="VendorName" AllowFiltering="true"
                        SortExpression="VendorName" UniqueName="VendorName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CostPort" DataField="SellBuyPort" AllowFiltering="true"
                        ColumnGroupName="SellBuyPort" SortExpression="SellBuyPort" UniqueName="SellBuyPort" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CostQty" DataField="EstQty" AllowFiltering="true"
                        ColumnGroupName="EstQty" SortExpression="EstQty" UniqueName="EstQty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CostRate" DataField="EstUnitCost" AllowFiltering="true"
                        ColumnGroupName="EstUnitCost" SortExpression="EstUnitCost" UniqueName="EstUnitCost" Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CostUOM" DataField="EstUnitCostUOM" AllowFiltering="true"
                        ColumnGroupName="EstUnitCostUOM" SortExpression="EstUnitCostUOM" UniqueName="EstUnitCostUOM" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillAccount" DataField="BillAcName" AllowFiltering="true"
                        SortExpression="BillAcName" UniqueName="BillAcName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SellQty" DataField="DefaultQty" AllowFiltering="true"
                        ColumnGroupName="DefaultQty" SortExpression="DefaultQty" UniqueName="DefaultQty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SellRate" DataField="UnitRate" AllowFiltering="true"
                        ColumnGroupName="UnitRate" SortExpression="UnitRate" UniqueName="UnitRate" Reorderable="true" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SellUOM" DataField="UnitRateUOM" AllowFiltering="true"
                        ColumnGroupName="UnitRateUOM" SortExpression="UnitRateUOM" UniqueName="UnitRateUOM" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Tax" DataField="taxtype" AllowFiltering="false"
                        ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                        FilterControlWidth="10px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                        AllowFiltering="false" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                        UniqueName="billingmethoddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="false"
                        ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethoddescr"
                        AllowFiltering="false" ColumnGroupName="billingcalcmethoddescr" SortExpression="billingcalcmethoddescr"
                        UniqueName="billingcalcmethoddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="false"
                        ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="false"
                        ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor"
                        HeaderText="Statuscolor" />
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
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


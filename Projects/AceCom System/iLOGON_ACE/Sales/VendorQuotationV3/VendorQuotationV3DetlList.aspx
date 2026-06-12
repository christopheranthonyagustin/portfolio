<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorQuotationV3DetlList.aspx.cs" Inherits="iWMS.Web.Sales.VendorQuotationV3.VendorQuotationV3DetlList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>VendorQuotationDetlList</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle">
                       <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" OnClick="AddDetailBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="NewLine" UseSubmitBehavior="false" />
                &nbsp;
                        <asp:Button ID="reseqBtn" runat="server" Text="Re-Seq" OnClick="ReSeqBtn_Click"
            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Re-Seq" UseSubmitBehavior="false" />
                </td>
                <td align="right"></td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            OnPreRender="ResultDG_PreRender" AllowFilteringByColumn="true" Skin="Metro"
            OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
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
                            <asp:Label ID="MSDSLbl" runat="server" />
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
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                        ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="POLDescr" AllowFiltering="false"
                        ColumnGroupName="POLDescr" SortExpression="POLDescr" UniqueName="POLDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="PODDescr" AllowFiltering="false"
                        ColumnGroupName="PODDescr" SortExpression="PODDescr" UniqueName="PODDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipperName" DataField="ExporterName" AllowFiltering="true"
                        ColumnGroupName="ExporterName" SortExpression="ExporterName" UniqueName="ExporterName"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Commodity" DataField="CommodityDescr" AllowFiltering="true"
                        ColumnGroupName="CommodityDescr" SortExpression="CommodityDescr" UniqueName="CommodityDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DG" DataField="commodityclassdescr" AllowFiltering="false"
                        ColumnGroupName="commodityclassdescr" SortExpression="commodityclassdescr" UniqueName="commodityclassdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="IMDG" DataField="IMDG" AllowFiltering="false"
                        ColumnGroupName="IMDG" SortExpression="IMDG" UniqueName="IMDG" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UNNo" DataField="UNNo" AllowFiltering="false"
                        ColumnGroupName="UNNo" SortExpression="UNNo" UniqueName="UNNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PackingGroup" DataField="PackingGroup" AllowFiltering="false"
                        ColumnGroupName="PackingGroup" SortExpression="PackingGroup" UniqueName="PackingGroup"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="false"
                        ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="estqty" AllowFiltering="false"
                        ColumnGroupName="estqty" SortExpression="estqty" UniqueName="estqty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnitCost" DataField="estunitcost" AllowFiltering="false"
                        ColumnGroupName="estunitcost" SortExpression="estunitcost" UniqueName="estunitcost"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="estunitcostuom" AllowFiltering="false"
                        ColumnGroupName="estunitcostuom" SortExpression="estunitcostuom" UniqueName="estunitcostuom"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingMethod" DataField="billingmethoddescr"
                        AllowFiltering="true" ColumnGroupName="billingmethoddescr" SortExpression="billingmethoddescr"
                        UniqueName="billingmethoddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BillingCalcMethod" DataField="billingcalcmethoddescr"
                        AllowFiltering="true" ColumnGroupName="billingcalcmethoddescr" SortExpression="billingcalcmethoddescr"
                        UniqueName="billingcalcmethoddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="true"
                        ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="false"
                        ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TaxType" DataField="taxtype" AllowFiltering="false"
                        ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                        FilterControlWidth="10px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
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
                    <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
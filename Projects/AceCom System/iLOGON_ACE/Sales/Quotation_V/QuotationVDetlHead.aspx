<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVDetlHead.aspx.cs" Inherits="iWMS.Web.Sales.Quotation_V.QuotationVDetlHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>QuotationDetlHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <%-- <tr>
            <td class="pagetitle">
                &nbsp;<asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" Visible="true"
                    CssClass="detailButton" OnClick="AddDetailBtn_Click"></asp:Button>
            </td>
            <td align="right">
            </td>
        </tr>--%>
            <tr>
                <td>
                    <%-- <asp:ImageButton ID="MassChangeBtn" runat="server" OnClick="MassChangeBtn_Click"
                    AlternateText="Update" ToolTip="Update Selected QuDetl(s)" ImageUrl="../../Image/Update.png"
                    BackColor="Transparent" BorderWidth="0" />
                    <asp:ImageButton ID="MergeBtn" runat="server" OnClick="MergeBtn_Click"
                    AlternateText="Merge" ToolTip="Merge QuDetl" ImageUrl="../../Image/Merge.png"
                    BackColor="Transparent" BorderWidth="0" Width="43px" Height="39px" />--%>
                    <asp:Button ID="MassChangeBtn" runat="server" Text="Update" OnClick="MassChangeBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update Selected QuDetl(s)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="MergeBtn" runat="server" Text="Merge" OnClick="MergeBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Merge QuDetl" UseSubmitBehavior="false" />
                </td>


            </tr>
        </table>
        <div id="div-radgrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true"
                AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
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
                                    <img id="Img4" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Edit"
                                        title="Edit" runat="server" /></a>
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
                        <%-- <telerik:GridBoundColumn HeaderText="SeqNo" DataField="seqno" AllowFiltering="false"
                        AllowSorting="false" ColumnGroupName="seqno" SortExpression="seqno" UniqueName="seqno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn HeaderText="QuotationNumber" DataField="qunumber" AllowFiltering="true"
                            ColumnGroupName="qunumber" SortExpression="qunumber" UniqueName="qunumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vendor" DataField="vendorcode" AllowFiltering="true"
                            ColumnGroupName="vendorcode" SortExpression="vendorcode" UniqueName="vendorcode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                            ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                            ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="POL" DataField="POLDescr" AllowFiltering="true"
                            ColumnGroupName="POLDescr" SortExpression="POLDescr" UniqueName="POLDescr"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="POD" DataField="PODDescr" AllowFiltering="true"
                            ColumnGroupName="PODDescr" SortExpression="PODDescr" UniqueName="PODDescr"
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
                            ColumnGroupName="IMDG" SortExpression="IMDG" UniqueName="IMDG"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UNNo" DataField="UNNo" AllowFiltering="false"
                            ColumnGroupName="UNNo" SortExpression="UNNo" UniqueName="UNNo"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PackingGroup" DataField="PackingGroup" AllowFiltering="false"
                            ColumnGroupName="PackingGroup" SortExpression="PackingGroup" UniqueName="PackingGroup"
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
                        <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="false"
                            ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Qty" DataField="estqty" AllowFiltering="false"
                            ColumnGroupName="estqty" SortExpression="estqty" UniqueName="estqty"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UnitCost" DataField="estunitcost" AllowFiltering="false"
                            ColumnGroupName="estunitcost" SortExpression="estunitcost" UniqueName="estunitcost"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="UOM" DataField="estunitcostuom" AllowFiltering="false"
                            ColumnGroupName="estunitcostuom" SortExpression="estunitcostuom" UniqueName="estunitcostuom"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="EffectiveDate" DataField="effectivedate" AllowFiltering="true"
                            ColumnGroupName="effectivedate" SortExpression="effectivedate" UniqueName="effectivedate"
                            Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-ForeColor="blue">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Tax" DataField="taxtype" AllowFiltering="true"
                            ColumnGroupName="taxtype" SortExpression="taxtype" UniqueName="taxtype" Reorderable="true"
                            FilterControlWidth="10px">
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
                        <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

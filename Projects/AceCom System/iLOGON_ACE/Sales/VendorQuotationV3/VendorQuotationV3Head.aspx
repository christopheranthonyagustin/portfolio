<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorQuotationV3Head.aspx.cs" Inherits="iWMS.Web.Sales.VendorQuotationV3.VendorQuotationV3Head" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Vendor Quotation V3 Head</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <asp:Button ID="ChargeMatrixBtn" runat="server" Text="MatrixView" CssClass="white"
            OnClick="ChargeMatrixBtn_Click" ToolTip="MatrixView"></asp:Button>
        &nbsp;
         <asp:Button ID="CopyBtn" runat="server" Text="Copy" CssClass="white"
             OnClick="CopyBtn_Click" ToolTip="Copy Vendor Quotation" Visible="false"></asp:Button>
        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="white"
            OnClick="DeleteBtn_Click" OnClientClick="return confirm('Confirm delete?')" ToolTip="Delete"></asp:Button>
        <asp:Button ID="DeleteAllBtn" runat="server" Text="DeleteAll" CssClass="white"
            OnClick="DeleteAllBtn_Click" OnClientClick="return confirm('Delete all quotation lines that have not been generated into invoice?')" ToolTip="Delete all quotation lines"></asp:Button>&nbsp;
                    <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" CssClass="white"
                        OnClick="ConfirmBtn_Click" OnClientClick="return confirm('Proceed to Confirm Quotation?')" ToolTip="Confirm"></asp:Button>&nbsp;
                     <asp:Button ID="QuotationBtn" runat="server" Text="Quotation" CssClass="blue"
                         OnClick="QuotationBtn_Click" ToolTip="Excel Quotation"></asp:Button>&nbsp;
              <asp:Button ID="QuotationExcelBtn" runat="server" Text="Quotation" CssClass="green"
                  OnClick="QuotationExcelBtn_Click" ToolTip="Quotation"></asp:Button>&nbsp;
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            GroupPanelPosition="Top" AllowSorting="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
            OnPreRender="ResultDG_PreRender">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                HierarchyLoadMode="Client">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="VendorQuotationEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Vendor Quotation" ToolTip="Edit Vendor Quotation"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="VQLineEdit" ImageUrl="../../image/rcsdetl.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Go to Vendor Quotation Line" ToolTip="Go to Vendor Quotation Line"
                                OnClick="ldLineEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <iWMS:iSubMenu ID="subMenuCtl" runat="server" Visible="false"></iWMS:iSubMenu>
                            <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server" Visible="false"></iWMS:iSubMenu>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Code" DataField="code" AllowFiltering="true"
                        ColumnGroupName="code" SortExpression="code" UniqueName="code" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vendor" DataField="pcode" AllowFiltering="true"
                        ColumnGroupName="pcode" SortExpression="pcode" UniqueName="pcode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                        ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DG" DataField="CommodityClassDescr" AllowFiltering="true"
                        ColumnGroupName="CommodityClassDescr" SortExpression="CommodityClassDescr" UniqueName="CommodityClassDescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="POLdescr" AllowFiltering="true"
                        ColumnGroupName="POLdescr" SortExpression="POLdescr" UniqueName="POLdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="PODdescr" AllowFiltering="true"
                        ColumnGroupName="PODdescr" SortExpression="PODdescr" UniqueName="PODdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Country" DataField="countrydescr" AllowFiltering="true"
                        ColumnGroupName="countrydescr" SortExpression="countrydescr" UniqueName="countrydescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Depot" DataField="sitedescr" AllowFiltering="true"
                        ColumnGroupName="sitedescr" SortExpression="sitedescr" UniqueName="sitedescr"
                        Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SalesMan" DataField="smancodedescr" AllowFiltering="true"
                        ColumnGroupName="smancodedescr" SortExpression="smancodedescr" UniqueName="smancodedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ValidTillDate" DataField="validtilldate" AllowFiltering="true"
                        ColumnGroupName="validtilldate" SortExpression="validtilldate" UniqueName="validtilldate"
                        Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtRef1" DataField="exref1" AllowFiltering="true"
                        ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExtRef2" DataField="exref2" AllowFiltering="true"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem" AllowFiltering="true"
                        ColumnGroupName="rem" SortExpression="rem" UniqueName="rem" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
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
                    <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                    <telerik:GridBoundColumn Display="False" DataField="vdid" SortExpression="vdid" />
                    <telerik:GridBoundColumn Display="False" DataField="type" SortExpression="type" />
                    <telerik:GridBoundColumn Display="False" DataField="EntId"/>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" Width="100%" SkinID="Telerik"
                        AllowPaging="false" AllowFilteringByColumn="false" TableLayout="Fixed">
                        <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="exportername" SortExpression="exportername" HeaderText="Shipper"
                                HeaderStyle-Width="300px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL"
                                HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD"
                                HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="estunitcost" SortExpression="estunitcost" HeaderText="Cost"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"
                                DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="commoditydescr" SortExpression="commoditydescr"
                                HeaderText="Commodity" HeaderStyle-Width="400px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="imdg" SortExpression="imdg" HeaderText="IMDG"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="unno" SortExpression="unno" HeaderText="UNNo"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="packinggroup" SortExpression="packinggroup" HeaderText="PG">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                    <telerik:GridTableView DataKeyNames="id" Name="OFChildGrid" Width="100%" SkinID="Telerik"
                        AllowPaging="false" AllowFilteringByColumn="false" TableLayout="Fixed">
                        <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge"
                                HeaderStyle-Width="300px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="estqty" SortExpression="estqty" HeaderText="Qty"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"
                                DataFormatString="{0:#,0}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="estunitcost" SortExpression="estunitcost" HeaderText="Cost"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"
                                DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="estunitcostuom" SortExpression="estunitcostuom" HeaderText="UOM" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL" UniqueName="poldescr" Display="false"
                                HeaderStyle-Width="200px" Reorderable="true" ColumnGroupName="poldescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD" UniqueName="poddescr" Display="false"
                                Reorderable="true" ColumnGroupName="poddescr">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>


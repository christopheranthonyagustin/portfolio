<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Head.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Head" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CostingSheetRegisterV2Head</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
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
        function OnClientItemBlurMenu(sender, args) {
            sender.close(true);
        }
        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function ClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Expire" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="ResultRadPageView">
                <br />
                <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ApproveBtn" runat="server" Text="Approve" OnClick="Approve_RadButtonClicked" Visible="true"
                                OnClientClick="return confirm('Confirm to approve selected CostingSheet?')" ToolTip="Approve Costing Sheet" CssClass="white"></asp:Button>
                            &nbsp;
                            <asp:Button ID="RejectBtn" runat="server" Text="Reject" OnClick="RejectBtn_Click"
                                OnClientClick="return confirm('Confirm to reject selected CostingSheet?')" CssClass="white"></asp:Button>
                            &nbsp;
                            <asp:Button ID="ReopenBtn" runat="server" Text="Reopen" OnClick="ReopenBtn_Click"
                                OnClientClick="return confirm('Confirm to be Reopen selected CostingSheet?')" CssClass="white"></asp:Button>
                            &nbsp;
                            <asp:Button ID="InactiveBtn" runat="server" Text="Inactive" OnClick="InactiveBtn_Click"
                                OnClientClick="return confirm('Confirm to be Inactive selected CostingSheet?')" CssClass="white"></asp:Button>
                            &nbsp;
                            <asp:Button ID="QuotationBtn" runat="server" Text="Sales Quotation" OnClick="QuotationBtn_Click"
                                CssClass="LONGLABELBLUE" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>&nbsp;
                            <telerik:RadMenu ID="EmailRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                OnItemClick="EmailRadMenu_ItemClick" Width="115px" OnClientItemClicked="ClientOnClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp; Email &nbsp;&nbsp;&nbsp;" PostBack="false" BackColor="#88fd64"
                                        Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SalesQuotation" Text="Sales Quotation"
                                                BackColor="White" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    GroupPanelPosition="Top" AllowSorting="true">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
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
                                    <asp:ImageButton runat="server" Visible="True" ID="JobEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Costing Sheet"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton ID="Copybtn" runat="server" Visible="True" ImageUrl="../../image/copy.png" ToolTip="Copy"
                                        Width="15" Height="15" AlternateText="Copy" BackColor="Transparent" OnClick="CopyBtn_Click"
                                        BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;
                                <asp:ImageButton ID="Deletebtn" runat="server" Visible="False" ImageUrl="../../image/deletealllines.png" ToolTip="DeleteAllLines"
                                    Width="15" Height="15" AlternateText="DeleteAllLines" BackColor="Transparent" OnClick="Deletebtn_Click1"
                                    OnClientClick="return confirm('Delete all costing sheet lines that have not been generated into invoice?');"
                                    BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;                                                                       
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                            <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" />
                            <telerik:GridBoundColumn HeaderText="Account" DataField="acname" AllowFiltering="true"
                                ColumnGroupName="acname" SortExpression="acname" UniqueName="acname" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="code" AllowFiltering="true"
                                ColumnGroupName="code" SortExpression="code" UniqueName="code" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="true"
                                ColumnGroupName="poldescr" SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="true"
                                ColumnGroupName="poddescr" SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Commodity" DataField="CommodityDescr" AllowFiltering="true"
                                ColumnGroupName="CommodityDescr" SortExpression="CommodityDescr" UniqueName="CommodityDescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="JobNo(s)" DataField="JobNo(s)" AllowFiltering="false"
                                ColumnGroupName="JobNo(s)" SortExpression="JobNo(s)" UniqueName="JobNo(s)"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DG" DataField="commodityclass" AllowFiltering="true"
                                ColumnGroupName="commodityclass" SortExpression="commodityclass" UniqueName="commodityclass"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MaxUnits" DataField="totalqty" AllowFiltering="false"
                                ColumnGroupName="totalqty" SortExpression="totalqty" UniqueName="totalqty" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UnitsLeft" DataField="UnitsLeft" AllowFiltering="false"
                                ColumnGroupName="UnitsLeft" SortExpression="UnitsLeft" UniqueName="UnitsLeft" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ValidTillDate" DataField="validtilldate" AllowFiltering="true"
                                ColumnGroupName="validtilldate" SortExpression="validtilldate" UniqueName="validtilldate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                            <telerik:GridBoundColumn HeaderText="SalesMan" DataField="smancodedescr" AllowFiltering="true"
                                ColumnGroupName="smancodedescr" SortExpression="smancodedescr" UniqueName="smancodedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="true"
                                ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="D-S" DataField="DS" AllowFiltering="true" ColumnGroupName="DS"
                                SortExpression="DS" UniqueName="DS" Reorderable="true">
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
                            <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                            <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
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
                            <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                            <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" />
                            <telerik:GridBoundColumn Display="False" DataField="accode" SortExpression="accode" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ExpirePageView1">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ExpireInactiveBtn" runat="server" Text="Inactive" OnClick="ExpireInactiveBtn_Click" Visible="true"
                                OnClientClick="return confirm('Confirm to be Inactive selected CostingSheet?')" CssClass="white"></asp:Button>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ExpireResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ExpireResultDG_NeedDataSource"
                    AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ExpireResultDG_ItemDataBound"
                    GroupPanelPosition="Top" AllowSorting="true">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ExpireGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                                    <asp:ImageButton runat="server" Visible="True" ID="JobEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Costing Sheet"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None"
                                        OnClientMouseOver="OnClientMouseOverHandler" OnClientItemBlur="OnClientItemBlurMenu" ExpandAnimation-Duration="0" CollapseAnimation-Duration="0" EnableEmbeddedSkins="false">
                                        <Items>
                                            <telerik:RadMenuItem ImageUrl="../../image/wrench.png">
                                            </telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenu>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemTemplate>
                                    <telerik:RadMenu ID="RadMenu2" runat="server" ClickToOpen="true" ExpandAnimation-Type="None"
                                        OnClientMouseOver="OnClientMouseOverHandler" OnClientItemBlur="OnClientItemBlurMenu" ExpandAnimation-Duration="0" CollapseAnimation-Duration="0" EnableEmbeddedSkins="false">
                                        <Items>
                                            <telerik:RadMenuItem ImageUrl="../../image/printer.png">
                                            </telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenu>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                            <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" />
                            <telerik:GridBoundColumn HeaderText="Acc" DataField="accode" AllowFiltering="true"
                                ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="code" AllowFiltering="true"
                                ColumnGroupName="code" SortExpression="code" UniqueName="code" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="typedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="true"
                                ColumnGroupName="poldescr" SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="true"
                                ColumnGroupName="poddescr" SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Commodity" DataField="CommodityDescr" AllowFiltering="true"
                                ColumnGroupName="CommodityDescr" SortExpression="CommodityDescr" UniqueName="CommodityDescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DG" DataField="commodityclass" AllowFiltering="true"
                                ColumnGroupName="commodityclass" SortExpression="commodityclass" UniqueName="commodityclass"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MaxUnits" DataField="totalqty" AllowFiltering="false"
                                ColumnGroupName="totalqty" SortExpression="totalqty" UniqueName="totalqty" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UnitsLeft" DataField="UnitsLeft" AllowFiltering="false"
                                ColumnGroupName="UnitsLeft" SortExpression="UnitsLeft" UniqueName="UnitsLeft" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ValidTillDate" DataField="validtilldate" AllowFiltering="true"
                                ColumnGroupName="validtilldate" SortExpression="validtilldate" UniqueName="validtilldate"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                            <telerik:GridBoundColumn HeaderText="SalesMan" DataField="smancodedescr" AllowFiltering="true"
                                ColumnGroupName="smancodedescr" SortExpression="smancodedescr" UniqueName="smancodedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CUR" DataField="currcode" AllowFiltering="true"
                                ColumnGroupName="currcode" SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="D-S" DataField="DS" AllowFiltering="true" ColumnGroupName="DS"
                                SortExpression="DS" UniqueName="DS" Reorderable="true">
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
                            <telerik:GridBoundColumn Display="False" DataField="smancode" SortExpression="smancode" />
                            <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
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
                            <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

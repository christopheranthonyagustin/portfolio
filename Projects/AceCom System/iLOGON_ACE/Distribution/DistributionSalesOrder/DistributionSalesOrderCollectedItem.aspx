<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderCollectedItem.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderCollectedItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AllocationHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
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
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="GLDistributionRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="DeleteBtn" runat="server" Text="Delete " OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" OnEditCommand="ResultDG_Edit"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnUpdateCommand="ResultDG_Update">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="false" PageSize="50" DataKeyNames="SalesOrderCollectedItemId" EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <itemstyle wrap="False" horizontalalign="Center"></itemstyle>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="salesordercollecteditemid" runat="server" Visible="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="SalesOrderCollectedItemId" ItemStyle-Wrap="false" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SalesOrderCollectedItemId")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="SalesorderItemId" ItemStyle-Wrap="false" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SalesorderItemId")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="ItemCollectedQty" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ItemCollectedQty")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="ItemDeliveredQty" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ItemDeliveredQty")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="ItemCollectedDate" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ItemCollectedDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="ItemCollectionStatus" ItemStyle-Wrap="false" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ItemCollectionStatusDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ItemCollectionStatusComBo" runat="server" DataTextField="descr" DataValueField="item"
                                        Skin="Sunset" Width="150px" DropDownWidth="150px" DataSource='<%# SalesOrderCollectedItemStatusDS%>'
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "ItemCollectionStatusDescr") %>'>
                                    </telerik:RadComboBox>

                                    <asp:RequiredFieldValidator ID="ItemCollectionStatusComBoReqVal" runat="server"
                                        ControlToValidate="ItemCollectionStatusComBo" ErrorMessage="*" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="AddDate" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("adddate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="AddUser" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "adduser")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="EditDate" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("editdate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" HorizontalAlign="Left" ForeColor="Black"></PagerStyle>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

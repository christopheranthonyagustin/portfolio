<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterItems.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterItems" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head runat="server">
    <title>Move Register Items</title>    
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" >
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table runat="server">
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>                    
                </td>
                <td>
                    <asp:Button ID="GenerateBtn" runat="server" CssClass="white" Text="Generate"
                        OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>                
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
            OnEditCommand="ResultDG_Edit" GroupPanelPosition="Top" OnUpdateCommand="ResultDG_UpdateCommand"
            OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace"
                CommandItemDisplay="Top">
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="TaskDetail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="S/N">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Items" HeaderText="Items">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "RMSItemDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="txtskucode" runat="server" DropDownHeight="150px" Skin="Sunset"
                                DataSource='<%# SKUCodeDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SKUCodeDS, DataBinder.Eval(Container.DataItem, "RMSItemDescr").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="inqty" HeaderText="Quantity">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtinqty" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="txtinqtyCompVal" runat="server" ControlToValidate="txtinqty" ValidationGroup="reqvalgrp"
                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="wt" HeaderText="Width">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "wt")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtwt" Text='<%# DataBinder.Eval(Container.DataItem, "wt") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                             <asp:CompareValidator ID="txtwtCompVal" runat="server" ControlToValidate="txtwt" ValidationGroup="reqvalgrp"
                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ItemRemarks" HeaderText="Remarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemRemarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtrem" Text='<%# DataBinder.Eval(Container.DataItem, "ItemRemarks") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                    <telerik:GridBoundColumn Display="False" DataField="jbctnrid" SortExpression="jbctnrid" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br /><br /><br />
        <telerik:RadGrid ID="ResultDG_Item" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_Item_NeedDataSource" >
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="skucode" UniqueName="skucode" SortExpression="skucode" HeaderText="Item">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skudescr" UniqueName="skudescr" SortExpression="skudescr" HeaderText="Description">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="inqty" UniqueName="inqty" SortExpression="inqty" HeaderText="Quantity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="wt" UniqueName="wt" SortExpression="wt" HeaderText="Width">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" UniqueName="remarks" SortExpression="remarks" HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
    </form>
</body>
</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountGeneralBusinessPostingGroup.aspx.cs" Inherits="iWMS.Web.Master.Account.AccountGeneralBusinessPostingGroup" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>General Business Posting Group</title>
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CssClass="white" OnClick="RefreshBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false"></asp:Button>
                    &nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="white" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false"></asp:Button>
                </td>
            </tr>
        </table>
        <br />

         <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Metro" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
            OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Item" >
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Item")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="ItemComBo" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                                EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="ItemComBo_ItemsRequested" OnSelectedIndexChanged="ItemComBo_SelectedIndexChanged"
                                ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="ItemComBo_Load">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Description">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Description")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="DescriptionTxtBox" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Created On">
                        <ItemTemplate>
                           <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("CreatedOn")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Modified On">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="false" DataField="StatusColourCode">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
<%@ Page Language="c#" CodeBehind="SkuGroupUOM.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.SkuGroup.SkuGroupUOM" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuGroupUOM</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <br />
                <asp:Button ID="AddUOMBtn" runat="server" Text="New" CssClass="white"
                    OnClick="AddUOMBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="white"
                    OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                &nbsp;<br />
                <br />
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <div id="div-datagrid">
        <telerik:RadGrid ID="UOMCfgDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="UOMCfgDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="UOMCfgDG_ItemDataBound"
            OnUpdateCommand="UOMCfgDG_Update" OnEditCommand="UOMCfgDG_Edit" OnCancelCommand="UOMCfgDG_Cancel">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                 <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="SkuGroupUOMDelete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" /></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="skuGrpId" SortExpression="skuGrpId"
                        HeaderText="SKU Group Id" />
                    <telerik:GridTemplateColumn Reorderable="true" UniqueName="uomdescr" SortExpression="uomdescr"
                        HeaderText="UOM">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="UOMList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                                DataSource='<%# packListDS%>' />
                            <asp:RequiredFieldValidator ID="UOMReqVal" runat="server" ControlToValidate="UOMList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="true" UniqueName="wholeloosedescr" SortExpression="wholeloosedescr"
                        HeaderText="Whole/Loose">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "wholeloosedescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="WholeLooseList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(wholeLooseListDS,DataBinder.Eval(Container.DataItem, "wholeloose").ToString())%>'
                                DataSource='<%# wholeLooseListDS%>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="true" UniqueName="catdescr" SortExpression="catdescr"
                        HeaderText="Category">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "catdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="CategoryList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(uomCatListDS,DataBinder.Eval(Container.DataItem, "cat").ToString())%>'
                                DataSource='<%# uomCatListDS%>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid></div>
    </form>
</body>
</html>

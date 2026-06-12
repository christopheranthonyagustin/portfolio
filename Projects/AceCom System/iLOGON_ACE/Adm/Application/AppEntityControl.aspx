<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppEntityControl.aspx.cs" Inherits="iWMS.Web.Adm.Application.AppEntityControl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Entity Control</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="AddEntityControlBtn" runat="server" Text="New" CssClass="white" OnClick="AddEntityControlBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                    <asp:Button ID="DeleteAllBtn" runat="server" class="white" Text="Delete" OnClick="DeleteAllBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="EntityControlDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="EntityControlDG_NeedDataSource" Skin="Metro" OnItemDataBound="EntityControlDG_ItemDataBound"
            OnUpdateCommand="EntityControlDG_UpdateCommand" OnEditCommand="EntityControlDG_Edit" OnCancelCommand="EntityControlDG_Cancel">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="25" DataKeyNames="id" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="EntityControlEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>

                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="EntityControlDelete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Entity Control"
                                    align="absmiddle" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="EntityControlUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="EntityControlCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="appId" SortExpression="appId" HeaderText="APPLICATION"
                        Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Entity">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EntityCode") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Entity" DataMember="" DataTextField="descr" DataValueField="descr"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(entityDS,DataBinder.Eval(Container.DataItem, "EntityCode").ToString())%>'
                                DataSource='<%# entityDS%>' runat="server" />
                            <asp:RequiredFieldValidator ID="ReqEntControl" runat="server" ControlToValidate="Entity"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control Type">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ControlType") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ControlType" DataMember="" DataTextField="descr" DataValueField="descr"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(controlDS,DataBinder.Eval(Container.DataItem, "ControlType").ToString())%>'
                                DataSource='<%# controlDS%>' runat="server" />
                            <asp:RequiredFieldValidator ID="ReqControlType" runat="server" ControlToValidate="ControlType"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ControlValue") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="CntValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 01 Label">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control01Label") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt01LabelTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 01 Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control01Value") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt01ValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 02 Label">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control02Label") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt02LabelTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 02 Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control02Value") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt02ValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 03 Label">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control03Label") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt03LabelTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 03 Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control03Value") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt03ValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 04 Label">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control04Label") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt04LabelTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 04 Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control04Value") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt04ValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 05 Label">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control05Label") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt05LabelTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Control 05 Value">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Control05Value") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Cnt05ValueTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

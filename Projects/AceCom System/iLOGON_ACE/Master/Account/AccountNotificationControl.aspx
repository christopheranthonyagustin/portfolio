<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountNotificationControl.aspx.cs" Inherits="iWMS.Web.Master.Account.AccountNotificationControl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Search Results</title>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" ClientSettings-AllowColumnsReorder="true" OnNeedDataSource="ResultDG_NeedDataSource"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

            <MasterTableView AllowMultiColumnSorting="true" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <CommandItemSettings ShowRefreshButton="false" />
                <Columns>

                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="AccountNotificationControlEdit" ImageUrl="../../image/pencil.gif"
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
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="S/No" HeaderText="S/No" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="Control Type" Display="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ControlType") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="ControlTypeTxt" Text='<%# Eval("ControlType") %>' CssClass="WebBlue"></asp:Label>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Description" SortExpression="Description" HeaderText="Description" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="AcContantListicon" AllowFiltering="false"  >
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="true" ID="AcContantList" ImageUrl="../../image/contact-mail.png" 
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Everyone in contact list" ToolTip ="Everyone in contact list"
                                OnClick="AcContantList_Click"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Email Recipient">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EmailRecipient") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="EmailRecipientTxt" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "EmailRecipient") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridTemplateColumn HeaderText="SMSRecipient">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SMSRecipient") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="SMSRecipientTxt" runat="server" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "SMSRecipient") %>'></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="In-App UserId" >
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "InAppUserId") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label runat="server" ID="InAppUserIdTxt" Text='<%# Eval("InAppUserId") %>' CssClass="WebBlue"></asp:Label>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Modified On" SortExpression="Modified On" HeaderText="Modified On" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="InAppUserId" UniqueName="InAppUserId" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ControlType" UniqueName="ControlType" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="EmailRecipient" UniqueName="EmailRecipient" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="SMSRecipient" UniqueName="SMSRecipient" Display="false">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

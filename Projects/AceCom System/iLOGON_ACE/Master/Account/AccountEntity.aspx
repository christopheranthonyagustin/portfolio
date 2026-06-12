<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountEntity.aspx.cs"
    Inherits="iWMS.Web.Master.Account.AccountEntity" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AccountEntity</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
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

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="AccodeLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true" OnItemCommand="ResultDG_ItemCommand"
                        AllowFilteringByColumn="false" Skin="Metro" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
                        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="id" EditMode="InPlace">
                            <CommandItemSettings ShowRefreshButton="false" />
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
                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                            BorderWidth="0"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                        <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Entity" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "code")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="EntityComBo" runat="server" DataTextField="descr" DataValueField="item"
                                            DataSource='<%# EntityDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EntityDS, DataBinder.Eval(Container.DataItem, "code").ToString())%>'
                                            OnSelectedIndexChanged="EntityComBoSelectedIndex_Changed" AutoPostBack="true">
                                        </telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="EntityComBoReqVal" runat="server"
                                                 ControlToValidate="EntityComBo" ErrorMessage="*" ForeColor="Red" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="CustomerCode" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "CustCode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="CustomerCodeComBo" runat="server" DataTextField="descr" DataValueField="item"
                                            Skin="Sunset" Width="150px" DropDownWidth="150px" DataSource='<%# CustomerCodeDS%>'
                                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "CustCode") %>' OnSelectedIndexChanged="CustomerCodeComBoSelectedIndex_Changed">
                                        </telerik:RadComboBox>

                                        <asp:RequiredFieldValidator ID="CustomerCodeComBoReqVal" runat="server"
                                                 ControlToValidate="CustomerCodeComBo" ErrorMessage="*" ForeColor="Red" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="CustomerName" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "CustName")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="CustomerNameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "CustName") %>'
                                            TextMode="SingleLine" Enabled="false">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>                              

                                <telerik:GridTemplateColumn HeaderText="Status" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="CreatedOn" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("AddDate")) %>
                                        <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                        <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="EntId" UniqueName="EntId" HeaderText="EntId" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" UniqueName="id" HeaderText="id" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
    </form>
</body>
</html>

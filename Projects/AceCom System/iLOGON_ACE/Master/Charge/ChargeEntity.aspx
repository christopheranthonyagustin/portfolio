<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeEntity.aspx.cs" Inherits="iWMS.Web.Master.Charge.ChargeEntity" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GLMapping</title>
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
                                        <%# DataBinder.Eval(Container.DataItem, "EntCode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="EntityComBo" runat="server" DataTextField="descr" DataValueField="item"
                                            DataSource='<%# EntityDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(EntityDS, DataBinder.Eval(Container.DataItem, "EntCode").ToString())%>'
                                            OnSelectedIndexChanged="EntityComBoSelectedIndex_Changed" AutoPostBack="true">
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="RevenueAccount" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "RevenueGLAccCodeDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadMultiColumnComboBox ID="RevenueAccountComBo" runat="server"                                            
                                            Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            DataTextField="descr" DataValueField="item" Width="150px" DropDownWidth="150px" 
                                            Text='<%# DataBinder.Eval(Container.DataItem, "RevenueGLAccCodeDescr") %>'>
                                        </telerik:RadMultiColumnComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                 <telerik:GridTemplateColumn HeaderText="AccruedRevenueControlAccount" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "AccruedRevenueControlGLAccCodeDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadMultiColumnComboBox ID="AccruedRevenueControlAccountComBo" runat="server" 
                                            Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            DataTextField="descr" DataValueField="item" Width="150px" DropDownWidth="150px" 
                                            Text='<%# DataBinder.Eval(Container.DataItem, "AccruedRevenueControlGLAccCodeDescr") %>'>
                                        </telerik:RadMultiColumnComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="ExpenseAccount" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "ExpenseGLAccCodeDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadMultiColumnComboBox ID="ExpenseAccountComBo" runat="server" 
                                            Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            DataTextField="descr" DataValueField="item" Width="150px" DropDownWidth="150px" 
                                            Text='<%# DataBinder.Eval(Container.DataItem, "ExpenseGLAccCodeDescr") %>'>
                                        </telerik:RadMultiColumnComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="AccruedExpenseControlAccount" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "AccruedExpenseControlGLAccCodeDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadMultiColumnComboBox ID="AccruedExpenseControlAccountComBo" runat="server" 
                                            Skin="WebBlue" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                            DataTextField="descr" DataValueField="item" Width="150px" DropDownWidth="150px"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "AccruedExpenseControlGLAccCodeDescr") %>'>
                                        </telerik:RadMultiColumnComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="ExternalCode" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "externalcode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="ExternalTxt" Skin="WebBlue"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "externalcode") %>'>
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="Status" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="AddedOn" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("AddDate")) %>
                                        <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn HeaderText="EditedOn" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                        <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="EntId" UniqueName="EntId" HeaderText="EntId" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" UniqueName="id" HeaderText="id" Display="false">
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

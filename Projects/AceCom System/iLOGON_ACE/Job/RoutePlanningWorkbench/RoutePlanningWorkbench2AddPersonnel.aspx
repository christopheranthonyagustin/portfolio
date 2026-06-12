<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoutePlanningWorkbench2AddPersonnel.aspx.cs" Inherits="iWMS.Web.Job.RoutePlanningWorkbench.RoutePlanningWorkbench2AddPersonnel" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobTripRegisterV3</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <br />
                        &nbsp;
                        <asp:Button ID="AddBtn" runat="server" Text="Add" Visible="true" OnClick="AddBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                    </td>
                </tr>
            </table>
        <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" Skin="Office2007"
                OnNeedDataSource="ResultDG_NeedDataSource" OnItemCommand="ResultDG_ItemCommand" 
                OnItemDataBound="ResultDG_ItemDataBound" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" CommandItemDisplay="Top" EditMode="InPlace" DataKeyNames="ID" >
                    <CommandItemSettings ShowRefreshButton="false" />
                    <Columns>
                        <telerik:GridTemplateColumn UniqueName="icon">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="ResultDG_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                        title="Delete" runat="server" /></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="perhtypedescr" HeaderText="PersonnelType">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center"/>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "perhtypedescr")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="PerTypeCB" runat="server" DropDownHeight="150px" DataTextField="descr"
                                    DataValueField="item" DataSource='<%# pertypeListDS%>' Skin="WebBlue" Width="120px"
                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(pertypeListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                </telerik:RadComboBox>
                                <asp:TextBox ID="PerTypeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "perhtypedescr") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="pername" HeaderText="Name">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center"/>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "pername")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="PerNameCB" runat="server" DropDownHeight="150px" DataTextField="name"
                                    DataValueField="id" DataSource='<%# manpowerListDS%>' Skin="WebBlue" Width="200px"
                                    DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(manpowerListDS,DataBinder.Eval(Container.DataItem, "id").ToString()) %>'>
                                </telerik:RadComboBox>
                                <asp:TextBox ID="PerNameTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "pername") %>' />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="ManpowerOption" HeaderText="ManpowerOption">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center"/>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ManpowerOption")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="ManpowerOptionDDL" runat="server" ExpandDirection="Up"
                                    DataTextField="descr" DataValueField="Item" DataSource='<%# manpowerOptionListDS%>' Skin="WebBlue" Width="150px"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(manpowerOptionListDS, DataBinder.Eval(Container.DataItem, "ManpowerOption").ToString())%>'
                                    DropDownWidth="150px">
                                </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    </form>
</body>
</html>

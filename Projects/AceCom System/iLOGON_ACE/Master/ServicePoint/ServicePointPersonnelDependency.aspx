<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePointPersonnelDependency.aspx.cs" Inherits="iWMS.Web.Master.ServicePoint.ServicePointPersonnelDependency" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnUpdateCommand="ResultDG_UpdateCommand" OnItemCommand="ResultDG_ItemCommand"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnEditCommand="ResultDG_EditCommand">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" EditMode="InPlace" CommandItemDisplay="Top" TableLayout="Fixed">
                <CommandItemSettings ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <a id="DeleteImgBtn" href='<%#DataBinder.Eval(Container,"DataItem.Id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="DeleteImgBtn_ServerClick" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    title="Delete" runat="server" visible="true" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            &nbsp;
                                    <asp:ImageButton runat="server" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="DependencyType" HeaderText="DependencyType" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "DependencyTypeDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="DependencyTypeDDL" runat="server" Skin="Office2007" DataSource='<%# DependencyTypeDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DependencyTypeDS,DataBinder.Eval(Container.DataItem, "DependencyType").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="PersonnelPassType" HeaderStyle-Width="190px" ItemStyle-Width="190px" ItemStyle-Wrap="true">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "PersonnelPassTypeDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="PersonnelPassTypeComBo" runat="server" DataTextField="descr" DataValueField="item"
                                DataSource='<%# PersonnelPassTypeDS%>' Skin="Office2007" Width="150px" DropDownWidth="150px"
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PersonnelPassTypeDS, DataBinder.Eval(Container.DataItem, "PersonnelPassType").ToString())%>'
                                AutoPostBack="true">
                            </telerik:RadComboBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Notes" HeaderText="Notes" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Notes")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="NotesTxtBox" Text='<%# Eval("Notes") %>' Skin="WebBlue" TextMode="MultiLine" Rows="3" Width="250px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" UniqueName="StatusDescr"
                        ReadOnly="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDdate" HeaderText="AddDate" UniqueName="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser" UniqueName="AddUser"
                        ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate" UniqueName="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser" UniqueName="EditUser"
                        ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColorCode" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelManpowerType.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelManpowerType" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Personnel Manpower Type</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowSorting="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand"
                    GroupPanelPosition="Top" Width="100%">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                        <Scrolling ScrollHeight="550px" AllowScroll="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" CommandItemDisplay="Top"
                        EditMode="InPlace" EnableHeaderContextMenu="true">
                        <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Add New Record" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit PV Detail" ToolTip="Edit ManpowerType Detail"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0" CausesValidation="false">
                                    </asp:ImageButton>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ResultDG_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" />
                                    </a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                    <asp:TextBox ID="CBIDTxt" runat="server" Visible="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="sn" AllowFiltering="false"
                                HeaderText="S/No">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PerHType">
                                <HeaderTemplate>
                                    <asp:Label ID="lblName" runat="server" Text="ManpowerType"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="400px" />
                                <ItemStyle HorizontalAlign="Left" Width="400px" Wrap="false" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ManpowerTypeDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox runat="server" ID="ManPowerTypeList" DropDownHeight="150px"
                                        Skin="WebBlue" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        Width="250px" Filter="Contains" DataSource='<%# ManPowerTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ManPowerTypeListDS,DataBinder.Eval(Container.DataItem, "PerHType").ToString()) %>'>
                                    </telerik:RadComboBox>
                                    <asp:TextBox ID="ManPowerTypeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "ManpowerTypeDescr") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Remarks">
                                <HeaderTemplate>
                                    <asp:Label ID="lblName" runat="server" Text="Remarks"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="350px" />
                                <ItemStyle HorizontalAlign="Left" Width="350px" Wrap="false" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="RemarksTxt" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>' Width="350px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Status">
                                <HeaderTemplate>
                                    <asp:Label ID="lblName" runat="server" Text="Status"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="300px" />
                                <ItemStyle HorizontalAlign="Left" Width="300px" Wrap="false" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PerManTypeStatusDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList runat="server" ID="ddlStatus" DataSource='<%# PerManTypeStatusDS%>'
                                        Skin="WebBlue" DataTextField="Descr" DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerManTypeStatusDS,DataBinder.Eval(Container.DataItem, "Status").ToString())%>'>
                                    </telerik:RadDropDownList>
                                    <asp:TextBox ID="StatusTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "PerManTypeStatusDescr") %>' />
                                    <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="ddlStatus"
                                        ErrorMessage="*" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ReadOnly="true">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                                ReadOnly="true">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

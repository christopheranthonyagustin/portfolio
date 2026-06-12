<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSLevelRoomZoneListHead.aspx.cs" Inherits="iWMS.Web.Master.WHSLevelRoomZone.WHSLevelRoomZoneListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>WHSRoomLevelZoneListHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="Zone_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Zone"
                                    runat="server"></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="code" SortExpression="Code" HeaderText="Zone"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="catdescr" SortExpression="catdescr" HeaderText="Category"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="storagerateoptiondescr" SortExpression="storagerateoptiondescr"
                        HeaderText="Storage Rate Option" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

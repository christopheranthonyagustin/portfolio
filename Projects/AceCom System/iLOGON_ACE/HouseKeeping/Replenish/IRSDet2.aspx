<%@ Page Language="c#" CodeBehind="IRSDet2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Replenish.IRSDet2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReplenishSuggestedDetl</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" />
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU" />
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description" />
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location" />
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot#" />
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1" />
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2" />
                <telerik:GridBoundColumn DataField="suggesteduomqty" SortExpression="suggesteduomqty" HeaderText="SuggestQty"
                    ItemStyle-HorizontalAlign="Center" />
                <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM" />
                <telerik:GridBoundColumn DataField="status" SortExpression="status" Display="false" />
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" />
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" />
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" />
                <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"/>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

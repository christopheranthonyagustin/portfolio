<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTransformationServiceLog.aspx.cs" Inherits="iWMS.Web.Interface.DataTransformationService.DataTransformationServiceLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Log @ Channel Master</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="false"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="false" ScrollHeight="450" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Type" SortExpression="type" HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Category" SortExpression="category" HeaderText="Category">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TableName" SortExpression="tablename" HeaderText="TableName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ColumnName" SortExpression="columnname" HeaderText="ColumnName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BeforeValue" SortExpression="beforevalue" HeaderText="BeforeValue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AfterValue" SortExpression="aftervalue" HeaderText="AfterValue">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Remarks" SortExpression="remarks" HeaderText="Remarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
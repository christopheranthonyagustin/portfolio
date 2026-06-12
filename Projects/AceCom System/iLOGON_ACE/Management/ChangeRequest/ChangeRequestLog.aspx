<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeRequestLog.aspx.cs" Inherits="iWMS.Web.Management.ChangeRequest.ChangeRequestLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Change Request Log</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowPaging="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView DataKeyNames="Id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" PageSizes="50" />
                <Columns>
                    <telerik:GridBoundColumn UniqueName="Type" HeaderText="Type" DataField="Type"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Category" HeaderText="Category" DataField="Category"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TableName" HeaderText="TableName" DataField="TableName"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ColumnName" HeaderText="ColumnName" DataField="ColumnName"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="BeforeValue" HeaderText="BeforeValue" DataField="BeforeValue"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="AfterValue" HeaderText="AfterValue" DataField="AfterValue"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Remarks" HeaderText="Remarks" DataField="Remarks"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="AddDate" HeaderText="AddDate" DataField="AddDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="AddUser" HeaderText="AddUser" DataField="AddUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="EditDate" HeaderText="EditDate" DataField="EditDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="EditUser" HeaderText="EditUser" DataField="EditUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

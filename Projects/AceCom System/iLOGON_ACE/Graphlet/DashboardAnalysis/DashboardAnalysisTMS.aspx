<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysisTMS.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysisTMS" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS DashBoard</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
</head>
<body>
     <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true"
            AutoGenerateColumns="false" AllowSorting="true" GridLines="None" AllowPaging="false"
            AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" ScrollHeight="500px" UseStaticHeaders="true"/>
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" Name="ParentGrid" 
                PageSize="50" HeaderStyle-HorizontalAlign="Left">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" HeaderText="Account"/>
                    <telerik:GridBoundColumn DataField="JobNumber" UniqueName="JobNumber" HeaderText="JobNumber" ItemStyle-Width="150px" HeaderStyle-Width="150px"/>
                    <telerik:GridBoundColumn DataField="ContainerNo" UniqueName="ContainerNo" HeaderText="ContainerNo" ItemStyle-Width="150px" HeaderStyle-Width="150px"/>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

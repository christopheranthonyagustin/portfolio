<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerLocationViewContainer.aspx.cs" Inherits="iWMS.Web.Job.ContainerLocation.ContainerLocationViewContainer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Container List  @ ContainerLocation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both"
            AllowSorting="true" AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn UniqueName="S/N" HeaderText="S/N" DataField="S/N" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="GateInDate" HeaderText="GateInDate" DataField="GateInDate" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TrailerNo" HeaderText="TrailerNo" DataField="TrailerNo" AutoPostBackOnFilter="true" AllowFiltering="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="JobType" HeaderText="JobType" DataField="JobType" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerNo" HeaderText="ContainerNo" DataField="ContainerNo" AutoPostBackOnFilter="true" AllowFiltering="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerSize" HeaderText="ContainerSize" DataField="ContainerSize" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="JobNo" HeaderText="JobNo" DataField="JobNo" AutoPostBackOnFilter="true" AllowFiltering="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerDescription" HeaderText="ContainerDescription" DataField="ContainerDescription" AllowFiltering="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Customer" HeaderText="Customer" DataField="Customer" AutoPostBackOnFilter="true" AllowFiltering="true"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerStatus" HeaderText="ContainerStatus" DataField="ContainerStatus" AllowFiltering="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

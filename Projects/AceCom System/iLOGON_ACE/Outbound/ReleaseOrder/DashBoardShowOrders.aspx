<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardShowOrders.aspx.cs" Inherits="iWMS.Web.Outbound.ReleaseOrder.DashBoardShowOrders" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Status Submitted @ Release Order</title>
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
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Metro"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true"
            AutoGenerateColumns="false" AllowSorting="true" GridLines="None" AllowPaging="false"
            AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="false">
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" ScrollHeight="500px" UseStaticHeaders="true"/>
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid"  HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                PageSize="50" HeaderStyle-HorizontalAlign="Left">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                     <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode"
                                HeaderText="Account" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="RONO" UniqueName="RONO" SortExpression="RONO"
                                HeaderText="RONO" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="ShipToName" UniqueName="ShipToName" SortExpression="ShipToName"
                                HeaderText="ConsigneeName " ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="Column1" UniqueName="ExpectedDate" SortExpression="ExpectedDate"
                                HeaderText="ExpectedDate " ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="NoOfLines" UniqueName="NoOfLines" SortExpression="NoOfLines"
                                HeaderText="Lines" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                    </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

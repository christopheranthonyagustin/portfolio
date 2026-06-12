<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PUNODetail.aspx.cs" Inherits="iWMS.Web.Outbound.Pack.PUNODetail" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueSkuHead</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />        
    <div>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" 
            OnNeedDataSource="ResultDG_NeedDataSource" >
             <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>                           
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering ="false" UniqueName="No" HeaderText="No" >
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcCode" HeaderText="AcCode" SortExpression="AcCode" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUNO" HeaderText="PUNO" SortExpression="PUNO" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CTNRNo" HeaderText="CTNRNo" SortExpression="CTNRNo" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CTNRType" HeaderText="CTNRType" SortExpression="CTNRType" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GINo" HeaderText="GINo" SortExpression="GINo" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerReference" HeaderText="CustomerReference" SortExpression="CustomerReference" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="ShipmentNo" HeaderText="ShipmentNo" SortExpression="ShipmentNo" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="StatusDescr" HeaderText="StatusDescr" SortExpression="StatusDescr" ItemStyle-Wrap="false">                   
                    </telerik:GridBoundColumn>                     
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>

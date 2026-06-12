<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankStoringOrderDetlList.aspx.cs"
    Inherits="iWMS.Web.Inbound.TankStoringOrder.TankStoringOrderDetlList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TankStoringOrderDetlList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div id="div-radgrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true"
            Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="70px" />
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Source" DataField="src" AllowFiltering="true"
                        ColumnGroupName="src" SortExpression="src" UniqueName="src" Reorderable="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="TankOrderNo" SortExpression="TankOrderNo" HeaderText="JobNo"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TransDate" DataField="TransDate" SortExpression="TransDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Job" DataField="TankOrderNo" AllowFiltering="true"
                        ColumnGroupName="TankOrderNo" SortExpression="TankOrderNo" UniqueName="TankOrderNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="No" DataField="SrcNo" AllowFiltering="true"
                        ColumnGroupName="SrcNo" SortExpression="SrcNo" UniqueName="SrcNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="SrcTypeDescr" SortExpression="SrcTypeDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DepotCodeDescr" SortExpression="DepotCodeDescr" HeaderText="Depot"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TankNo" DataField="SKUCode" SortExpression="SKUCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Commodity" DataField="Commodity" SortExpression="Commodity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLETD" DataField="POLETD" SortExpression="POLETD"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLFreeDays" DataField="POLFreeDays" SortExpression="POLFreeDays">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODETA" DataField="PODETA" SortExpression="PODETA"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODFreeDays" DataField="PODFreeDays" SortExpression="PODFreeDays">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="TransStatusDescr" SortExpression="TransStatusDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Srcid" DataField="Srcid" Display="false" SortExpression="Srcid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ACC" DataField="acid" Display="false" SortExpression="acid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>

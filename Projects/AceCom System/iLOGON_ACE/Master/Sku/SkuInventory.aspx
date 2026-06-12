<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkuInventory.aspx.cs" Inherits="iWMS.Web.Master.Sku.SkuInventory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuInventory</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="NewModuleTitle">
            <asp:Label ID="Label4" labelclass="NewModuleTitle" runat="server">SKU Inventory By SKU - UOM</asp:Label>
        </div>
        <telerik:RadGrid ID="SkuUomQtyResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true"           
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="SkuUomQtyResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">                    
                <Columns>   
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                    </telerik:GridBoundColumn>   
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="skudescr" AllowFiltering="true"
                        ColumnGroupName="skudescr" SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="uom" AllowFiltering="true"
                        ColumnGroupName="uom" SortExpression="uom" UniqueName="uom" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="availuomqty" SortExpression="availuomqty" UniqueName="availuomqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br /><br />

        <div class="NewModuleTitle">
            <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">SKU Inventory By Location</asp:Label>
        </div>
        <telerik:RadGrid ID="LocResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true"           
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="LocResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">                    
                <Columns>      
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true"
                        ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhanduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="onhandqty" SortExpression="onhanduomqty" UniqueName="onhandqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnavailQty" DataField="unavailuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="unavailqty" SortExpression="unavailuomqty" UniqueName="unavailqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BlockQty" DataField="helduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="heldqty" SortExpression="helduomqty" UniqueName="heldqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="availqty" SortExpression="availuomqty" UniqueName="availqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br /><br />
        <div class="NewModuleTitle">
            <asp:Label ID="Label2" labelclass="NewModuleTitle" runat="server">SKU inventory By Location - SLOC</asp:Label>
        </div>
        <telerik:RadGrid ID="SlocResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"  AllowSorting="true"              
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="SlocResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">                    
                <Columns>      
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true"
                        ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                        ColumnGroupName="lot12" SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhanduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="onhandqty" SortExpression="onhanduomqty" UniqueName="onhandqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnavailQty" DataField="unavailuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="unavailqty" SortExpression="unavailuomqty" UniqueName="unavailqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BlockQty" DataField="helduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="heldqty" SortExpression="helduomqty" UniqueName="heldqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="availqty" SortExpression="availuomqty" UniqueName="availqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br /><br />
        <div class="NewModuleTitle">
            <asp:Label ID="Label3" labelclass="NewModuleTitle" runat="server">SKU Inventory By Location - Expiry/Serial/Batch/Lot </asp:Label>
        </div>
        <telerik:RadGrid ID="Lot456ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"  AllowSorting="true"              
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="Lot456ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">                    
                <Columns>      
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true"
                        ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                        ColumnGroupName="lot1" SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                        ColumnGroupName="lot4" SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                        ColumnGroupName="lot5" SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                        ColumnGroupName="lot6" SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhanduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="onhandqty" SortExpression="onhanduomqty" UniqueName="onhandqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnavailQty" DataField="unavailuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="unavailqty" SortExpression="unavailuomqty" UniqueName="unavailqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BlockQty" DataField="helduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="heldqty" SortExpression="helduomqty" UniqueName="heldqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availuomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                        ColumnGroupName="availqty" SortExpression="availuomqty" UniqueName="availqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn> 
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocInventory.aspx.cs" Inherits="iWMS.Web.Master.Loc.LocInventory" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<html>
<head runat="server">
    <title>LocInventory</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body >
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <br />
            <br />
            <div class="NewModuleTitle">
            <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Inventory by SKU - Location </asp:Label>
            </div>
            <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"                
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                    <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhanduomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                        ColumnGroupName="onhandqty" SortExpression="onhandqty" UniqueName="onhandqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UnavailQty" DataField="unavailuomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                        ColumnGroupName="unavailqty" SortExpression="unavailqty" UniqueName="unavailqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="BlockQty" DataField="helduomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                        ColumnGroupName="heldqty" SortExpression="heldqty" UniqueName="heldqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availuomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                        ColumnGroupName="availqty" SortExpression="availqty" UniqueName="availqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>                   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
            <br /><br />
            <div class="NewModuleTitle">
            <asp:Label ID="Label2" labelclass="NewModuleTitle" runat="server">Inventory By SKU - Location - Lottable </asp:Label>
            </div>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"                
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">                    
                    <Columns>                       
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                            ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                            ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Descr" DataField="skudescr" AllowFiltering="true"
                            ColumnGroupName="skudescr" SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="location" DataField="loccode" AllowFiltering="true"
                            ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot4" DataField="Lot4" AllowFiltering="true"
                            ColumnGroupName="Lot4" SortExpression="Lot4" UniqueName="Lot4" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="true"
                            ColumnGroupName="Lot5" SortExpression="Lot5" UniqueName="Lot5" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true"
                            ColumnGroupName="Lot6" SortExpression="Lot6" UniqueName="Lot6"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="true"
                            ColumnGroupName="Lot12" SortExpression="Lot12" UniqueName="Lot12"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TUNO1" DataField="TUNO1" AllowFiltering="true"
                            ColumnGroupName="TUNO1" SortExpression="TUNO1" UniqueName="TUNO1"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="onhanduomqty" SortExpression="OnhandQty" HeaderText="OnhandQty" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:F3}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="availuomqty" SortExpression="AvailQty" HeaderText="AvailQty" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:F3}">
                        </telerik:GridBoundColumn>   
                        <telerik:GridBoundColumn HeaderText="UnavailQty" DataField="unavailuomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                            ColumnGroupName="unavailqty" SortExpression="unavailqty" UniqueName="unavailqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="BlockQty" DataField="helduomqty" AllowFiltering="true" DataFormatString="{0:F3}"
                            ColumnGroupName="heldqty" SortExpression="heldqty" UniqueName="heldqty" Reorderable="true" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>                     
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.JobAnalysisByShipmentType.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job Analysis By Shipment Type</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        .style2
        {
        }
        .style3
        {
            width: 12px;
        }
        .style4
        {
            width: 143px;
        }
        .stylewrap
        {
        	white-space: pre-line;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td class="style2" colspan="3">
                <%--<asp:Label ID="ReportLbl" runat="server"></asp:Label>--%>
                <asp:Label ID="EntityLbl" runat="server" CssClass="Graytitle"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                <asp:Label ID="Label1" runat="server">Report</asp:Label>
            </td>
            <td class="style3">
                :
            </td>
            <td>
            <asp:Label ID="Reportlbl" runat="server"></asp:Label>
            </td>
            <%--<td>
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>--%>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                <asp:Label ID="Label2" runat="server">Format</asp:Label>
            </td>
            <td class="style3">
                :
            </td>
            <td>
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                <asp:Label ID="userLbl1" runat="server">Account</asp:Label>
            </td>
            <td class="style3">
                :
            </td>
            <td>
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style4">
                <asp:Label ID="DateLbl" runat="server">Shipment Type</asp:Label>
            </td>
            <td class="style3">
                :
            </td>
            <td>
                <asp:Label ID="ShipmentTypeLbl" runat="server"></asp:Label>
            </td>
            <td>
            &nbsp;</td>
        </tr>
        <tr>
            <td>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
    </table>
    <br />
   <%--<telerik:RadPivotGrid ID="RadPivotGrid1" runat="server" ColumnHeaderZoneText="ColumnHeaderZone"
        ShowColumnHeaderZone="false" ShowDataHeaderZone="false" ShowRowHeaderZone="true"
        ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7" 
        OnCellDataBound="RadPivotGrid1_CellDataBound" OnPivotGridCellExporting="RadPivotGrid1_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid1_NeedDataSource">
        <ClientSettings EnableFieldsDragDrop="false" >
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="false" ScrollHeight="800px" />
            
        </ClientSettings>
        <TotalsSettings GrandTotalsVisibility="None" RowsSubTotalsPosition="None" ColumnGrandTotalsPosition ="None" ColumnsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField DataField="JobNo"  CellStyle-Font-Bold="true"  CellStyle-Width="200">
            </telerik:PivotGridRowField>            
            <telerik:PivotGridRowField DataField="Account"  CellStyle-Font-Bold="true" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="JobExpDate"  CellStyle-Font-Bold="true" DataFormatString="{0:dd/MMM/yyyy}" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="Vessel" CellStyle-Font-Bold="true" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="Voyage"  CellStyle-Font-Bold="true" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="FrAddr"  CellStyle-Font-Bold="true" CellStyle-Width="200" CellStyle-CssClass="stylewrap">            
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="ToAddr"  CellStyle-Font-Bold="true" CellStyle-Width="200" CellStyle-CssClass="stylewrap">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="ShipmentType"  CellStyle-Font-Bold="true" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="JobTypeDescr"  CellStyle-Font-Bold="true" CellStyle-Width="200">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="BillSizeType" CellStyle-Font-Bold="true" >
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="NoOfBST" Aggregate="sum" CellStyle-Font-Bold="true" DataFormatString="{0:C}">
            </telerik:PivotGridAggregateField>
        </Fields>

    </telerik:RadPivotGrid>--%>
    <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
             OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true">
           
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
             <ExportSettings UseItemStyles="True">
        </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                  <Columns>
                  
                         </Columns>
                   </MasterTableView>
        </telerik:RadGrid>
    
    </form>
</body>
</html>

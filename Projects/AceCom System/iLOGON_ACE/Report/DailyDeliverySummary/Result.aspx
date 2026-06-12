<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyDeliverySummary.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DailyRevenueTransactionSummary</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        
        .RadPivotGrid_Metro .rpgContentZoneDiv td {
            white-space: nowrap;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Daily Delivery Summary</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccountTextLbl" runat="server">Account</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="formatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="formatypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />
    <telerik:RadPivotGrid AllowPaging="false" ID="RadPivotGrid1" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid1_CellDataBound" OnPivotGridCellExporting="RadPivotGrid1_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid1_NeedDataSource"  >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <TotalsSettings RowsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField DataField="Date" ZoneIndex="0" DataFormatString="{0:dd/MMM/yyyy (ddd)}"
                CellStyle-Width="160px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="AMPM" ZoneIndex="1" CellStyle-Width="80px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="type" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridColumnField DataField="X" ZoneIndex="1" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="cnt" Aggregate="sum">
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>    
    <br />
    <asp:ImageButton ID="ButtonExcel2" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel2_Click" />
    <telerik:RadPivotGrid AllowPaging="false" ID="RadPivotGrid2" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid2_CellDataBound" OnPivotGridCellExporting="RadPivotGrid2_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid2_NeedDataSource"  >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <TotalsSettings RowsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField DataField="Date" ZoneIndex="0" DataFormatString="{0:dd/MMM/yyyy (ddd)}"
                CellStyle-Width="160px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="AMPM" ZoneIndex="1" CellStyle-Width="80px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="X" ZoneIndex="1" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="cnt" Aggregate="sum">
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>    
    
    </form>
</body>
</html>

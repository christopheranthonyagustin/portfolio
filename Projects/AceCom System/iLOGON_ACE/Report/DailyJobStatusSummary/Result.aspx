<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyJobStatusSummary.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>DailyJobStatusSummary</title>
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Daily Job Status Summary " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td width="8%">
                <asp:Label ID="AccLbl" runat="server" class="graytitle">Account</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="AccountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="8%">
                <asp:Label ID="jobsrcLbl" runat="server" class="graytitle">JobSource</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="jbsrcLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="8%">
                <asp:Label ID="StatusLbl" runat="server" class="graytitle">Status</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="StatusTypeLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />
    <telerik:RadPivotGrid AllowPaging="true" PageSize="10" ID="RadPivotGrid1" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid1_CellDataBound" OnPivotGridCellExporting="RadPivotGrid1_PivotGridCellExporting"
        OnPivotGridBiffExporting="RadPivotGrid1_PivotGridBiffExporting"
        OnNeedDataSource="RadPivotGrid1_NeedDataSource" >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <Fields>
            <telerik:PivotGridRowField DataField="Month" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="Date" ZoneIndex="1" DataFormatString="{0:dd/MMM/yyyy}" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="JobNo" ZoneIndex="2" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="statusdescr" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="id" Aggregate="Count" ZoneIndex="0">
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>    
    </form>
</body>
</html>
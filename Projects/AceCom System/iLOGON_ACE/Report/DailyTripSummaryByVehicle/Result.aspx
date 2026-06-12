<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyTripSummaryByVehicle.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyTripSummary</title>
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
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Daily Trip Summary " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr class="graytitle">
            <td width="8%">
                <asp:Label ID="AccLbl" runat="server" class="graytitle">Account</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="AccountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td width="8%">
                <asp:Label ID="BillSizeLbl" runat="server" class="graytitle">BillSizeType</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="BillSizeTypeLbl" runat="server" class="graytitle"></asp:Label>
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
        OnNeedDataSource="RadPivotGrid1_NeedDataSource">
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <Fields>
            <telerik:PivotGridRowField DataField="Date" ZoneIndex="0"
                CellStyle-Width="100px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="Vehicle" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="AM_Trips" Aggregate="Sum" ZoneIndex="0">
                <HeaderCellTemplate>
                    <asp:Label ID="tripAMLbl" Text="AM" runat="server" />
                </HeaderCellTemplate>
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripAMLbl" Text="Total AM Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="PM_Trips" Aggregate="Sum" ZoneIndex="0">
                <HeaderCellTemplate>
                    <asp:Label ID="tripPMLbl" Text="PM" runat="server" />
                </HeaderCellTemplate>
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripPMLbl" Text="Total PM Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="TotalTrips" CalculationDataFields="AM_Trips,PM_Trips" CalculationExpression="{0}+{1}">
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripLbl" Text="Total Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>
    <br />
    <br />
    <asp:ImageButton ID="ButtonExcel2" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel2_Click" />
    <telerik:RadPivotGrid AllowPaging="true" PageSize="10" ID="RadPivotGrid2" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid2_CellDataBound" OnPivotGridCellExporting="RadPivotGrid2_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid2_NeedDataSource">
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <Fields>
            <telerik:PivotGridRowField DataField="Vehicle" ZoneIndex="0" CellStyle-Font-Bold="true"
                CellStyle-Width="100px">
            </telerik:PivotGridRowField>
            <telerik:PivotGridAggregateField DataField="AM_Trips" Aggregate="Sum" ZoneIndex="0">
                <HeaderCellTemplate>
                    <asp:Label ID="tripAMLbl" Text="AM" runat="server" Font-Bold="true" />
                </HeaderCellTemplate>
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripAMLbl" Text="Total AM Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="PM_Trips" Aggregate="Sum" ZoneIndex="0">
                <HeaderCellTemplate>
                    <asp:Label ID="tripPMLbl" Text="PM" runat="server" Font-Bold="true" />
                </HeaderCellTemplate>
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripPMLbl" Text="Total PM Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="TotalTrips" CalculationDataFields="AM_Trips,PM_Trips" CalculationExpression="{0}+{1}">
                <HeaderCellTemplate>
                    <asp:Label ID="totalLbl" Text="Total" runat="server" Font-Bold="true" />
                </HeaderCellTemplate>
                <ColumnGrandTotalHeaderCellTemplate>
                    <asp:Label ID="totalTripLbl" Text="Total Trips" runat="server" />
                </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>
    <br />
    <br />
    <asp:ImageButton ID="ButtonExcel3" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel3_Click" />
    <telerik:RadPivotGrid AllowPaging="true" PageSize="10" ID="RadPivotGrid3" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid3_CellDataBound" OnPivotGridCellExporting="RadPivotGrid3_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid3_NeedDataSource">
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
        </ClientSettings>
        <Fields>
            <telerik:PivotGridRowField DataField="Date" ZoneIndex="0"
                CellStyle-Width="100px" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="billsizetype" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="TripCount" Aggregate="Sum" ZoneIndex="0">
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.SkuMvmtBalSummary.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SKUMovementBalanceSummary</title>
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
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="SKU Movement Balance Summary as at " />
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
                <asp:Label ID="SiteLbl" runat="server" class="graytitle">Site</asp:Label>
            </td>
            <td width="92%">
                :&nbsp;<asp:Label ID="SiteDescrLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td width="8%">
                <asp:Label ID="DateNowLbl" runat="server">Date</asp:Label>
            </td>
            <td width="92%">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
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
        OnNeedDataSource="RadPivotGrid1_NeedDataSource" OnPivotGridBiffExporting="RadPivotGrid1_PivotGridBiffExporting" >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="true" SaveScrollPosition="true" ScrollHeight="500px" />
        </ClientSettings>
        <TotalsSettings RowsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField ZoneIndex="0" DataField="AcCode" Caption="AcCode" />
            <telerik:PivotGridRowField ZoneIndex="0" DataField="Site" Caption="Site" />
            <telerik:PivotGridRowField ZoneIndex="0" DataField="Code" Caption="Code" />
            <telerik:PivotGridRowField ZoneIndex="0" DataField="Code2" Caption="Code2" />
            <telerik:PivotGridRowField ZoneIndex="0" DataField="Descr" Caption="Descr" />
            <telerik:PivotGridColumnField ZoneIndex="1" DataField="lot13" Caption="lot13" />
            <telerik:PivotGridColumnField ZoneIndex="1" DataField="lot15" Caption="lot15" />
            <telerik:PivotGridAggregateField DataField="Received" Aggregate="Sum" ZoneIndex="1" Caption="Received" DataFormatString="{0:#,0.##}">
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="Issued" Aggregate="Sum" ZoneIndex="1" Caption="Issued" DataFormatString="{0:#,0.##}">
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="Balance" Aggregate="Sum" ZoneIndex="1" Caption="Balance" DataFormatString="{0:#,0.##}">
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="OnHold" Aggregate="Sum" ZoneIndex="1" Caption="OnHold" DataFormatString="{0:#,0.##}">
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyManPowerULabourCostByJobType.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DailyManPowerULabourCostByJobType</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        
        .RadPivotGrid_Metro .rpgContentZoneDiv td {
            white-space: nowrap;
        }
        .style1
        {
            width: 180px;
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
        </table>
        <table width="100%">
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
           
            <td colspan="2">
                :
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Daily Manpower Utilization & LabourCost By JobType</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            &nbsp;for OpsUnit <asp:Label ID="OpsUnitLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccountTextLbl" runat="server">Account</asp:Label>
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
           
            <td colspan="2">
                :
                <asp:Label ID="formatypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
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
            <telerik:PivotGridRowField DataField="jobtype" ZoneIndex="0" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="FrTime" ZoneIndex="0" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="ToTime" ZoneIndex="0" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="Duration" ZoneIndex="0" DataFormatString="{0:0.00}" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="Date" ZoneIndex="1" DataFormatString="{0:dd/MMM/yyyy ddd}">
            </telerik:PivotGridColumnField>
           <telerik:PivotGridAggregateField DataField="HeadCount" ZoneIndex="1" Caption="HeadCount">
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="Hours" ZoneIndex="1" >
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>    

 

 <telerik:RadPivotGrid AllowPaging="false" ID="RadPivotGrid2" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid2_CellDataBound" OnPivotGridCellExporting="RadPivotGrid2_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid2_NeedDataSource"  >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true"/>
        </ClientSettings>
        <TotalsSettings RowsSubTotalsPosition="first" />
    <TotalsSettings ColumnsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField DataField="jobtype" ZoneIndex="0" CellStyle-Width="200" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="name" ZoneIndex="0" CellStyle-Width="250" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="Date" ZoneIndex="1" DataFormatString="{0:dd/MMM/yyyy ddd}" CellStyle-Width="260">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridColumnField DataField="Ratedescr" ZoneIndex="1" >
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="Hours" ZoneIndex="1" >
            <HeaderCellTemplate>
                            <asp:Label ID="hoursLbl" Text="Hours" runat="server" />
            </HeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="Amount" ZoneIndex="1" DataFormatString="{0:##,#.00}"   >
            <HeaderCellTemplate>
                            <asp:Label ID="amtLbl" Text="Amount" runat="server" />
            </HeaderCellTemplate>
            <ColumnGrandTotalHeaderCellTemplate>
                        <asp:Label ID="amtheadLbl" Text="Total sum at cost" runat="server" />
            </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="SellRateAmt" ZoneIndex="1" DataFormatString="{0:##,#.00}"   >
            <HeaderCellTemplate>
                            <asp:Label ID="sellrateamtLbl" Text="SellRateAmount" runat="server" />
            </HeaderCellTemplate>
            <ColumnGrandTotalHeaderCellTemplate>
                        <asp:Label ID="sellrateamtheadLbl" Text="Total sum billed" runat="server" />
            </ColumnGrandTotalHeaderCellTemplate>
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid> 


<telerik:RadPivotGrid AllowPaging="false" ID="RadPivotGrid3" runat="server"
        ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
        ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid2_CellDataBound" OnPivotGridCellExporting="RadPivotGrid2_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid3_NeedDataSource"  >
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true"/>
        </ClientSettings>
        <TotalsSettings RowsSubTotalsPosition="first" />
    <TotalsSettings ColumnsSubTotalsPosition="None" />
        <Fields>
            <telerik:PivotGridRowField DataField="jobtype" ZoneIndex="0" CellStyle-Width="200" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="name" ZoneIndex="0" CellStyle-Width="250" >
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="Date" ZoneIndex="1" DataFormatString="{0:dd/MMM/yyyy ddd}" CellStyle-Width="260">
            </telerik:PivotGridColumnField>
            
            <telerik:PivotGridAggregateField DataField="Hours" ZoneIndex="1" >
            <HeaderCellTemplate>
                            <asp:Label ID="hoursLbl" Text="Hours" runat="server" />
            </HeaderCellTemplate>
            </telerik:PivotGridAggregateField>
            <telerik:PivotGridAggregateField DataField="days" ZoneIndex="1" >
            <HeaderCellTemplate>
                            <asp:Label ID="hoursLbl" Text="Days" runat="server" />
            </HeaderCellTemplate>
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid> 
    </form>
</body>
</html>

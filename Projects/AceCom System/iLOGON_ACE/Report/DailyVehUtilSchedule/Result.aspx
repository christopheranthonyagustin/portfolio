<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyVehUtilSchedule.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Daily Vehicle Utilization Schedule</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
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
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Daily Vehicle Utilization Schedule " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />
    <telerik:RadPivotGrid ID="RadPivotGrid1" runat="server" ColumnHeaderZoneText="ColumnHeaderZone"
        ShowColumnHeaderZone="false" ShowDataHeaderZone="false" ShowRowHeaderZone="true"
        ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false" Skin="Windows7"
        OnCellDataBound="RadPivotGrid1_CellDataBound" OnPivotGridCellExporting="RadPivotGrid1_PivotGridCellExporting"
        OnNeedDataSource="RadPivotGrid1_NeedDataSource">
        <ClientSettings EnableFieldsDragDrop="false">
            <Scrolling AllowVerticalScroll="true" SaveScrollPosition="true" ScrollHeight="500px" />
        </ClientSettings>
        <Fields>
            <telerik:PivotGridRowField DataField="opsunitcode" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridRowField DataField="vehicleno" ZoneIndex="0" CellStyle-Font-Bold="true">
            </telerik:PivotGridRowField>
            <telerik:PivotGridColumnField DataField="IndividualDate" ZoneIndex="0" CellStyle-Font-Bold="true"
                DataFormatString="{0:dd/MMM/yyyy}">
            </telerik:PivotGridColumnField>
            <telerik:PivotGridAggregateField DataField="nooftrips" Aggregate="Sum" ZoneIndex="0" DataFormatString="{0:#}">
               
            </telerik:PivotGridAggregateField>
        </Fields>
    </telerik:RadPivotGrid>
    <br />
    <br />
    <table width="100%">
        <tr>
            <td align="left">
                <asp:Label ID="Label1" runat="server" class="graytitle" Text="Legend"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                    Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" Width="200px">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView>
                        <Columns>
                            <telerik:GridBoundColumn DataField="item" HeaderText="OffType" />
                            <telerik:GridTemplateColumn UniqueName="icon" HeaderText="Color" Display="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="colorLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef02") %>' Visible="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

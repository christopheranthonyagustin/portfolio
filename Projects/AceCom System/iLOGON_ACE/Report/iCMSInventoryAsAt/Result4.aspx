<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result4.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Result4" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>DepotMovementList</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.png"
                        runat="server" /></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Depot Movement List</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td class="style1">
                &nbsp;&nbsp;<asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="deLbl" runat="server">Depot</asp:Label>
            </td>
            <td>
                :
            </td>
            <td class="style1">
                &nbsp;&nbsp;<asp:Label ID="DepotLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="stLbl" runat="server">Size Type</asp:Label>
            </td>
            <td>
                :
            </td>
            <td class="style1">
                &nbsp;&nbsp;<asp:Label ID="sizetypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" OnGridExporting="ResultDG_GridExporting"
        AllowPaging="false" OnItemDataBound="ResultDG_ItemDataBound">
        <ExportSettings OpenInNewWindow="true" />
        <MasterTableView AutoGenerateColumns="true" ShowHeader="false">
            <ItemTemplate>
                <b><u>Container Movement - In</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG_NeedDataSource" OnItemDataBound="SubResultDG_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <b><u>Container Movement - In Summary</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG2" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG2_NeedDataSource" OnItemDataBound="SubResultDG2_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <b><u>Container Movement - Out</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG3" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG3_NeedDataSource" OnItemDataBound="SubResultDG3_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <b><u>Container Movement - Out Summary</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG4" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG4_NeedDataSource" OnItemDataBound="SubResultDG4_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <b><u>Container Inventory Summary By Conditions</u></b>
                <br />
                <br />
                <telerik:RadPivotGrid AllowPaging="false" ID="RadPivotGrid1" runat="server" ColumnHeaderZoneText="ColumnHeaderZone"
                    ShowColumnHeaderZone="false" ShowDataHeaderZone="false" ShowRowHeaderZone="false"
                    ShowFilterHeaderZone="false" AllowSorting="false" AllowFiltering="false" Skin="Office2007"
                    OnCellDataBound="RadPivotGrid1_CellDataBound" OnNeedDataSource="RadPivotGrid1_NeedDataSource">
                    <ClientSettings EnableFieldsDragDrop="false">
                        <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
                    </ClientSettings>
                    <TotalsSettings RowsSubTotalsPosition="Last" />
                    <Fields>
                        <telerik:PivotGridRowField DataField="DepotCode" ZoneIndex="0" CellStyle-Font-Bold="true">
                        </telerik:PivotGridRowField>
                        <telerik:PivotGridRowField DataField="SizeType" ZoneIndex="1" CellStyle-Font-Bold="true">
                        </telerik:PivotGridRowField>
                        <telerik:PivotGridColumnField DataField="Condition" ZoneIndex="0" CellStyle-Font-Bold="true">
                        </telerik:PivotGridColumnField>
                        <telerik:PivotGridAggregateField DataField="cnt" Aggregate="sum">
                        </telerik:PivotGridAggregateField>
                    </Fields>
                </telerik:RadPivotGrid>
                <br />
                <br />
                <b><u>Outstanding Storing Order</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG6" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG6_NeedDataSource" OnItemDataBound="SubResultDG6_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <b><u>Outstanding Release Order</u></b>
                <br />
                <br />
                <telerik:RadGrid ID="SubResultDG5" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                    OnNeedDataSource="SubResultDG5_NeedDataSource" OnItemDataBound="SubResultDG5_ItemDataBound">
                    <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                    <MasterTableView AutoGenerateColumns="true">
                    </MasterTableView>
                </telerik:RadGrid>
            </ItemTemplate>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="SummaryResult.aspx.cs"
    Inherits="iWMS.Web.Report.VehicleExpirySchedule.SummaryResult" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>EquipmentExpirySchedule</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style5 {
            width: 95px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style5">
                    <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Equipment Expiry Schedule</asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style5">
                    <asp:Label ID="DeptLbl" runat="server">VehOpsUnit</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="DepartmentLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style5">
                    <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.png"
            OnClick="ButtonExcel_Click" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
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

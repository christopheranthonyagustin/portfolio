<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result41.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result41" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RevenueAnalysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }
    </style>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
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
                    <asp:Label ID="TitleLbl" runat="server" class="graytitle" Text="Revenue Analysis" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
                    <%--   <asp:Label ID="datelbl" runat="server" class="graytitle" Text="Invoice Date :" />--%>
                    <asp:Label ID="formdateLbl" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="todateLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Entity :" />
                    <asp:Label ID="entitylbl" runat="server" class="graytitle" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="accLbl" runat="server" class="graytitle" Text="Account :" />
                    <asp:Label ID="accountLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="CGLbl" runat="server" class="graytitle" Text="Charge Group :" />
                    <asp:Label ID="chargegrouplbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" class="graytitle" Text="Charger Code :" />
                    <asp:Label ID="Label2" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ButtonExcel" Class="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" />
        <br />
        <br />
        &nbsp;
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true"
            OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting" OnColumnCreated="ResultDG_ColumnCreated">
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

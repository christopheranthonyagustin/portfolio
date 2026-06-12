<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result131.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result131" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GI Analysis</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="lblComapanyName" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="Title" runat="server" Text="GI Analysis" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:" />
                    <asp:Label ID="lblFormat" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="Aclabel" runat="server" class="graytitle" Text="Account&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:" />
                    <asp:Label ID="AccountLabel" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" Text="Date Range &nbsp;: "></asp:Label>
                    <asp:Label ID="FrDateLbl" runat="server" class="graytitle" Text="From &nbsp;:" />
                    <asp:Label ID="frDate" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="ToDateLbl" runat="server" class="graytitle" Text="To &nbsp;:" />
                    <asp:Label ID="toDate" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="IsTypeLabel" runat="server" class="graytitle" Text="Issue Type &nbsp;&nbsp;: "></asp:Label>
                    <asp:Label ID="IssueTypelbl" runat="server" class="graytitle" />
                </td>
            </tr>
        </table>
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

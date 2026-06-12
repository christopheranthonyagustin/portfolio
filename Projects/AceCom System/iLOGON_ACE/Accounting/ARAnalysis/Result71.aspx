<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result71.aspx.cs" Inherits="iWMS.Web.Accounting.ARAnalysis.Result71" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ARAnalysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
                    <asp:Label ID="lblComapanyName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="Title" runat="server" Text="ARAnalysis" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;:" />
                    <asp:Label ID="lblFormat" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Entity&nbsp;&nbsp;:" />
                    <asp:Label ID="entitylbl" runat="server" class="graytitle" />
                </td>
            </tr>
             <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="Branch" runat="server" class="graytitle" Text="Branch&nbsp;&nbsp;:" />
                    <asp:Label ID="Branchlbl" runat="server" class="graytitle" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting" OnColumnCreated="ResultDG_ColumnCreated"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" OnItemDataBound="ResultDG_ItemDataBound">
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
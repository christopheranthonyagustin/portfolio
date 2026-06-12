<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result83.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result83" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIAnalysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style2 {
        }

        .style3 {
            width: 12px;
        }

        .style4 {
            width: 143px;
        }

        .stylewrap {
            white-space: pre-line;
        }

    </style>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
             <tr class="graytitle">
                <td class="style2" colspan="3">
                    <asp:Label ID="lblComapanyName" runat="server" CssClass="Graytitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label1" runat="server">Report</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="Title" runat="server" Text="GI Analysis"></asp:Label>
                </td>             
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label2" runat="server">Format</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="lblFormat" runat="server"></asp:Label>
                </td>             
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label3" runat="server">Account</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="lblAccount" runat="server"></asp:Label>
                </td>             
            </tr>
             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label4" runat="server">Period Type</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="lblperiodtype" runat="server"></asp:Label>
                </td>             
            </tr>
             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label5" runat="server">Balance Type</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="lblbalancetype" runat="server"></asp:Label>
                </td>             
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label6" runat="server">Generated on</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="lblGeneratedon" runat="server"></asp:Label>
                </td>             
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle"/>
                </td>
            </tr>
        </table>
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

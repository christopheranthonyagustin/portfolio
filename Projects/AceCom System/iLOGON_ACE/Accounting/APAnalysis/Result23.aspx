<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result23.aspx.cs" Inherits="iWMS.Web.Accounting.APAnalysis.Result23" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>APAnalysis</title>
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
                    <asp:Label ID="lblComapanyName" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="Title" runat="server" Text="AP Analysis" class="graytitle"></asp:Label>
            </tr>
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;:" />
                    <asp:Label ID="lblFormat" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="FrPeriodLbl" runat="server" class="graytitle" Text="From&nbsp;:" />
                    <asp:Label ID="frPeriod" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="ToPeriodLbl" runat="server" class="graytitle" Text="To&nbsp;:" />
                    <asp:Label ID="toPeriod" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="PaymentStatusLbl" runat="server" class="graytitle" Text=" - Payment Status&nbsp;&nbsp;:" />
                    <asp:Label ID="paymentstatus" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Entity :" />
                    <asp:Label ID="entitylbl" runat="server" class="graytitle" />
                </td>
            </tr>
             <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="Branch" runat="server" class="graytitle" Text="Branch :" />
                    <asp:Label ID="BranchLbl" runat="server" class="graytitle" />
                </td>
            </tr>
             <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="UnbalancedLbl" runat="server" class="graytitle" Text="There are UNBALANCED transactions in this report" Visible ="false" ForeColor="Red"/>
                </td>
            </tr>
        </table>
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label> <!--added by CT Ticket #15934 pt-8 on 8 DEC 2023-->
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting" OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result61.aspx.cs" Inherits="iWMS.Web.Graphlet.InventoryAnalysis.Result61" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InventoryAnalysisResults</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <div>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <br />
            <table width="100%">
                <tr class="graytitle">
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                        UseSubmitBehavior="false" />
                </tr>
                <tr class="graytitle">
                    <td colspan="2">
                        <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td width="60px">
                        <asp:Label ID="ReportLbl" runat="server">Report</asp:Label></td>
                    <td>:&nbsp; &nbsp;  
                        <asp:Label ID="TitleLbl" runat="server">Inventory Analysis</asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td class="auto-style1">
                        <asp:Label ID="DateLbl" runat="server">Date</asp:Label></td>
                    <td>:&nbsp; &nbsp;   
                        <asp:Label ID="NowLbl" runat="server"></asp:Label></td>
                </tr>
            </table>
            <div>
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
        </div>
    </form>
</body>
</html>
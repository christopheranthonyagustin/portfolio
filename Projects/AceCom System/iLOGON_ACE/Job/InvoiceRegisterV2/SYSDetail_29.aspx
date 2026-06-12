<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SYSDetail_29.aspx.cs" Inherits="iWMS.Web.Job.InvoiceRegisterV2.SYSDetail_29" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>System Detail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 300px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>    
             <td>
                :
            </td>        
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">System Detail</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td> 
             <td>
                :
            </td>          
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td align="right" class="style1">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False"
        AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting"
        OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting" ExportSettings-UseItemStyles="true">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="True" />
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
    </form>
</body>
</html>

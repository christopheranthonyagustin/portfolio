<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.Pallet_Utilization.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pallet Utilization</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>

    <style type="text/css">
        .style1
        {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3" class="style1">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
           <%-- <td width="70%" align="right" class="style1">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>--%>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Pallet Utilization Report</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="Label1" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="userLbl1" runat="server">SKU Group</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="SKUGrouplbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="dtLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
     <table>
        <tr>
            <td align="right" class="style1">
                <a id="A2" runat="server" onserverclick="ExportExcel">
                    <img id="Img2" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="true"
            GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
            OnGridExporting="ResultDG_GridExporting" AllowSorting="false" BorderStyle="Solid"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <br />
    </div>
     <table>
        <tr>
            <td align="right" class="style1">
                <a id="A1" runat="server" onserverclick="ExportExcel1">
                    <img id="Img1" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div1">
        <telerik:RadGrid ID="ResultDG2" runat="server" GridLines="None" AutoGenerateColumns="true"
            GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic" OnGridExporting="ResultDG_GridExporting"
            AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource"
            OnItemDataBound="ResultDG2_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>

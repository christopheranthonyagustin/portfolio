<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.StorageInvoiceAnalysis.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>StorageInvoiceAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        
        .RadPivotGrid_Metro .rpgContentZoneDiv td {
            white-space: nowrap;
        }
        .style1
        {
            width: 180px;
        }
    </style>
    
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                &nbsp;
            </td>
        </tr>
        </table>
        <table width="100%">
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
                :
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Storage Invoice Analysis</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
        <td>
                <asp:Label ID="InvDateLbl" runat="server" CssClass="graytitle">Invoice Date As At</asp:Label>
                :
                <asp:Label ID="DateLbl" runat="server" CssClass="graytitle"></asp:Label>
        </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />
    <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AutoGenerateColumns="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                </MasterTableView>
                </telerik:RadGrid>
    </form>
</body>
</html>

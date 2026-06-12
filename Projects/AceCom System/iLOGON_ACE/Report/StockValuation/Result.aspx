<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.StockValuation.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Stock Valuation Report</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .blackBoldText
        {
            color: #000000;
            font-size: 18px;
            font-family: Arial,Verdana,Helvetica;
            font-weight: bold;
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
            <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
            </td>
        </tr>
        <tr class="graytitle">
            <td style="width:7%;">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td style="width:3%;">
                :
            </td>
            <td colspan="2" style="width:90%;">
                <asp:Label ID="TitleLbl" runat="server" CssClass="graytitle">Stock Valuation As At</asp:Label>
                <asp:Label ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" UseAccessibleHeader="True" CellPadding="2"
            GridLines="Both" BorderStyle="None" AutoGenerateColumns="true">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>

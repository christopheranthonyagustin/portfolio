<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.StockBalance.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>StockBalanceAsAt</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td>Report
                </td>
                <td>:
                </td>
                <td>Stock Balance By Date
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="customerLbl1" runat="server">Customer</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="customerLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="dateLbl1" runat="server">Date</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="dateLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <div style="height: 90%" id="div-datagrid">
            <asp:DataGrid ID="ResultDG" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="True">
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>

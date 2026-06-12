<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.InventoryByLot2.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>InventoryByLotResults</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
             <td width="70%" align="right">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../../Image/Excel.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    ToolTip="Export to Excel" OnClick="ExportExcel" />
            </td>
            <td>
                <asp:ImageButton ID="excelImgBtn" runat="server" ImageUrl="../../Image/Excel.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    ToolTip="Report Without Header" OnClick="ExportExcelWithoutHeader" />
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Inventory By Lot</asp:Label>
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
        <tr class="graytitle">
            <td>
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
            <td>
                <asp:Label ID="frmtLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="height: 85%">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None"
            GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>

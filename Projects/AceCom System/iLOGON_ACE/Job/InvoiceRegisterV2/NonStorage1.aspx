<%@ Page Language="c#" CodeBehind="NonStorage1.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.InvoiceRegisterV2.NonStorage1" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DebiteNote</title>
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
            <td width="80%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
    </table>
    <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td colspan="4" class="style1">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td width="10%">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">NonStorage1</asp:Label>
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
        <tr>
            <td colspan="4">
                <div style="height: 90%" id="div-datagrid">
                    <asp:DataGrid ID="ResultDG" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                        CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="True">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                    </asp:DataGrid></div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

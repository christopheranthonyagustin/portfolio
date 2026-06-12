<%@ Page Language="c#" CodeBehind="ChargeDetail2.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.InvoiceRegisterV2.ChargeDetail2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ChargeDetail2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            height: 19px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td width="80%" align="right">
                    <%--    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="right" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>--%>
                    <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        CssClass="green" ToolTip="Export To Excel" />
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
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">ChargeDetail2</asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="div-datagrid" style="height: 90%">
                        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None"
                            GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                        </asp:DataGrid>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

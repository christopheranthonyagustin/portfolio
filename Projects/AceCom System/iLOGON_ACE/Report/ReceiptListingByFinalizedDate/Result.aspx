<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.ReceiptListingByFinalizedDate.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptSummaryListing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr class="graytitle">
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Receipt Summary By Finalized Date</asp:Label><asp:Label
                        ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="SiteLbl" runat="server">Site</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="SiteDescrLbl" runat="server"></asp:Label>
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
                <td>
                    <asp:Button ID="ExportExcelLnk" class="green" runat="server" OnClick="ExportExcel" Text="Excel" />
                </td>
            </tr>
        </table>
        <div id="div-datagrid" style="height: 85%">
            <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                OnGridExporting="RadGrid1_GridExporting" OnItemDataBound="ResultDG_ItemDataBound"
                ExportSettings-UseItemStyles="true" GroupPanelPosition="Top">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result89.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result89" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>JbAccPnL</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style3 {
            width: 12px;
        }

        .style4 {
            width: 93px;
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
                <%-- <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
            </td>--%>
            </tr>
            <tr class="graytitle">
                <td colspan="5">
                    <asp:Label ID="TitleLbl" runat="server"></asp:Label>
                    <%-- <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">P & L By Account By Job</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>--%>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">JobNo
                </td>
                <td class="style3">:
                </td>
                <td colspan="2">
                    <asp:Label ID="JobNoLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" OnGridExporting="ResultDG_GridExporting"
            Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
            OnColumnCreated="ResultDG_ColumnCreated">
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
    </form>
</body>
</html>


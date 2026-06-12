<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.iCMSJobPerformanceAnalysis.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>iCMS Job Performance Analysis Result</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style2" colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <br>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="AccountDescrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="FormatDescrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="POLLbl" runat="server">POL</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="POLDesrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="PODLBL" runat="server">POD</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="PODDesrLbl" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button runat="server" ID="ExportExcelBtn" OnClick="ExportExcel" CssClass="green" ToolTip="Export to Excel" Text="Excel" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>


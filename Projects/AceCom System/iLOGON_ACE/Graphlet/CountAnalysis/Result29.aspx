<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result29.aspx.cs" Inherits="iWMS.Web.Graphlet.CountAnalysis.Result29" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reconcile By SKU by Location with Stock Take</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server" />

        <table>
            <tr>
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="graytitle"></asp:Label>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Account" CssClass="graytitle"></asp:Label>
                </td>
                <td class="graytitle">:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server" CssClass="graytitle"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label runat="server" Text="Format" CssClass="graytitle"></asp:Label>
                </td>
                <td class="graytitle">:
                </td>
                <td>
                    <asp:Label ID="FormatLbl" runat="server" CssClass="graytitle"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label runat="server" Text="Stock Take Number" CssClass="graytitle"></asp:Label>
                </td>
                <td class="graytitle">:
                </td>
                <td>
                    <asp:Label ID="StockTakeNumberLbl" runat="server" CssClass="graytitle"></asp:Label>
                </td>
            </tr>
        </table>

        <table style="padding-top: 15px;">
            <tr>
                <td>
                    <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CssClass="green" OnClick="ExcelBtn_Click" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <table style="padding-top: 15px;">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Reconcile by SKU" Font-Bold="true" Font-Size="Small"></asp:Label>
                    <br />
                </td>
            </tr>

            <tr>
                <td>
                    <telerik:RadGrid ID="ReconcileBySKUResultDG" runat="server" AutoGenerateColumns="true" Skin="Metro"
                        AllowFilteringByColumn="false" AllowSorting="true" ExportSettings-UseItemStyles="true" OnNeedDataSource="ReconcileBySKUResultDG_NeedDataSource"
                        GridLines="None" EnableLinqExpressions="false" OnColumnCreated="ReconcileBySKUResultDG_ColumnCreated">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>

        <table style="padding-top: 15px;">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Reconcile by Location" Font-Bold="true" Font-Size="Small"></asp:Label>
                    <br />
                </td>
            </tr>

            <tr>
                <td>
                    <telerik:RadGrid ID="ReconcileByLocationResultDG" runat="server" AutoGenerateColumns="true" Skin="Metro"
                        AllowFilteringByColumn="false" AllowSorting="true" ExportSettings-UseItemStyles="true" OnNeedDataSource="ReconcileByLocationResultDG_NeedDataSource"
                        GridLines="None" EnableLinqExpressions="false" OnColumnCreated="ReconcileByLocationResultDG_ColumnCreated">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

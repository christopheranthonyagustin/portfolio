<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result37.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result37" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FreightAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style2 {
        }

        .style3 {
            width: 12px;
        }

        .style4 {
            width: 100px;
        }

        .stylewrap {
            white-space: pre-line;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="FormatLbl" runat="server" CssClass="Graytitle" Text="Format"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="FormatTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="EntityLbl" runat="server" CssClass="Graytitle" Text="Entity"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="EntityTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="BranchLbl" runat="server" CssClass="Graytitle" Text="Branch"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="BranchTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="DepartmentLbl" runat="server" CssClass="Graytitle" Text="Department"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="DepartmentTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="AsAtDateLbl" runat="server" CssClass="Graytitle" Text="As At Date"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AsAtDateTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="StatusLbl" runat="server" CssClass="Graytitle" Text="Status"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="StatusTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <table width="40%">
            <tr>
                <td>
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
            AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <ClientSettings Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" ItemStyle-Width="80px" HeaderStyle-Width="80px" Width="100%" TableLayout="Auto" PageSize="50">
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>

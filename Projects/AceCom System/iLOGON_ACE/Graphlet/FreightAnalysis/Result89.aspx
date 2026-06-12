<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result89.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result89" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FreightAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="LicenseNameLbl" class="graytitle" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" CssClass="Graytitle" Text="Freight Analysis :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EntityLbl" runat="server" class="graytitle" Text="Entity :" />
                </td>
                <td>
                    <asp:Label ID="EntityName" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="BranchLbl" runat="server" class="graytitle" Text="Branch :" />
                </td>
                <td>
                    <asp:Label ID="BranchTxt" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="DepartmentLbl" runat="server" class="graytitle" Text="Department :" />
                </td>
                <td>
                    <asp:Label ID="DepartmentTxt" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="AddDateLbl" runat="server" CssClass="Graytitle" Text="Add Date :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="AddDateText" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Statuslbl" runat="server" class="graytitle" Text="Status :" />
                </td>
                <td>
                    <asp:Label ID="StatusText" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="JobLabel" runat="server" class="graytitle" Text="Transactions Recongnised Lines Posted From :" />
                </td>
                <td>
                    <asp:Label ID="JobText" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserLbl" runat="server" class="graytitle" Text="Printed by :" />
                </td>
                <td>
                    <asp:Label ID="UserText" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="FormatddlLbl" runat="server" class="graytitle" Text="Format :" />
                </td>
                <td>
                    <asp:Label ID="FormatddlText" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click"
                        UseSubmitBehavior="false" />
                    &nbsp; &nbsp;
                    <asp:Label ID="RowCountLbl" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
            AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True" AllowPaging="true"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both" OnColumnCreated="ResultDG_ColumnCreated">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <ClientSettings Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" ItemStyle-Width="80px" HeaderStyle-Width="80px" Width="100%" TableLayout="Auto" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

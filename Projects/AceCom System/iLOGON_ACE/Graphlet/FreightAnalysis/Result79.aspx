<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result79.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result79" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>POL/POD Summary @ Freight Analysis</title>
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="EntityName" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:Label ID="TPTLabel" runat="server" class="graytitle" Text="Tranpsort Mode :" />
                </td>
                <td>
                    <asp:Label ID="TPTText" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Containerlbl" runat="server" class="graytitle" Text="Container Mode :" />
                </td>
                <td>
                    <asp:Label ID="ContainerText" class="graytitle" runat="server"></asp:Label>
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
                    <asp:Label ID="StatusLbl" runat="server" class="graytitle" Text="Status :" />
                </td>
                <td>
                    <asp:Label ID="StatusTxt" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="JobLabel" runat="server" class="graytitle" Text="Date :" />
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
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True"
            AllowFilteringByColumn="false" AllowPaging="true" OnGridExporting="ResultDG_GridExporting" GridLines="Both" OnColumnCreated="ResultDG_ColumnCreated">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings Resizing-AllowColumnResize="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" Width="150%" PageSize="50" HeaderStyle-HorizontalAlign="Center">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>


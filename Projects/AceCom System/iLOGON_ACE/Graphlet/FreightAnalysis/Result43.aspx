<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result43.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result43" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FreightAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
            
             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="FormatLabel" runat="server" CssClass="Graytitle" Text="Freight Analysis"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="FormatText" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>

            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="ETDLabel" runat="server" CssClass="Graytitle" Text="ETD"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Label ID="ETDSpl" runat="server" CssClass="Graytitle" Text=":"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ETDText" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>

             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="ETALabel" runat="server" CssClass="Graytitle" Text="ETA"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Label ID="ETASpl" runat="server" CssClass="Graytitle" Text=":"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ETAText" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>

            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="TPTLabel" runat="server" CssClass="Graytitle" Text="Tranpsort Mode"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="TPTText" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>

             <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Containerlbl" runat="server" CssClass="Graytitle" Text="Container Mode"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="ContainerText" runat="server" CssClass="Graytitle"></asp:Label>
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
                    <asp:Label ID="UserLbl" runat="server" CssClass="Graytitle" Text="Printed by"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="UserText" runat="server" CssClass="Graytitle"></asp:Label>
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
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
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

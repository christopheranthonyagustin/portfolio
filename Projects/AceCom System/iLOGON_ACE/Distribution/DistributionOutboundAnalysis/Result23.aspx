<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result23.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionOutboundAnalysis.Result23" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OutboundAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" CssClass="Graytitle" Text="Outbound Analysis : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EntityLabel" runat="server" class="graytitle" Text="Entity :" />
                </td>
                <td>
                    <asp:Label ID="EntityLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="WarehouseLabel" runat="server" class="graytitle" Text="Warehouse:" />
                </td>
                <td>
                    <asp:Label ID="WarehouseLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="ContainerNoLabel" runat="server" class="graytitle" Text="ContainerNo :" />
                </td>
                <td>
                    <asp:Label ID="ContainerNoLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="SalesOrderDateLabel" runat="server" class="graytitle" Text="SalesOrderDate :" />
                </td>
                <td>
                    <asp:Label ID="SalesOrderDateLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="StatusLabel" runat="server" class="graytitle" Text="Status :" />
                </td>
                <td>
                    <asp:Label ID="StatusLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="excelImgBtn_Click"
                        UseSubmitBehavior="false" />
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result71.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result71" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job Charge Detail with GL Account</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
                    <asp:Label ID="TitleLabel" runat="server" CssClass="Graytitle" Text="Freight Analysis -"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EntityLbl" runat="server" class="graytitle" Text="Entity" />
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="EntityNameLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="TransportModeLbl" runat="server" class="graytitle" Text="Transport Mode" />
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="TransportModeTxtLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="BranchLbl" runat="server" class="graytitle" Text="Branch" />
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="BranchTxtLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="DepartmentLbl" runat="server" class="graytitle" Text="Department" />
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="DepartmentTxtLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="StatusLbl" runat="server" class="graytitle" Text="Status" />
                </td>
                <td>:</td>
                <td>
                    <asp:Label ID="StatusTxtLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="AddDateLbl" runat="server" Visible="false" class="graytitle" Text="Job Add Date " />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="JobAddDateLbl" class="graytitle" runat="server" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="CloseDateLbl" runat="server" class="graytitle" Visible="false" Text="Job Close Date" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="JobCloseDateLbl" class="graytitle" runat="server" Visible="false"></asp:Label>
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
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ExcelBtn" runat="server" class="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" OnColumnCreated="ResultDG_ColumnCreated"
            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True" OnItemDataBound="ResultDG_ItemDataBound"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevAndNumeric" />
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

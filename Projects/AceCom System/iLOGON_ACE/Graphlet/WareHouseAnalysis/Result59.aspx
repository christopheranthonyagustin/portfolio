<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result59.aspx.cs" Inherits="iWMS.Web.Graphlet.WareHouseAnalysis.Result59" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Summary of Warehouse Movement</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td class="style2" colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle" Font-Bold="true"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="Label2" runat="server">Format</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="userLbl1" runat="server">Account</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ExportExcelBtn" CssClass="LongLabelGreen" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, false)" runat="server" OnClick="ExportExcelBtn_Click" Text="Export Excel" />
                </td>
            </tr>
        </table>
        <br /><br />

        <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Large" Font-Underline="true"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Label ID="B2L1Lbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B2L1ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B2L1ResultDG_NeedDataSource" OnColumnCreated="B2L1ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="B3L1Lbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label> <br />
        <telerik:RadGrid ID="B3L1ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B3L1ResultDG_NeedDataSource" OnColumnCreated="B3L1ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="B2L4Lbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B2L4ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B2L4ResultDG_NeedDataSource" OnColumnCreated="B2L4ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>


        <br />
        <br />
        <asp:Label ID="B3L4Lbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B3L4ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B3L4ResultDG_NeedDataSource" OnColumnCreated="B3L4ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="B4L4Lbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B4L4ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B4L4ResultDG_NeedDataSource" OnColumnCreated="B4L4ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>


        <br />
        <br />
        <asp:Label ID="Block3ALbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="Block3AResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="Block3AResultDG_NeedDataSource" OnColumnCreated="Block3AResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="B2L1PurchaseLbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B2L1PurchaseResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B2L1PurchaseResultDG_NeedDataSource" OnColumnCreated="B2L1PurchaseResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="TransportationLbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="TransportationResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="TransportationResultDG_NeedDataSource" OnColumnCreated="TransportationResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

        <br />
        <br />
        <asp:Label ID="B2L1ProductLbl" runat="server" Font-Bold="true" Font-Size="Medium" Font-Underline="true"></asp:Label><br />
        <telerik:RadGrid ID="B2L1ProductResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" Width="50%"
            AllowFilteringByColumn="false" OnNeedDataSource="B2L1ProductResultDG_NeedDataSource" OnColumnCreated="B2L1ProductResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ShowHeader="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

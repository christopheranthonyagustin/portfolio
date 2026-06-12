<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackToteStationScanToteBin.aspx.cs" Inherits="iWMS.Web.Outbound.PackToteStation.PackToteStationScanToteBin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scan Tote Bin @ Pack Tote Station</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Tote Bin No" Font-Size="Medium"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="ToteBinNoTxtBox" Skin="WebBlue" Width="155" CausesValidation="false" AutoPostBack="true" OnTextChanged="ScanToteBinNoTxtBox_TextChanged"></telerik:RadTextBox>
                </td>
            </tr>
        </table>

        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                        OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>

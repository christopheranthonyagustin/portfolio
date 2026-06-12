<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result97.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result97" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>RevenueAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="AccLbl" runat="server">Account : </asp:Label>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>Revenue Analysis&nbsp;-&nbsp;&nbsp;
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                    &nbsp; From&nbsp;
                     <asp:Label ID="FrDateLbl" runat="server"></asp:Label>
                    &nbsp; TO&nbsp;
                         <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" OnColumnCreated="ResultDG_ColumnCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

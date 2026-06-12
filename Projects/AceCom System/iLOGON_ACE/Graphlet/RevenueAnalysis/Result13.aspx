<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result13.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result13" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ARGLCode</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Revenue Analysis :" />
                    <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" class="graytitle" Text="Entity :" />
                    <asp:Label ID="EntityLbl" runat="server" class="graytitle" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="accLbl" runat="server" class="graytitle" Text="Account :" />
                    <asp:Label ID="accountLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="frmat" runat="server" class="graytitle"></asp:Label>
                 <asp:Button ID="excelImg" runat="server" class="green" Text="Excel" OnClick="excelImg_Click"
                                            UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

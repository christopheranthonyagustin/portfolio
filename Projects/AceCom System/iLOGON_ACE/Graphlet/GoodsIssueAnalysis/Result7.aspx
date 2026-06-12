<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result7.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GoodsIssueAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Goods Issue Analysis From</asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="SiteLbl" runat="server">Site</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="SiteDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDescLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="TyLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="TypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="StaLbl" runat="server">Status</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="StatusLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnGridExporting="RadGrid1_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true"
        GroupPanelPosition="Top">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <ExportSettings UseItemStyles="True">
        </ExportSettings>
    </telerik:RadGrid>
    </form>
</body>
</html>
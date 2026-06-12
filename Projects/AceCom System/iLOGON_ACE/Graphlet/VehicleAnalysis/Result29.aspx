<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result29.aspx.cs" Inherits="iWMS.Web.Graphlet.VehicleAnalysis.Result29" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>VehicleAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Vehicle Analysis</asp:Label><asp:Label
                        ID="DateLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="FormatDescLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="VehicleLabel" runat="server">Vehicle Type:</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="VehicleLbl" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="style2">
                    <asp:Label ID="DateTimeLbl" runat="server">Generation DateTime </asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="GenDateTimeLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                                UseSubmitBehavior="false" />
                </td>
                    
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnGridExporting="ResultDG_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true" AutoGenerateColumns="true"
            GroupPanelPosition="Top" >
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
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
            <%--<ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>--%>
        </telerik:RadGrid>
    </form>
</body>
</html>

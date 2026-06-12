<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result5.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result5" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>Good Issue Analysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                        runat="server"></a>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Good Issue Anaysis</asp:Label><br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDesrLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="DateLbl" runat="server">AsAtDate</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" Width="2000"
        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2"
        UseAccessibleHeader="True" ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting"
        GridLines="Both">
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
        <ClientSettings>
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <MasterTableView AllowMultiColumnSorting="true">
            <Columns>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk" Width="2000">
        <charttitle text="GI - Number of Goods Issue Processed">
        </charttitle>
        <PlotArea>
                <Series>
                    <telerik:ColumnSeries Name="Quarter 1" Stacked="false" Gap="2" Spacing="0.2">
                    </telerik:ColumnSeries>
                </Series>
        </PlotArea>
        <legend>
            <appearance position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </appearance>
        </legend>
    </telerik:RadHtmlChart>
    <br />
    <br />
      <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Skin="Silk" Width="2000">
        <ChartTitle Text=" GI - Number of Goods Issue Processed">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
    </form>
</body>
</html>

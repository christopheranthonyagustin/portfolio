<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.StockBalanceBySKU2.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>StockBalanceDetailBySku</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

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
                    <img id="excelImg" border="0" alt="Export to Excel" src="../../Image/excel.gif" height="20"
                        runat="server"></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Stock Balance Detail By SKU</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="height: 85%">
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnGridExporting="ResultDG_GridExporting" OnItemDataBound="ResultDG_ItemDataBound"
            OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" AutoGenerateColumns="false"
            GroupPanelPosition="Top">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Product">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="ProductName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot8value" SortExpression="lot8value" HeaderText="lot8" UniqueName="lot8value"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="lot9" UniqueName="lot9"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="PalletId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4"  HeaderText="lot4" UniqueName="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="lot5" UniqueName="lot5"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skulotuom" SortExpression="skulotuom" HeaderText="uom"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="wholeonhandqty" SortExpression="wholeonhandqty"
                        HeaderText="OnhandWhole" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="looseonhandqty" SortExpression="looseonhandqty"
                        HeaderText="OnhandLoose">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lowestonhandqty" SortExpression="lowestonhandqty"
                        HeaderText="OnhandLHU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="wholeavailqty" SortExpression="wholeavailqty"
                        HeaderText="AvailWhole">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="looseavailqty" SortExpression="looseavailqty"
                        HeaderText="AvailLoose">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lowestavailqty" SortExpression="lowestavailqty"
                        HeaderText="AvailLHU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="wholeunavailqty" SortExpression="wholeunavailqty"
                        HeaderText="OnHoldWhole">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="looseunavailqty" SortExpression="looseunavailqty"
                        HeaderText="OnHoldLoose">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lowestunavailqty" SortExpression="lowestunavailqty"
                        HeaderText="OnHoldLHU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalwt" SortExpression="totalwt" HeaderText="Weight">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalnetwt" SortExpression="totalnetwt" HeaderText="NetWeight">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vol" SortExpression="vol" HeaderText="Volume">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="lot1" UniqueName="lot1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="lot2" UniqueName="lot2">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>

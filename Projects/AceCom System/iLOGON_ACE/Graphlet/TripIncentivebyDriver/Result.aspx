<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.TripIncentivebyDriver.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Trip Incentive Analysis Result</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function selectAll(invoker) {
            if (invoker.checked) {
                legendSelectAll();
            }
            else {
                legendDeselectAll();
            }
        }

        function legendDeselectAll() {
            var chart = $find("RadHtmlChart1");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }

        function legendSelectAll() {
            var chart = $find("RadHtmlChart1");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (!chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
        </tr>
    </table>
    <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Trip Incentive Analysis 
                Report</asp:Label>
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="StatusHeaderLbl" runat="server">Shipment Type</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="ShtypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="PersonnelHeaderLbl" runat="server">Personnel Grade</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="PerGradeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="FormatHeaderLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <%--<tr>
            <td align="right" class="style1">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
            <td>
            </td>
        </tr>--%>
       <%-- <tr>
            <td colspan="4">
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                        OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true">
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
                        </MasterTableView>
                    </telerik:RadGrid></div>
            </td>
        </tr>--%>
    </table>  
    <br />
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk">
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>  
    <table width="100%">
        <tr>
            <td align="center">
                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" checked="checked"onclick="selectAll(this)" />Select/Unselect
                All Series
            </td>
        </tr>
    </table>
    </form>
</body>

</html>

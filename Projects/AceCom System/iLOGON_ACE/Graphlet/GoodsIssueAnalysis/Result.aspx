<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GoodsIssueAnalysis</title>
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

        function selectAll1(invoker) {
            if (invoker.checked) {
                legendSelectAll1();
            }
            else {
                legendDeselectAll1();
            }
        }

        function legendDeselectAll1() {
            var chart = $find("RadHtmlChart2");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }

        function legendSelectAll1() {
            var chart = $find("RadHtmlChart2");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (!chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }
        function selectAll2(invoker) {
            if (invoker.checked) {
                legendSelectAll2();
            }
            else {
                legendDeselectAll2();
            }
        }

        function legendDeselectAll2() {
            var chart = $find("RadHtmlChart3");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }

        function legendSelectAll2() {
            var chart = $find("RadHtmlChart3");
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
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Goods Issue Analysis " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
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
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk">
        <ChartTitle Text=" GI - Number of Goods Issue Processed">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
    <table width="100%">
        <tr>
            <td align="center">
                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" checked="true" onclick="selectAll(this)" />Select/Unselect
                All Series
            </td>
        </tr>
    </table>
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Skin="Silk">
        <ChartTitle Text=" GI - Number of SKU Lines Processed">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
     <table width="100%">
        <tr>
            <td align="center">
                <input id="cbSelectAll1" name="cbSelectAll1" type="checkbox" checked="true" onclick="selectAll1(this)" />Select/Unselect
 All Series
            </td>
        </tr>
    </table>
      
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart3" Skin="Silk">
        <ChartTitle Text="GI - Number of LHU Quantity Issued">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
     <table width="100%">
        <tr>
            <td align="center">
               <input id="cbSelectAll2" name="cbSelectAll2" type="checkbox" checked="true" onclick="selectAll2(this)" />Select/Unselect
    All Series
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>

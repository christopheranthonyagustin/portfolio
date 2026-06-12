<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result4.aspx.cs" Inherits="iWMS.Web.Graphlet.TripIncentivebyDriver.Result4" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>Trip Incentive Analysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
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

        function selectAll2(invoker) {
            if (invoker.checked) {
                legendSelectAll2();
            }
            else {
                legendDeselectAll2();
            }
        }

        function legendDeselectAll2() {
            var chart = $find("RadHtmlChart2");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }

        function legendSelectAll2() {
            var chart = $find("RadHtmlChart2");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (!chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }
    </script>
    <style type="text/css">
        .style1 {
            width: 10%;
        }

        .style2 {
            width: 6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <td>:
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
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="ShtypeLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style1">
                    <asp:Label ID="PersonnelHeaderLbl" runat="server">Personnel Grade</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="PerGradeLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style1">
                    <asp:Label ID="FormatHeaderLbl" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style1">
                    <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
                </td>
                <td>:
                </td>
                <td colspan="2">
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk" Width="1700" Height="900">
            <ChartTitle Text="Trip Incentive Analysis <Unstacked Graph>">
            </ChartTitle>
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries>
                    </telerik:ColumnSeries>
                </Series>
                <AdditionalYAxes>
                    <telerik:AxisY Name="AmountAxis">
                        <TitleAppearance Text="Trip Amount" />
                    </telerik:AxisY>
                </AdditionalYAxes>
                <XAxis>
                    <AxisCrossingPoints>
                        <telerik:AxisCrossingPoint Value="0" />
                        <telerik:AxisCrossingPoint Value="8" />
                    </AxisCrossingPoints>
                    <LabelsAppearance />
                </XAxis>
            </PlotArea>
            <Legend>
                <Appearance Position="Bottom">
                    <TextStyle Margin="20 0 0 80" />
                </Appearance>
            </Legend>
        </telerik:RadHtmlChart>
        <br />
        <table width="100%">
            <tr>
                <td align="center">
                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" checked="true" onclick="selectAll(this)" />Select/Unselect
                All Series
                </td>
            </tr>
        </table>
        <br />
        <br />
        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Skin="Silk" Width="1700" Height="900">
            <ChartTitle Text="Trip Incentive Analysis <Stacked Graph>">
            </ChartTitle>
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries Stacked="true">
                    </telerik:ColumnSeries>
                </Series>
                <AdditionalYAxes>
                    <telerik:AxisY Name="AmountAxis">
                        <TitleAppearance Text="Trip Amount" />
                    </telerik:AxisY>
                </AdditionalYAxes>
                <XAxis>
                    <AxisCrossingPoints>
                        <telerik:AxisCrossingPoint Value="0" />
                        <telerik:AxisCrossingPoint Value="8" />
                    </AxisCrossingPoints>
                    <LabelsAppearance />
                </XAxis>
            </PlotArea>
            <Legend>
                <Appearance Position="Bottom">
                    <TextStyle Margin="20 00 0 0" />
                </Appearance>
            </Legend>
        </telerik:RadHtmlChart>
        <br />
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

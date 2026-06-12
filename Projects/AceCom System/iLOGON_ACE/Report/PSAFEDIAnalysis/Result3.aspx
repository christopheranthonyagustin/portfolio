<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Report.PSAFEDIAnalysis.Result3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head id="Head1" runat="server">
    <title>PSA FEDI Analysis</title>
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
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="PSA FEDI Analysis " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk">
        <PlotArea>
            <Series>
                <telerik:ColumnSeries DataFieldY="V20FT" GroupName="NonRebate" Name="20FT">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="V20FT24HrRb" GroupName="Rebate" Name="20FT24HrRebate">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="V20FT48HrRb" GroupName="Rebate" Name="20FT48HrRebate">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="V40FT" GroupName="NonRebate" Name="40FT">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="V40FT24HrRb" GroupName="Rebate" Name="40FT24HrRebate">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="V40FT48HrRb" GroupName="Rebate" Name="40FT48HrRebate">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
            </Series>
            <YAxis Step="50">
                <TitleAppearance Text="Number of Containers" />
            </YAxis>
            <XAxis DataLabelsField="BillMonth">
                <TitleAppearance Text="Months" />
                <LabelsAppearance DataFormatString="{0}" />
            </XAxis>
        </PlotArea>
        <ChartTitle Text="PSA FEDI Analysis">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
                <TextStyle Margin="20 0 0 0" />
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
    </form>
</body>
</html>


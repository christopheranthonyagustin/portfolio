<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result31.aspx.cs" Inherits="iWMS.Web.Report.TripAnalysis.Result31" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>TripAnalysis</title>
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
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Trip Analysis" />
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
                <asp:Label ID="shplbl" runat="server" class="graytitle" Text="Shipment Type :" />
                <asp:Label ID="ShptypeLbl" runat="server" class="graytitle"></asp:Label>
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
        <charttitle text="Trip Analysis">
        </charttitle>
        <legend>
            <appearance position="Bottom">
                <TextStyle Margin="20 0 0 0" />
            </appearance>
        </legend>
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

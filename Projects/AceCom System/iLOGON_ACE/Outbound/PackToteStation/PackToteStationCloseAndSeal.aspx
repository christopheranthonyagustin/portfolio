<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackToteStationCloseAndSeal.aspx.cs" Inherits="iWMS.Web.Outbound.PackToteStation.PackToteStationCloseAndSeal" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Close And Seal @ Pack Tote Station</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                        oWindow = window.frameElement.radWindow; return oWindow;
            }

            function Close() {
                GetRadWindow().close();
                var HasDataForScanPickingCart = (<%= "'" + ViewState["HasDataForScanPickingCart"].ToString() + "'" %>);
                var Action = (<%= "'" + ViewState["Action"].ToString() + "'" %>);

                if (HasDataForScanPickingCart == "Exist") {
                    if (Action == "AlreadySelectedPrinter") {
                        window.parent.location.href = "../PackToteStation/PackToteStationScanToteBin.aspx?SiteCode=" + <%= "'" + ViewState["SiteCode"].ToString() + "'" %> + "&PickingCartNo=" + <%= "'" + ViewState["PickingCartNo"].ToString() + "'" %>;
                    }
                    else {
                        window.parent.parent.location.href = "../PackToteStation/PackToteStationScanToteBin.aspx?SiteCode=" + <%= "'" + ViewState["SiteCode"].ToString() + "'" %> + "&PickingCartNo=" + <%= "'" + ViewState["PickingCartNo"].ToString() + "'" %>;
                    }
                }
                else {
                    if (Action == "AlreadySelectedPrinter") {
                        window.parent.location.href = "../PackToteStation/PackToteStationScanPickingCart.aspx";
                    }
                    else {
                        window.parent.parent.location.href = "../PackToteStation/PackToteStationScanPickingCart.aspx";
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Issue No" Font-Size="Medium"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="IssueNoTxtBox" Skin="WebBlue" Width="155" CausesValidation="false" Enabled="false"></telerik:RadTextBox>
                </td>
                <td>
                    <asp:Label runat="server" Text="Order No" Font-Size="Medium"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="OrderNoTxtBox" Skin="WebBlue" Width="155" CausesValidation="false" Enabled="false"></telerik:RadTextBox>
                </td>
                <td>
                    <asp:Label runat="server" Text="AWB" Font-Size="Medium"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="AWBTxtBox" Skin="WebBlue" Width="155" CausesValidation="false" Enabled="false"></telerik:RadTextBox>
                </td>
            </tr>
        </table>

        <br />

        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Scan the AWB" Font-Size="Medium"></asp:Label>
                    <br />
                    <telerik:RadTextBox runat="server" ID="ScanAWBTxtBox" Skin="WebBlue" Width="400" TextMode="MultiLine" Rows="5" CausesValidation="false" AutoPostBack="true" OnTextChanged="ScanAWBTxtBox_TextChanged"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

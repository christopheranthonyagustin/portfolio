<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingKioskPrinterList.aspx.cs" Inherits="iWMS.Web.Outbound.PackingKiosk.PackingKioskPrinterList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Installed Printer List</title>
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
            }

            function OnClientClose(sender, args) {
                window.parent.location.href = window.parent.location.href;
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
                    <asp:Label Text="Please select Printer" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="InstalledPrinterRadioButtonList" runat="server"></asp:RadioButtonList>
                </td>
            </tr>
        </table>

        &nbsp;
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SelectBtn" CssClass="white" runat="server" Text="Select"
                        OnClick="SelectBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

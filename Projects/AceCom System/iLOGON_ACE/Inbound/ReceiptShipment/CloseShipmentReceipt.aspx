<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CloseShipmentReceipt.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.CloseShipmentReceipt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Close RCS @ Receipt Shipment</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />   
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" Font-Size="Small" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td width="40%">
                    <asp:Label ID="ReasonLbl" runat="server" >Reason:</asp:Label>
                </td>
                <td width="60%">
                    <asp:TextBox ID="ReasonTxt" runat="server"
                        Width="200" Height="100"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="40%">
                    &nbsp;
                </td>
                <td width="60%" align="left">
                    <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" Text="Submit" OnClientClick="disableBtn(this.id)"
                        OnClick="ConfirmBtn_Click" UseSubmitBehavior="false"></asp:Button>                 
                </td>
            </tr>
        </table>
    </asp:Panel>
    <iframe id="IFrame" ondrop="return false;" frameborder="0" name="IFrame"
        scrolling="no"></iframe>

    <%--<script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>--%>

    </form>
</body>
</html>

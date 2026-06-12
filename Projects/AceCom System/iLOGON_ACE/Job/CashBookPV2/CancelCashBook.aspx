<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelCashBook.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CancelCashBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancel Cash Book</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript">
          function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
        </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Cash Book Cancellation\Void</asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"  style="padding-right: 20px">
                        <asp:Label ID="lblValid" Text="" ForeColor="Red" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                    <td>
                        <asp:TextBox ID="ReasonTxt" BackColor="Yellow" runat="server" Width="155px"
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <table width="100%">
                <tr>
                   <%-- <td style="padding-left: 60px">
                        <asp:Button ID="CancelBtn0" runat="server" OnClick="CancelBtn_Click"
                            Text="Cancel" UseSubmitBehavior="false" CssClass="white" />
                    </td>--%>
                    <td align ="center">
                        <asp:Button ID="OkayBtn" runat="server" OnClick="OkayBtn_Click"
                            Text="Submit" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
            scrolling="no"></iframe>
        <script type="text/javascript">
            // Instantiate our BusyBox object
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
        </script>
    </form>
</body>
</html>

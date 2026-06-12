<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2FinalizeZero.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2FinalizeZero" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Finalize via Receipt @ GoodsReceiveV2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/NewBusyBox.js" language="javascript"></script>

</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="FinalizeLbl" runat="server" CssClass="pagetitle">Receipt Finalize</asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server">Some SKU lines have ZERO received qty. Please provide the reason if you wish to proceed to finalize.</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                    </td>
                    <td width="60%">:
                    <asp:TextBox ID="ReasonTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                    <td width="60%" align="left">
                        <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" OnClick="ConfirmBtn_Click"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
            scrolling="no"></iframe>

        <script type="text/javascript">
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBoxl.html");
        </script>
    </form>
</body>
</html>

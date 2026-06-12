<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3NonBillable.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3NonBillable" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Non-Billable @ Goods Receive V3</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" Font-Size="Small" />
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        <asp:Label ID="ReasonLbl" runat="server" Font-Size="Small">Reason</asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="GrossWTUOMReqVal" runat="server" ControlToValidate="ReasonTxt"
                            ErrorMessage="*" ForeColor="Red" CssClass="top-left-corner" />
                    </td>
                </tr>
                <tr>
                    <td width="60%" align="left">
                        <asp:TextBox ID="ReasonTxt" runat="server" Width="200" Height="100"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="40%">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="60%" align="left">
                        <asp:Button ID="ConfirmBtn" runat="server" Text="Submit" CssClass="LongLabelWhite"
                            OnClick="SubmitBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

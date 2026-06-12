<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelHOTORegister.aspx.cs" Inherits="iWMS.Web.Outbound.HOTORegister.CancelHOTORegister" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>CancelHOTORegister</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">HOTORegister Cancellation</asp:Label>
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
                <td width="30%">
                    <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                </td>
                <td width="70%">
                    :
                    &nbsp;
                    <telerik:RadTextBox ID="ReasonTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox> 
                </td>
            </tr>
            <tr>
                <td width="30%">
                    &nbsp;
                </td>
                <td width="70%" align="left">
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click" Text="Confirm" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>

</html>

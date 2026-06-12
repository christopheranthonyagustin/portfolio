<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelWorkOrderRegister.aspx.cs" Inherits="iWMS.Web.VAS.WorkOrderRegister.CancelWorkOrderRegister" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>CancelWorkOrderRegister</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">WorkOrderRegister Cancellation</asp:Label>
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
                    <telerik:RadButton ID="ConfirmBtn" runat="server" Skin="WebBlue" Text="Confirm"
                        OnClick="ConfirmBtn_Click" SingleClick="true" SingleClickText="Processing..."></telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>

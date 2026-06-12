<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrGateOutV2Form.aspx.cs" Inherits="iWMS.Web.Outbound.CtnrGateOutV2.CtnrGateOutV2Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>CtnrGateOutV2Form</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="ConfirmBtn_Click"
                    Text="Confirm" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="false" />
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server" Visible="false"></iWMS:iForm>
                <iWMS:iForm ID="formCtl2" runat="server" Visible="false"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAccountCode.aspx.cs" Inherits="iWMS.Web.Master.Account.ChangeAccountCode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Change Account Code</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
             <tr>
                <td>
                      <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
             </tr>

             <tr>
                <td>
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" Text="Submit"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" /><br />
                </td>
             </tr>
        </table>
    </form>
</body>
</html>

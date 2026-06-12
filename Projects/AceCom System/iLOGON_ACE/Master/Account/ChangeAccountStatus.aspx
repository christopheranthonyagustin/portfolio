<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAccountStatus.aspx.cs" Inherits="iWMS.Web.Master.Account.ChangeAccountStatus" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Change Account Status</title>
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
                     <asp:Button ID="OkayBtn" CssClass="white" runat="server" OnClick="OkayBtn_Click" Text="Okay"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br />
                </td>
             </tr>
        </table>
    </form>
</body>
</html>

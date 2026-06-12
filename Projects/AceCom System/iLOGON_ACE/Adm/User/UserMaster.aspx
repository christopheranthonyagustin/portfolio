<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMaster.aspx.cs" Inherits="iWMS.Web.Adm.User.UserMaster" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <table cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="RadButton1" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

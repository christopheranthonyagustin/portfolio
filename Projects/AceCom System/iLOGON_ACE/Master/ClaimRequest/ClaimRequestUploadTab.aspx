<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimRequestUploadTab.aspx.cs" Inherits="iWMS.Web.Master.ClaimRequest.ClaimRequestUploadTab" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>IssueInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                </td>
            </tr>
            <tr>
                <td>
                    <iwms:iform ID="formCtl2" runat="server"></iwms:iform>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;       
                    <asp:Button ID="OkBtn" class="white" runat="server" OnClick="OkBtn_Click"
                        Text="OK" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

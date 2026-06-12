<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeRequestApprove.aspx.cs" Inherits="iWMS.Web.Management.ChangeRequest.ChangeRequestApprove" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Change Request Approve</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

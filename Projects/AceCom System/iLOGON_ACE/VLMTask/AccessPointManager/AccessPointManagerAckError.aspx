<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessPointManagerAckError.aspx.cs" Inherits="iWMS.Web.VLMTask.AccessPointManager.AccessPointManagerAckError" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledge Error @ VLM Picking</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="AckErrorLbl" Text="" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td style="text-align: center">&nbsp;<asp:Button ID="AckErrorBtn" CssClass="LongLabelWhite" runat="server" OnClick="AckErrorBtn_Click" Text="Acknowledge Error"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /><br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

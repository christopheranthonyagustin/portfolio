<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMPutawayReSubmitMission.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMPutaway.VLMPutawayReSubmitMission" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Re-Submit Mission @ VLM Putaway</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../js/Script.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel Text="Reason:" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="MissionNotesTxt" TextMode="MultiLine" runat="server" Skin="WebBlue"
                        Font-Size="Medium" Height="150px" Width="320px">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" Text="Submit"
                        UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CloseBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseBtn_Click" Text="Close Window"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

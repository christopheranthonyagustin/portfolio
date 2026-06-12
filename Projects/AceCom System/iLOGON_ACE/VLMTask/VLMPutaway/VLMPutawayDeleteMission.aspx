<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMPutawayDeleteMission.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMPutaway.VLMPutawayDeleteMission" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Mission @ Web VLMPutaway</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" href="../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../css/style.css" type="text/css" />
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

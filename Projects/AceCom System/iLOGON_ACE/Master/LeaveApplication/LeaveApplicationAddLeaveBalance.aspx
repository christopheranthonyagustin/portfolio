<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplicationAddLeaveBalance.aspx.cs" Inherits="iWMS.Web.Master.LeaveApplication.LeaveApplicationAddLeaveBalance" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Distribution Purchase order Item</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CloseModalPopup() {
                // Get the URL from ViewState
                var url = "../LeaveApplication/LeaveApplicationAddLeave.aspx?PersonnelId=" + '<%= ViewState["PersonnelId"].ToString() %>';
                // Replace the current history entry without reloading the page
                window.parent.history.replaceState(null, null, url);

                // Optionally, add a delay before closing the modal
                setTimeout(function () {
                    // Get a reference to the modal element
                    var modal = window.parent.document.getElementById("Modalpopup");

                    // Check if the modal element exists
                    if (modal) {
                        // Dispatch a click event to the modal's close button or any close element
                        var closeButton = modal.querySelector('.close');
                        if (closeButton) {
                            closeButton.click();
                        } else {
                            // If there is no close button, you can hide the modal directly
                            modal.style.display = "none";
                        }
                    }
                }, 1); // Adjust the delay (in milliseconds) as needed
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                </td>
                <td>
                    <asp:Button ID="CancelBtn" CssClass="LongLabelWhite" runat="server" OnClick="CancelBtn_Click" Text="Close Window" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7MassUpdate.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7MassUpdate" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Planning V7 Mass Update</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click" Text="Confirm"
            OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
        <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:CheckBox ID="AssignCheckBox" ToolTip="Assign" runat="server" AutoPostBack="true"
            Text="Assign" Font-Size="Small" ForeColor="Black" Font-Bold="true" />
        <%-- <asp:Label ID="AssignLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Assign" ForeColor="Black"></asp:Label> --%>
        &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:CheckBox ID="CompleteChk" ToolTip="Complete" runat="server"
            Font-Bold="true" Font-Size="Small" Text="Complete" ForeColor="Black" />
        <%-- <asp:Label ID="CompleteLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Complete" ForeColor="Black"></asp:Label> --%>
        <br /><br />

        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
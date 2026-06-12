<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderMassTripUpdate.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderMassTripUpdate" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Update @ TMS Booking Order</title>
    <base target="_self" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmBtn" class="white" runat="server" OnClick="ConfirmBtn_Click" Text="Confirm"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td style="padding-left: 15px">
                    <asp:CheckBox ID="AssignCheckBox" ToolTip="Assign" runat="server" AutoPostBack="true" Text="Assign" Font-Size="Small" ForeColor="Black" Font-Bold="true" />
                </td>
                <td style="padding-left: 15px">
                    <asp:CheckBox ID="CompleteChk" ToolTip="Complete" runat="server" Font-Bold="true" Font-Size="Small" Text="Complete" ForeColor="Black" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterRecurring.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterRecurring" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head runat="server">
    <title>Delivery Job Register Recurring</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="40%">
            <tr>
                <td>
                    <asp:Label ID="RecurringLbl" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="red"></asp:Label><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" Width="511px"
                        CellSpacing="4" CellPadding="5">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="ForNextFewDaysLbl" runat="server" Text="ForNextFewDays"></asp:Label><br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadTextBox ID="ForNextFewDaysTxt" runat="server" TextMode="SingleLine" Enabled="true" Width="100px">
                    </telerik:RadTextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator ID="ForNextFewDaysTxtCom" runat="server" ControlToValidate="ForNextFewDaysTxt"
                        EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="DisplayChkBoxListByHoliday" runat="server" Width="511px"
                        CellSpacing="4" CellPadding="5">
                    </asp:CheckBoxList><br /><br />
                </td>
            </tr>           
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Text="Submit" /> &nbsp;&nbsp;
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

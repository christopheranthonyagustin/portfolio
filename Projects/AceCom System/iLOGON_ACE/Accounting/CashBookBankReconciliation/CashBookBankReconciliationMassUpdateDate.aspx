<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookBankReconciliationMassUpdateDate.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookBankReconciliation.CashBookBankReconciliationMassUpdateDate" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookBankReconciliationMassUpdateDate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Button ID="updateBtn" class="white" runat="server" OnClick="updateBtn_Click" Text="update"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                     <br />
                     <br />
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label runat="server" Text=" Clearance Date "></asp:Label>
                <telerik:RadDatePicker ID="ClearanceDate" runat="server" Width="155"
                    DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="BottomRight" Skin="Office2007"
                   AutoPostBack="true">
                    <Calendar runat="server">
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                </telerik:RadDatePicker>                    
                </td>
                <td>
                <asp:Label runat="server" Text=" Recon Status "></asp:Label>
                 <asp:CheckBox ID="ReconStatusChkBox"  runat="server" />                
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
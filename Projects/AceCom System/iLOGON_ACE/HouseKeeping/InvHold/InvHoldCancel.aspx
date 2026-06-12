<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvHoldCancel.aspx.cs" Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldCancel" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Cancel @ Hold & Release</title>
     <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self"/>

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
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="ScanOutPanel" runat="server">
            <table cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="MsgLbl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        <asp:Label ID="DocNo" runat="server">Document No :</asp:Label>
                    </td>
                </tr>
                <tr>                    
                    <td width="60%">
                    <asp:TextBox ID="DocNoTxt"  runat="server" Height="40px" Width="249px"
                                TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                     <td width="40%">
                        <asp:Label ID="ReasonLbl" runat="server">Cancellation Reason :</asp:Label>
                    </td>
                </tr>
                <tr>                   
                    <td width="60%">
                    <asp:TextBox ID="ReasonTxt" BackColor="Yellow" runat="server" Height="90px" Width="249px"
                                TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>                   
                    <td width="60%" align="left">
                        <asp:Button ID="ConfirmBtn" runat="server" Text="Submit" OnClientClick="return busyBox.Show();"
                            OnClick="ConfirmBtn_Click" CssClass="white"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

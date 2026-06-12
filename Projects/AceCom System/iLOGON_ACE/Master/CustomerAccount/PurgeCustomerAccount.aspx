<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurgeCustomerAccount.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.PurgeCustomerAccount" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purge Customer Account</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
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
        <div>
            <asp:Panel ID="Panel" runat="server">
                <table cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td width="30%">
                            <asp:Label ID="acclbl" runat="server">Account</asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>

                        <td>
                            <asp:TextBox ID="Accounttxt" BackColor="White" runat="server" Width="155px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            <asp:Label ID="namelbl" runat="server">Name</asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                        <td>
                            <asp:TextBox ID="Nametxt" BackColor="White" runat="server" Width="155px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right" style="padding-right: 20px">
                            <asp:Label ID="lblValid" Text="" ForeColor="Red" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%">
                            <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                        <td>
                            <asp:TextBox ID="ReasonTxt" BackColor="White" runat="server" Width="155px"
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="OkayBtn" runat="server" OnClick="OkayBtn_Click"
                                Text="Submit" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

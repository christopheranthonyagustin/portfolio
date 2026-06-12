<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPersonnel.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripPersonnel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TripPersonnel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
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
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="14%">
                            Personnel&nbsp;
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="PersonnelList" runat="server" Rows="10" SelectionMode="Multiple"
                                Width="100%" />
                        </td>
                        <td width="13%" align="center">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                Text=" >> " />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                Text=" << " />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedPersonnelList" runat="server" Rows="10" SelectionMode="Multiple"
                                Width="100%" Style="background-color: Yellow;" />
                        </td>
                        <td width="23%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="SaveBtn" CausesValidation="false" runat="server" Text="Save" CssClass="detailButton"
                    OnClick="SaveBtn_Click"></asp:Button>
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CopyUserXbind.aspx.cs" Inherits="iWMS.Web.Adm.User.CopyUserXbind" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserXbind</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="msgLbl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        CopyFromUser &nbsp;&nbsp;&nbsp;<telerik:RadDropDownList ID="UserList" runat="server"></telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="copyBtn" runat="server" Text="Copy" ToolTip="Copy" OnClick="copyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

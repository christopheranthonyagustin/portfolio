<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWindowConsoleMenu.aspx.cs" Inherits="iWMS.Web.Adm.QueryWindowConsole.QueryWindowConsoleMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager" />
    <table width="100%">
        <tr>
            <td class="NewModuleTitle" align="right">
                <asp:Label ID="MenuLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
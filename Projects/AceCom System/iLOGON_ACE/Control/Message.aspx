<%@ Page Language="c#" CodeBehind="Message.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Control.Message" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Message</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td class="pagetitle">
                <asp:Label ID="TitleLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <div style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px;
                    overflow: auto; border-left: gray 0px solid; width: 420px; padding-top: 0px;
                    border-bottom: gray 0px solid; height: 140px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="MessageLbl" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="OkBtn" runat="server" Text=" OK "></asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

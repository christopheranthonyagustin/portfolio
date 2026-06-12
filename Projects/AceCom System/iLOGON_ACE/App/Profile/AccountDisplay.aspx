<%@ Page Language="c#" CodeBehind="AccountDisplay.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.App.Profile.AccountDisplay" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountDisplay</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="Stylesheet" href="../../css/RadNotification.css" />
</head>
<body scroll="no">
    <form id="Form1" method="post" runat="server" style="overflow: hidden;">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>

        <table>
            <tr>
                <td align="center" valign="top" style="font-size: 120%;">
                     <asp:Panel ID="panel" runat="server">
                    <p>
                        <asp:Image ID="imgLicense" CssClass="img" Style="margin: 25px; height: auto; min-width: 250px;" runat="server" />
                    </p>
                    <asp:Label ID="LastLoginLbl" runat="server">You last logged in on </asp:Label><b>
                        <asp:Label ID="lblLastLogin" runat="server"></asp:Label></b>
                    <br />
                    <br />
                    <asp:Label ID="Connection" runat="server">You are connected to</asp:Label><b>
                        <asp:Label ID="ConnectionLbl" runat="server"></asp:Label></b>
                    <br />
                    <br />
                    <asp:Panel ID="pnlpswdexp" runat="server">
                            <asp:Label ID="PswdExpire" runat="server">Your Password will expire in '</asp:Label>
                            <b>
                                <asp:Label ID="lblPswdExpire" runat="server"></asp:Label></b>
                            <asp:Label ID="lblDay" runat="server">' days</asp:Label>
                        </asp:Panel>
                     </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

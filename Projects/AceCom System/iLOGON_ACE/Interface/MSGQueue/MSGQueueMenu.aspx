<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MSGQueueMenu.aspx.cs" Inherits="iWMS.Web.Interface.MSGQueue.MSGQueueMenu" %>


<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MessageQUEUE</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 160px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="15" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                    ID="MenuTabs" runat="server"></iWMS:Tabs>
                </a>
            </td>
            <td class="NewModuleTitle" align="right">
                <asp:Label ID="SMSQueuelbl" runat="server">Message Queue</asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

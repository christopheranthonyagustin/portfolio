<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2Menu.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2Menu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Daily Deliveries Planning V2</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                        <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="ModuleTitle" align="right">
                    <asp:Label ID="Label1" Style="color: Black; font-size: medium; font-weight: bold" runat="server">Daily Deliveries Planning V2&nbsp;</asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

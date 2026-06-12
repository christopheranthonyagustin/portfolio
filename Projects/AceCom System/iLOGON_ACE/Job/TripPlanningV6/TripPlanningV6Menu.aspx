<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6Menu.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6Menu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script> 
    <style type="text/css">
        .style1 {
            width: 817px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr valign="bottom">
                <td class="style1">
                    <table>
                        <tr>
                            <td>Legend :</td>
                            <td>
                                <div style="background-color: white; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Open</td>
                            <td></td>
                            <td>
                                <div style="background-color: lightskyblue; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Assigned</td>
                            <td>
                                <div style="background-color: gold; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Driver Accepted</td>
                            <td></td>
                            <td>
                                <div style="background-color: #00ffff; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Started</td>
                            <td>
                                <div style="background-color: peru; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Driver Collected</td>
                            <td>
                                <div style="background-color: lightgreen; width: 20px; height: 20px;"></div>
                            </td>
                            <td>Completed</td>
                            <td></td>
                        </tr>
                    </table>

                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="NewModuleTitle" align="right" valign="bottom">
                    <asp:Label ID="MenuLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

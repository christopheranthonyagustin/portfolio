<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliverySchedulingWorkbenchMenu.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliverySchedulingWorkbench.DailyDeliverySchedulingWorkbenchMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .ColorDivStyle {
            border-width: 15px !important;
            border-right: 1px solid;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <table id="ColorLegendTb" runat="server"></table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="NewModuleTitle" align="right" valign="bottom">
                    <asp:Label ID="MenuLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

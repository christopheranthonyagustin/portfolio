<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentLoadPlanMenu.aspx.cs" Inherits="iWMS.Web.Outbound.ShipmentLoadPlan.ShipmentLoadPlanMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Shipment Load Plan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="5" style="border-bottom: #D5D5D5 1px solid;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
                </td>
                <td align="right">
                    <div class="NewModuleTitle">
                        <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Dashboard.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Dashboard" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CostingSheetRegisterV2 Dashboard</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <link rel="stylesheet" href="../../css/Dashboard.css" type="text/css">

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.getElementById('<%= OverviewDashboardPanel.ClientID %>').style.visibility = 'visible';
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="600px" OnClientClose="OnClientClose"
            Modal="true" Left="100px" VisibleStatusbar="false" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>

        <div id="OverView" style="width: 100%; overflow: hidden;">
            <table style="margin-left: 5px;">
                <tr>
                    <td>
                        <asp:Button ID="RefreshOverviewBtn" CssClass="LongLabelWhite" runat="server" OnClick="RefreshOverview_Click"
                            Text="Refresh Overview" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <asp:Panel ID="OverviewDashboardPanel" runat="server" Width="100%" HorizontalAlign="Left">
                <div id="EachOverviewDashboard" runat="server"></div>
            </asp:Panel>
        </div>

      <%--  <div id="Warning" style="width: 100%; margin-top: 4%">
            <table style="margin-left: 5px;">
                <tr>
                    <td>
                        <asp:Button ID="RefreshWarningBtn" CssClass="LongLabelWhite" runat="server" OnClick="RefreshWarning_Click"
                            Text="Refresh Warning" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="WarningLabel" Text="Generating the warning results may take some time.Thank you for waiting." Font-Size="150%" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="WarningDashboardPanel" runat="server" Width="100%" HorizontalAlign="Left" Visible="false">
                <div id="EachWarningDashboard" runat="server"></div>
            </asp:Panel>
        </div>--%>
    </form>
</body>
</html>

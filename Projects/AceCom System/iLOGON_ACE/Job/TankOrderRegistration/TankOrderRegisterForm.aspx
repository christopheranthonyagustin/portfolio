<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderRegisterForm.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TankOrderRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
        CausesValidation="false" AutoPostBack="True" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Tank" Value="5" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="LOI" Value="150" runat="server">  
            </telerik:RadTab>       
            <telerik:RadTab Text="Point" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="BL" Value="20" runat="server" Visible="false">
            </telerik:RadTab>
            <telerik:RadTab Text="Charge" Value="30" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Cost" Value="140" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="P&L" Value="160" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Task" Value="90" runat="server" Visible="false">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="110" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="120" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Route" Value="130" runat="server" Visible="false">
            </telerik:RadTab>
            <telerik:RadTab Text="Payable" Value="50" runat="server" Visible="false">
            </telerik:RadTab>
            
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td>
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
            <td>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="85%" ID="HeaderRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="EquipmentRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="LOIRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="PointRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="BLPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="ChargeRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="CostRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="PnLRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="TaskRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="AttcRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="LogRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="RouteRadPageView" />
        <telerik:RadPageView runat="server" Height="85%" ID="PayableRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>

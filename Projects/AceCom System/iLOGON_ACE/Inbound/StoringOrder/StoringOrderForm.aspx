<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoringOrderForm.aspx.cs"
    Inherits="iWMS.Web.Inbound.StoringOrder.StoringOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>StoringOrderForm</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Container" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="200" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td>
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="CtnrRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>

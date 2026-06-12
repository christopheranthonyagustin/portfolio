<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLRegisterForm.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.BLRegisterForm" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>BLRegisterForm</title>
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
            <telerik:RadTab Text="Log" Value="50" runat="server">
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
        <telerik:RadPageView runat="server" Height="85%" ID="LogRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>

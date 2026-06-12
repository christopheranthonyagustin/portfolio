<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="ShipmentInbox.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Shipment.ShipmentInbox" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipmentInbox</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="SubmitStatus" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Permit" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Others" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Currency" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="SubmitStatusRadPageView" Height="400px" ContentUrl="InboxSubmitStatus.aspx" />
            <telerik:RadPageView runat="server" ID="PermitRadPageView" Height="400px" ContentUrl="InboxPermit.aspx"/>
            <telerik:RadPageView runat="server" ID="OthersRadPageView" Height="400px" ContentUrl="InboxOthers.aspx"/>
            <telerik:RadPageView runat="server" ID="CurrencyRadPageView" Height="500px" ContentUrl="InboxCurrency.aspx"/>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

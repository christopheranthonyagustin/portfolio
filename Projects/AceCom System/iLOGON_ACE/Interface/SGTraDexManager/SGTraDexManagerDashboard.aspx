<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SGTraDexManagerDashboard.aspx.cs" Inherits="iWMS.Web.Interface.SGTraDexManager.SGTraDexManagerDashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>SGTraDexManagerDashboard</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
  <%--  <link rel="stylesheet" type="text/css" href="../../css/Dashboard.css">--%>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .BigCheckBox {
            float: right;
            margin-right: 12px;
            width: 30px;
            height: 20px;
            text-align: right;
        }

        .form {
            margin-top: 1px;
            padding-top: 1px;
        }
    </style>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <br />
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_Click">
            <Tabs>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="0"  runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ParticipantTab" Text="Participant" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DataElementRequestTab" Text="Data Element Request" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PSADefinitionCodeTab" Text="PSA Definition Code" Value="30" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ContainerDefinitionCodeTab" Text="Container Definition Code" Value="40" runat="server">
                </telerik:RadTab>
                
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ParticipantRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="DataElementRequestRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="PSADefinitionCodeRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerDefinitionCodeRadPageView" />
            
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
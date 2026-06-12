<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicenseManagerResult.aspx.cs" Inherits="iWMS.Web.Adm.LicenseManager.LicenseManagerResult" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>LicenseManagerResult</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
</head>
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" >
            <Tabs>
                <telerik:RadTab Text="Account" Value="0" runat="server" TabIndex="0">
                </telerik:RadTab>
                <telerik:RadTab Text="Personnel" Value="50" runat="server" TabIndex="1">
                </telerik:RadTab>
                <telerik:RadTab Text="Analysis" Value="100" runat="server" TabIndex="2">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="92%" ID="AccountRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="PersonnelRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="AnalysisRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

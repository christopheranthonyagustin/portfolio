<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbench.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbench" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>CycleCountWorkbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>

                <telerik:RadTab Text="Dashboard" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="OutstandingCountTab" Text="Outstanding Count" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CountrecordsTab" Text="Count records" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CountcompletedTab" Text="Count completed" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="Candidatesnotsent" Text="Candidates not sent" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="Resultsnotsent" Text="Results not sent" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="Adjustmentnotsent" Text="Adjustment not sent" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="Cancellationnotsent" Text="Cancellation not sent" Value="700" runat="server">
                </telerik:RadTab>

            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="OutstandingCountRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CountrecordsRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CountcompletedRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CandidatesnotsentRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ResultsnotsentRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AdjustmentnotsentRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CancellationnotsentRadPageView" />

        </telerik:RadMultiPage>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

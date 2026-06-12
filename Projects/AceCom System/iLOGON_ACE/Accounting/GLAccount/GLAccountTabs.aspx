<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAccountTabs.aspx.cs" Inherits="iWMS.Web.Accounting.GLAccount.GLAccountTabs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GLAccountTabs</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Assets" Value="5" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Liabilities" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Revenue" Value="15" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Expenses" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shareholder's Equity" Value="25" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="ResultsGridRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="AssetsRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="LiabilitiesRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="RevenueRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="ExpensesRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="ShareholdersEquityRadPageView">
        </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
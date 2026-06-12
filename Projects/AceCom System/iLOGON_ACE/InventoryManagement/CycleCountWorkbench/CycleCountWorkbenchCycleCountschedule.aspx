<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbenchCycleCountschedule.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbenchCycleCountschedule" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>CycleCountWorkBenchLocationInventorySchedule</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SingleSKUTab" Text="Single SKU" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SplitSKUTab" Text="Split SKU" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>       

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
             <telerik:RadPageView runat="server" Height="700px" ID="SingleSKURadPageView" ContentUrl="CycleCountWorkbenchSingleSKU.aspx" />
            <telerik:RadPageView runat="server" Height="700px" ID="SplitSKURadPageView" ContentUrl="CycleCountWorkbenchSplitSKU.aspx" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

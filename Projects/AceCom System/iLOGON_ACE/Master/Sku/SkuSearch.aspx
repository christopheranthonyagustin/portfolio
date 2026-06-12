<%@ Page Language="c#" CodeBehind="SkuSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku.SkuSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ABCReclassificationTab" Text="ABC reclassification" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SendSynchronizationTab" Text="Send synchronization" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ReceiveSynchronizationTab" Text="Receive synchronization" Value="27" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BrandConfigurationTab" Text="Brand configuration" Value="30" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ListLookuptab" Text="List Lookup" Value="35" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="searchbtn" />
                            &nbsp;
                              <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"
                                  CssClass="green" ToolTip="Export To Excel" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,false)" />
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttributesRadPageView">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SKUDashboardRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ABCReclassificationRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SkuSendsynchronizationRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ReceiveSynchronizationRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="BrandConfigurationRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ListLookupRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

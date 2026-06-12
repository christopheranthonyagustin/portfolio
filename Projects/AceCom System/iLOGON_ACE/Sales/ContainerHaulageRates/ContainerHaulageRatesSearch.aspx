<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesSearch.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="400px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="SearchImgBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Search" UseSubmitBehavior="false" />
                &nbsp;
        <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Visible="true"
            Text="Excel" ToolTip="Export To Excel" />
                <br />
                <br />
                <table id="resultTable" runat="server">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td valign="top">
                            <asp:Label ID="OurPricingModuleLbl" runat="server" Text="OurPricingModel" /><br />
                            <asp:CheckBox ID="OurPricingModuleID" runat="server"
                                OnCheckedChanged="CB_CheckedChanged" AutoPostBack="true" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;  
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>

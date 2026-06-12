<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteSurveyForm.aspx.cs" Inherits="iWMS.Web.MoveManagement.SiteSurvey.SiteSurveyForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SiteSurveyForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ItemTab" Text="Items" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuotationTab" Text="Quotation" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CostTab" Text="Cost" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ServicesTab" Text="Services" Value="350" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Id="AttcTab" Text="Attc" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="250" runat="server">
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
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="90%">
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>                        
                    </tr>
                </table>
            </telerik:RadPageView>  
            <telerik:RadPageView runat="server" Height="90%" ID="ItemsTabPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="QuotationTabPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CostTabPageView"></telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="90%" ID="ServicesRadPageView"></telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="LogTabPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
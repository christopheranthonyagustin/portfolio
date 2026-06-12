<%@ Page Language="c#" CodeBehind="InvoiceAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.DebitNote.InvoiceAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceAdd</title>

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    </telerik:RadScriptBlock>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <p>
            <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel>
        </p>
        <p>
            <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
                HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
                EnableClientScript="true"></asp:ValidationSummary>
        </p>
    </form>
</body>
</html>

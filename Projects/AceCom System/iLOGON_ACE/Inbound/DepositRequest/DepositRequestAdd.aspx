<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositRequestAdd.aspx.cs" Inherits="iWMS.Web.Inbound.DepositRequest.DepositRequestAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DepositRequestAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="true" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                        <br />
                        <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click"
                            Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" /><br />
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </ContentTemplate>
               <Triggers>
                <asp:PostBackTrigger ControlID="AddBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

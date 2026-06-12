<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="PartnerAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Partner.PartnerAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ConsigneeAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                            OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="GenCodeBtn" CssClass="white" runat="server" OnClick="GenCodeBtn_Click" Text="GenCode"
                            OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CausesValidation="false" />
                        <br />
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn" />
                        <asp:PostBackTrigger ControlID="GenCodeBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

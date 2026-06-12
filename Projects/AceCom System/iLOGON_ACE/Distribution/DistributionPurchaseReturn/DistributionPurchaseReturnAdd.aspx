<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseReturnAdd.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseReturn.DistributionPurchaseReturnAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DIstribution Purchase Return Add</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <br />
                        &nbsp;
                        <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                            OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        <br />
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

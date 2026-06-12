<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3Add.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GIV3Add</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Button Style="z-index: 0" ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)"
            UseSubmitBehavior="false" CssClass="white"></asp:Button>
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shipping" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ShippingRadPageView">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl_Shipping" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

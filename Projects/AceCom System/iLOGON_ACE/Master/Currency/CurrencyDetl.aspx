<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyDetl.aspx.cs" Inherits="iWMS.Web.Master.Currency.CurrencyDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CurrencyDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="InternalEXRateTab" Text="Internal Rate" Value="30" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ExternalEXRateTab" Text="SG Customs Rate" Value="20" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TaxEXRateTab" Text="Local CCY Rate (for Taxation)" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="true"></asp:Label>
                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enable="false" Visible="true" />
                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" Visible="true"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="CurrencyPanel" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="true"
                                    Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enable="true"
                        OnClick="UpdateBtn_Click1" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="true"
                        Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    <br />
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                    <ContentTemplate><br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td valign="top" align="center">
                                <asp:PlaceHolder ID="APHId_QRCode" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="InternalEXRateRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ExternalEXRateRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TaxEXRateRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

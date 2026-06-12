<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Add.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CostingSheetAdd</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
        <link href="../../css/style.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
        <script type="text/javascript" src="../../js/row.js"></script>
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />&nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td rowspan="9" colspan="9" valign="top"><br />
                                    <iWMS:iForm ID="formCtl" runat="server" />
                                </td>
                                <td></td>
                                <td colspan="9" rowspan="9" valign="top"><br />
                                    <iWMS:iForm ID="RequestorformCtl" runat="server" />
                                </td>
                            </tr>
                        </table>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
            CssClass="RedText" />
    </form>
</body>
</html>

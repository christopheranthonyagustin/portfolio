<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterBankTransfer.aspx.cs" Inherits="iWMS.Web.Accounting.InterBankTransfer.InterBankTransfer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Transfer @ InterBank</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="TransferBtn" runat="server" Text="Transfer" CssClass="white" ToolTip="Transfer"
                                OnClick="TransferBtn_Click" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,true)" />
                        </td>
                    </tr>
                </table>

                <asp:UpdatePanel ID="FormCtlUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="FormCtl_Entity" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="FormCtl_FrTransfer" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="FormCtl_MultiCurrExchRate" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="FormCtl_ToTransfer" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="FormCtl_ClearingAcc" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

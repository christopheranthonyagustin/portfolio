<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsRcpt.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsReceiveAnalysis.GoodsRcpt" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GoodsReceiveAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RunBtn">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="20">
            <div id="LoaderPopup">
                <a id="loader"></a>
                <a id="text">We are processing your request ...</a>
            </div>
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="true">
                </telerik:RadTab>
                <telerik:RadTab Text="TemplateManager" Value="60" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="1" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="FormatRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="CriteriaRadPageView">
                <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                <br />
                <br />
                &nbsp;
                <asp:Panel ID="Panel43" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="CompileFormatBtn" CssClass="white" runat="server" OnClick="CompileFormatBtn_Click" OnClientClick="disableBtn(this.id, false)" Text="Run" UseSubmitBehavior="false" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formctl43" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Button ID="RunBtn" class="white" runat="server" OnClick="compile_ClickBtn" Text="Run"
                    UseSubmitBehavior="true" />

                <asp:Button ID="SaveTemplateBtn" runat="server" Text="Save Template" CausesValidation="false" OnClick="SaveTemplateBtn_Click" OnClientClick="disableBtn(this.id, false)"
                    UseSubmitBehavior="false" class="LongLabelWhite" Visible="false" />

                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="trformCtl" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td id="trformCt3" runat="server">
                                <iWMS:iForm ID="formCt3" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl2_CB1" runat="server"></iWMS:iForm>
                            </td>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl2_CB2" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl_Analysis37" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl6" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl47" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl31" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl53" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl59" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl67" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl7" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl8" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="PanelListBox" runat="server" Width="1100px" Visible="false">
                        <table style="float: left">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="420px">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <asp:Label ID="RcTypeLbl" runat="server" Text="ReceiptType"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="ReceiveTypeList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedReceiveTypeList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="ReceiveTypeList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedReceiveTypeList" Height="120px" Width="200px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="420px">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="RcStatusLbl" runat="server" Text="Status"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="StatusList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedStatusList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="StatusList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedStatusList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    Skin="Sunset" AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="340px" id="PanelSKUGroup" runat="server">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="SKU Group"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="SkuGroup_List" Height="120px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUGroup_List"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="SelectedSKUGroupList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedSKUGroup_List" Height="120px" Width="150px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>

        </telerik:RadMultiPage>
    </form>
</body>
</html>

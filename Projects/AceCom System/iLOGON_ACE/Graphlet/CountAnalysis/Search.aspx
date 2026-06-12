<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Graphlet.CountAnalysis.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CountAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="compile_Click">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="40" BackColor="#f5f5f0">
            <div style="vertical-align: middle;">
                <asp:Image ID="Image1" runat="server" ImageUrl="../../Image/loading-image.gif" Width="50"
                    Height="50" AlternateText="loading" CssClass="MyLoadingImage"></asp:Image>
            </div>
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>

        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <table border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                    <td style="width: 20%">
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="lbPanel" runat="server" Width="500px">
            <table border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                    <td>&nbsp;Location Category</td>
                </tr>
                <tr>
                    <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="200px"
                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                        OnTransferred="LocCatList_Transferred" CausesValidation="false">
                    </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false" Style="background-color: Yellow;">
                        </telerik:RadListBox>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Format23" runat="server">
            <table border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                    <td style="width: 20%">
                        <br />
                        <iWMS:iForm ID="FormCtl23" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Format29Panel" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <iWMS:iForm ID="FormCtl29" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;
                        <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="ConfirmBtn_Click" Text="Confirm" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    </td>
                    <td style="padding-left: 15px">
                        <asp:Label ID="Format29Lbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <table id="BtnPanel" runat="server">
            <tr>
                <td>
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

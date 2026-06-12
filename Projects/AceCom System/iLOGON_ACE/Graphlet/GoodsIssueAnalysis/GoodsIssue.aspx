<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsIssue.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.GoodsIssue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GoodsIssueAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 36px;
        }

        .style4 {
            width: 6.15%;
        }

        .style5 {
            width: 5.25%;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
                <asp:Panel ID="Panel1" runat="server" Width="500px">
                    <asp:UpdatePanel ID="UpdButton" runat="server">
                        <ContentTemplate>
                            <br />
                            &nbsp;<asp:Button ID="compile_Click" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" OnClick="compile_ClickBtn" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" />
                            <asp:Button ID="SaveTemplateBtn" runat="server" Text="Save Template" CausesValidation="false" OnClick="SaveTemplateBtn_Click" OnClientClick="disableBtn(this.id, false)"
                                UseSubmitBehavior="false" class="LongLabelWhite" Visible="false" />
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                Visible="False"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="compile_Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 20%">
                                <br />
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl79" runat="server" Visible="false"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl127" runat="server" Visible="false"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl131" runat="server" Visible="false"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl137" runat="server" Visible="false"></iWMS:iForm>

                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                            </td>
                            <td valign="top" style="float: right;">
                                <iWMS:iForm ID="formCtl3_DefToggle" runat="server"></iWMS:iForm>
                            </td>
                            <td style="width: 20%" valign="top">
                                <br />
                                <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl6" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl53" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl57" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl83" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl97" runat="server"></iWMS:iForm>
                                <iWMS:iForm ID="formCtl101" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <iWMS:iForm ID="formCtl7" runat="server"></iWMS:iForm>
                            </td>
                            <td valign="top" style="float: right;">
                                <iWMS:iForm ID="formCtl13_DefToggle" runat="server"></iWMS:iForm>
                                
                            </td>
                            <td valign="top">
                                <iWMS:iForm ID="formCtl13_Lottable" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <asp:Panel ID="Format83Panel" runat="server">
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Label ID="Label7" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                    <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="ListBoxPnl" runat="server" Width="500px">
                            <tr>
                                <td colspan="2" class="style1">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="AccountLbl" runat="server" Text="Account"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="AccountList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccountList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="SelectedAccountList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedAccountList" Height="120px" Width="200px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style1">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="SiteLbl" runat="server" Text="Site"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="SiteList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSiteList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="SelectedSiteList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedSiteList" Height="120px" Width="200px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style1">
                                    <asp:UpdatePanel ID="IssueTypeListPanel" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="1%"></td>
                                                    <td>
                                                        <br />
                                                        <asp:Label ID="IsTypeLbl" runat="server" Text="Issue Type"></asp:Label><br />
                                                        <telerik:RadListBox runat="server" ID="IssueTypeList" Height="120px" Width="200px"
                                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIssueTypeList"
                                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                            OnTransferred="SelectedIssueTypeList_Transferred">
                                                        </telerik:RadListBox>
                                                        <telerik:RadListBox runat="server" ID="SelectedIssueTypeList" Height="120px" Width="200px"
                                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                            AllowDelete="false">
                                                        </telerik:RadListBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style1">
                                    <asp:UpdatePanel ID="SelectedStatusListPanel" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="1%"></td>
                                                    <td>
                                                        <br />
                                                        <asp:Label ID="IsStatusLbl" runat="server" Text="Status"></asp:Label><br />
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="style1">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="SkuGrpLbl" runat="server" Text="SKU Group"></asp:Label>
                                                <br />
                                                <telerik:RadListBox runat="server" ID="SKUGroupList" Height="120px" Width="200px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUGroupList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="SelectedSKUGroupList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedSKUGroupList" Height="120px" Width="200px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">&nbsp;<asp:Label ID="Dayslbl" runat="server" Visible="false">KPIDays</asp:Label>
                                    <br />
                                    &nbsp;<telerik:RadTextBox ID="DaysTxt" runat="server" Style="z-index: 0" Width="155px" Visible="false">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;<asp:Label ID="RadMonthYearPickerLbl" runat="server">MonthSelection</asp:Label>
                                    <br />
                                    &nbsp;<telerik:RadMonthYearPicker ID="RadMonthYearPicker" runat="server" AutoPostBack="false" RenderMode="Lightweight"
                                        DateInput-Display="true" Skin="WebBlue" Width="31%">
                                    </telerik:RadMonthYearPicker>
                                </td>
                            </tr>

                        </asp:Panel>
                    </table>
                    <asp:Panel ID="ListBox_Pnl2" runat="server" Visible="false" Width="1200px">
                        <table>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="340px">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="Label1" runat="server" Text="Issue Type"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="Type_List" Height="120px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedType_List"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="SelectedIssueTypeList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedType_List" Height="120px" Width="150px"
                                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="340px">
                                        <tr>
                                            <td width="1%"></td>
                                            <td>
                                                <br />
                                                <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label><br />
                                                <telerik:RadListBox runat="server" ID="Status_List" Height="120px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedStatus_List"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                    OnTransferred="StatusList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedStatus_List" Height="120px" Width="150px"
                                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    Skin="Sunset" AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="340px">
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
                </asp:Panel>
                <asp:Panel ID="Panel_67" runat="server" Visible="false">
                    <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                        <tr>
                            <td valign="top" align="left" colspan="3">
                                <iWMS:iForm ID="formCtl67" runat="server" />
                            </td>
                            <td style="width: 5px"></td>
                            <td valign="top" align="right" rowspan="3">
                                <iWMS:iForm ID="formCtl67_LotToggle" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="left">
                                <asp:Label ID="IssueTypeLbl" runat="server" Text="Issue Type"></asp:Label><br />
                                <telerik:RadListBox runat="server" ID="IssueTypeList67" Height="120px" Width="180px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIssueType_List67"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="SelectedIssueTypeList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedIssueType_List67" Height="120px" Width="150px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                            <td style="width: 5px"></td>
                            <td valign="top">
                                <asp:Label ID="StatusLabel" runat="server" Text="Status"></asp:Label><br />
                                <telerik:RadListBox runat="server" ID="StatusList67" Height="120px" Width="180px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedStatus_List67"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="StatusList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedStatus_List67" Height="120px" Width="150px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="Sunset" AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="Panel_71" runat="server" Visible="false">
                    <table border="0" cellspacing="0" cellpadding="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl71" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Account"></asp:Label><br />
                                <telerik:RadListBox runat="server" ID="AccountList_71" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccountList_71"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="SelectedAccountList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedAccountList_71" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="Panel_107" runat="server" Visible="false" Width="1200px">
                    <table>
                        <tr>
                            <td colspan="2" class="style1">
                                <table border="0" cellpadding="0" cellspacing="0" width="340px">
                                    <tr>
                                        <td width="1%"></td>
                                        <td>
                                            <br />
                                            <asp:Label ID="IssueType107Lbl" runat="server" Text="Issue Type"></asp:Label><br />
                                            <telerik:RadListBox runat="server" ID="IssueType_107" Height="120px" Width="180px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIssueType_107"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="SelectedIssueType107_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedIssueType_107" Height="120px" Width="150px"
                                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                AllowDelete="false">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" width="340px">
                                    <tr>
                                        <td width="1%"></td>
                                        <td>
                                            <br />
                                            <asp:Label ID="Status107" runat="server" Text="Status"></asp:Label><br />
                                            <telerik:RadListBox runat="server" ID="Status_107" Height="120px" Width="180px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedStatus_107"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="Status107_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedStatus_107" Height="120px" Width="150px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="Sunset" AllowDelete="false">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <br />
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

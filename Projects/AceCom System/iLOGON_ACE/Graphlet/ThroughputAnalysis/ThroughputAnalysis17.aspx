<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThroughputAnalysis17.aspx.cs" Inherits="iWMS.Web.Graphlet.ThroughputAnalysis.ThroughputAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ThroughputAnalysis17</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
    <form id="form1" runat="server">       
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="40" BackColor="#f5f5f0">
            <div style="vertical-align: middle;">
                <asp:Image ID="Image1" runat="server" ImageUrl="../../Image/loading-image.gif" Width="50"
                    Height="50" AlternateText="loading" CssClass="MyLoadingImage"></asp:Image>
            </div>
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Office2007">
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
        <br />
        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                   
                    <br />
                    &nbsp;&nbsp;
                    <asp:Button ID="compile_Click" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" OnClick="compile_ClickBtn" OnClientClick="disableBtn(this.id,true)"
                        UseSubmitBehavior="false" CssClass="white" /> 
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label> 
                </ContentTemplate>
            </asp:UpdatePanel>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 20%">&nbsp;&nbsp;
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <asp:Panel ID="ListBoxPnl" runat="server" Width="500px" Visible ="false">
                    <tr>
                        <td colspan="2" class="style1">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="1%"></td>
                                    <td>
                                        <br />
                                        <asp:Label ID="AccountLbl" runat="server" Text="Account"></asp:Label><br />
                                        <telerik:RadListBox runat="server" ID="AvailAccList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="AvailAccList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedAccList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            Skin="WebBlue" AllowDelete="false">
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
                                        <asp:Label ID="Label2" runat="server" Text="Site"></asp:Label><br />
                                        <telerik:RadListBox runat="server" ID="SiteList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                                            AllowTransfer="true" TransferToID="SelectedSiteList" TransferMode="Move" AllowTransferDuplicates="false"
                                            SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                            AutoPostBackOnTransfer="true" OnTransferred="SelectedSiteList_Transferred">
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
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="1%"></td>
                                    <td>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="Issue Type"></asp:Label><br />
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
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="style1">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="1%"></td>
                                    <td>
                                        <br />
                                        <asp:Label ID="RcTypeLbl" runat="server" Text="Receipt Type"></asp:Label><br />
                                        <telerik:RadListBox runat="server" ID="ReceiptTypeList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedReceiptTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="SelectedReceiptTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedReceiptTypeList" Height="120px" Width="200px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </td>
                    </tr>           
                </asp:Panel>
            </table>
        </asp:Panel>
        <br />
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>

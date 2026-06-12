<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAnalysisSearch.aspx.cs" Inherits="iWMS.Web.Graphlet.UserAnalysis.UserAnalysisSearch" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Analysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <script src="../../js/Script.js" type="text/javascript"></script>   
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>

</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>

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
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <asp:UpdatePanel ID="UpdButton" runat="server">
                <ContentTemplate>
                    <br />
                    &nbsp;<asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Panel ID="Format17Panel" runat="server" Visible="false">
                 <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl17" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="Format29Panel" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <table id="Tbsource" border="0" runat="server">
                    <tr>
                        <td width="25%">
                            <asp:Label ID="SourceLbl" runat="server">Source</asp:Label>
                            <telerik:RadListBox runat="server" ID="SourceGroupList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                                AllowTransfer="true" TransferToID="SelectedSourceGroupList" TransferMode="Move" AllowTransferDuplicates="false"
                                SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                AutoPostBackOnTransfer="true" OnTransferred="SourceGroupList_Transferred">
                            </telerik:RadListBox>
                        </td>
                        <td>
                            <br />
                            <telerik:RadListBox runat="server" ID="SelectedSourceGroupList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false" Style="background-color: Yellow;">
                            </telerik:RadListBox>
                        </td>
                        <td style="width: 25%"></td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="Format23Panel" runat="server" Visible="false">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl23" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:UpdatePanel ID="UpdErrLbl" runat="server">
                <ContentTemplate>
                    &nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>

        </asp:Panel>
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


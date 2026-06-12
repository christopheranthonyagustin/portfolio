<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAnalysisSearch.aspx.cs" Inherits="iWMS.Web.Graphlet.SystemAnalysis.SystemAnalysisSearch" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>System Analysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
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
        <br /><br />
        <asp:Label ID ="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label>

        <asp:Panel ID="Panel1" runat="server" Width="500px">
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
                <tr>
                    <td></td>
                </tr>
                
                <tr>
                    <td align="left">&nbsp;
                    <asp:Label ID="UserTypelbl" runat="server">UserType</asp:Label>
                    <br />
                        &nbsp;<telerik:RadListBox ID="List" runat="server" AllowDelete="false"
                            AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false"
                            AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px"
                            OnTransferred="IssueTypeList_Transferred" SelectionMode="Multiple"
                            Skin="Sunset" TransferMode="Move" TransferToID="SelectedList" Visible ="false"
                            Width="200px">

                        </telerik:RadListBox>
                        <telerik:RadListBox ID="SelectedList" runat="server"
                            AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px"
                            Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px" Visible ="false"> 
                        </telerik:RadListBox>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdButton" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label><br />
                                <br />
                                <br />
                                &nbsp;&nbsp;<asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

            </table>
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

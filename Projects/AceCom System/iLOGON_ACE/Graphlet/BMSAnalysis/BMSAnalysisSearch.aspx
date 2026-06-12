<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BMSAnalysisSearch.aspx.cs" Inherits="iWMS.Web.Graphlet.BMSAnalysis.BMSAnalysisSearch" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head id="Head1" runat="server">
    <title>BMSAnalysisSearch</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body style="border-spacing: 0px;">
    <form id="Form1" method="post" runat="server">
        
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
        <table border="0" style="border-spacing: 0px;">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Button ID="compile_Click" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="white" /> 
                    &nbsp;
                <br />
                    &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="border-spacing: 0px; width: 100%">
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr> 
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl19" runat="server"></iWMS:iForm>
                </td>
            </tr>  
             <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl23" runat="server"></iWMS:iForm>
                </td>
            </tr>               
        </table>
        <table id="table1" border="0" cellspacing="3" cellpadding="2" width="100%" runat="server">
            <tr>
                <td style="width: 10%">IncidentalCharges
                <br />
                    <telerik:RadListBox runat="server" ID="IncidentalChargesList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedIncidentalChargesList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="IncidentalChargesList_Transferred">
                    </telerik:RadListBox>
                </td>
                <td style="width: 25%">
                    <br />
                    <telerik:RadListBox runat="server" ID="SelectedIncidentalChargesList" Height="120px" Width="200px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" Style="background-color: Yellow;">
                    </telerik:RadListBox>
                </td>
                <td style="width: 25%"></td>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Graphlet.iCDSAnalysis.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>iCMSStoringOrderAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>        
        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style1">
                        <table id="table1" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="style5">&nbsp;<asp:Label ID="DepotLbl" runat="server" Text="Depot"></asp:Label>
                            </td>      
                                </tr>                      
                            <tr>
                                <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAvailList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="AvailList_Transferred" CausesValidation="false">
                                </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedAvailList" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false" Style="background-color: Yellow;">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
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
                    <td>
                        <asp:UpdatePanel ID="UpdButton" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label><br />
                                <br />
                                <br />
                                &nbsp;&nbsp;<asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" />
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
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


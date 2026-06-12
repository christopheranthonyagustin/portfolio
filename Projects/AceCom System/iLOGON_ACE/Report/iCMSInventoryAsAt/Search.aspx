<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>iCMSInventoryAsAt</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
            <tr>
                <td width="10%">
                    <asp:Label ID="DepotLbl" runat="server">Depot</asp:Label>
                    <br />
                    <telerik:RadListBox runat="server" ID="AvailList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedAvailList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="AvailList_Transferred">
                    </telerik:RadListBox>
                </td>
                <td width="25%">
                    <br />
                    <telerik:RadListBox runat="server" ID="SelectedAvailList" Height="120px" Width="200px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" Style="background-color: Yellow;">
                    </telerik:RadListBox>
                </td>
                <td width="25%"></td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="50%">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdButton" runat="server">
                        <ContentTemplate>
                            &nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label><br />
                            <br />
                            <br />
                            &nbsp;<asp:Button ID="CompileBtn" CssClass="white" runat="server" OnClick="CompileBtn_Click" Text="Run" />
                            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
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

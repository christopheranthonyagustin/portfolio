<%@ Page Language="c#" CodeBehind="JobStatusMonitorSetup.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Graphlet.JobStatusMonitor.JobStatusMonitorSetup" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>JobStatusMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="3" Width="500px" Height="30px"
                        CellSpacing="1" CellPadding="2">
                    </asp:CheckBoxList>
                    <br />
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="ReceiptTypeLbl" runat="server" Text="ReceiptType" Width="180px"></asp:Label>
                                <br />
                                <telerik:RadListBox runat="server" ID="RcTypeList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedRcList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="SelectedRcList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedRcList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <asp:Label ID="IssueTypeLbl" runat="server" Text="IssueType" Width="180px"></asp:Label>
                                <br />
                                <telerik:RadListBox runat="server" ID="IsTypeList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIsList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="SelectedIsList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedIsList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <tr>
                    <td>
                        <br />
                        <br />
                        <asp:Button ID="ViewBtn" runat="server" Text="Compile" OnClick="ViewBtn_Click"
                            OnClientClick="disableBtn(this.id,true)" CssClass="White" />
                        <br />
                        <br />
                        &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                        <br />
                    </td>
                    <td>&nbsp;
                    </td>
                </tr>
        </table>
    </form>
</body>
</html>

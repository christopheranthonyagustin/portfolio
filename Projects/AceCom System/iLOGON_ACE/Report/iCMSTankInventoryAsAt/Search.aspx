<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.iCMSTankInventoryAsAt.Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head id="Head1" runat="server">
    <title>iCMSInventoryAsAt</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body style="border-spacing: 0px;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="border-spacing: 0px; width: 100%">
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
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <table id="depotTable" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server" visible="false">
            <tr>
                <td width="25%">Depot
                <br />
                    <telerik:RadListBox runat="server" ID="DepotList" Height="120px" Width="300px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedDepotList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="DepotList_Transferred">
                    </telerik:RadListBox>
                </td>
                <td width="25%">
                    <br />
                    <telerik:RadListBox runat="server" ID="SelectedDepotList" Height="120px" Width="300px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" Style="background-color: Yellow;">
                    </telerik:RadListBox>
                </td>
                <td width="50%">&nbsp;
                </td>
            </tr>
        </table>
        <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
            <tr>
                <td style="width: 10%">MovementStatus
                <br />
                    <telerik:RadListBox runat="server" ID="MovementStatusList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                        AllowTransfer="true" TransferToID="SelectedMovementStatusList" TransferMode="Move" AllowTransferDuplicates="false"
                        SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                        AutoPostBackOnTransfer="true" OnTransferred="MovementStatusList_Transferred">
                    </telerik:RadListBox>
                </td>
                <td style="width: 25%">
                    <br />
                    <telerik:RadListBox runat="server" ID="SelectedMovementStatusList" Height="120px" Width="200px"
                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                        AllowDelete="false" Style="background-color: Yellow;">
                    </telerik:RadListBox>
                </td>
                <td style="width: 25%"></td>
            </tr>
        </table>
        <table border="0" style="border-spacing: 0px;">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text="Run"
                    Skin="WebBlue" CssClass="detailButton" OnClick="CompileBtn_Click">
                </telerik:RadButton>
                    &nbsp;
                <br />
                    &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

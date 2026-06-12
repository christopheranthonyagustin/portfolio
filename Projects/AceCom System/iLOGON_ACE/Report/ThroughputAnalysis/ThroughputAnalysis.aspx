<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThroughputAnalysis.aspx.cs"
    Inherits="iWMS.Web.Report.ThroughputAnalysis.ThroughputAnalysis" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pallet Utilization </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
            </td>
        </tr>
         <tr>
            <td valign="top" width="30%">
                &nbsp;&nbsp;<iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <td>
                    <asp:Label ID="AccountLbl" runat="server" Text="Account"></asp:Label><br />
                </td>
                <tr>
                    <td style="width: 350px" valign="top">
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
        </tr>
        <br />
        <br />
        <tr>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <td>
                    <asp:Label ID="SiteLbl" runat="server" Text="Site"></asp:Label><br />
                </td>
                <tr>
                    <td style="width: 350px" valign="top">
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
        </tr>
        <tr>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <td>
                    <asp:Label ID="IsTypeLbl" runat="server" Text="Issue Type"></asp:Label><br />
                </td>
                <tr>
                    <td style="width: 350px" valign="top">
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
        </tr>
        <tr>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <td>
                    <asp:Label ID="RcTypeLbl" runat="server" Text="Receipt Type"></asp:Label><br />
                </td>
                <tr>
                    <td style="width: 350px" valign="top">
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
        </tr>       
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td>
                        <asp:Label ID="SKUGroupLbl" runat="server" Text="SKU Group"></asp:Label><br />
                    </td>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="SKUList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                AutoPostBackOnTransfer="true" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                OnTransferred="SKUList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedSKUList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
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
        <tr>
            <td>
                &nbsp;&nbsp;<telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server"
                 AutoPostBack="true" Skin="WebBlue" Text="Compile" CssClass="detailButton" OnClick="CompileBtn_Click">
                </telerik:RadButton>
                &nbsp;
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>

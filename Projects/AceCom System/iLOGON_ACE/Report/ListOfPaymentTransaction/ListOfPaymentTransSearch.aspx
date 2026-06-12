<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfPaymentTransSearch.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfPaymentTransaction.ListOfPaymentTransSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>List of Payment Transaction</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            width: 36px;
        }

        .style5 {
            width: 5.25%;
        }
    </style>

    <style type="text/css">
        .RadListBoxScrollable .rlbGroup {
            overflow-x: hidden !important;
        }
    </style>


</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2" class="style1">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">&nbsp;Bank
                        </td>
                        <tr>
                            <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="BankList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedBankList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="BankList_Transferred">
                            </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedBankList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" style="padding-top: 9px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">&nbsp;Vendor
                        </td>
                        <tr>
                            <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="VendorList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVendorList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="VendorList_Transferred">
                            </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedVendorList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style1" style="padding-top: 9px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">&nbsp;ChargeCode
                        </td>
                        <tr>
                            <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="ChargeCodeList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedChargeCodeList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="ChargeCodeList_Transferred">
                            </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedChargeCodeList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </table>
            <br />
            <table>
                &nbsp;<telerik:RadButton ID="CompileBtn" runat="server" Text="Compile"
                    CssClass="formbtn" Skin="WebBlue" OnClick="CompileBtn_Click">
                </telerik:RadButton>
            </table>

            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Font-Bold="True" Visible="false"
                CssClass="errorLabel"></asp:Label>
        </table>
    </form>
</body>
</html>

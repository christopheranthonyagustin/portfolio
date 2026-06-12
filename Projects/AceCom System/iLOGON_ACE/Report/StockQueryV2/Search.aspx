<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.StockQueryV2.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OpenCloseBalanceV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        function disableRunBtn(id, check) {
            if (check) {
                if (Page_ClientValidate('')) {
                    var btn = document.getElementById(id);
                    btn.disabled = true;
                    btn.value = "Processing...";
                }
                else {
                    return false;
                }
            }
            else {
                var btn = document.getElementById(id);
                btn.disabled = true;
                btn.value = "Processing...";
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Template Manager" Value="60" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="1" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="FormatRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="CriteriaRadPageView">
                <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id, true)"
                                UseSubmitBehavior="false" class="white" />
                        </td>
                        <td>
                            <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id, false)"
                                UseSubmitBehavior="false" class="white" />
                            <asp:Button ID="SaveTemplateBtn" runat="server" Text="Save Template" CausesValidation="false" OnClick="SaveTemplateBtn_Click" OnClientClick="disableBtn(this.id, false)"
                                UseSubmitBehavior="false" class="LongLabelWhite" Visible="false" />
                        </td>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel_13_INT" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13_INT" runat="server" />
                                        <iWMS:iForm ID="formCtl13_INT_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13_INT_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label6" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label7" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="StockQueryBlacklistLabelOn" Text="3. Enable Stock Query Blacklist is [ On ]." Font-Size="15px" runat="server" Visible="false"></asp:Label>
                                        <br />
                                         &nbsp;<asp:Label ID="StockQueryBlacklistLabelOff" Text="3. Enable Stock Query Blacklist is [ Off ]." Font-Size="15px" runat="server" Visible="false"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_13_EXT" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13_EXT" runat="server" />
                                        <iWMS:iForm ID="formCtl13_EXT_Lot456" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13_EXT_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13_EXT_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label8" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label9" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view.  " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label10" Text="2. If there are more than [" Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl1" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label11" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_17" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl17" runat="server" />
                                        <iWMS:iForm ID="formCtl17_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">

                                        <iWMS:iForm ID="formCtl17_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl17_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label16" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label18" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label19" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl3" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label21" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_23" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl23" runat="server" />
                                        <iWMS:iForm ID="formCtl23_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl23_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl23_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label40" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br /> 
                                        &nbsp;<asp:Label ID="StockQueryBlacklistLabel23On" Text="1. Enable Stock Query Blacklist is [ On ]." Font-Size="15px" runat="server" Visible="false"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="StockQueryBlacklistLabel23Off" Text="1. Enable Stock Query Blacklist is [ Off ]." Font-Size="15px" runat="server" Visible="false"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_29" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl29" runat="server" />
                                        <iWMS:iForm ID="formCtl29_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label3" Text="1. If you supply a value in Pallet No, the query will strictly search by this Pallet No vaLue and not qualify values in MoveDateRange even if <br/>  they are supplied. " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_31" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl31" runat="server" />
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl31_LotToggle" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label44" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label46" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view.  " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label47" Text="2. If there are more than [" Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl31" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label48" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_37" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl37" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_39" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl39" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_41" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl41" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_43" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl43" runat="server" />
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl43_LotToggle" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label41" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label42" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label43" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl4" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label45" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_47" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl47" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_51" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <iWMS:iForm ID="formCtl51" runat="server" />
                                <tr>
                                    <td>&nbsp;
                        <asp:Label ID="SKUGroupLbl51" runat="server" Text="SKUGroup"></asp:Label><br />
                                        &nbsp;
                        <telerik:RadListBox runat="server" ID="SKUGroupList51" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUGroupList51"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="SKUGroupList51_Transferred">
                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedSKUGroupList51" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            Skin="WebBlue" AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                                <iWMS:iForm ID="formCtl51_2" runat="server" />
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_53" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl53" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_57" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl57" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_61" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl61" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_67" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top" style="width: 500px">
                                        <iWMS:iForm ID="formCtl67" runat="server" />
                                    </td>

                                    <td valign="top" rowspan="2">
                                        <iWMS:iForm ID="formCtl67_DefToggle" runat="server" />
                                    </td>

                                    <td valign="top" rowspan="2">
                                        <iWMS:iForm ID="formCtl67_LotToggle" runat="server" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>&nbsp;
                        <asp:Label ID="SKUGroupLbl67" runat="server" Text="SKUGroup"></asp:Label><br />
                                        &nbsp;
                         <telerik:RadListBox runat="server" ID="SKUGroupList67" Height="120px" Width="200px"
                             ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUGroupList67"
                             TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                             Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                             OnTransferred="SKUGroupList67_Transferred">
                         </telerik:RadListBox>

                                        <telerik:RadListBox runat="server" ID="SelectedSKUGroupList67" Height="120px" Width="200px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_71" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl71" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label1" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        &nbsp;<asp:Label ID="Label4" Text="1. This will be provided later" Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_73" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl73" runat="server" />
                                        <iWMS:iForm ID="formCtl73_Lot456" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl73_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl73_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label13" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label14" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label15" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl2" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label17" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_79" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl79" runat="server" />
                                        <iWMS:iForm ID="formCtl79_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl79_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl79_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_83" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl83" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label20" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label22" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label23" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="MaxRecordLbl83" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label25" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_89" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl89" runat="server" />
                                        <iWMS:iForm ID="formCtl89_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl89_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl89_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_97" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl97" runat="server" />
                                        <iWMS:iForm ID="formCtl97_LotTextBox" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl97_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl97_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_101" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl101" runat="server" />
                                        <iWMS:iForm ID="formCtl101_Lot456" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label24" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label26" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view.  " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label27" Text="2. If there are more than [" Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="Label28" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label29" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_103" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl103" runat="server" />
                                        <iWMS:iForm ID="formCtl103_Lot456" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl103_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl103_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label30" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label31" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label32" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="Label33" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label34" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="Panel_107" runat="server" Visible="false">
                            <table border="0" cellspacing="2" cellpadding="2" style="float: left">
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl107" runat="server" />
                                        <iWMS:iForm ID="formCtl107_Lot456" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl107_DefToggle" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl107_LotToggle" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label35" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label36" Text="1. If you are generating for a specific Account, you can set the output column sequence using the grid-memory (M) in the Web Page result view. " Font-Size="15px" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label37" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="Label38" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label39" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>


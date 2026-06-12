<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARAnalysis.aspx.cs" Inherits="iWMS.Web.Accounting.ARAnalysis.ARAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ARAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

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
        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
            <ContentTemplate>
                <table border="0" style="border-spacing: 0px;">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="compile_Click" runat="server" Text="Run" CssClass="white" CausesValidation="false" ToolTip="Run"
                                OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            <br />
                            &nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="compile_Click" />
            </Triggers>
        </asp:UpdatePanel>

        <asp:Panel ID="Format13Panel" runat="server">
            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="trformCtl" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl13" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;
                        <asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label7" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format17Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl17" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label6" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl7" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label14" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>

                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="Format19Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl19" runat="server"></iWMS:iForm>
                            </td>
                        </tr>

                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table style="width: 100%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label1" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label3" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl1" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label8" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Format23Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl23" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label4" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label10" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl2" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label13" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<asp:Label ID="Label18" Text="2. Unless explicitly selected, transactions that are 90-Cancelled are excluded by default" Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<asp:Label ID="Label9" Text="3. AR Opening Balance Transactions that were uploaded will not be included in this report. " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<asp:Label ID="Label32" Text="4. Regardless of the selected date range, the Payment Status filter refers to a record's current Payment Status " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format29Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl29" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label11" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label15" Text="2. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl3" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label17" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="Format31Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl31" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label16" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label19" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl4" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label21" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="Format37Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl37" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label20" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label23" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl5" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label25" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="Format41Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl41" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label24" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label27" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl6" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label29" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format43Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl43" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label22" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label26" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl8" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label30" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format47Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl47" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label28" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label31" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl9" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label33" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format51Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl51" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label35" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label36" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl10" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label38" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format53Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="tr1" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl53" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;
                        <asp:Label ID="Label34" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label37" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl12" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label40" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format59Panel" runat="server" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl59" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label39" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label41" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl13" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label43" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format61Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label42" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label44" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl61" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label46" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format67Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl67" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;<asp:Label ID="Label47" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label48" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="MaxRecordLbl67" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label50" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="Format71Panel" runat="server">
            <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                <ContentTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                        <tr id="tr2" runat="server">
                            <td>
                                <iWMS:iForm ID="formCtl71" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td class="style1">&nbsp;
                        <asp:Label ID="Label45" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                <br />
                                &nbsp;<asp:Label ID="Label49" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                <asp:Label ID="Label51" Font-Size="15px" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label52" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

    </form>
</body>
</html>

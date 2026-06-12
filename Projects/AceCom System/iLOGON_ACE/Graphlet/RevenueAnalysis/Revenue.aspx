<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Revenue.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Revenue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RevenueAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <style>
        #TypeReq {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="180" />
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RunBtn">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="20">
            <div id="LoaderPopup">
                <a id="loader"></a>
                <a id="text">We are processing your request ...</a>
            </div>
        </telerik:RadAjaxLoadingPanel>

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
        <br />
        <br />
        <asp:UpdatePanel ID="UpdButton" runat="server">
            <ContentTemplate>
                <asp:Button ID="compile_Click" CssClass="white" runat="server" OnClick="compile_ClickBtn" Text="Run" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="Panel1" runat="server" Width="500px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 20%">
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl8" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCt79" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCt113" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
            <table id="TbCharge" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                <tr>
                    <td style="width: 10%">ChargeGroup
                        <telerik:RadListBox runat="server" ID="ChargeGroupList" Height="120px" Width="300px" ButtonSettings-AreaWidth="35px"
                            AllowTransfer="true" TransferToID="SelectedChargeGroupList" TransferMode="Move" AllowTransferDuplicates="false"
                            SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                            AutoPostBackOnTransfer="true" OnTransferred="ChargeGroupList_Transferred">
                        </telerik:RadListBox>
                    </td>
                    <td style="width: 25%">
                        <br />
                        <telerik:RadListBox runat="server" ID="SelectedChargeGroupList" Height="120px" Width="300px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false" Style="background-color: Yellow;">
                        </telerik:RadListBox>
                    </td>
                    <td style="width: 25%"></td>
                </tr>
            </table>

            <table id="TbType" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                <tr>
                    <td style="width: 10%">Job Type
                        <telerik:RadListBox runat="server" ID="TypeList" Height="120px" Width="300px" ButtonSettings-AreaWidth="35px"
                            AllowTransfer="true" TransferToID="SelectedTypeList" TransferMode="Move" AllowTransferDuplicates="false"
                            SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                            AutoPostBackOnTransfer="true" OnTransferred="TypeList_Transferred">
                        </telerik:RadListBox>
                    </td>
                    <td style="width: 25%">
                        <br />
                        <telerik:RadListBox runat="server" ID="SelectedTypeList" Height="120px" Width="300px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false" Style="background-color: Yellow;">
                        </telerik:RadListBox>
                    </td>
                    <td style="width: 25%"></td>
                </tr>
            </table>

            <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                <tr>
                    <td width="25%">
                        <asp:Label ID="VehOpsLbl" runat="server">VehOpsUnit</asp:Label><asp:Label ID="ShipmentTypeLbl" runat="server">ShipmentType</asp:Label>
                        <telerik:RadListBox runat="server" ID="EqpTypeList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedEqpTypeList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="EqpTypeList_Transferred">
                        </telerik:RadListBox>
                    </td>
                    <td width="13%" align="center">
                        <br />
                        <br />
                    </td>
                    <td width="25%">
                        <telerik:RadListBox runat="server" ID="SelectedEqpTypeList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false" BackColor="Yellow">
                        </telerik:RadListBox>
                    </td>
                    <td width="25%"></td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20%">&nbsp;<iWMS:iForm ID="formCtl9" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">&nbsp;<iWMS:iForm ID="formCtl10" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">&nbsp;<iWMS:iForm ID="formCtl11" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td id="IDI" runat="server" visible="false" width="200px">&nbsp;Include Driver&#39;s Incentives&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="ChkIncludeDriverInc" runat="server" Checked="true" />
                    </td>
                    <tr>
                        <td style="width: 20%">&nbsp;<iWMS:iForm ID="formCtl7" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <iWMS:iForm ID="formCtl3" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <iWMS:iForm ID="formCtl12" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <iWMS:iForm ID="formCtl5" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <iWMS:iForm ID="formCtl4" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdErrLbl" runat="server">
                                <ContentTemplate>
                                    &nbsp;
                                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </tr>
            </table>
            <table style="width: 100%" visible="false" id="RemarkTable" runat="server">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label1" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label7" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel" Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel37" runat="server" Width="500px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl37" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;<asp:Label ID="RadMonthYearPickerLbl" runat="server">MonthSelection</asp:Label>
                        <br />
                        &nbsp;<telerik:RadMonthYearPicker ID="RadMonthYearPicker" runat="server" AutoPostBack="false" RenderMode="Lightweight"
                            DateInput-Display="true" Skin="WebBlue" Width="31%">
                        </telerik:RadMonthYearPicker>
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl37" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel41" runat="server" Width="500px">
            <br />
            &nbsp;
            <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Run" CssClass="white"
                OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl41" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="AccountLbl" runat="server" Text="Account"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="AccountList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccountList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="SelectedAccountList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedAccountList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl41_Charge" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
            <asp:Label ID="MessageLabel" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="Panel47" runat="server" Width="500px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl47" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl47" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel51" runat="server" Width="500px">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl51" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <asp:Label ID="IvTypeLbl" runat="server" Text="InvoiceType"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="InvoiceTypeList" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedInvoiceTypeList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="InvoiceTypeList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedInvoiceTypeList" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">
                        <iWMS:iForm ID="formCtl51_currency" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel51" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl51" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel53" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl53" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <asp:Label ID="SaleManLabel1" runat="server" Text="Salesman"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SalesmanList_53" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList_53"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SalesmanList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSalesmanList_53" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel53" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl53" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel59" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl59" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <asp:Label ID="SaleManLabel2" runat="server" Text="Salesman"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SalesmanList_59" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList_59"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SalesmanList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSalesmanList_59" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel59" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl59" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel61" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" width="420px">
                                    <tr>
                                        <td valign="top" align="left"></td>
                                        <td>
                                            <asp:Label ID="salesmanLbl" runat="server" Text="Salesman"></asp:Label><br />
                                            <telerik:RadListBox runat="server" ID="SalesmanList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="SalesmanList_Transferred" CausesValidation="false">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedSalesmanList" Height="120px" Width="200px"
                                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                AllowDelete="false">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCt61_Output" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel61" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl61" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

            <table style="width: 200%">
                <tr>

                    <td class="style1">&nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label15" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl12" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label17" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel67" runat="server" Width="500px">

            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl67" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl67A" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;<asp:Label ID="shTypeLbl" runat="server">JobSource</asp:Label><br />
                        &nbsp;<telerik:RadListBox runat="server" ID="JobSourceList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedJobSourceList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="JobSourceList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedJobSourceList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false">
                        </telerik:RadListBox>
                    </td>

                    <td>&nbsp;<asp:Label ID="JobStatusLbl" runat="server">JobStatus</asp:Label><br />
                        &nbsp;<telerik:RadListBox runat="server" ID="JobStatusList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedJobStatusList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="JobSourceList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedJobStatusList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;<asp:Label ID="Label67" runat="server">ShipmentType</asp:Label><br />
                        &nbsp;<telerik:RadListBox runat="server" ID="ShTypeList" Height="120px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShTypeList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="ShTypeList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedShTypeList" Height="120px" Width="200px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl67B" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel67" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl67" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <asp:Panel ID="Panel71" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl71" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <asp:Label ID="SaleManLabel71" runat="server" Text="Salesman"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SalesmanList_71" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList_71"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SalesmanList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSalesmanList_71" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel71" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl71" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel73" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl73" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <asp:Label ID="SaleManLabel73" runat="server" Text="Salesman"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SalesmanList_73" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList_73"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SalesmanList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSalesmanList_73" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel73" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl73" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel83" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl83" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl83" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel89" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl89" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl89" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel97" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl97" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel runat="server" ID="UpdatePanel97">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Label ID="VehOpsUnit_97Lbl" runat="server" Text="VehOpsUnit"></asp:Label><br />
                                            <telerik:RadListBox runat="server" ID="VehOpsUnitList_97" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehOpsUnitList_97"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="VehOpsUnitList_97_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedVehOpsUnitList_97" Height="120px" Width="200px"
                                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                AllowDelete="false">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl97_Date" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl97" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel101" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl101" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <%--<td>
                                    <asp:Label ID="SalesManLabel2" runat="server" Text="Salesman"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SalesmanList_101" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSalesmanList_101"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SalesmanList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSalesmanList_101" Height="120px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>--%>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel101" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl101" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel103" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl103" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel103" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl103" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

            <table style="width: 200%">
                <tr>

                    <td class="style1">&nbsp;<asp:Label ID="Label4" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label6" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="Label8" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label9" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel107" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl107" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel107" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl107" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

            <table style="width: 200%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label3" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label10" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="Label11" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label13" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel109" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl109" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel109" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl109" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

            <table style="width: 200%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label14" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label16" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="Label18" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label19" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label20" Text="2. This format is meant for users of the Daily Transport Planning (DTP) module " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel113" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl113" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel113" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl113" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel127" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl127" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel127" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl127" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel131" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl131" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="selectlabl1" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:CheckBoxList ID="DisplayChkBoxList_131" runat="server" RepeatColumns="2" Width="310px" Style="text-align: right;"
                                        CellSpacing="4" CellPadding="5">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel131" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl131" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel137" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl137" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="Label21" runat="server">Display</asp:Label>&nbsp;:
                                    <asp:CheckBox ID="DisplayAll137" ToolTip="DisplayAll" runat="server" Visible="true" OnCheckedChanged="DisplayAll137_CheckedChanged" Checked="true" AutoPostBack="true" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBoxList ID="DisplayChkBoxList_137" runat="server" RepeatColumns="2" Width="511px" CellSpacing="4" CellPadding="5" TextAlign="Right">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />

                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl137" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <asp:Panel ID="Panel139" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl139" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="Format139Lbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:CheckBoxList ID="DisplayChkBoxList_139" runat="server" RepeatColumns="2" Width="310px" Style="text-align: right;"
                                        CellSpacing="4" CellPadding="5">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel139" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl139" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel149" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl149" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="SelectLbl1" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:CheckBoxList ID="DisplayChkBoxList_149" runat="server" RepeatColumns="2" Width="310px" Style="text-align: right;"
                                        CellSpacing="4" CellPadding="5">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel149" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl149" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel151" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl151" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:CheckBoxList ID="DisplayChkBoxList_151" runat="server" RepeatColumns="2" Width="310px" Style="text-align: right;"
                                        CellSpacing="4" CellPadding="5">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel151" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl151" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel157" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl157" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="top" width="70%">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%" style="text-align: center">
                            <tr>
                                <td>
                                    <asp:Label ID="SelectLbl2" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:CheckBoxList ID="DisplayChkBoxList_157" runat="server" RepeatColumns="2" Width="310px" Style="text-align: right;"
                                        CellSpacing="4" CellPadding="5">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel157" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl157" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel163" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl163" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel163" runat="server">
                            <ContentTemplate>
                                &nbsp;
                                <asp:Label ID="MessageLbl163" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>

            <table style="width: 200%">
                <tr>

                    <td class="style1">&nbsp;<asp:Label ID="Label22" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label23" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="Label24" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label25" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel173" runat="server" Width="500px" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <asp:UpdatePanel runat="server" ID="UpdatePanel173">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td></td>
                                        <td><asp:Label ID="ShipmentType_173Lbl" runat="server">ShipmentType</asp:Label><br />                                           
                                            <telerik:RadListBox runat="server" ID="ShipmentTypeList_173" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList_173"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="ShipmentTypeList_173_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList_173" Height="120px" Width="200px"
                                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                AllowDelete="false">
                                            </telerik:RadListBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl173_Date" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl173" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="MessageLbl173" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 200%">
                <tr>

                    <td class="style1">&nbsp;<asp:Label ID="Label26" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label27" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl173" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label29" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripAnalysisSearch.aspx.cs" Inherits="iWMS.Web.Report.TripAnalysis.TripAnalysisSearch" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Trip Analysis</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
                <asp:UpdatePanel ID="UpdButton" runat="server">
                    <ContentTemplate>
                        <br />
                        &nbsp;  
                    <asp:Button ID="Compilebtn" CssClass="white" runat="server" OnClick="Compilebtn_Click" Text="Run"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false" ToolTip="Run" />
                        &nbsp;&nbsp;  
                        <asp:Button ID="SaveTemplateBtn" runat="server" Text="Save Template" OnClick="SaveTemplateBtn_Click" OnClientClick="disableBtn(this.id,false)"
                            UseSubmitBehavior="false" class="LongLabelWhite" Visible="false" />
                        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                        <table>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel1" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <br />
                                        &nbsp;<asp:Label ID="shTypeLbl" runat="server">ShipmentType</asp:Label><br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="ShipmentTypeList" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="SelectedShipmentTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList" Height="100px" Width="160px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" AutoPostBack="true"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                        <br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="JobTypeList" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedJobTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                            OnTransferred="SelectedJobTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedJobTypeList" Height="100px" Width="160px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                        <br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="TptTypeList" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTptTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                            OnTransferred="SelectedTptTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedTptTypeList" Height="100px" Width="160px"
                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            Skin="WebBlue" AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl6" runat="server"></iWMS:iForm>
                                        <br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="BillSizeTypeList" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedBillSizeTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                            OnTransferred="SelectedBillSizeTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedBillSizeTypeList" Height="100px" Width="160px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                    <td>
                                        <iWMS:iForm ID="formCtl7" runat="server"></iWMS:iForm>
                                        <br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="TripTypeList" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedTripTypeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                            OnTransferred="SelectedTripTypeList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedTripTypeList" Height="100px" Width="160px"
                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            Skin="WebBlue" AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl8" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl9" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel4" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl10" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel11" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl11" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel5" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl12" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel6" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl13" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table id="TbReason" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                                <tr>
                                    <td style="width: 10%">Reason<br />
                                        <telerik:RadListBox runat="server" ID="ReasonList" Height="120px" Width="300px" ButtonSettings-AreaWidth="35px"
                                            AllowTransfer="true" TransferToID="SelectedReasonList" TransferMode="Move" AllowTransferDuplicates="false"
                                            SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                            AutoPostBackOnTransfer="true" OnTransferred="ReasonList_Transferred">
                                        </telerik:RadListBox>
                                    </td>
                                    <td style="width: 25%">
                                        <br />
                                        <telerik:RadListBox runat="server" ID="SelectedReasonList" Height="120px" Width="300px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            AllowDelete="false" Style="background-color: Yellow;">
                                        </telerik:RadListBox>
                                    </td>
                                    <td style="width: 25%"></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel51" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl51" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel53" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl53" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel59" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl59" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel61" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <br />
                                        <iWMS:iForm ID="formCtl61_1" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table id="shTable" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <br />
                                                    &nbsp;
                                        ShipmentType<br />
                                                    &nbsp;
                                        <telerik:RadListBox runat="server" ID="ShipmentTypeList61" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList61"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="ShipmentTypeList61_Transferred">
                                        </telerik:RadListBox>
                                                    <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList61" Height="120px" Width="200px"
                                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                        AllowDelete="false" BackColor="Yellow">
                                                    </telerik:RadListBox>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table id="OpsTable" runat="server" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <br />
                                                    &nbsp;
                                        Opsunitcode<br />
                                                    &nbsp;
                                        <telerik:RadListBox runat="server" ID="OpsunitcodeList" Height="120px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsunitcodeList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="OpsunitcodeList_Transferred">
                                        </telerik:RadListBox>
                                                    <telerik:RadListBox runat="server" ID="SelectedOpsunitcodeList" Height="120px" Width="200px"
                                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                        AllowDelete="false" BackColor="Yellow">
                                                    </telerik:RadListBox>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <br />
                                        <iWMS:iForm ID="formCtl61_2" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel67" runat="server">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="FormCtl67_Acc" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        &nbsp;<asp:Label ID="Label1" runat="server">ShipmentType</asp:Label><br />
                                        &nbsp;<telerik:RadListBox runat="server" ID="ShipmentTypeList_DDS" Height="100px" Width="200px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedShipmentTypeList_DDS"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="SelectedShipmentTypeList_DDS_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedShipmentTypeList_DDS" Height="100px" Width="160px"
                                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" AutoPostBack="true"
                                            AllowDelete="false">
                                        </telerik:RadListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="FormCtl67_Date" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel71" runat="server" Width="500px">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <iWMS:iForm ID="formCtl71" runat="server"></iWMS:iForm>
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
                        <asp:Panel ID="Panel73" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <iWMS:iForm ID="formCtl73Acc" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <iWMS:iForm ID="formCtl73" runat="server"></iWMS:iForm>
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
                        <asp:Panel ID="Panel79" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <iWMS:iForm ID="formCtl79" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel79" runat="server">
                                            <ContentTemplate>
                                                &nbsp;
                                            <asp:Label ID="MessageLbl79" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                                Visible="False"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel83" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl83" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">&nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                        <br />
                                        &nbsp;<asp:Label ID="Label4" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                                        <asp:Label ID="Label8" Text="500" Font-Size="15px" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="Label9" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel89" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <iWMS:iForm ID="formCtl89" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel89" runat="server">
                                            <ContentTemplate>
                                                &nbsp;
                                            <asp:Label ID="MessageLbl89" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                                Visible="False"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel97" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="PersonnelLbl" runat="server" Text="Personnel"></asp:Label>
                                        <br />
                                        <telerik:RadListBox runat="server" ID="PersonnelList" Height="150px" Width="250px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersonnelList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" CausesValidation="false"
                                            OnTransferred="PersonnelList_Transferred">
                                        </telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="SelectedPersonnelList" Height="150px" Width="230px" CausesValidation="false"
                                            ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                            Skin="WebBlue" AllowDelete="false">
                                        </telerik:RadListBox>
                                        <br />
                                        <iWMS:iForm ID="formCtl97" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--<asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="TemplateRadPageView" Height="600px">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>


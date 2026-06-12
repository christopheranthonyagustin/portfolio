<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSOperationsDetlForm.aspx.cs" Inherits="iWMS.Web.Job.TMSOperations.TMSOperationsDetlForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit @ TMS OperationsDetl</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/row.js"></script>    
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
      
    <base target="_self">
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="JobOrderItemTab" Text="JobOrderItem" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="JobOrderItemAttcTab" Text="JobOrderItemAttc" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="JobOrderItemDOTab" Text="DO" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" /><br />
                        </td>
                    </tr>
                </table>
                <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2"
                    width="100%">
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <table>
                                        <tr>

                                            <asp:Button ID="AddBtn" CssClass="LongLabelWhite" runat="server" OnClick="AddBtn_Click" Text="Add" CausesValidation="false"
                                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                        </tr>
                                        <tr>
                                            <td style="width: 450px; vertical-align: text-top">
                                                <asp:Label ID="PersonnelLbl" runat="server" Text="Personnel" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                <br />
                                                <iWMS:iForm ID="formCtl_Personnel" runat="server"></iWMS:iForm>
                                                <table>
                                                    <tr style="width: 500px;">
                                                        <td style="width: 150px; text-align: center;">
                                                            <asp:Label ID="PersonnelAvailableLbl" runat="server" Text="Available" Font-Bold="true"></asp:Label></td>
                                                        <td style="width: 290px; text-align: center;">
                                                            <asp:Label ID="PersonnelSelectedLbl" runat="server" Text="Selected" Font-Bold="true"></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <telerik:RadListBox runat="server" ID="PersonnelList" Height="250px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPersonnelList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" CausesValidation="false"
                                                    OnTransferred="PersonnelList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedPersonnelList" Height="250px" Width="160px" CausesValidation="false"
                                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    Skin="WebBlue" AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                            <td style="width: 450px; vertical-align: text-top">
                                                <asp:Label ID="VehicleLbl" runat="server" Text="Vehicle" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                <br />
                                                <br />
                                                <iWMS:iForm ID="FormCtl_Vehicle" runat="server"></iWMS:iForm>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <table>
                                                    <tr style="width: 500px;">
                                                        <td style="width: 150px; text-align: center;">
                                                            <asp:Label ID="AvaiVehicleLbl" runat="server" Text="Available" Font-Bold="true"></asp:Label></td>
                                                        <td style="width: 290px; text-align: center;">
                                                            <asp:Label ID="SelectedVehicleLbl" runat="server" Text="Selected" Font-Bold="true"></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <telerik:RadListBox runat="server" ID="VehicleList" Height="250px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehicleList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" CausesValidation="false"
                                                    OnTransferred="VehicleList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedVehicleList" Height="250px" Width="160px" CausesValidation="false"
                                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    Skin="WebBlue" AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                            <td style="width: 450px; vertical-align: text-top">
                                                <asp:Label ID="EquipmentLbl" runat="server" Text="Equipment" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                <br />
                                                <br />
                                                <iWMS:iForm ID="FormCtl_Equipment" runat="server"></iWMS:iForm>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <table>
                                                    <tr style="width: 500px;">
                                                        <td style="width: 150px; text-align: center;">
                                                            <asp:Label ID="AvaiEquipLbl" runat="server" Text="Available" Font-Bold="true"></asp:Label></td>
                                                        <td style="width: 290px; text-align: center;">
                                                            <asp:Label ID="SelectedEquipLbl" runat="server" Text="Selected" Font-Bold="true"></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <telerik:RadListBox runat="server" ID="EquipmentList" Height="250px" Width="180px"
                                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedEquipmentList"
                                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" CausesValidation="false"
                                                    OnTransferred="EquipmentList_Transferred">
                                                </telerik:RadListBox>
                                                <telerik:RadListBox runat="server" ID="SelectedEquipmentList" Height="250px" Width="160px" CausesValidation="false"
                                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                    Skin="WebBlue" AllowDelete="false">
                                                </telerik:RadListBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TMSOperationJobOrderItemRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TMSOperationJobOrderItemAttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TMSOperationAttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TMSOperationDORadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

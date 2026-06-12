<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Graphlet.VehicleAnalysis.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>VehicleAnalysis</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <%--<link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />--%>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="1"
            MinDisplayTime="500" Transparency="40" BackColor="#f5f5f0">
            <div style="vertical-align: middle;">
                <asp:Image ID="Image1" runat="server" ImageUrl="../../Image/loading-image.gif" Width="50"
                    Height="50" AlternateText="loading" CssClass="MyLoadingImage"></asp:Image>
            </div>
        </telerik:RadAjaxLoadingPanel>--%>

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

        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="CompileBtn" runat="server" Text="Run" ToolTip="Run" OnClick="CompileBtn_Click"
                        CssClass="white" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
        </table>
        <asp:Panel ID="PanelListBox" runat="server" Width="1000px" Visible="false">
            <table>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="OpsUnitCodeLbl" runat="server" Text="OpsUnitCode"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="OpsUnitCodeGrpList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsUnitCodeGroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedOpsUnitCodeGroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedOpsUnitCodeGroupList" Height="150px" Width="200px"
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
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="docketGrpLbl" runat="server" Text="DocketType"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="DocketGroupList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDocketGroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedDocketGroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedDocketGroupList" Height="150px" Width="200px"
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
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <br />
                                    <asp:Label ID="VehicleStatusGrpLbl" runat="server" Text="VehicleStatus"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="VehStatusGroupList" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehStatusGroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" CausesValidation="false"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedVehStatusGroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedVehStatusGroupList" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        Skin="Sunset" AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl_month" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelListBox2" runat="server" Width="1000px" Visible="false">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="CompileBtn19" runat="server" Text="Run" ToolTip="Run" OnClick="CompileBtn19_Click"
                            CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="RegisteredEntityFormat19Lbl" runat="server" Text="Register Entity"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="RegisteredEntityFormat19GrpList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedRegisteredEntityFormat19GroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedRegisteredEntityFormat19GroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedRegisteredEntityFormat19GroupList" Height="150px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>

                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="OpsUnitCodeFormat19Lbl" runat="server" Text="OpsUnitCode"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="OpsUnitCodeFormat19GrpList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsUnitCodeFormat19GroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedOpsUnitCodeFormat19GroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedOpsUnitCodeFormat19GroupList" Height="150px" Width="200px"
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
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="VehicleTypeFormat19Lbl" runat="server" Text="Vehicle Type"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="VehicleTypeFormat19GrpList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehicleTypeFormat19GroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedVehicleTypeFormat19GroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedVehicleTypeFormat19GroupList" Height="150px" Width="200px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelListVeh_29" runat="server" Width="1000px" Visible="false">
            <table>
                <tr>
                    <td>
                        <iWMS:iForm ID="FormCtl29" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="OpsUnitCodeFormat29Lbl" runat="server" Text="OpsUnitCode"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="OpsUnitCodeFormat29GrpList" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsUnitCodeFormat29GroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedOpsUnitCodeFormat29GroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedOpsUnitCodeFormat29GroupList" Height="150px" Width="200px"
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
                        <table border="0" cellpadding="0" cellspacing="0" width="420px">
                            <tr>
                                <td width="1%"></td>
                                <td>

                                    <asp:Label ID="VehTypeLbl" runat="server" Text="VehType"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="VehTypeRadListBox" Height="150px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehTypeGroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="VehTypeRadListBox_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedVehTypeGroupList" Height="150px" Width="200px"
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
                        <iWMS:iForm ID="FormCtlAcid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        &nbsp;&nbsp;<asp:Label ID="MessageLbl29" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

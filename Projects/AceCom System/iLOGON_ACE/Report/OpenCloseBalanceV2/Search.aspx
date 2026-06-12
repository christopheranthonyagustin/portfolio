<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.OpenCloseBalanceV2.Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%--<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>--%>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>OpenCloseBalanceV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 28px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                display: none;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #A8A8A8;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 22px;
                width: 28px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #393;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }

        .auto-style1 {
            width: 97px;
        }

        .auto-style2 {
            width: 500px;
        }
    </style>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
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
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                                 <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)"
                                     UseSubmitBehavior="false" class="white" />
                    &nbsp;
                       <br />
                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
        <%--<iwms:msgpopup id="MsgPopup" runat="server"></iwms:msgpopup>--%>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="Ok" OnClientClick="disableBtn(this.id)"
                                        UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />&nbsp;
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <table border="0" cellspacing="2" cellpadding="2" style="float: left">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtlFormat" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl61" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtlForGrid_OCB_41" runat="server" Visible="false"></iWMS:iForm>
                    <iWMS:iForm ID="formCtlForGrid_OCB_67" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <table style="float: left">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl5" runat="server" Visible="false"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl6" runat="server" Visible="false"></iWMS:iForm>
                    <iWMS:iForm ID="formCtlForGrid_OCB_41_Lot" runat="server" Visible="false"></iWMS:iForm>
                    <iWMS:iForm ID="formCtlForGrid_OCB_53_Lot" runat="server" Visible="false"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <asp:Panel ID="ListBox_Pnl" runat="server" Visible="false" Width="1200px">
            <table>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="340px">
                            <tr>
                                <td width="1%"></td>
                                <td>
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Text="SKU Group"></asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="SKUGroupList" Height="120px" Width="180px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUGroupList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="SelectedSKUGroupList_Transferred">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedSKUGroupList" Height="120px" Width="150px"
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
        <asp:Panel ID="Panel_67" runat="server" Visible="false">
            <table style="width: 100%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label14" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label15" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label17" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div style="float: left">
            <asp:Panel ID="pnlReleasenotes" Visible="false" runat="server">
                <table>
                    <tr>
                        <td class="style1">
                            <br />
                            &nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label3" Text="1. In the results, if SourceNo column is blank, it means that the record did not originate from a GR or GI. <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This record is most likely spawned as a result of a Move (e.g.) re-palletization or split TU. " Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label4" Text="2. In the results, if InTUNO1 column is 1, it means that the record was received/created within the selected date range. " Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

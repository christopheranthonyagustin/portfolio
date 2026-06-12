<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="ReceiptHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search Result @ Goods Receive</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
    <script language="javascript" type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }

    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>

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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }

        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab Id="ItemLineTab" Text="Item Line" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
            <Tabs>
                <telerik:RadTab Id="ConfirmationNotSentTab" Text="Confirmation Not Sent" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div style="height: 92%" id="div-datagrid">
                    <table cellspacing="2">
                        <tr>
                            <td>
                                <asp:Button ID="PopToTRP" runat="server" Text="Delivery" OnClick="PopToTPR_Click"
                                    OnClientClick="disableBtn(this.id,false)" Visible="false"
                                    UseSubmitBehavior="false" CssClass="white" ToolTip="Populate to Transport" />
                            </td>
                            <td>
                                <asp:Button ID="FinalizeBtn" class="white" runat="server" OnClick="FinalizeBtn_Click" Visible="false"
                                    Text="Finalize" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="CopyBtn" runat="server" Text="Copy" OnClick="CopyBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)"
                                    UseSubmitBehavior="false" CssClass="white" />
                            </td>
                            <td>
                                <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="ReceiptCancelBtn_Click" Text="Cancel"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="TuNo1Btn" class="LongLabelBlue" runat="server" OnClick="TuNo1Btn_Click" Visible="true"
                                    Text="TUNO1 Label" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="GenLabelBtn" CssClass="blue" runat="server" OnClick="GenLabelBtn_Click" Text="TUNO2"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="TallyHo" CssClass="LongLabelBlue" runat="server" OnClick="TallyBtn_Click" Text="Tally Sheet"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="GRNBtn" CssClass="blue" runat="server" OnClick="GRNBtn_Click" Text="GRN"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="ChargeSheetBtn" CssClass="LongLabelBlue" runat="server" OnClick="ChargeSheetBtn_Click" Text="Charge Sheet"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="BtnRecAdv" CssClass="LongLabelGreen" runat="server" OnClick="BtnRecAdv_Click" Text="Receipt Advice"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="ReleaseToOpsbtn" CssClass="LongLabelWhite" runat="server" OnClick="ReleaseToOps_Click"
                                    Text="Release To Ops" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="EndOpsStatusbtn" CssClass="LongLabelWhite" runat="server" OnClick="EndOpsStatus_Click"
                                    Text="End Ops Status" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="BookPackingBtn" CssClass="LongLabelWhite" runat="server" OnClick="BookPackingBtn_Click"
                                    Text="Book Packing" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Visible="true"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td align="right">&nbsp;&nbsp;
                                <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            </td>
                            <td align="right">
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            </td>
                            <td>
                                <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                            </td>
                        </tr>
                    </table>

                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>&nbsp;<telerik:RadMenu ID="RadMenu_MoreFunctions" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                                OnItemClick="RadMenu_MoreFunctions_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="More<br/>Functions" PostBack="false" Value="MoreFunctions">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" Value="BackOrder" Text="Back Order" />
                                            <telerik:RadMenuItem runat="server" Value="Close" Text="Close GR" />
                                            <telerik:RadMenuItem runat="server" Value="DeleteAllSku" Text="Delete all SKU" />
                                            <telerik:RadMenuItem runat="server" Value="NonBill" Text="Non Billable" />
                                            <telerik:RadMenuItem runat="server" Value="ReceivebyPO" Text="Receive by PO" />
                                            <telerik:RadMenuItem runat="server" Value="ReopenChargeSheet" Text="Reopen Charge Sheet" />
                                            <telerik:RadMenuItem runat="server" Value="ReOpenGR" Text="Reinstate Cancellation" />
                                            <telerik:RadMenuItem runat="server" Value="PostAccounting" Text="Post Accounting" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            </td>
                            <td>
                                <telerik:RadMenu ID="RadMenu_MorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" Skin="Default"
                                    OnItemClick="RadMenu_MorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" CssClass="RadMenu_CUSTOM_Blue">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" Text="More<br/>Printouts" PostBack="false" Value="MorePrintouts">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" Value="CtnrCheckList" Text="Container CheckList" />
                                                <telerik:RadMenuItem runat="server" Value="MSDS" Text="MSDS" />
                                                <telerik:RadMenuItem runat="server" Value="ConsolidateGRN" Text="Consolidate GRN" />
                                            </Items>
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenu>
                            </td>
                            <td>
                                <asp:Button ID="DownloadAllAttachBtn" runat="server" Text="Download All Attachment" OnClick="DownloadAllAttachBtn_ServerClick"
                                    UseSubmitBehavior="false" CssClass="LongLabelWhite" ToolTip="Download All Attachment" />
                            </td>
                            <td>
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="ConfirmRecAdvBtn" Text="" Style="display: none;" OnClick="ConfirmRecAdvBtn_Click" runat="server" />
                                <asp:Button ID="ConfirmRecAdvSAPWMMBxyPPGBtn" Text="" Style="display: none;" OnClick="ConfirmRecAdvSAPWMMBxyPPGBtn_Click" runat="server" />
                            </td>
                            <td>
                                <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                        <GroupingSettings CaseSensitive="false" />
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="250px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ReceiveEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Receive"
                                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="RcFinalizeLbl" runat="server" />
                                        <asp:Label ID="RcCfmLbl" runat="server" />
                                        <asp:Label ID="NonBillCfmLbl" runat="server" />
                                        <asp:Label ID="WrcPopCfmLbl" runat="server" />
                                        <asp:Label ID="RcImageFound" runat="server" />
                                        <asp:Label ID="PostAccountingDoneLbl" runat="server" />
                                        <asp:Label ID="GRConfirmDoneLbl" runat="server" />
                                        <asp:Label ID="GRConfirmErrorLbl" runat="server" />
                                        <asp:Label ID="GRConfirmSentLbl" runat="server" />
                                        <asp:Label ID="GRConfirmPartialLbl" runat="server" />

                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn Display="false" DataField="acid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="isid">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account Name"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                                    AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="InvoiceDate" UniqueName="InvoiceDate" SortExpression="InvoiceDate" HeaderText="InvoiceDate"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm}" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="grconfirmstatus" DataField="grconfirmstatus" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="Expected" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Display="false" DataField="type">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="TeamDescr" HeaderText="TeamDescr" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReceivingStatusDescr" SortExpression="ReceivingStatusDescr" HeaderText="ReceivingStatus" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ZoneCode" SortExpression="ZoneCode" HeaderText="ZoneCode" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ReceiverStatusDescr" SortExpression="ReceiverStatusDescr" HeaderText="ReceiverStatus" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="SupplierInvNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exref3" SortExpression="exref3" HeaderText="Exref3" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="grp" SortExpression="grp" HeaderText="Group" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="Ctnrno" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Supplier" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="SupplierName" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="suaddr1" SortExpression="suaddr1" HeaderText="Addr1" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" AutoPostBackOnFilter="true"
                                    HeaderText="Priority">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="SuppInvDate" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustomerRefDate" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PKONO" SortExpression="exref2" HeaderText="PackingOrderNo" UniqueName="PackingOrderNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="VslVoy" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eta" SortExpression="eta" HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gateindate" SortExpression="gateindate" HeaderText="GateIn" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="gateoutdate" SortExpression="gateoutdate" HeaderText="GateOut" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pano" SortExpression="pano" HeaderText="PANo" Display="false" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pastatusdescr" SortExpression="pastatusdescr" AutoPostBackOnFilter="true"
                                    HeaderText="PAStatus" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="MoreCtnrNo" SortExpression="MoreCtnrNo" HeaderText="MoreCtnrNo" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem6 " SortExpression="rem6 " HeaderText="ReceiverAdhocCharges" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="isnonbillable" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitecode" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="RCImageFound" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NonBillCfmLbl" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="PostAccountingDone" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GRConfirmDone" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GRConfirmError" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GRConfirmSent" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GRConfirmPartial" Display="false">
                                </telerik:GridBoundColumn>

                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ItemLineRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="ConfirmationNotSentRadPageView" />
        </telerik:RadMultiPage>

        <%--Message popup 2 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmYesBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" CssClass="white" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" CssClass="white" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 2 area end--%>
        <%--Message popup 3 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton3" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup3" runat="server" PopupControlID="ConfrimMessagePanel3"
            TargetControlID="PopupTargetButton3" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel3" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmYesBtn3">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg3" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn3" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div2" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb3" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge3" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType3" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel3" CssClass="white" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn3_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn3" CssClass="white" runat="server" Text="  OK  " OnClick="ConfirmYesBtn3_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 3 area end--%>
        <%--Message popup 5 area start For Partial Receipt Message Box--%>
        <asp:Button runat="server" ID="PopupPartialReceiptButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="PartialReceiptPopup" runat="server" PopupControlID="PartialReceiptMessagePanel"
            TargetControlID="PopupPartialReceiptButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="PartialReceiptMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="PartialReceiptYesBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="PartialReceiptLbl" Text="PartialReceipt" runat="server" Style="size: 15px"></asp:Label>
            </div>
            <div id="Div4" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="PartialReceiptTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="PartialReceiptLiteral" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="PartialReceiptCancelConfrimMsg" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="PartialReceiptNoBtn" runat="server" CssClass="white" Text="Cancel" OnClick="PartialReceiptNoBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="PartialReceiptYesBtn" runat="server" CssClass="white" Text="  OK  " OnClick="PartialReceiptYesBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 5 area end--%>

        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmAllBtn" Text="" Style="display: none;" OnClick="OkayImg_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmAllBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmAllBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

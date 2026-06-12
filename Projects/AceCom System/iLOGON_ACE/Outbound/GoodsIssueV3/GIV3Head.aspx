<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3Head.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3Head" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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

        .popupHeaderR {
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            background: #859DD4;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-top: 2px solid GREY;
            border-right: 2px solid GREY;
            border-left: 2px solid GREY;
        }

            .popupHeaderR span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
                margin-top: 5px;
            }

            .popupHeaderR a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        html .RadMenu .rmGroup .rmItem a.rmLink {
            background-color: #99c2ff !important;
            text-decoration: none;
        }

            html .RadMenu .rmGroup .rmItem a.rmLink:hover {
                background-color: #ebebe0 !important;
                font-weight: bold;
            }

        .rmItem:hover {
            background-color: white !important;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePageMethods="true" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
        <table cellspacing="2" cellspacing="2">
            <tr>
                <td>
                    <asp:Button ID="PrintPTBtn" runat="server" Text="Pick Ticket" OnClick="PrintPTBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Pick Ticket" />
                </td>
                <td>
                    <asp:Button ID="PrintDOBtn" runat="server" Text="DO" OnClick="PrintDOBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print DO" />
                </td>
                <td>
                    <asp:Button ID="CloseBtn" runat="server" Text="Close" OnClick="CloseBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                </td>
                <td>
                    <asp:Button ID="PopToTRP" runat="server" Text="&nbsp;&nbsp;&nbsp;Book Transport" OnClick="PopToTPR_Click"
                        OnClientClick="disableBtn(this.id)"
                        UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Populate to Transport" />
                </td>
                <td>
                    <asp:Button ID="CancelTransportBtn" runat="server" Text="Cancel Transport" OnClick="CancelTransportBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                </td>
                <td>
                    <asp:Button ID="AllocatedImgBtn" runat="server" Text="Allocate" OnClick="AllocatedImgBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="white" ToolTip="Allocate Selected Issue(s)" />
                </td>
                <td>
                    <asp:Button ID="UnAllocatedBtn" runat="server" Text="Unallocate" OnClick="UnAllocatedBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="white" ToolTip="Unallocate Selected Issue(s)" />
                </td>
                <td>
                    <asp:Button ID="PickedBtn" CssClass="white" runat="server" OnClick="PickedBtn_Click" Text="Picked"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="BatchingBtn" CssClass="white" runat="server" OnClick="BatchingBtn_Click" Text="Consolidate"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ReleaseToOpsBtn" runat="server" Text="Release to &nbsp;&nbsp;&nbsp;Ops&nbsp;&nbsp;&nbsp;" OnClick="ReleaseToOpsBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                </td>
                <td>
                    <asp:Button ID="ShipBtn" CssClass="white" runat="server" OnClick="ShipBtn_Click" Text="Ship"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="PopDecBtn" runat="server" Text="Customs Declaration" OnClick="PopDecBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="LongLabelWhite" ToolTip="Populate Selected Issue(s) to Declaration Register" />
                </td>
                <td>
                    <asp:Button ID="PrintOrderBtn" runat="server" Text="Order" OnClick="PrintOrderBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Order" />
                </td>

                <td>
                    <asp:Button ID="ChargeSheetBtn" runat="server" Text="Charge Sheet" OnClick="ChargeSheetBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="LongLabelBlue" ToolTip="Charge Sheet" />
                </td>

                <td>
                    <asp:Button ID="PickingInstructionBtn" runat="server" Text="Picking Instruction " OnClick="PickingInstructionBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="LongLabelGreen" />
                </td>
                <td>
                    <asp:Button ID="ShipEDIBtn" runat="server" Text="Ship EDI" OnClick="ShipEDIBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id,false)" CausesValidation="False"
                        UseSubmitBehavior="false" CssClass="green" ToolTip="Ship Confirmation" />
                </td>


                <td>
                    <asp:Button ID="MassUpdateBtn" runat="server" Text="Mass Update" OnClick="MassUpdateBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                </td>
                <td align="right">
                    <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <telerik:RadMenu ID="RadMenu_MoreFunctions" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" BorderWidth="1" ExpandAnimation-Type="None" BackColor="#f5f5f0"
                        OnItemClick="RadMenu_MoreFunctions_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="More<br/>Functions" PostBack="false" Value="MoreFunctions" Font-Bold="true" ForeColor="black">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Return" Text="Goods Return" ForeColor="Black"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="NonBill" Text="Non Billable" ForeColor="Black"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Split" Text="Split" ForeColor="Black"
                                        Visible="true" BackColor="White" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <telerik:RadMenu ID="RadMenu_MorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" BorderWidth="1" BackColor="#f5f5f0" Visible="false"
                        OnItemClick="RadMenu_MorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="More<br/>Printouts" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ContainerPickingDetails" Text="Container Picking Details" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DispenserInstruction" Text="Dispenser Instruction" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="MSDS" Text="MSDS" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SalesInvoice" Text="Sales Invoice" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="TruckingOrder" Text="Trucking Order" ForeColor="Black" Enabled="false"
                                        Visible="true" BackColor="White" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmUnallocateBtn" Text="" Style="display: none;" OnClick="ConfirmUnallocateBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmGoodsReturnBtn" Text="" Style="display: none;" OnClick="ConfirmGoodsReturnBtn_Click" runat="server" />
                </td>
                <td>
                    <asp:Button ID="ConfirmShipEDIBtn" Text="" Style="display: none;" OnClick="ConfirmShipEDIBtn_Click" runat="server" />
                </td>
                <td>
                    <asp:Button runat="server" ID="btnDeclareOkay" Style="display: none;" OnClick="btnDeclareOkay_Click" />
                </td>
                <td>
                    <asp:Button runat="server" ID="ConfirmCancelTransportBtn" Style="display: none;" OnClick="ConfirmCancelTransportBtn_Click" />
                </td>
            </tr>
        </table>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                <GroupingSettings CaseSensitive="false" />
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
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
                                <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueCopy" ImageUrl="../../image/copy.png"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy Goods Issue"
                                    OnClick="GoodsIssueCopy_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="False" ID="GoodIssueCancel" ImageUrl="../../image/bin.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Goods Issue"
                                    OnClick="ldCancel_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="isSHCfmLbl" runat="server" />
                                <asp:Label ID="BookTransportDoneLbl" runat="server" />
                                <asp:Label ID="ExpiredLbl" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="accode" HeaderText="Acc" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sitedescr" HeaderText="Site" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" HeaderText="IssueNo" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DeliveryCode" HeaderText="DeliveryCode" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustReference">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jobno" SortExpression="JobNo" HeaderText="JobNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="podstatus" SortExpression="podstatus" HeaderText="POD status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit#">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr"
                            HeaderText="Priority">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="Shipped"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OP#">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="WholeQty" SortExpression="WholeQty" HeaderText="WholeQty"
                            DataFormatString="{0:#.####}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LooseQty" SortExpression="LooseQty" HeaderText="LooseQty"
                            DataFormatString="{0:#.####}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OrdVol" SortExpression="OrdVol" HeaderText="OrdVol">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OrdWt" SortExpression="OrdWt" HeaderText="OrdWt">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PackVol" SortExpression="PackVol" HeaderText="PackVol">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PackWt" SortExpression="PackWt" HeaderText="PackWt">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofplt" SortExpression="noofplt" HeaderText="NoOfPallet"
                            DataFormatString="{0:0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="NoOfPackage"
                            DataFormatString="{0:0.00}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PoNo">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip">
                        </telerik:GridBoundColumn>


                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="TeamDescr" HeaderText="TeamDescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ZoneCode" SortExpression="ZoneCode" HeaderText="ZoneCode" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PickerStatus" SortExpression="PickerStatus" HeaderText="PickerStatus" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PackerStatus" SortExpression="PackerStatus" HeaderText="PackerStatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ReleaserStatus" SortExpression="ReleaserStatus" HeaderText="ReleaserStatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="false" DataField="acid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="false" DataField="sitecode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="false" DataField="rcid">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="type" SortExpression="type" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BookTransportDone" SortExpression="BookTransportDone" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BookTransportStatus" SortExpression="BookTransportStatus" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
    <%-- javascript function --%>
    <script type="text/javascript">
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
        function OnClientItemBlurMenu(sender, args) {
            sender.close(true);
        }
        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
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
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmUnallocatCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmUnallocateBtn.UniqueID %>", "");
                }
            }

            function ConfirmGoodsReturnCallbackFn(arg) {
                if (arg) {
                    __doPostBack("<%=ConfirmGoodsReturnBtn.UniqueID %>", "");
                }
            }

            function ConfirmShipEDICallbackFn(arg) {
                if (arg) {
                    __doPostBack("<%=ConfirmShipEDIBtn.UniqueID %>", "");
            }
        }

        function ConfirmCancelTransportCallbackFn(arg) {
            if (arg) {
                __doPostBack("<%=ConfirmCancelTransportBtn.UniqueID %>", "");
            }
        }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

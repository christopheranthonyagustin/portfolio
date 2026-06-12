<%@ Page Language="c#" CodeBehind="IssueHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.IssueHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function OnClientClose_Edit(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }

            let TotalCount = 0;
            function RecordLevelCheckboxCheckedChanged(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    TotalCount = TotalCount + 1;
                }
                else {
                    TotalCount = TotalCount - 1;
                }

                document.getElementById("<%= SelectedTotalLbl.ClientID %>").innerText = "Total Selected:" + TotalCount;
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }

        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ItemLineTab" Text="Item Line" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ConfirmationNotSentTab" Text="Confirmation Not Sent" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
                <table cellspacing="2" cellspacing="2">
                    <tr>
                        <td>
                            <asp:Button ID="AllocatedImgBtn" runat="server" Text="Allocate" OnClick="AllocatedImgBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" ToolTip="Allocate Selected Issue(s)" />
                        </td>
                        <td>
                            <asp:Button ID="PopDecBtn" runat="server" Text="Customs Declaration" OnClick="PopDecBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="LonglabelBlue" ToolTip="Populate Selected Issue(s) to Declaration Register" />
                        </td>
                        <td>
                            <asp:Button ID="PrintOrderBtn" runat="server" Text="Order" OnClick="PrintOrderBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Order" />
                        </td>
                        <td>
                            <asp:Button ID="PrintPTBtn" runat="server" Text="Pick Ticket" OnClick="PrintPTBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Pick Ticket" />
                        </td>
                        <td>
                            <asp:Button ID="PickedBtn" CssClass="white" runat="server" OnClick="PickedBtn_Click" Text="Picked"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="PrintDOBtn" runat="server" Text="DO" OnClick="PrintDOBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="blue" ToolTip="Print DO" />
                        </td>
                        <td>
                            <asp:Button ID="ShipBtn" CssClass="white" runat="server" OnClick="ShipBtn_Click" Text="Ship"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ChargeSheetBtn" runat="server" Text="Charge Sheet" OnClick="ChargeSheetBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="LongLabelBlue" ToolTip="Charge Sheet" />
                        </td>
                        <td>
                            <asp:Button ID="UnAllocatedBtn" runat="server" Text="Unallocate" OnClick="UnAllocatedBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" ToolTip="Unallocate Selected Issue(s)" />
                        </td>
                        <td>
                            <asp:Button ID="BatchingBtn" CssClass="white" runat="server" OnClick="BatchingBtn_Click" Text="Batching"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CloseBtn" runat="server" Text="Close" OnClick="CloseBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                        <td>
                            <asp:Button ID="SpeedupBtn" runat="server" Text="Mass Update" OnClick="SpeedupBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                        <td>
                            <asp:Button ID="ReleaseToOpsBtn" runat="server" Text="Release to Ops" OnClick="ReleaseToOpsBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                        <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="PickingInstructionBtn" runat="server" Text="Picking Instruction " OnClick="PickingInstructionBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="LongLabelGreen" />
                        </td>
                        <td>
                            <asp:Button ID="ShipEDIBtn" runat="server" Text="Ship EDI" OnClick="ShipEDIBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" CausesValidation="False"
                                UseSubmitBehavior="false" CssClass="green" ToolTip="Ship Confirmation" />
                        </td>
                        <td>
                            <asp:Button ID="PopToTRP" runat="server" Text="Book Transport" OnClick="PopToTPR_Click"
                                OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Populate to Transport" />
                        </td>
                        <td>
                            <asp:Button ID="BookPacking" runat="server" Text="Book Packing" OnClick="BookPacking_Click"
                                OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Book Packing" />
                        </td>
                        <td>
                            <asp:Button ID="BookFreightBtn" runat="server" Text="Book Freight" OnClick="BookFreightBtn_Click"
                                OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Book Packing" />
                        </td>
                        <td>
                            <asp:Button ID="ReleaseOrderBtn" runat="server" Text="Release Order" OnClick="ReleaseOrderBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelBlue" />
                        </td>
                        <td>
                            <asp:Button ID="GoodsReturnBtn" runat="server" Text="Goods Return" OnClick="GoodsReturnBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                        <td>
                            <asp:Button ID="ConsolidateBtn" runat="server" Text="Consolidate Pick Ticket" OnClick="ConsolidateBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelBlue" />
                        </td>
                        <td>
                            <asp:Button ID="ReleaseKittingBtn" runat="server" Text="Release Kitting" OnClick="ReleaseKittingBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                        <td>
                            <telerik:RadMenu ID="RadMenu_MoreFunctions" runat="server" ShowToggleHandle="false" ClickToOpen="true"
                                EnableEmbeddedSkins="false" ExpandAnimation-Type="None" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue"
                                OnItemClick="RadMenu_MoreFunctions_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="More<br/>Functions" PostBack="false" Value="MoreFunctions">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" Value="ApproveAllocate" Text="Approve Allocate" />
                                            <telerik:RadMenuItem runat="server" Value="BackOrder" Text="Back Order" />
                                            <telerik:RadMenuItem runat="server" Value="Controlledlocallocation" Text="Controlled Loc Allocation" />
                                            <telerik:RadMenuItem runat="server" Value="NonBill" Text="Non Billable" />
                                            <telerik:RadMenuItem runat="server" Value="OrderStatusEDI" Text="Order Status EDI" />
                                            <telerik:RadMenuItem runat="server" Value="PostAccounting" Text="Post Accounting" />
                                            <telerik:RadMenuItem runat="server" Value="PollAWBEDI" Text="Poll AWB EDI" />
                                            <telerik:RadMenuItem runat="server" Value="ReopenChargeSheet" Text="Reopen Charge Sheet" />
                                            <telerik:RadMenuItem runat="server" Value="Return" Text="Goods Return" />
                                            <telerik:RadMenuItem runat="server" Value="Split" Text="Split" />
                                            <telerik:RadMenuItem runat="server" Value="UnApproveAllocate" Text="UnApprove Allocate" />
                                            <telerik:RadMenuItem runat="server" Value="ConsolidatedStuffingList" Text="Consolidated Stuffing List" />

                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </td>
                        <td>
                            <telerik:RadMenu ID="RadMenu_MorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true"
                                EnableEmbeddedSkins="false" ExpandAnimation-Type="None" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue"
                                OnItemClick="RadMenu_MorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="More<br/>Printouts" PostBack="false" Value="MorePrintouts">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" Value="CartonLabel" Text="Carton Label" />
                                            <telerik:RadMenuItem runat="server" Value="ContainerPickingDetails" Text="Container Picking Details" />
                                            <telerik:RadMenuItem runat="server" Value="DispenserInstruction" Text="Dispenser Instruction" />
                                            <telerik:RadMenuItem runat="server" Value="DO" Text="DO(Draft)" />
                                            <telerik:RadMenuItem runat="server" Value="GatePass" Text="Gate Pass" />
                                            <telerik:RadMenuItem runat="server" Value="MSDS" Text="MSDS" />
                                            <telerik:RadMenuItem runat="server" Value="PLExcel" Text="Packing List(Excel)" />
                                            <telerik:RadMenuItem runat="server" Value="RN" Text="Release Note" />
                                            <telerik:RadMenuItem runat="server" Value="SalesInvoice" Text="Sales Invoice" />
                                            <telerik:RadMenuItem runat="server" Value="TruckingOrder" Text="Trucking Order" />
                                            <telerik:RadMenuItem runat="server" Value="CtnrCheckList" Text="Container CheckList" />
                                            <telerik:RadMenuItem runat="server" Value="ContainerManifest" Text="Container/Truck Manifest" />
                                            <telerik:RadMenuItem runat="server" Value="DN" Text="Delivery Note" />
                                            <telerik:RadMenuItem runat="server" Value="TL" Text="TUNO1 Label" />
                                            <telerik:RadMenuItem runat="server" Value="OTS" Text="Outbound Tally Sheet" />
                                            <telerik:RadMenuItem runat="server" Value="DISExcel" Text="Delivery Items Summary( excel )" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </td>
                        <td>
                            <asp:Button ID="PackEDIBtn" runat="server" Text="Pack EDI" OnClick="PackEDIBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" CausesValidation="False"
                                UseSubmitBehavior="false" CssClass="green" ToolTip="Packed Confirmation" />
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Label Style="z-index: 0" ID="SelectedTotalLbl" runat="server" CssClass="errorLabel" Visible="true"></asp:Label>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>

                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="DownloadAllAttachBtn" runat="server" Text="Download All Attachment" OnClick="DownloadAllAttachBtn_ServerClick"
                                UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                        <td>
                            <telerik:RadComboBox ID="PrintTallySheetCombo" runat="server" Skin="WebBlue" RenderMode="Lightweight" OnLoad="PrintTallySheetCombo_Load"
                                EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="PrintTallySheetCombo_ItemsRequested"
                                ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true">
                            </telerik:RadComboBox>
                        </td>
                        <td>
                            <asp:Button ID="PrintTallySheetBtn" runat="server" Text="Print Tally Sheet" OnClick="PrintTallySheetBtn_Click" UseSubmitBehavior="false" CssClass="LongLabelBlue" OnClientClick="disableBtn(this.id,false)" />
                        </td>
                    </tr>
                </table><br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmUnallocateBtn" Text="" Style="display: none;" OnClick="ConfirmUnallocateBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <asp:Button ID="ConfirmShipEDIBtn" Text="" Style="display: none;" OnClick="ConfirmShipEDIBtn_Click" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmPackEDIBtn" Text="" Style="display: none;" OnClick="ConfirmPackEDIBtn_Click" runat="server" />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnDeclareOkay" Style="display: none;" OnClick="btnDeclareOkay_Click" />
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />  <%--Added by SR on 26/Dec/2023--%>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" CausesValidation="false" AutoPostBack="true" OnClick="CheckAll(this)" OnCheckedChanged="cbSelectAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" CausesValidation="false" OnClick="RecordLevelCheckboxCheckedChanged(this)" />
                                    <asp:ImageButton runat="server" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="False" ID="GoodIssueCancel" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Goods Issue"
                                        OnClick="ldCancel_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="isSHCfmLbl" runat="server" />
                                    <asp:Label ID="isPKCfmlbl" runat="server" />
                                    <asp:Label ID="BookTransportDoneLbl" runat="server" />
                                    <asp:Label ID="ISImageFound" runat="server" />
                                    <asp:Label ID="IsNonBillable" runat="server" />
                                    <asp:Label ID="PostAccountingDoneLbl" runat="server" />
                                    <asp:Label ID="PostAccountingErrorLbl" runat="server" />
                                    <asp:Label ID="PostAccountingSentLbl" runat="server" />
                                    <asp:Label ID="ShippedEDIDoneLbl" runat="server" />
                                    <asp:Label ID="ShippedEDIErrorLbl" runat="server" />
                                    <asp:Label ID="ShippedEDISentLbl" runat="server" />

                                    <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueCopy" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy Goods Issue"
                                        OnClick="GoodsIssueCopy_Click" CausesValidation="False"></asp:ImageButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="accode" HeaderText="Account" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acname" HeaderText="Account Name" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="sitedescr" HeaderText="Site" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" HeaderText="IssueNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerReference" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceDate" UniqueName="InvoiceDate" SortExpression="InvoiceDate" HeaderText="InvoiceDate" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="podstatus" SortExpression="podstatus" HeaderText="POD status" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="CtnrNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ExternalReference" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit#" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Route" SortExpression="Route" HeaderText="Route" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vsl.Voy" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" AutoPostBackOnFilter="true"
                                HeaderText="Priority">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="ShippedOn" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OrderPlanNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PKONO" SortExpression="PKONO" HeaderText="PackingOrderNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WholeQty" SortExpression="WholeQty" HeaderText="WholeQty" AllowFiltering="false"
                                DataFormatString="{0:#.####}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LooseQty" SortExpression="LooseQty" HeaderText="LooseQty" AllowFiltering="false"
                                DataFormatString="{0:#.####}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrdVol" SortExpression="OrdVol" HeaderText="OrdVol" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrdWt" SortExpression="OrdWt" HeaderText="OrdWt" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PackVol" SortExpression="PackVol" HeaderText="PackVol" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PackWt" SortExpression="PackWt" HeaderText="PackWt" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="noofplt" SortExpression="noofplt" HeaderText="NoOfPallet" AllowFiltering="false"
                                DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="NoOfPackage" AllowFiltering="false"
                                DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PoNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="PostalCode" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MoreCtnrNo" SortExpression="MoreCtnrNo" HeaderText="MoreCtnrNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem6" SortExpression="rem6" HeaderText="PackerAdhocCharges" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exref4" SortExpression="exref4" HeaderText="ShipmentNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="TeamDescr" HeaderText="TeamDescr" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ZoneCode" SortExpression="ZoneCode" HeaderText="ZoneCode" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OnlinePlatform" SortExpression="OnlinePlatform" HeaderText="OnlinePlatform" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ISCharges" SortExpression="Charges" HeaderText="Charges" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveAllocateStatusDescr" SortExpression="ApproveAllocateStatusDescr" HeaderText="ApproveAllocateStatus" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PickerStatus" SortExpression="PickerStatus" HeaderText="PickerStatus" AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PackerStatus" SortExpression="PackerStatus" HeaderText="PackerStatus" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReleaserStatus" SortExpression="ReleaserStatus" HeaderText="ReleaserStatus" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="External Date" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HoldAndReleaseStatus" SortExpression="HoldAndReleaseStatus" HeaderText="Hold/Release" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BookPackingOrderStatusDescr" SortExpression="BookPackingOrderStatusDescr" HeaderText="PackingOrderStatus" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUStorageZone" SortExpression="SKUStorageZone" HeaderText="SKUStorageZone" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" AutoPostBackOnFilter="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jobno">
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
                            <telerik:GridBoundColumn DataField="ISImageFound" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsNonBillable" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveAllocateStatus" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostAccountingDone" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostAccountingError" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostAccountingSent" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShippedEDIDone" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShippedEDIError" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShippedEDISent" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="700px" Height="400px"
                    Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose_Edit" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ItemLineRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ConfirmationNotSentRadPageView" />
        </telerik:RadMultiPage>
    </form>
    <%-- javascript function --%>
    <script type="text/javascript">
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</body>
</html>

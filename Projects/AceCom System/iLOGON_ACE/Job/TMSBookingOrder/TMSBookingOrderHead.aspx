<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderHead.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderHead" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
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


        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="ResultsGridTab" Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="JobsheetBtn" CssClass="blue" runat="server" OnClick="JobsheetBtn_Click"
                                Text="Job Sheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ChargeSheetBtn" CssClass="LongLabelBlue" runat="server" OnClick="ChargesSheetBtn_Click"
                                Text="Charge Sheet" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <asp:Button ID="ReopenCSBtn" CssClass="LongLabelWhite" runat="server" OnClick="ReopenCSBtn_Click" Text="Reopen Charge Sheet" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="false" />
                            <asp:Button ID="ConfirmReopenCS" Text="" Style="display: none;" OnClick="ConfirmReopenCSBtn_Click" runat="server" />
                        <td>
                            <asp:Button ID="ReopenJobBtn" CssClass="white" runat="server" OnClick="ReopenJobBtn_Click" Text="Reopen Job" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <asp:Button ID="JobInstructionBtn" CssClass="LongLabelBlue" runat="server" OnClick="JobInstructionBtn_Click"
                                Text="Job Instruction" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="OutsourceBtn" CssClass="LongLabelWhite" runat="server" OnClick="OutsourceBtn_Click"
                                Text="Outsource Email" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CopyBtn" CssClass="white" runat="server" OnClick="CopyBtn_Click"
                                Text="Copy" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <asp:Button ID="BookWhsButton" CssClass="LongLabelWhite" runat="server" OnClick="BookWhsBtn_Click"
                                Text="Book Warehouse" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                        <td>
                            <asp:Button ID="ContainerMovementBtn" CssClass="LongLabelWhite" runat="server" OnClick="ContainerMovementBtn_Click"
                                Text="Container Movement" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="NonBillableBtn" CssClass="white" runat="server" OnClick="NonBillableBtn_Click"
                                Text="Non-Billable" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Enabled="false" />
                        </td>
                        <td>
                            <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="Closebtn_Click" Text="Close" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                         <td>
                           <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                       </td>
                        <td>
                            <br />
                            <telerik:RadMenu ID="RadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false" 
                                OnItemClick="RadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;&nbsp; Bill" PostBack="false" value="Bill">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" Value="SINGLE" Text="SINGLE" />
                                            <telerik:RadMenuItem runat="server" Value="CONSOLIDATED" Text="Consolidated" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="PopToGR" runat="server" Text="Populate GR" CausesValidation="false"
                                CssClass="LongLabelGreen" OnClick="PopToGR_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="PopToGI" runat="server" Text="Populate GI" CausesValidation="false"
                                CssClass="LongLabelGreen" OnClick="PopToGI_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="MassUpload" runat="server" Text="Mass Upload @Attc" CssClass="LongLabelWhite" 
                                OnClick="MassUpload_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                       
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="JBId" Name="MainGrid" AllowFilteringByColumn="false">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                        BorderWidth="0" BackColor="Transparent" OnClick="AttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="ChargeSheetApprovedLbl" runat="server" />
                                     <asp:Label ID="ChargeSheetRejectedLbl" runat="server" />
                                     <asp:Label ID="ChargeSheetLockedLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="labels" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="CODLbl" runat="server"></asp:Label>
                                    <asp:Label ID="CSCfmLbl" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="number" SortExpression="JobNo" HeaderText="JobNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderNo" UniqueName="exref1" SortExpression="PONO" HeaderText="OrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ProjectName" UniqueName="ProjectName" SortExpression="ProjectName" HeaderText="EndCustomer/ProjectName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceDate" UniqueName="InvoiceDate" SortExpression="InvoiceDate" HeaderText="InvoiceDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentTypeDescr" UniqueName="ShipmentTypeDescr" SortExpression="ShipmentTypeDescr" HeaderText="ShipmentType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jobtype" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="XMLTptType" UniqueName="XMLTptType" SortExpression="XMLTptType" HeaderText="TransportType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="XMLBillSizeType" UniqueName="XMLBillSizeType" SortExpression="XMLBillSizeType" HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="inedoasn" UniqueName="inedoasn" SortExpression="inedoasn" HeaderText=" ImportEdoAsn/UCI">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddr" UniqueName="fraddr" SortExpression="fraddr" HeaderText="FromAddress">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="toaddr" UniqueName="toaddr" SortExpression="toaddr" HeaderText="ToAddress">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ET" UniqueName="ET" SortExpression="ET" HeaderText="C-T">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" SortExpression="Vessel" HeaderText="Vessel">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="voyage" UniqueName="Voyage" SortExpression="Voyage" HeaderText="Voyage">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="expdate" HeaderText="RequiredDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="completedate" UniqueName="completedate" SortExpression="completedate" HeaderText="JobCompletionDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="INETA" UniqueName="INETA" SortExpression="INETA" HeaderText="ETA"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDescription">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PaymentTerms" UniqueName="PaymentTerms" SortExpression="PaymentTerms" HeaderText="PaymentTerm">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GINo" UniqueName="GINo" SortExpression="GINo" HeaderText="GINo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRNo" UniqueName="GRNo" SortExpression="GRNo" HeaderText="GRNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="AddUser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="EditUser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false" />
                            <telerik:GridBoundColumn DataField="ChargeSheetPrinted" UniqueName="ChargeSheetPrinted" Display="false" />
                            <telerik:GridBoundColumn DataField="ShipmentType" UniqueName="ShipmentType" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JbId" UniqueName="JbId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChargeSheetApproved" Display="false">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ChargeSheetRejected" Display="false">
                             </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ChargeSheetLocked" Display="false">
                             </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeJobClosePopup" runat="server" PopupControlID="pnlStstusBox"
                    TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="225px" Style="display: none; border: 2px solid #859DD4;">
                    <div class="popupHeader" style="width: 225px;">
                        <asp:Label ID="Label2" Text="Close Job" runat="server" Style="size: 15px"></asp:Label>
                        <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
                    </div>
                    <div style="height: 240px; width: 225px;">
                        <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                            <tr>
                                <td>JobNo<br />
                                    <telerik:RadTextBox ID="JobNotxt" runat="server" Width="155px" ReadOnly="true">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Account<br />
                                    <telerik:RadTextBox ID="Accounttxt" runat="server" Width="155px" ReadOnly="true">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>CloseCompleteDate
                      <telerik:RadDatePicker ID="CloseJobDateTxt" runat="server" Width="155"
                          DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                          <Calendar runat="server">
                              <SpecialDays>
                                  <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                              </SpecialDays>
                          </Calendar>
                      </telerik:RadDatePicker>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="CloseImg" class="white" runat="server" OnClick="CancelImg_Click" Text="Close"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                    DefaultButton="btnOk">
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
                                        <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
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
                                            <asp:Button ID="btnOk" runat="server" Text="OK" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="NotBilledRadPageView">
                <table cellspacing="2" cellpadding="2" width="30%">
                    <caption>
                        <br />
                        <tr>
                            <td>
                                <telerik:RadMenu ID="RadMenuNB" runat="server" ClickToOpen="true" ExpandAnimation-Type="None" OnItemClick="RadMenuNB_ItemClick">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" PostBack="false" Text="Bill" Value="Print">
                                            <Items>
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Single" Value="SINGLE" Visible="false" />
                                                <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Consolidated" Value="CONSOLIDATED" Visible="false" />
                                            </Items>
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenu>
                            </td>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="SearchBtn" runat="server" CausesValidation="false" CssClass="white" OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" Text="Search" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </caption>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="NotBilledGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="JobCreationDate" SortExpression="JobCreationDate" HeaderText="JobCreationDate" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderNo" UniqueName="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" UniqueName="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderDate" UniqueName="OrderDate" SortExpression="OrderDate" HeaderText="OrderDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vehno" UniqueName="Vehno" SortExpression="Vehno" HeaderText="VehNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QUNO" UniqueName="QUNO" SortExpression="QUNO" HeaderText="QuotationNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobDescr" UniqueName="JobDescr" SortExpression="JobDescr" HeaderText="JobDesription" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ACId" UniqueName="ACId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BillableItemsRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderTrip.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderTrip" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Trip @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="TripNewBtnPanel" runat="server">
            <asp:Button ID="TripOpenBtn" runat="server" CssClass="white" OnClick="TripOpenBtn_Click"
                Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripCancelBtn" runat="server" CssClass="white" OnClick="TripCancelBtn_Click"
                Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripReadyBtn" runat="server" CssClass="white" OnClick="TripReadyBtn_Click"
                Text="Ready" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripAssignedBtn" runat="server" CssClass="white" OnClick="TripAssignBtn_Click"
                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripCompletedBtn" runat="server" CssClass="white" OnClick="TripCompletedBtn_Click"
                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripPODBtn" runat="server" CssClass="white" OnClick="TripPODBtn_Click"
                Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp; 
            <asp:Button ID="TripDeleteBtn" runat="server" CssClass="white" Text="Delete" OnClientClick="disableBtn(this.id)"
                OnClick="TripDeleteBtn_Click" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="TripDOBtn" CssClass="Blue" runat="server" OnClick="TripDOBtn_Click"
                Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="TripMassUpdateBtn" runat="server" Text="Mass Update" CausesValidation="false"
                ToolTip="MassUpdate" CssClass="LongLabelWhite" OnClick="TripMassUpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="DetourBtn" runat="server" Text="Detour" CausesValidation="false"
                ToolTip="Detour" CssClass="LongLabelWhite" OnClick="DetourBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="InternalShiftingBtn" runat="server" Text="Internal Shifting" CausesValidation="false"
                ToolTip="InternalShifting" CssClass="LongLabelWhite" OnClick="InternalShiftingBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="CopyBtn" runat="server" Text="Copy" CausesValidation="false"
                CssClass="white" OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="PaymentBtn" runat="server" Text="Payment" CausesValidation="false"
                CssClass="white" OnClick="PaymentBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <br />
        </asp:Panel>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDGTrip" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDGTrip_NeedDataSource"
                    OnItemDataBound="ResultDGTrip_ItemDataBound" OnBatchEditCommand="ResultDGTrip_BatchEditCommand" AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowFilteringByColumn="true">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <GroupingSettings CaseSensitive="false" />
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="480px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                    </ClientSettings>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" PageSize="50"
                        EditMode="Batch" CommandItemDisplay="TopAndBottom">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:Label runat="server" ID="CrescentMoonLbl" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ExecutionDateTime" HeaderText="ExecutionDate <br/> FromTime <br/> ToTime" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center"
                                AutoPostBackOnFilter="true" SortExpression="FrExpDate" DataField="FrExpDate">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FrExpDateLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrExpDate", "{0:dd/MMM/yyyy}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="FromTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripFrTime", "{0:HH:mm}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="ToTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripToTime", "{0:HH:mm}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker runat="server" ID="ExecutionDatePicker" Skin="Office2007" Width="140px"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-DateFormat="dd/MMM/yyyy">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                    <br />
                                    <br />
                                    <telerik:RadTimePicker runat="server" ID="FromTimePicker" Skin="Office2007" Width="140px" TimeView-Interval="00:30:00" TimeView-TimeFormat="HH:mm"
                                        DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                    </telerik:RadTimePicker>
                                    <br />
                                    <br />
                                    <telerik:RadTimePicker runat="server" ID="ToTimePicker" Skin="Office2007" Width="140px" TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00"
                                        DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                    </telerik:RadTimePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="SNo" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripContainerNo/SealNo" AutoPostBackOnFilter="true" DataField="ContainerNo" HeaderStyle-Width="150px"
                                ItemStyle-Width="150px" HeaderText="ContainerNo <br/> SealNo" SortExpression="ContainerNo" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TripSealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripContainerNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="TripSealNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripType/TripOption/BillOption/BillSizeType" HeaderText="TripType <br/> TripOption <br/> BillOption <br/> BillSizeType" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px" DataField="TripTypeDescr" SortExpression="TripTypeDescr">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripTypeLbl" Text='<%# string.Format("{0:}",Eval("Type")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TripOptionLbl" Text=' <%# string.Format("{0:}",Eval("TripOptionDescr")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="BillOptionLbl" Text=' <%# string.Format("{0:}",Eval("BillOption1Descr")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="BillSizeTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripTypeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Type") %>'
                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="TripOptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripOptionDescr") %>'
                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="BillOptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BillOption1Descr") %>'
                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="BillSizeTypeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr") %>'
                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/TrailerPark/TrailerNo" HeaderText="Vehicle <br> Driver <br> TrailerPark <br/> Trailer" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="VehicleLbl" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="DriverLbl" Text=' <%# string.Format("{0:}",Eval("Name")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TrailerParkLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vehparkcode")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TrailerNoLbl" Text=' <%# string.Format("{0:}",Eval("TrailerNo")) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="VehicleCombo" runat="server" DataTextField="descr" DataValueField="item"
                                        Skin="WebBlue" Width="140px" OnClientDropDownClosed="VehicleList_DropDownClosed"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnItemsRequested="VehicleCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="DriverCombo" runat="server" Skin="WebBlue" Width="140px"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnItemsRequested="DriverCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerParkCombo" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        OnLoad="TrailerParkCombo_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px" EnableLoadOnDemand="true"
                                        AllowCustomText="false" Filter="Contains">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerNoCombo" runat="server" Skin="WebBlue" Width="140px"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnLoad="TrailerNoCombo_Load" OnItemDataBound="TrailerNo_ItemDataBound" OnClientSelectedIndexChanged="TrailerNo_SelectedIndexChange">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Double/Status" HeaderText="Double <br/> Status" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="DoubleMountLbl" Text='<%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="StatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="DoubleMountTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="StatusTxt" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr") %>'
                                        TextMode="SingleLine" Width="140px" Enabled="false">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUpServicePtAndAddress" HeaderText="PickUp <br/> PickUp Address" DataField="FrAddr" AllowFiltering="true" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PickUpServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePtDescr")%>' Style="display: none;"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="PickUpAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="PickUpServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                        Skin="WebBlue" Width="140px" OnClientDropDownClosed="PickUpServicePt_DropDownClosed"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="PickUpAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DropOffServicePtAndAddress" HeaderText="DropOff <br/> DropOff Address" DataField="ToAddr" AllowFiltering="true" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="DropOffServiceptDescr" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePtDescr")%>' Style="display: none;"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="DropOffAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="DropOffServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                        Skin="WebBlue" Width="140px" OnClientDropDownClosed="DropOffServicePt_DropDownClosed"
                                        DropDownWidth="160px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="DropOffAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BookingRef" HeaderText="BookingRef" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="BookingRefLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BookingNo")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="BookingRefTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripDescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripDescrTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="RequiredDateRemarks" HeaderText="RequiredDateRemarks" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RequiredDateRemarksLbl" Text='<%# DataBinder.Eval(Container.DataItem, "EqpRemarks")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="RequiredDateRemarksTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripSpecialInstructionLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                            <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                            <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                            <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                            <telerik:GridBoundColumn DataField="type" UniqueName="type" Display="False" />
                            <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentType" Display="False" />
                            <telerik:GridBoundColumn DataField="CrossDayJob" Display="False" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
    </script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            //ServicePtDescrAndAddr
            var ServicePtDescrAndAddr = function (ServicePtDescr, Addr, ServicePtCode) {
                this.ServicePtDescr = ServicePtDescr;
                this.Addr = Addr;
                this.ServicePtCode = ServicePtCode;
            }
            ServicePtDescrAndAddr.prototype.equals = function (ServicePtDescrAddrTxt) {
                if (this.ServicePtDescr === ServicePtDescrAddrTxt.ServicePtDescr && this.Addr === ServicePtDescrAddrTxt.Addr) {
                    return true;
                }
                return false;
            }
            ServicePtDescrAndAddr.prototype.toString = function () {
                return JSON.stringify({
                    Addr: this.Addr, ServicePtCode: this.ServicePtCode,
                    ServicePtDescr: this.ServicePtDescr
                }).replaceAll("'", "\\'");
            }

            //Double/Status
            var DoubleStatus = function (Double, Status) {
                this.Double = Double;
                this.Status = Status;
            }
            DoubleStatus.prototype.equals = function (Double_Status) {
                if (this.Double === Double_Status.Double) {
                    return true;
                }
                return false;
            }
            DoubleStatus.prototype.toString = function () {
                return JSON.stringify({
                    Double: this.Double
                });
            }

            //TripType/TripOption/BillOption/BillSizeType
            var TripOption_BillOption = function (TripOption, TripType, BillOption, BillSizeType) {
                this.TripOption = TripOption;
                this.TripType = TripType;
                this.BillOption = BillOption;
                this.BillSizeType = BillSizeType;
            }
            TripOption_BillOption.prototype.equals = function (tripOption_BillOption) {
                if (this.TripOption === tripOption_BillOption.TripOption &&
                    this.TripType === tripOption_BillOption.TripType &&
                    this.BillOption === tripOption_BillOption.BillOption &&
                    this.BillSizeType === tripOption_BillOption.BillSizeType) {
                    return true;
                }
                return false;
            }
            TripOption_BillOption.prototype.toString = function () {
                return JSON.stringify({
                    TripOptionText: this.TripOption,
                    TripTypeText: this.TripType,
                    BillOptionText: this.BillOption,
                    BillSizeTypeText: this.BillSizeType
                }).replaceAll("'", "\\'");
            }
            //Vehicle/Driver/TrailerNo
            var VehicleDriverTrailer = function (VehNo, Driver, TrailerPark, TrailerNo, VehNoValue, DriverValue, TrailerParkValue, TrailerNoValue) {
                this.VehNo = VehNo;
                this.Driver = Driver;
                this.TrailerPark = TrailerPark;
                this.TrailerNo = TrailerNo;
                this.VehNoText = VehNoValue;
                this.DriverText = DriverValue;
                this.TrailerParkText = TrailerParkValue;
                this.TrailerNoText = TrailerNoValue;
            }
            VehicleDriverTrailer.prototype.equals = function (vehicleDriverTrailer) {
                if (this.VehNo === vehicleDriverTrailer.VehNo &&
                    this.Driver === vehicleDriverTrailer.Driver &&
                    this.TrailerPark === vehicleDriverTrailer.TrailerPark &&
                    this.TrailerNo === vehicleDriverTrailer.TrailerNo) {
                    return true;
                }
                return false;
            }
            VehicleDriverTrailer.prototype.toString = function () {
                return JSON.stringify({
                    VehNo: this.VehNoText, Driver: this.DriverText, TrailerPark: this.TrailerParkText, TrailerNo: this.TrailerNoText,
                    VehNoText: this.VehNo, DriverText: this.Driver, TrailerParkText: this.TrailerPark, TrailerNoText: this.TrailerNo
                }).replaceAll("'", "\\'");
            }

            //TripContainerNo/SealNo
            var TripContainerNoSealNo = function (ContainerNo, SealNo) {
                this.ContainerNo = ContainerNo;
                this.SealNo = SealNo;
            }
            TripContainerNoSealNo.prototype.equals = function (TripContainerSealNo) {
                if (this.ContainerNo === TripContainerSealNo.ContainerNo && this.SealNo === TripContainerSealNo.SealNo) {
                    return true;
                }
                return false;
            }
            TripContainerNoSealNo.prototype.toString = function () {
                return JSON.stringify({
                    ContainerNo: this.ContainerNo, SealNo: this.SealNo, VGM: this.VGM
                }).replaceAll("'", "\\'");
            }

            var ExecutionDateTime = function (ExecutionDate, FromTime, ToTime) {
                this.ExecutionDate = ExecutionDate;
                this.FromTime = FromTime;
                this.ToTime = ToTime;
            }

            ExecutionDateTime.prototype.equals = function (executiondatetime) {
                if (this.ExecutionDate === executiondatetime.ExecutionDate
                    && this.FromTime === executiondatetime.FromTime && this.ToTime === executiondatetime.ToTime) {
                    return true;
                }
                return false;
            }

            ExecutionDateTime.prototype.toString = function () {
                return JSON.stringify({
                    ExecutionDate: this.ExecutionDate.toString("dd/MMM/yyyy"), FromTime: this.FromTime, ToTime: this.ToTime
                });
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <script type="text/javascript">
            function GetCellValue(sender, args) {
                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerHTML;
                    if (Addr.includes("&nbsp;")) {
                        Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerText;
                    }
                    var ServicePtDescr = $telerik.findElement(Container, "PickUpServiceptDescr").innerHTML;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerHTML;
                    if (Addr.includes("&nbsp;")) {
                        Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerText;
                    }
                    var ServicePtDescr = $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML;
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                }

                //Double/Status
                if (args.get_columnUniqueName() === "Double/Status") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var Double = $telerik.findElement(Container, "DoubleMountLbl").innerHTML;
                    var Status = $telerik.findElement(Container, "StatusLbl").innerHTML;
                    args.set_value(new DoubleStatus(Double, Status));
                }

                //TripType/TripOption/BillOption/BillSizeType
                if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var TripType = $telerik.findElement(Container, "TripTypeLbl").innerHTML;
                    var TripOption = $telerik.findElement(Container, "TripOptionLbl").innerHTML;
                    var Billoption = $telerik.findElement(Container, "BillOptionLbl").innerHTML;
                    var BillSizeType = $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML;
                    args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType));
                }

                //Vehicle/Driver/TrailerNo
                if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerPark/TrailerNo") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var VehNo = $telerik.findElement(Container, "VehicleLbl").innerHTML;
                    var Driver = $telerik.findElement(Container, "DriverLbl").innerHTML;
                    var TrailerPark = $telerik.findElement(Container, "TrailerParkLbl").innerHTML;
                    var TrailerNo = $telerik.findElement(Container, "TrailerNoLbl").innerHTML;
                    args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerPark, TrailerNo));
                }

                //TripContainerNo/SealNo
                if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ContainerNo = $telerik.findElement(Container, "TripContainerNoLbl").innerHTML;
                    var SealNo = $telerik.findElement(Container, "TripSealNoLbl").innerHTML;
                    args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                }

                //ExecutionDateTime
                if (args.get_columnUniqueName() === "ExecutionDateTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ExecutionDate = $telerik.findElement(Container, "FrExpDateLbl").innerText;
                    var FromTime = $telerik.findElement(Container, "FromTimeLbl").innerText;
                    var ToTime = $telerik.findElement(Container, "ToTimeLbl").innerText;

                    args.set_value(new ExecutionDateTime(ExecutionDate, FromTime, ToTime));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            function SetCellValue(sender, args) {
                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "PickUpServiceptDescr").innerHTML = Value.ServicePtDescr;
                    $telerik.findElement(Container, "PickUpAddrLbl").innerHTML = Value.Addr;
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML = Value.ServicePtDescr;
                    $telerik.findElement(Container, "DropOffAddrLbl").innerHTML = Value.Addr;
                }

                //Double/Status
                if (args.get_columnUniqueName() === "Double/Status") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "DoubleMountLbl").innerHTML = Value.Double;
                }

                //TripType/TripOption/BillOption/BillSizeType
                if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "TripTypeLbl").innerHTML = Value.TripType;
                    $telerik.findElement(Container, "TripOptionLbl").innerHTML = Value.TripOption;
                    $telerik.findElement(Container, "BillOptionLbl").innerHTML = Value.BillOption;
                    $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML = Value.BillSizeType;
                }

                //Vehicle/Driver/TrailerNo
                if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerPark/TrailerNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "VehicleLbl").innerHTML = Value.VehNo;
                    $telerik.findElement(Container, "DriverLbl").innerHTML = Value.Driver;
                    $telerik.findElement(Container, "TrailerParkLbl").innerHTML = Value.TrailerPark;
                    $telerik.findElement(Container, "TrailerNoLbl").innerHTML = Value.TrailerNo;
                }

                //TripContainerNo/SealNo
                if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();
                    $telerik.findElement(Container, "TripContainerNoLbl").innerHTML = Value.ContainerNo;
                    $telerik.findElement(Container, "TripSealNoLbl").innerHTML = Value.SealNo;
                }

                //ExecutionDateTime
                if (args.get_columnUniqueName() === "ExecutionDateTime") {
                    args.set_cancel(true);
                    var Container = args.get_container(), Value = args.get_value();

                    $telerik.findElement(Container, "FrExpDateLbl").innerHTML = Value.ExecutionDate;
                    $telerik.findElement(Container, "FromTimeLbl").innerHTML = Value.FromTime;
                    $telerik.findElement(Container, "ToTimeLbl").innerHTML = Value.ToTime;
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
        <script type="text/javascript">
            function GetEditorValue(sender, args) {
                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "PickUpAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "PickUpServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "PickUpServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Addr = $telerik.findControl(Container, "DropOffAddrTxt").get_value(),
                        ServicePtCode = ($telerik.findControl(Container, "DropOffServicePtCombo").get_value().split("|"))[0],
                        ServicePtDescr = $telerik.findControl(Container, "DropOffServicePtCombo").get_text();
                    args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                }

                //Double/Status
                if (args.get_columnUniqueName() === "Double/Status") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Double = $telerik.findControl(Container, "DoubleMountTxt").get_value();
                    args.set_value(new DoubleStatus(Double, null));
                }

                //TripType/TripOption/BillOption/BillSizeType
                if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        TripType = $telerik.findControl(Container, "TripTypeTxt").get_value(),
                        TripOption = $telerik.findControl(Container, "TripOptionTxt").get_value(),
                        Billoption = $telerik.findControl(Container, "BillOptionTxt").get_value(),
                        BillSizeType = $telerik.findControl(Container, "BillSizeTypeTxt").get_value();
                    args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType));
                }

                //Vehicle/Driver/TrailerNo
                if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerPark/TrailerNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        VehNo = $telerik.findControl(Container, "VehicleCombo").get_text(),
                        VehNoValue = ($telerik.findControl(Container, "VehicleCombo").get_value().split("|"))[0],
                        Driver = $telerik.findControl(Container, "DriverCombo").get_text(),
                        DriverValue = $telerik.findControl(Container, "DriverCombo").get_value(),
                        TrailerPark = $telerik.findControl(Container, "TrailerParkCombo").get_text(),
                        TrailerParkValue = $telerik.findControl(Container, "TrailerParkCombo").get_value()
                        TrailerNo = $telerik.findControl(Container, "TrailerNoCombo").get_text(),
                        TrailerNoValue = $telerik.findControl(Container, "TrailerNoCombo").get_value();
                    args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerPark, TrailerNo, VehNoValue, DriverValue, TrailerParkValue, TrailerNoValue));
                }

                //TripContainerNo/SealNo
                if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        ContainerNo = $telerik.findControl(Container, "TripContainerNoTxt").get_value(),
                        SealNo = $telerik.findControl(Container, "TripSealNoTxt").get_value();
                    args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                }

                //ExecutionDateTime
                if (args.get_columnUniqueName() === "ExecutionDateTime") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var ExecutionDatePicker = $telerik.findControl(Container, "ExecutionDatePicker");
                    var ExecutionDate = ExecutionDatePicker.get_dateInput().get_value();
                    var FromTime = $telerik.findControl(Container, "FromTimePicker").get_dateInput().get_value();
                    var ToTime = $telerik.findControl(Container, "ToTimePicker").get_dateInput().get_value();
                    args.set_value(new ExecutionDateTime(ExecutionDate, FromTime, ToTime));
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
        <script type="text/javascript">
            function SetEditorValue(sender, args) {
                //PickUpServicePtAndAddress
                if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "PickUpAddrTxt").set_value(Value.Addr);

                    if ($telerik.findControl(Container, "PickUpServicePtCombo") && $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr))
                        $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                    else
                        $telerik.findControl(Container, "PickUpServicePtCombo").set_text(Value.ServicePtDescr);
                }

                //DropOffServicePtAndAddress
                if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "DropOffAddrTxt").set_value(Value.Addr);

                    if ($telerik.findControl(Container, "DropOffServicePtCombo") && $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr))
                        $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                    else
                        $telerik.findControl(Container, "DropOffServicePtCombo").set_text(Value.ServicePtDescr);
                }

                //Double/Status
                if (args.get_columnUniqueName() === "Double/Status") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                         Value = args.get_value();

                    $telerik.findControl(Container, "StatusTxt").set_value(Value.Status);
                    $telerik.findControl(Container, "DoubleMountTxt").set_value(Value.Double);
                }

                //TripType/TripOption/BillOption/BillSizeType
                if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "TripTypeTxt").set_value(Value.TripType);
                    $telerik.findControl(Container, "TripOptionTxt").set_value(Value.TripOption);
                    $telerik.findControl(Container, "BillOptionTxt").set_value(Value.BillOption);
                    $telerik.findControl(Container, "BillSizeTypeTxt").set_value(Value.BillSizeType);
                }

                //Vehicle/Driver/TrailerNo
                if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerPark/TrailerNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    if ($telerik.findControl(Container, "VehicleCombo") && $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo))
                        $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo).select();
                    else
                        $telerik.findControl(Container, "VehicleCombo").set_text(Value.VehNo);

                    if ($telerik.findControl(Container, "DriverCombo") && $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver))
                        $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver).select();
                    else
                        $telerik.findControl(Container, "DriverCombo").set_text(Value.Driver);

                    if ($telerik.findControl(Container, "TrailerParkCombo") && $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark))
                        $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark).select();
                    else
                        $telerik.findControl(Container, "TrailerParkCombo").set_text(Value.TrailerPark);

                    if ($telerik.findControl(Container, "TrailerNoCombo") && $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo))
                        $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo).select();
                    else
                        $telerik.findControl(Container, "TrailerNoCombo").set_text(Value.TrailerNo);
                }

                //TripContainerNo/SealNo
                if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "TripContainerNoTxt").set_value(Value.ContainerNo);
                    $telerik.findControl(Container, "TripSealNoTxt").set_value(Value.SealNo);
                }

                //ExecutionDateTime
                if (args.get_columnUniqueName() === "ExecutionDateTime") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "ExecutionDatePicker").get_dateInput().set_value(Value.ExecutionDate);
                    $telerik.findControl(Container, "FromTimePicker").get_dateInput().set_value(Value.FromTime);
                    $telerik.findControl(Container, "ToTimePicker").get_dateInput().set_value(Value.ToTime);
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
        <script type="text/javascript">
            <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            function PickUpServicePt_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var PickUpServicePt = $telerik.findControl(currentRow, "PickUpServicePtCombo").get_value();
                if (PickUpServicePt != null && PickUpServicePt != "") {
                    var PickUpServicePtAddrPair = PickUpServicePt.split("|");
                    $telerik.findControl(currentRow, "PickUpAddrTxt").set_value(PickUpServicePtAddrPair[1]);
                }
            }

            function DropOffServicePt_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var DropOffServicePt = $telerik.findControl(currentRow, "DropOffServicePtCombo").get_value();

                if (DropOffServicePt != null && DropOffServicePt != "") {
                    var DropOffServicePtAddrPair = DropOffServicePt.split("|");
                    $telerik.findControl(currentRow, "DropOffAddrTxt").set_value(DropOffServicePtAddrPair[1]);
                }
            }

            function VehicleList_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var VehicleList = $telerik.findControl(currentRow, "VehicleCombo").get_value();

                if (VehicleList != null && VehicleList != "") {
                    var VehNoDriverPair = VehicleList.split("|");
                    var DefaultDriverId = VehNoDriverPair[1];
                    var DefaultDriverName = VehNoDriverPair[2];

                    if ($telerik.findControl(currentRow, "DriverCombo") && $telerik.findControl(currentRow, "DriverCombo").findItemByText(DefaultDriverName))
                        $telerik.findControl(currentRow, "DriverCombo").findItemByText(DefaultDriverName).select();
                    else
                        $telerik.findControl(currentRow, "DriverCombo").set_text(DefaultDriverName);
                }
                else {
                    $telerik.findControl(currentRow, "DriverCombo").set_text("");
                }
            }

            function TrailerNo_SelectedIndexChange(sender, args, ControlIdToUpdate, DefaultField) {
                var ControlIdToUpdate = 'TrailerParkCombo', DefaultField = 'VehParkCode'
                var NewValue = sender.get_selectedItem().get_attributes().getAttribute(DefaultField);

                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                if ($telerik.findControl(CurrentRow, ControlIdToUpdate) && $telerik.findControl(CurrentRow, ControlIdToUpdate).findItemByValue(NewValue))
                    $telerik.findControl(CurrentRow, ControlIdToUpdate).findItemByValue(NewValue).select();
                else {
                    if (!NewValue) {
                        if ($telerik.findControl(CurrentRow, ControlIdToUpdate) && $telerik.findControl(CurrentRow, ControlIdToUpdate).findItemByText(''))
                            $telerik.findControl(CurrentRow, ControlIdToUpdate).findItemByText('').select();
                        else
                            $telerik.findControl(CurrentRow, ControlIdToUpdate).set_text('');
                    } else
                        $telerik.findControl(CurrentRow, ControlIdToUpdate).set_value(NewValue);
                }
            }
            <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

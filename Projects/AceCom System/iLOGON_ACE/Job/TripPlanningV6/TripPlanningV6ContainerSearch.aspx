<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6ContainerSearch.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6ContainerSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>TripPlanningV6ContainerSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <style type="text/css">
        .hide {
            display: none;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search" OnClick="SearchBtn_Click" CausesValidation="false"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                     &nbsp;
                     <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click"
                        CssClass="white" ToolTip="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                     &nbsp;
                     <asp:Button ID="PaymentBtn" runat="server" CssClass="white" Text="Payment" OnClick="PaymentBtn_Click" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand" AllowSorting="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True" AllowFilteringByColumn="true" Height="86%">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                    </ClientSettings>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid"
                        EditMode="Batch" CommandItemDisplay="TopAndBottom">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                AutoPostBackOnFilter="true" AllowFiltering="false">
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
                                    <asp:Label runat="server" ID="TripContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>' Style="text-transform: uppercase"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TripSealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>' Style="text-transform: uppercase"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripContainerNoTxt" TextMode="SingleLine" Width="140px" Style="text-transform: uppercase"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="TripSealNoTxt" TextMode="SingleLine" Width="140px" Style="text-transform: uppercase"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripDateTime" HeaderText="Trip Date Time" HeaderStyle-Width="130px" ItemStyle-Width="130px" AllowFiltering="false"
                                SortExpression="TripDateTime" AllowSorting="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("TripDateTime")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="TripDatePicker" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true"
                                        DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" Width="120">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="Account" DataField="AcCode" HeaderText="Account" HeaderStyle-Width="180px" ItemStyle-Width="180px" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="JobNo" DataField="JobNo" HeaderText="JobNo" HeaderStyle-Width="150px" ItemStyle-Width="150px" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="CustRef" DataField="Exref1" HeaderText="CustRef" HeaderStyle-Width="150px" ItemStyle-Width="150px" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="RequestedDetourDate" HeaderText="RequestedDetourDate" HeaderStyle-Width="170px" ItemStyle-Width="170px" AllowFiltering="false" SortExpression="bookingtime" AllowSorting="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RequestedDetourDateLbl" Text='<%# string.Format("{0:dd/MMM/yyyy HH:mm}",Eval("bookingtime")) %>' CssClass='<%# ((Eval("TripDetour").ToString()).Equals("shifting", StringComparison.OrdinalIgnoreCase) || (Eval("TripDetour").ToString()).Equals("detour", StringComparison.OrdinalIgnoreCase))? "" : "hide" %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker runat="server" ID="RequestedDetourDatePicker" Skin="Office2007" Width="160px"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00">
                                    </telerik:RadDateTimePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripType/TripOption/BillOption/BillSizeType" HeaderText="TripType <br/> TripOption <br/> BillOption <br/> BillSizeType" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripTypeLbl" Text='<%# string.Format("{0:}",Eval("TripTypeDescr")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TripOptionLbl" Text=' <%# string.Format("{0:}",Eval("TripOptionDescr")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="BillOptionLbl" Text=' <%# string.Format("{0:}",Eval("BillOption1Descr")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="BillSizeTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="TripTypeDDL" runat="server"
                                        Skin="WebBlue" Width="140px"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnLoad="TripTypeDDL_Load">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                    <telerik:RadDropDownList ID="TripOptionDDL" runat="server" Skin="WebBlue" Width="140px"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnLoad="TripOptionDDL_Load">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                    <telerik:RadDropDownList ID="TripBillOptionDDL" runat="server"
                                        Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="BillOption1DDL_Load">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                    <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" Skin="WebBlue"
                                        RenderMode="Lightweight" Width="140px" OnLoad="ContainerSizeDDL_Load">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/TrailerNo" HeaderText="Vehicle <br> Driver <br/> Trailer <br/> TrailerPark" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="VehicleLbl" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="DriverLbl" Text=' <%# string.Format("{0:}",Eval("Name")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TrailerNoLbl" Text=' <%# string.Format("{0:}",Eval("TrailerNo")) %>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="TrailerParkLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vehparkcode")%>'></asp:Label>
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
                                    <telerik:RadComboBox ID="TrailerNoCombo" runat="server" Skin="WebBlue" Width="140px"
                                        RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                        EnableLoadOnDemand="true" OnItemsRequested="TrailerNoCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerParkCombo" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        OnLoad="TrailerParkCombo_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px" DropDownAutoWidth="Enabled" ExpandDirection="Down"
                                        AllowCustomText="false" Filter="Contains">
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
                            <telerik:GridTemplateColumn UniqueName="PickUpServicePtAndAddress" HeaderText="PickUp <br/> PickUp Address" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
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
                            <telerik:GridTemplateColumn UniqueName="DropOffServicePtAndAddress" HeaderText="DropOff <br/> DropOff Address" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
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
                            <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TripSpecialInstructionLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" TextMode="MultiLine" Rows="3" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="OrderNo/CustomerReference" HeaderText="OrderNo/ <br/> CustomerReference" DataField="Exref1" ItemStyle-Width="110px" HeaderStyle-Width="110px"
                                ItemStyle-HorizontalAlign="Center" SortExpression="Exref1" AutoPostBackOnFilter="true" FilterControlWidth="65px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("Exref1")) %>
                                    <br />
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False">
                            </telerik:GridBoundColumn>
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
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>

        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
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

                var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
                function selectCheckbox(e, selectedIndex) {
                    if (e.shiftKey) {
                        if (startingIndex < selectedIndex) {
                            $(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                        }
                        else
                            $(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                    }
                    startingIndex = selectedIndex;
                }
            </script>
        </telerik:RadCodeBlock>
        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script type="text/javascript">
                <%--Start Region : Migrate Two ItemTemplate into One Column --%>
                var RequestedDetourDate = function (RequestedDetourDate, isHidden) {
                    this.RequestedDetourDate = RequestedDetourDate;
                    this.isHidden = isHidden;
                }

                var ServicePtDescrAndAddr = function (ServicePtDescr, Addr, ServicePtCode) {
                    this.ServicePtDescr = ServicePtDescr;
                    this.Addr = Addr;
                    this.ServicePtCode = ServicePtCode;
                }

                var TripContainerNoSealNo = function (ContainerNo, SealNo) {
                    this.ContainerNo = ContainerNo;
                    this.SealNo = SealNo;
                }

                RequestedDetourDate.prototype.equals = function (requestedDetourDate) {
                    return ((!this.RequestedDetourDate && !requestedDetourDate.RequestedDetourDate) || moment(this.RequestedDetourDate).isSame(moment(requestedDetourDate.RequestedDetourDate)));
                }

                TripContainerNoSealNo.prototype.equals = function (TripContainerSealNo) {
                    if (this.ContainerNo === TripContainerSealNo.ContainerNo && this.SealNo === TripContainerSealNo.SealNo) {
                        return true;
                    }
                    return false;
                }

                ServicePtDescrAndAddr.prototype.equals = function (ServicePtDescrAddrTxt) {
                    if (this.ServicePtDescr === ServicePtDescrAddrTxt.ServicePtDescr && this.Addr === ServicePtDescrAddrTxt.Addr) {
                        return true;
                    }
                    return false;
                }

                RequestedDetourDate.prototype.toString = function () {
                    if (this.RequestedDetourDate)
                        return moment(this.RequestedDetourDate).format("DD/MMM/YYYY HH:mm");
                    else
                        return '';
                }

                TripContainerNoSealNo.prototype.toString = function () {
                    return JSON.stringify({
                        ContainerNo: this.ContainerNo, SealNo: this.SealNo, VGM: this.VGM
                    }).replaceAll("'", "\\'");
                }

                ServicePtDescrAndAddr.prototype.toString = function () {
                    return JSON.stringify({
                        Addr: this.Addr, ServicePtCode: this.ServicePtCode,
                        ServicePtDescr: this.ServicePtDescr
                    }).replaceAll("'", "\\'");
                }

                var TripOption_BillOption = function (TripOption, TripType, BillOption, BillSizeType, TripOptionValue, TripTypeValue, BillOptionValue, BillSizeTypeValue) {
                    this.TripOption = TripOption;
                    this.TripType = TripType;
                    this.BillOption = BillOption;
                    this.BillSizeType = BillSizeType;
                    this.TripOptionValue = TripOptionValue;
                    this.TripTypeValue = TripTypeValue;
                    this.BillOptionValue = BillOptionValue;
                    this.BillSizeTypeValue = BillSizeTypeValue;
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
                        TripOption: this.TripOptionValue,
                        TripType: this.TripTypeValue,
                        BillOption: this.BillOptionValue,
                        BillSizeType: this.BillSizeTypeValue,
                        TripOptionText: this.TripOption,
                        TripTypeText: this.TripType,
                        BillOptionText: this.BillOption,
                        BillSizeTypeText: this.BillSizeType
                    }).replaceAll("'", "\\'");
                }

                var VehicleDriverTrailer = function (VehNo, Driver, TrailerNo, TrailerPark, VehNoValue, DriverValue, TrailerNoValue, TrailerParkValue) {
                    this.VehNo = VehNo;
                    this.Driver = Driver;
                    this.TrailerNo = TrailerNo;
                    this.TrailerPark = TrailerPark;
                    this.VehNoText = VehNoValue;
                    this.DriverText = DriverValue;
                    this.TrailerNoText = TrailerNoValue;
                    this.TrailerParkText = TrailerParkValue;
                }
                VehicleDriverTrailer.prototype.equals = function (vehicleDriverTrailer) {
                    if (this.VehNo === vehicleDriverTrailer.VehNo &&
                        this.Driver === vehicleDriverTrailer.Driver &&
                        this.TrailerNo === vehicleDriverTrailer.TrailerNo &&
                        this.TrailerPark === vehicleDriverTrailer.TrailerPark) {
                        return true;
                    }
                    return false;
                }
                VehicleDriverTrailer.prototype.toString = function () {
                    return JSON.stringify({
                        VehNo: this.VehNoText, Driver: this.DriverText, TrailerNo: this.TrailerNoText, TrailerPark: this.TrailerParkText,
                        VehNoText: this.VehNo, DriverText: this.Driver, TrailerNoText: this.TrailerNo, TrailerParkText: this.TrailerPark
                    }).replaceAll("'", "\\'");
                }

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
                    }).replaceAll("'", "\\'");
                }

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var requestedDetourDateElement = $telerik.findElement(Container, "RequestedDetourDateLbl");
                        var requestedDetourDate = null;
                        if (requestedDetourDateElement.innerText)
                            requestedDetourDate = moment(requestedDetourDateElement.innerText, "DD/MMM/YYYY HH:mm").toDate();
                        var isHidden = requestedDetourDateElement.classList.contains('hide');
                        args.set_value(new RequestedDetourDate(requestedDetourDate, isHidden));
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Double = $telerik.findElement(Container, "DoubleMountLbl").innerHTML;
                        var Status = $telerik.findElement(Container, "StatusLbl").innerHTML;
                        args.set_value(new DoubleStatus(Double, Status));
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var TripType = $telerik.findElement(Container, "TripTypeLbl").innerHTML;
                        var TripOption = $telerik.findElement(Container, "TripOptionLbl").innerHTML;
                        var Billoption = $telerik.findElement(Container, "BillOptionLbl").innerHTML;
                        var BillSizeType = $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML;
                        args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType));
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var VehNo = $telerik.findElement(Container, "VehicleLbl").innerHTML;
                        var Driver = $telerik.findElement(Container, "DriverLbl").innerHTML;
                        var TrailerNo = $telerik.findElement(Container, "TrailerNoLbl").innerHTML;
                        var TrailerPark = $telerik.findElement(Container, "TrailerParkLbl").innerHTML;
                        args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerNo, TrailerPark));
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ContainerNo = $telerik.findElement(Container, "TripContainerNoLbl").innerHTML;
                        var SealNo = $telerik.findElement(Container, "TripSealNoLbl").innerHTML;
                        args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                    }
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
                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        if (Value.RequestedDetourDate)
                            $telerik.findElement(Container, "RequestedDetourDateLbl").innerText = moment(Value.RequestedDetourDate).format("DD/MMM/YYYY HH:mm");
                        else
                            $telerik.findElement(Container, "RequestedDetourDateLbl").innerText = '';
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "DoubleMountLbl").innerHTML = Value.Double;
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "TripTypeLbl").innerHTML = Value.TripType;
                        $telerik.findElement(Container, "TripOptionLbl").innerHTML = Value.TripOption;
                        $telerik.findElement(Container, "BillOptionLbl").innerHTML = Value.BillOption;
                        $telerik.findElement(Container, "BillSizeTypeLbl").innerHTML = Value.BillSizeType;
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "VehicleLbl").innerHTML = Value.VehNo;
                        $telerik.findElement(Container, "DriverLbl").innerHTML = Value.Driver;
                        $telerik.findElement(Container, "TrailerNoLbl").innerHTML = Value.TrailerNo;
                        $telerik.findElement(Container, "TrailerParkLbl").innerHTML = Value.TrailerPark;
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "TripContainerNoLbl").innerHTML = Value.ContainerNo;
                        $telerik.findElement(Container, "TripSealNoLbl").innerHTML = Value.SealNo;
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "PickUpServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "PickUpAddrLbl").innerHTML = Value.Addr;
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "DropOffServiceptDescr").innerHTML = Value.ServicePtDescr;
                        $telerik.findElement(Container, "DropOffAddrLbl").innerHTML = Value.Addr;
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            RequestedDetourDatePickerElement = $telerik.findControl(Container, "RequestedDetourDatePicker");
                        var requestedDetourDate = RequestedDetourDatePickerElement.get_selectedDate();
                        args.set_value(new RequestedDetourDate(requestedDetourDate, !RequestedDetourDatePickerElement.get_enabled()));
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Double = $telerik.findControl(Container, "DoubleMountTxt").get_value();
                        args.set_value(new DoubleStatus(Double, null));
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            TripType = $telerik.findControl(Container, "TripTypeDDL").get_selectedItem().get_text(),
                            TripTypeValue = $telerik.findControl(Container, "TripTypeDDL").get_selectedItem().get_value(),
                            TripOption = $telerik.findControl(Container, "TripOptionDDL").get_selectedItem().get_text(),
                            TripOptionValue = $telerik.findControl(Container, "TripOptionDDL").get_selectedItem().get_value(),
                            Billoption = $telerik.findControl(Container, "TripBillOptionDDL").get_selectedItem().get_text(),
                            BillOptionValue = $telerik.findControl(Container, "TripBillOptionDDL").get_selectedItem().get_value(),
                            BillSizeType = $telerik.findControl(Container, "BillSizeTypeDDL").get_selectedItem().get_text(),
                            BillSizeTypeValue = $telerik.findControl(Container, "BillSizeTypeDDL").get_selectedItem().get_value();
                        args.set_value(new TripOption_BillOption(TripOption, TripType, Billoption, BillSizeType, TripOptionValue, TripTypeValue, BillOptionValue, BillSizeTypeValue));
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            VehNo = $telerik.findControl(Container, "VehicleCombo").get_text(),
                            VehNoValue = ($telerik.findControl(Container, "VehicleCombo").get_value().split("|"))[0],
                            Driver = $telerik.findControl(Container, "DriverCombo").get_text(),
                            DriverValue = $telerik.findControl(Container, "DriverCombo").get_value(),
                            TrailerNo = $telerik.findControl(Container, "TrailerNoCombo").get_text(),
                            TrailerNoValue = $telerik.findControl(Container, "TrailerNoCombo").get_value();
                        TrailerPark = $telerik.findControl(Container, "TrailerParkCombo").get_text(),
                            TrailerParkValue = $telerik.findControl(Container, "TrailerParkCombo").get_value();
                        args.set_value(new VehicleDriverTrailer(VehNo, Driver, TrailerNo, TrailerPark, VehNoValue, DriverValue, TrailerNoValue, TrailerParkValue));
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ContainerNo = $telerik.findControl(Container, "TripContainerNoTxt").get_value(),
                            SealNo = $telerik.findControl(Container, "TripSealNoTxt").get_value();
                        args.set_value(new TripContainerNoSealNo(ContainerNo, SealNo));
                    }
                    if (args.get_columnUniqueName() === "PickUpServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "PickUpAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "PickUpServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "PickUpServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                    if (args.get_columnUniqueName() === "DropOffServicePtAndAddress") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "DropOffAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "DropOffServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "DropOffServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === 'RequestedDetourDate') {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        var RequestedDetourDatePickerElement = $telerik.findControl(Container, "RequestedDetourDatePicker");
                        RequestedDetourDatePickerElement.set_selectedDate(Value.RequestedDetourDate);
                        RequestedDetourDatePickerElement.set_enabled(!Value.isHidden);
                    }
                    if (args.get_columnUniqueName() === "Double/Status") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "StatusTxt").set_value(Value.Status);
                        $telerik.findControl(Container, "DoubleMountTxt").set_value(Value.Double);
                    }
                    if (args.get_columnUniqueName() === "TripType/TripOption/BillOption/BillSizeType") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "TripTypeDDL").findItemByText(Value.TripType).select();
                        $telerik.findControl(Container, "TripOptionDDL").findItemByText(Value.TripOption).select();
                        $telerik.findControl(Container, "TripBillOptionDDL").findItemByText(Value.BillOption).select();
                        $telerik.findControl(Container, "BillSizeTypeDDL").findItemByText(Value.BillSizeType).select();
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/TrailerNo") {
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

                        if ($telerik.findControl(Container, "TrailerNoCombo") && $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo))
                            $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo).select();
                        else
                            $telerik.findControl(Container, "TrailerNoCombo").set_text(Value.TrailerNo);

                        if ($telerik.findControl(Container, "TrailerParkCombo") && $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark))
                            $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark).select();
                        else
                            $telerik.findControl(Container, "TrailerParkCombo").set_text(Value.TrailerPark);
                    }
                    if (args.get_columnUniqueName() === "TripContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "TripContainerNoTxt").set_value(Value.ContainerNo);
                        $telerik.findControl(Container, "TripSealNoTxt").set_value(Value.SealNo);
                    }
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
                }
                <%--End Region : Migrate Two ItemTemplate into One Column --%>
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
                <%--End Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>

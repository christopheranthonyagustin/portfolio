<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV6NonContainerized.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV6.TripPlanningV6NonContainerized" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>NonContainerized @ TripPlanningV6</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <style type="text/css">
        .headerbutton {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background-color: white;
            z-index: 100;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <asp:UpdatePanel ID="FormCtlUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:Button ID="RunBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                        Text="Run" OnClick="RunBtn_Click" UseSubmitBehavior="false" />
                    &nbsp;
                </td>
            </tr>
        </table>
        <table class="headerbutton">

            <tr>
                <td>
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                        Text="Refresh" OnClick="RefreshBtn_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                        Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                        Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="SaveAssignBtn" runat="server" CssClass="LongLabelWhite" OnClick="SaveAssignBtn_Click"
                        Text="Save & Assign" OnClientClick="disableBtn(this.id); saveChangesToGrid()" UseSubmitBehavior="false" />
                    <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                        Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click"
                        Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="DetourBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="DetourBtn_Click" Text="Detour" />
                    <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="PaymentBtn_Click" Text="Payment" />
                    <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="IncentiveBtn_Click" Text="Incentive" />
                    <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ChargeBtn_Click" Text="Charge" />
                    <asp:Button ID="ImportantBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="ImportantBtn_Click" Text="Important" />
                    <asp:Button ID="MassUpdateBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="MassUpdateBtn_Click" Text="MassUpdate" />
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" UseSubmitBehavior="false" OnClick="ExcelBtn_Click" Text="Excel" />
                    <br />
                </td>
                <td align="right">
                    <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                        OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true" AllowPaging="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true" Height="92.5%"
                    AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true" OnPreRender="ResultDG_PreRender" OnBatchEditCommand="ResultDG_BatchEditCommand">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="150%" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="Top" TableLayout="Auto" EditMode="Batch">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Left">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0" Visible="false"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="Attc_Click"></asp:ImageButton>
                                    <asp:Label runat="server" ID="CrescentMoonLbl" />
                                    <asp:Label runat="server" ID="PIconLbl" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                AutoPostBackOnFilter="true" AllowFiltering="false" HeaderText="S/N">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
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
                            <telerik:GridTemplateColumn UniqueName="JobType" HeaderText="ShipmentType<br/> JobType <br/> TripType" HeaderStyle-Width="145px"
                                ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" AutoPostBackOnFilter="true" AllowSorting="true" ItemStyle-Wrap="false" DataField="JobType" SortExpression="JobType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ShipmentType", "{0:}")%>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "JobType", "{0:}")%>
                                    <asp:Label ID="JobType" runat="server"></asp:Label>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "Type", "{0:}")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="RequiredDate" HeaderText="Required <br/> Date" ItemStyle-Width="130px" HeaderStyle-Width="135px" ItemStyle-HorizontalAlign="Center"
                                AllowSorting="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="false" DataField="ExpDateOnly" SortExpression="ExpDateOnly">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblRequire" Text='<%# DataBinder.Eval(Container.DataItem, "ExpDate", "{0:dd/MMM/yyyy <br/> HH:mm}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblDate" Text='<%# DataBinder.Eval(Container.DataItem, "EqpRemarks")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker runat="server" ID="RequireDP" DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" Width="120px">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="DateTxt" TextMode="SingleLine" Width="100px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="JobNo/Account/BookingNo" DataField="JobAcBookingNoEndCustomer" ItemStyle-HorizontalAlign="Center"
                                HeaderText="JobNo <br/> Account <br/> BookingNo <br/> EndCustomer" SortExpression="AcCode" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="145px" HeaderStyle-Width="145px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}", Eval("JobAcBookingNoEndCustomer")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/Trailer" HeaderText="Vehicle <br/> Driver<br/> TrailerPark<br/> TrailerNo" ItemStyle-Width="160px" HeaderStyle-Width="160px"
                                SortExpression="VehNoDriverTrailer" AllowFiltering="true" AutoPostBackOnFilter="true" AllowSorting="true" ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="Center" DataField="VehicleDriverTrailerParkTrailerNo">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblVehNo" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "VehNo")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblDriver" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblTrailerPark" Text='<%# DataBinder.Eval(Container.DataItem, "vehparkcode")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="lblTrailerNo" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "TrailerNoDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="VehicleList_ItemsRequested"
                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnClientDropDownClosed="VehicleList_DropDownClosed">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                        RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="DriverList_ItemsRequested"
                                        HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerParkList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        OnLoad="TrailerParkList_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px"
                                        AllowCustomText="false" Filter="Contains">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                    <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                        OnLoad="TrailerNoList_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px"
                                        AllowCustomText="false" Filter="Contains" OnItemDataBound="TrailerNoList_ItemDataBound" OnClientDropDownOpening="TrailerParkList_TrailerNoList_filter"
                                        OnClientSelectedIndexChanged="TrailerNoList_SelectedIndexChange" OnClientDropDownClosed="TrailerNoList_ClientDropDownClosed">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BillSizeType/TripOption/BillOption" HeaderText="BillSizeType <br/> TripOption <br/> BillOption"
                                SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblBillSizeType" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "billsizetype")%>'></asp:Label>
                                    </br>
                                            <asp:Label runat="server" ID="lblTripOption" Text='<%# DataBinder.Eval(Container.DataItem, "TripOptionDescr")%>'></asp:Label>
                                    </br>
                                            <asp:Label runat="server" ID="lblBillOption" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "BillOption1Descr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="BillSizeTypeList" runat="server" Skin="WebBlue"
                                        RenderMode="Lightweight" Enabled="false" Width="140px">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                    <telerik:RadDropDownList ID="TripOptionList" runat="server" Skin="WebBlue"
                                        RenderMode="Lightweight" OnLoad="TripOptionList_Load" Width="140px">
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                    <telerik:RadDropDownList ID="BillOptionList" runat="server" Skin="WebBlue"
                                       RenderMode ="Lightweight" Width="140px"  Enabled="false">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="DoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="Double <br/> Status"
                                SortExpression="StatusDescr" AllowFiltering="false" AllowSorting="true">
                                <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="84px" />
                                <ItemStyle Wrap="true" HorizontalAlign="Center" Width="84px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "DoubleStatus")%>
                                            </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" DataField="fraddr" AllowFiltering="true" AutoPostBackOnFilter="true" ItemStyle-Width="160px"
                                        HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblFrServicePtDescr" Text='<%# DataBinder.Eval(Container.DataItem, "FrServiceptDescr")%>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblFrAddr" Text='<%# Eval("fraddr") %>' Width="140px" CssClass="wordwrap"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="140px" OnClientDropDownClosed="FrServicePtList_DropDownClosed"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="ServicePtList_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" DataField="toaddr" SortExpression="ToServicePtDescr" AllowFiltering="true" AutoPostBackOnFilter="true"
                                        ItemStyle-Width="160px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblToServicePtDescr" Text='<%# DataBinder.Eval(Container.DataItem, "ToServiceptDescr")%>' Style="display: none;"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblToAddr" Text='<%# Eval("toaddr") %>' Width="140px" CssClass="wordwrap"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtList_ItemsRequested" OnClientDropDownClosed="ToServicePtList_DropDownClosed"
                                                EnableLoadOnDemand="true" DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" SortExpression="TripDescr"
                                AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Width="145px" TextMode="MultiLine" Rows="3"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridTemplateColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction" SortExpression="SpecialInstruction"
                                AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SpecialInstruction")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="SpecialInstructionTxt" Width="145px" TextMode="MultiLine" Rows="3"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="JobSpecialInstruction" SortExpression="JobSpecialInstruction"
                                AllowFiltering="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ContainerNo/SealNo" HeaderText="ContainerNo <br/> SealNo"
                                SortExpression="ContainerNo" AllowFiltering="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="ContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>' Style="text-transform: uppercase"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>' Style="text-transform: uppercase"></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="CtnrStatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CtnrStatus")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" TextMode="SingleLine" Width="140px" Style="text-transform: uppercase">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="SealNoTxt" TextMode="SingleLine" Width="140px" Style="text-transform: uppercase">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ETA/Vessel/Voyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage" ItemStyle-HorizontalAlign="Center"
                                SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="165px" HeaderStyle-Width="165px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Shipper" HeaderText="Shipper" DataField="Shipper" ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px"
                                ItemStyle-HorizontalAlign="Center" SortExpression="Shipper" AutoPostBackOnFilter="true">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("Shipper")) %>
                                    <br />
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="NoOfPLT/Packages" HeaderText="NoOfPLT <br/> Packages"
                                SortExpression="ActPLT" AllowFiltering="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="NoOfPLTLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ActPLT","{0:0.00}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="PackagesLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ActPKG","{0:0.00}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="NoOfPLTTxt" TextMode="SingleLine" Width="140px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="PackagesTxt" TextMode="SingleLine" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="GoodsWT/GoodsVOL" HeaderText="GoodsWT <br/> GoodsVOL"
                                SortExpression="ActWT" AllowFiltering="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="GoodsWTLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ActWT","{0:0.00}")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="GoodsVOLLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ActVol","{0:0.00}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="GoodsWTTxt" TextMode="SingleLine" Width="140px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="GoodsVOLTxt" TextMode="SingleLine" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="TripSpecialInstruction" SortExpression="TripSpecialInstruction"
                                AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Width="145px" TextMode="MultiLine" Rows="3"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="InternalDocNo/OutsourceDocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                    </br>
                                    </br>
                                     <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="GoodsDescription/ContainerDescription" HeaderText="GoodsDescription <br/> ContainerDescription"
                                SortExpression="ContainerDescr" AllowFiltering="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CtnrDescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerDescr")%>'></asp:Label>
                                    <br />
                                    <asp:Label runat="server" ID="GoodsDescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "EqpGoodsDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="CtnrDescrTxt" TextMode="MultiLine" Width="140px">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="GoodsDescrTxt" TextMode="MultiLine" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="PermitNo/PermitExpiryDate" ItemStyle-HorizontalAlign="Center" HeaderText="PermitNo<br/> PermitExpiry Date"
                                SortExpression="PermitNo" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="130px" HeaderStyle-Width="130px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PermitNoPermitExpiryDate")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BillingNotes" HeaderText="BillingNotes" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("BillingNotes")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="BillingNotesTxt" TextMode="MultiLine" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripSequence" HeaderText="TripSequence" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("TripSequence")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="OrderNo/CustomerReference" HeaderText="OrderNo <br/> CustomerReference" DataField="Exref1" ItemStyle-Width="110px" HeaderStyle-Width="110px"
                                ItemStyle-HorizontalAlign="Center" SortExpression="Exref1" AutoPostBackOnFilter="true" FilterControlWidth="65px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",  Eval("Exref1")) %>
                                    <br />
                                    </br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                            <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                            <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                            <telerik:GridBoundColumn DataField="TripOption" UniqueName="TripOption" Display="False" />
                            <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" Display="False" />
                            <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                            <telerik:GridBoundColumn DataField="status" Display="false" UniqueName="Status"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequiredDateColour" UniqueName="RequiredDateColour" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CMSDone" UniqueName="CMSV" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                            <telerik:GridBoundColumn DataField="ShipmentType" Display="False" />
                            <telerik:GridBoundColumn DataField="CrossDayJob" Display="False" />
                             <telerik:GridBoundColumn DataField="PermitNoColour" UniqueName="PermitNoColour" Display="False"/>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:HiddenField ID="HiddenField" runat="server" />
        <telerik:RadWindow ID="AttcIconRadWindow" runat="server" VisibleOnPageLoad="true" Title="Attc @ TripPlanningV6" Width="800px" Height="600px"
            NavigateUrl='<%# "TripPlanningV6Attc.aspx?JBId="+ HiddenField.Value %>'
            Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>

        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();               }

                function saveChangesToGrid() {
                    // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                    var grid = $find('<%=ResultDG.ClientID%>');
                    grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
                }

                var RequireDate = function (Required, Date) {
                    this.Required = Required; // in javascript date object
                    this.Date = Date;
                }
                RequireDate.prototype.equals = function (requireddate) {
                    if (((!this.Required && !requireddate.Required) || moment(this.Required).isSame(moment(requireddate.Required)))
                        && this.Date === requireddate.Date) {
                        return true;
                    }
                    return false;
                }
                RequireDate.prototype.toString = function () {
                    var required = null;
                    if (this.Required)
                        required = moment(this.Required).format("DD/MMM/YYYY");
                    return JSON.stringify({
                        Required: required, Date: this.Date
                    });
                }

                var TripOption_BillOption = function (tripOption, billOption, billSizeType, tripOptionValue, billOptionValue) {
                    // to display the text to user
                    this.tripOption = tripOption;
                    this.billOption = billOption; // non-editable
                    this.billSizeType = billSizeType; // non-editable

                    // for server use
                    this.tripOptionValue = tripOptionValue;                    
                }
                TripOption_BillOption.prototype.equals = function (tripOption_BillOption) {
                    if (this.tripOption === tripOption_BillOption.tripOption)
                        
                    {
                        return true;
                    }
                    return false;
                }
                TripOption_BillOption.prototype.toString = function () {
                    return JSON.stringify({
                        tripOption: this.tripOptionValue,
                        tripOptionText: this.tripOption,
                    }).replaceAll("'", "\\'");;
                }
                var VehicleDriverTrailer = function (vehNo, driver, trailerNo, trailerPark, vehNoValue, driverValue, trailerNoValue, trailerParkValue) {
                    // to display the text to user
                    this.vehNo = vehNo;
                    this.driver = driver;
                    this.trailerNo = trailerNo;
                    this.trailerPark = trailerPark;

                    // for server use
                    this.vehNoValue = vehNoValue;
                    this.driverValue = driverValue;
                    this.trailerNoValue = trailerNoValue;
                    this.trailerParkValue = trailerParkValue;
                }
                VehicleDriverTrailer.prototype.equals = function (vehicleDriverTrailer) {
                    if (this.vehNo === vehicleDriverTrailer.vehNo &&
                        this.driver === vehicleDriverTrailer.driver &&
                        this.trailerNo === vehicleDriverTrailer.trailerNo &&
                        this.trailerPark === vehicleDriverTrailer.trailerPark) {
                        return true;
                    }
                    return false;
                }
                VehicleDriverTrailer.prototype.toString = function () {
                    return JSON.stringify({
                        vehNo: this.vehNoValue, driver: this.driverValue, trailerNo: this.trailerNoValue, trailerPark: this.trailerParkValue,
                        vehNoText: this.vehNo, driverText: this.driver, trailerNoText: this.trailerNo, trailerParkText: this.trailerPark
                    }).replaceAll("'", "\\'");
                }

                var ServicePtDescr_AddrTxt = function (servicePtDescr, addrTxt, servicePtCode) {
                    // to display the text to user
                    this.servicePtDescr = servicePtDescr;
                    this.addrTxt = addrTxt;

                    // for server use
                    this.servicePtCode = servicePtCode;
                }
                ServicePtDescr_AddrTxt.prototype.equals = function (servicePtDescr_AddrTxt) {
                    if (this.servicePtDescr === servicePtDescr_AddrTxt.servicePtDescr &&
                        this.addrTxt === servicePtDescr_AddrTxt.addrTxt) {
                        return true;
                    }
                    return false;
                }
                ServicePtDescr_AddrTxt.prototype.toString = function () {
                    return JSON.stringify({
                        addr: this.addrTxt, servicePtCode: this.servicePtCode,
                        servicePtDescr: this.servicePtDescr // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
                    }).replaceAll("'", "\\'");
                }

                var ContainerNoSealNo = function (ContainerNo, SealNo) {
                    this.ContainerNo = ContainerNo;
                    this.SealNo = SealNo;
                }

                ContainerNoSealNo.prototype.equals = function (ContainerSealNo) {
                    if (this.ContainerNo === ContainerSealNo.ContainerNo && this.SealNo === ContainerSealNo.SealNo) {
                        return true;
                    }
                    return false;
                }

                ContainerNoSealNo.prototype.toString = function () {
                    return JSON.stringify({
                        ContainerNo: this.ContainerNo, SealNo: this.SealNo
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
                var NoOfPLTPackages = function (NoOfPLT, Packages) {
                    this.NoOfPLT = NoOfPLT;
                    this.Packages = Packages;
                }

                NoOfPLTPackages.prototype.equals = function (NoofpltPackages) {
                    if (this.NoOfPLT === NoofpltPackages.NoOfPLT && this.Packages === NoofpltPackages.Packages) {
                        return true;
                    }
                    return false;
                }

                NoOfPLTPackages.prototype.toString = function () {
                    return JSON.stringify({
                        NoOfPLT: this.NoOfPLT, Packages: this.Packages
                    }).replaceAll("'", "\\'");
                }
                var GoodsWTGoodsVOL = function (GoodsWT, GoodsVOL) {
                    this.GoodsWT = GoodsWT;
                    this.GoodsVOL = GoodsVOL;
                }

                GoodsWTGoodsVOL.prototype.equals = function (goodswtgoodsvol) {
                    if (this.GoodsWT === goodswtgoodsvol.GoodsWT && this.GoodsVOL === goodswtgoodsvol.GoodsVOL) {
                        return true;
                    }
                    return false;
                }

                GoodsWTGoodsVOL.prototype.toString = function () {
                    return JSON.stringify({
                        GoodsWT: this.GoodsWT, GoodsVOL: this.GoodsVOL
                    }).replaceAll("'", "\\'");
                }
                var GoodsDescriptionContainerDescription = function (ContainerDescription, GoodsDescription) {
                    this.ContainerDescription = ContainerDescription;
                    this.GoodsDescription = GoodsDescription;
                }

                GoodsDescriptionContainerDescription.prototype.equals = function (GoodsContainer) {
                    if (this.ContainerDescription === GoodsContainer.ContainerDescription && this.GoodsDescription === GoodsContainer.GoodsDescription) {
                        return true;
                    }
                    return false;
                }

                GoodsDescriptionContainerDescription.prototype.toString = function () {
                    return JSON.stringify({
                        ContainerDescription: this.ContainerDescription, GoodsDescription: this.GoodsDescription
                    }).replaceAll("'", "\\'");
                }
                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var tripOption = $telerik.findElement(container, "lblTripOption").innerHTML;
                        var billOption = $telerik.findElement(container, "lblBillOption").innerHTML;
                        var billSizeType = $telerik.findElement(container, "lblBillSizeType").innerHTML;
                        args.set_value(new TripOption_BillOption(tripOption, billOption, billSizeType));
                    }
                    if (args.get_columnUniqueName() === "RequiredDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var RequiredText = $telerik.findElement(Container, "lblRequire").innerText;
                        var Required = null;
                        if (RequiredText)
                            Required = moment(RequiredText, "DD/MMM/YYYY").toDate();
                        var Date = $telerik.findElement(Container, "lblDate").innerText;
                        args.set_value(new RequireDate(Required, Date));
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/Trailer") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var vehNo = $telerik.findElement(container, "lblVehNo").innerHTML;
                        var driver = $telerik.findElement(container, "lblDriver").innerHTML;
                        var trailerNo = $telerik.findElement(container, "lblTrailerNo").innerHTML;
                        var trailerPark = $telerik.findElement(container, "lblTrailerPark").innerHTML;
                        args.set_value(new VehicleDriverTrailer(vehNo, driver, trailerNo, trailerPark));
                    }
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var addrTxt = $telerik.findElement(container, "lblFrAddr").innerText;
                        var servicePtDescr = $telerik.findElement(container, "lblFrServicePtDescr").innerText;
                        args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt));
                    }
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var addrTxt = $telerik.findElement(container, "lblToAddr").innerText;
                        var servicePtDescr = $telerik.findElement(container, "lblToServicePtDescr").innerText;
                        args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt));
                    }
                    if (args.get_columnUniqueName() === "ContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ContainerNo = $telerik.findElement(Container, "ContainerNoLbl").innerHTML;
                        var SealNo = $telerik.findElement(Container, "SealNoLbl").innerHTML;
                        args.set_value(new ContainerNoSealNo(ContainerNo, SealNo));
                    }

                    if (args.get_columnUniqueName() === "ExecutionDateTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ExecutionDate = $telerik.findElement(Container, "FrExpDateLbl").innerText;
                        var FromTime = $telerik.findElement(Container, "FromTimeLbl").innerText;
                        var ToTime = $telerik.findElement(Container, "ToTimeLbl").innerText;

                        args.set_value(new ExecutionDateTime(ExecutionDate, FromTime, ToTime));
                    }
                    if (args.get_columnUniqueName() === "NoOfPLT/Packages") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var NoOfPLT = $telerik.findElement(Container, "NoOfPLTLbl").innerHTML;
                        var Packages = $telerik.findElement(Container, "PackagesLbl").innerHTML;
                        args.set_value(new NoOfPLTPackages(NoOfPLT, Packages));
                    }
                    if (args.get_columnUniqueName() === "GoodsWT/GoodsVOL") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var GoodsWT = $telerik.findElement(Container, "GoodsWTLbl").innerHTML;
                        var GoodsVOL = $telerik.findElement(Container, "GoodsVOLLbl").innerHTML;
                        args.set_value(new GoodsWTGoodsVOL(GoodsWT, GoodsVOL));
                    }
                    if (args.get_columnUniqueName() === "GoodsDescription/ContainerDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ContainerDescription = $telerik.findElement(Container, "CtnrDescrLbl").innerHTML;
                        var GoodsDescription = $telerik.findElement(Container, "GoodsDescrLbl").innerHTML;
                        args.set_value(new GoodsDescriptionContainerDescription(GoodsDescription, ContainerDescription));
                    }
                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblTripOption").innerHTML = value.tripOption;                       
                    }
                    if (args.get_columnUniqueName() === "RequiredDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        if (Value.Required)
                            $telerik.findElement(Container, "lblRequire").innerText = moment(Value.Required).format("DD/MMM/YYYY");
                        else
                            $telerik.findElement(Container, "lblRequire").innerText = "";
                        $telerik.findElement(Container, "lblDate").innerText = Value.Date;
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/Trailer") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblVehNo").innerText = value.vehNo;
                        $telerik.findElement(container, "lblDriver").innerText = value.driver;
                        $telerik.findElement(container, "lblTrailerNo").innerText = value.trailerNo;
                        $telerik.findElement(container, "lblTrailerPark").innerText = value.trailerPark;
                    }
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblFrServicePtDescr").innerText = value.servicePtDescr;
                        $telerik.findElement(container, "lblFrAddr").innerText = value.addrTxt;
                    }
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblToServicePtDescr").innerText = value.servicePtDescr;
                        $telerik.findElement(container, "lblToAddr").innerText = value.addrTxt;
                    }
                    if (args.get_columnUniqueName() === "ContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "ContainerNoLbl").innerHTML = Value.ContainerNo;
                        $telerik.findElement(Container, "SealNoLbl").innerHTML = Value.SealNo;
                    }

                    if (args.get_columnUniqueName() === "ExecutionDateTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();

                        $telerik.findElement(Container, "FrExpDateLbl").innerHTML = Value.ExecutionDate;
                        $telerik.findElement(Container, "FromTimeLbl").innerHTML = Value.FromTime;
                        $telerik.findElement(Container, "ToTimeLbl").innerHTML = Value.ToTime;
                    }
                    if (args.get_columnUniqueName() === "NoOfPLT/Packages") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "NoOfPLTLbl").innerHTML = Value.NoOfPLT;
                        $telerik.findElement(Container, "PackagesLbl").innerHTML = Value.Packages;
                    }
                    if (args.get_columnUniqueName() === "GoodsWT/GoodsVOL") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "GoodsWTLbl").innerHTML = Value.GoodsWT;
                        $telerik.findElement(Container, "GoodsVOLLbl").innerHTML = Value.GoodsVOL;
                    }
                    if (args.get_columnUniqueName() === "GoodsDescription/ContainerDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "CtnrDescrLbl").innerHTML = Value.ContainerDescription;
                        $telerik.findElement(Container, "GoodsDescrLbl").innerHTML = Value.GoodsDescription;
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            tripOption = $telerik.findControl(container, "TripOptionList").get_selectedItem().get_text(),
                            tripOptionValue = $telerik.findControl(container, "TripOptionList").get_selectedItem().get_value();
                        args.set_value(new TripOption_BillOption(tripOption, null, null, tripOptionValue, null));
                    }
                    if (args.get_columnUniqueName() === "RequiredDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Required = $telerik.findControl(Container, "RequireDP").get_selectedDate(),
                            Date = $telerik.findControl(Container, "DateTxt").get_value();
                        args.set_value(new RequireDate(Required, Date));
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/Trailer") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            vehNo = $telerik.findControl(container, "VehicleList").get_text(),
                            vehNoValue = ($telerik.findControl(container, "VehicleList").get_value().split("|"))[0],
                            driver = $telerik.findControl(container, "DriverList").get_text(),
                            driverValue = $telerik.findControl(container, "DriverList").get_value(),
                            trailerNo = $telerik.findControl(container, "TrailerNoList").get_text(),
                            trailerNoValue = $telerik.findControl(container, "TrailerNoList").get_value(),
                            trailerPark = $telerik.findControl(container, "TrailerParkList").get_text(),
                            trailerParkValue = $telerik.findControl(container, "TrailerParkList").get_value();
                        args.set_value(new VehicleDriverTrailer(vehNo, driver, trailerNo, trailerPark, vehNoValue, driverValue, trailerNoValue, trailerParkValue));
                    }
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            addrTxt = $telerik.findControl(container, "FrAddrTxt").get_value(),
                            servicePtCode = ($telerik.findControl(container, "FrServicePtList").get_value().split("|"))[0],
                            servicePtDescr = $telerik.findControl(container, "FrServicePtList").get_text();
                        args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt, servicePtCode));
                    }
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            addrTxt = $telerik.findControl(container, "ToAddrTxt").get_value(),
                            servicePtCode = ($telerik.findControl(container, "ToServicePtList").get_value().split("|"))[0],
                            servicePtDescr = $telerik.findControl(container, "ToServicePtList").get_text();
                        args.set_value(new ServicePtDescr_AddrTxt(servicePtDescr, addrTxt, servicePtCode));
                    }
                    if (args.get_columnUniqueName() === "ContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ContainerNo = $telerik.findControl(Container, "ContainerNoTxt").get_value(),
                            SealNo = $telerik.findControl(Container, "SealNoTxt").get_value();
                        args.set_value(new ContainerNoSealNo(ContainerNo, SealNo));
                    }

                    if (args.get_columnUniqueName() === "ExecutionDateTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var ExecutionDatePicker = $telerik.findControl(Container, "ExecutionDatePicker");
                        var ExecutionDate = ExecutionDatePicker.get_dateInput().get_value();
                        var FromTime = $telerik.findControl(Container, "FromTimePicker").get_dateInput().get_value();
                        var ToTime = $telerik.findControl(Container, "ToTimePicker").get_dateInput().get_value();
                        args.set_value(new ExecutionDateTime(ExecutionDate, FromTime, ToTime));
                    }
                    if (args.get_columnUniqueName() === "NoOfPLT/Packages") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            NoOfPLT = $telerik.findControl(Container, "NoOfPLTTxt").get_value(),
                            Packages = $telerik.findControl(Container, "PackagesTxt").get_value();
                        args.set_value(new NoOfPLTPackages(NoOfPLT, Packages));
                    }
                    if (args.get_columnUniqueName() === "GoodsWT/GoodsVOL") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            GoodsWT = $telerik.findControl(Container, "GoodsWTTxt").get_value(),
                            GoodsVOL = $telerik.findControl(Container, "GoodsVOLTxt").get_value();
                        args.set_value(new GoodsWTGoodsVOL(GoodsWT, GoodsVOL));
                    }
                    if (args.get_columnUniqueName() === "GoodsDescription/ContainerDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            ContainerDescription = $telerik.findControl(Container, "CtnrDescrTxt").get_value(),
                            GoodsDescription = $telerik.findControl(Container, "GoodsDescrTxt").get_value();
                        args.set_value(new GoodsDescriptionContainerDescription(ContainerDescription, GoodsDescription));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "BillSizeTypeList").get_textElement().innerHTML = value.billSizeType;

                        $telerik.findControl(container, "TripOptionList").findItemByText(value.tripOption).select();
                        $telerik.findControl(container, "BillOptionList").get_textElement().innerHTML = value.billOption;
                    }
                    if (args.get_columnUniqueName() === "RequiredDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "RequireDP").set_selectedDate(Value.Required);
                        $telerik.findControl(Container, "DateTxt").set_value(Value.Date);
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/Trailer") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        if ($telerik.findControl(container, "VehicleList") && $telerik.findControl(container, "VehicleList").findItemByText(value.vehNo))
                            $telerik.findControl(container, "VehicleList").findItemByText(value.vehNo).select();
                        else
                            $telerik.findControl(container, "VehicleList").set_text(value.vehNo);

                        if ($telerik.findControl(container, "DriverList") && $telerik.findControl(container, "DriverList").findItemByText(value.driver))
                            $telerik.findControl(container, "DriverList").findItemByText(value.driver).select();
                        else
                            $telerik.findControl(container, "DriverList").set_text(value.driver);

                        if ($telerik.findControl(container, "TrailerNoList") && $telerik.findControl(container, "TrailerNoList").findItemByText(value.trailerNo))
                            $telerik.findControl(container, "TrailerNoList").findItemByText(value.trailerNo).select();
                        else
                            $telerik.findControl(container, "TrailerNoList").set_text(value.trailerNo);

                        if ($telerik.findControl(container, "TrailerParkList") && $telerik.findControl(container, "TrailerParkList").findItemByText(value.trailerPark))
                            $telerik.findControl(container, "TrailerParkList").findItemByText(value.trailerPark).select();
                        else
                            $telerik.findControl(container, "TrailerParkList").set_text(value.trailerPark);
                    }
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "FrAddrTxt").set_value(value.addrTxt);

                        if ($telerik.findControl(container, "FrServicePtList") && $telerik.findControl(container, "FrServicePtList").findItemByText(value.servicePtDescr))
                            $telerik.findControl(container, "FrServicePtList").findItemByText(value.servicePtDescr).select();
                        else
                            $telerik.findControl(container, "FrServicePtList").set_text(value.servicePtDescr);
                    }
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "ToAddrTxt").set_value(value.addrTxt);

                        if ($telerik.findControl(container, "ToServicePtList") && $telerik.findControl(container, "ToServicePtList").findItemByText(value.servicePtDescr))
                            $telerik.findControl(container, "ToServicePtList").findItemByText(value.servicePtDescr).select();
                        else
                            $telerik.findControl(container, "ToServicePtList").set_text(value.servicePtDescr);
                    }
                    if (args.get_columnUniqueName() === "ContainerNo/SealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "ContainerNoTxt").set_value(Value.ContainerNo);
                        $telerik.findControl(Container, "SealNoTxt").set_value(Value.SealNo);
                    }

                    if (args.get_columnUniqueName() === "ExecutionDateTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "ExecutionDatePicker").get_dateInput().set_value(Value.ExecutionDate);
                        $telerik.findControl(Container, "FromTimePicker").get_dateInput().set_value(Value.FromTime);
                        $telerik.findControl(Container, "ToTimePicker").get_dateInput().set_value(Value.ToTime);
                    }
                    if (args.get_columnUniqueName() === "NoOfPLT/Packages") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "NoOfPLTTxt").set_value(Value.NoOfPLT);
                        $telerik.findControl(Container, "PackagesTxt").set_value(Value.Packages);
                    }
                    if (args.get_columnUniqueName() === "GoodsWT/GoodsVOL") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "GoodsWTTxt").set_value(Value.GoodsWT);
                        $telerik.findControl(Container, "GoodsVOLTxt").set_value(Value.GoodsVOL);
                    }
                    if (args.get_columnUniqueName() === "GoodsDescription/ContainerDescription") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "CtnrDescrTxt").set_value(Value.ContainerDescription);
                        $telerik.findControl(Container, "GoodsDescrTxt").set_value(Value.GoodsDescription);
                    }
                }
            </script>
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

                //function RowSelected(sender, eventArgs) {
                //    // toggle the checkbox
                //    var checkbox = eventArgs.get_item().findElement('chkObjective');
                //    checkbox.checked = !checkbox.checked; //true;
                //}

                function RowSelected(sender, eventArgs) {
                    // uncheck all other checkbox first
                    var inputElements = document.getElementsByTagName('input');
                    for (var i = 0; i < inputElements.length; i++) {
                        var myElement = inputElements[i];
                        if (myElement.type === "checkbox") {
                            myElement.checked = false;
                        }
                    }

                    // checked the checkbox
                    var checkbox = eventArgs.get_item().findElement('chkObjective');
                    checkbox.checked = true;
                }

                function TrailerNoList_SelectedIndexChange(sender, args, controlIdToUpdate, defaultField) {
                    var controlIdToUpdate = 'TrailerParkList', defaultField = 'vehparkcode'
                    var newValue = sender.get_selectedItem().get_attributes().getAttribute(defaultField);

                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    if ($telerik.findControl(currentRow, controlIdToUpdate) && $telerik.findControl(currentRow, controlIdToUpdate).findItemByValue(newValue))
                        $telerik.findControl(currentRow, controlIdToUpdate).findItemByValue(newValue).select();
                    else {
                        if (!newValue) {
                            if ($telerik.findControl(currentRow, controlIdToUpdate) && $telerik.findControl(currentRow, controlIdToUpdate).findItemByText(''))
                                $telerik.findControl(currentRow, controlIdToUpdate).findItemByText('').select();
                            else
                                $telerik.findControl(currentRow, controlIdToUpdate).set_text('');
                        } else
                            $telerik.findControl(currentRow, controlIdToUpdate).set_value(newValue);
                    }
                }

                function TrailerNoList_ClientDropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var TrailerNo = $telerik.findControl(currentRow, "TrailerNoList").get_value();

                    if (TrailerNo != null && TrailerNo != "") {
                        $.ajax({
                            url: 'TripPlanningV6AllTrip.aspx/CheckUsedTrailerNo',
                            data: '{TrailerNo: "' + TrailerNo + '"}',
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                if (result.d) {
                                    if (result.d) {
                                        var ReturnVal = result.d;
                                        if (ReturnVal != "") {
                                            alert(ReturnVal);
                                        }
                                    }
                                }
                            },
                            failure: function (response) {
                                alert('Error Occur: Check TrailerNo Again.');
                            }
                        });
                    }
                }

                function TrailerParkList_TrailerNoList_filter(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var trailerNoList = $telerik.findControl(currentRow, "TrailerNoList");
                    var trailerParkList = $telerik.findControl(currentRow, "TrailerParkList");
                    if (trailerParkList.get_text()) { // if the selected text is not empty
                        // filter TrailerNoList comboBox items to those that match <vehParkCode> === <this current selected value>
                        var trailerNoListItems = trailerNoList.get_items();
                        for (var i = 0; i < trailerNoListItems.get_count(); i++) {
                            var item = trailerNoListItems.getItem(i);
                            var vehParkCodeAttribute = item.get_attributes().getAttribute('vehparkcode');

                            if (!item.get_text()) {
                                // don't hide empty item
                                item.show();
                            }
                            else if (!vehParkCodeAttribute) {
                                item.hide(); // hide empty vehParkCode
                            }
                            else if (vehParkCodeAttribute.toLowerCase() !== trailerParkList.get_value().toLowerCase()) {
                                item.hide();
                            }
                            else {
                                item.show();
                            }
                        }
                        trailerNoList.commitChanges();
                    } else
                        trailerNoList.setAllItemsVisible(true); // set all to visible since trailerParkList is not selected
                }

            <%--On Vehicle SelectedIndexchange, show the default driver on Driver column--%>
                function VehicleList_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var VehicleList = $telerik.findControl(currentRow, "VehicleList").get_value();

                    if (VehicleList != null && VehicleList != "") {
                        var VehNoDriverPair = VehicleList.split("|");
                        var DefaultDriverId = VehNoDriverPair[1];
                        var DefaultDriverName = VehNoDriverPair[2];

                        if ($telerik.findControl(currentRow, "DriverList") && $telerik.findControl(currentRow, "DriverList").findItemByText(DefaultDriverName))
                            $telerik.findControl(currentRow, "DriverList").findItemByText(DefaultDriverName).select();
                        else
                            $telerik.findControl(currentRow, "DriverList").set_text(DefaultDriverName);
                    }
                    else {
                        $telerik.findControl(currentRow, "DriverList").set_text("");
                    }
                }

            <%--On FrServicePtList SelectedIndexchange, show the default address in the text box--%>
                function FrServicePtList_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var FrServicePtList = $telerik.findControl(currentRow, "FrServicePtList").get_value();

                    if (FrServicePtList != null && FrServicePtList != "") {
                        var FrServicePtAddrPair = FrServicePtList.split("|");
                        $telerik.findControl(currentRow, "FrAddrTxt").set_value(FrServicePtAddrPair[1]); // set the default address in the TextBox
                    }
                }

            <%--On ToServicePtList SelectedIndexchange, show the default address in the text box--%>
                function ToServicePtList_DropDownClosed(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var ToServicePtList = $telerik.findControl(currentRow, "ToServicePtList").get_value();

                    if (ToServicePtList != null && ToServicePtList != "") {
                        var ToServicePtAddrPair = ToServicePtList.split("|");
                        $telerik.findControl(currentRow, "ToAddrTxt").set_value(ToServicePtAddrPair[1]); // set the default address in the TextBox
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>

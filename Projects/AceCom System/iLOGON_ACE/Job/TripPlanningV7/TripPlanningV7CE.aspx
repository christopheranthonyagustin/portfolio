<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7CE.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7CE" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV7CE</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%-- MomentJs is used to parse string into date object --%>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Collect Empty" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Export" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Import" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Return Empty" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="RRETab" Text="Ready Return Empty" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Local/OneWay" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Loose Cargo" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shifting/Detour" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab id="JobScheduling" Text="JobScheduling" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab id="CompletedTab" Text="Completed" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab id="ContainerSearchTab" Text="ContainerSearch" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab id="AllTripTab" Text="AllTrip" Value="700" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="92%" ID="HeaderRadPageView">
                <table class="headerbutton">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                                Text="Refresh" OnClick="RefreshBtn_Click" UseSubmitBehavior="false" />
                            <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                                Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="CMSBtn" runat="server" CssClass="white" OnClick="CMSBtn_Click"
                                Text="CMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="SaveAssignBtn" runat="server" CssClass="LongLabelWhite" OnClick="SaveAssignBtn_Click"
                                Text="Save & Assign" OnClientClick="disableBtn(this.id); saveChangesToGrid()" UseSubmitBehavior="false" />
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="DetourBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="DetourBtn_Click" Text="Detour" />
                            <asp:Button ID="InternalShiftingBtn" runat="server" CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="InternalShiftingBtn_Click" Text="Internal Shifting" />
                            <asp:Button ID="DoubleBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="DoubleBtn_Click" Text="Double" />
                            <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="PaymentBtn_Click" Text="Payment" />
                            <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="IncentiveBtn_Click" Text="Incentive" />
                            <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="ChargeBtn_Click" Text="Charge" />
                            <asp:Button ID="ImportantBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="ImportantBtn_Click" Text="Important" />
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" UseSubmitBehavior="false" OnClick="ExcelBtn_Click" Text="Excel" />
                        </td>
                        <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%-- Width="175%"--%>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Silk" RenderMode="Lightweight" AllowPaging="true"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true" Height="98%"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true"
                            AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true" OnPreRender="ResultDG_PreRender" OnBatchEditCommand="ResultDG_BatchEditCommand">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnRowSelected="RowSelected" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid"
                                PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="Top" TableLayout="Auto" EditMode="Batch">
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
                                            <asp:ImageButton runat="server" ID="BookImg" ImageUrl="../../image/pickdetail.gif" BorderWidth="0" CausesValidation="false"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Book" OnClick="BookImg_Click"></asp:ImageButton>
                                            <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcImg_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CMS" DataField="CMSDone" HeaderText="CMS" AllowFiltering="false" HeaderStyle-Width="45px" ItemStyle-Width="45px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="CMSDoneLbl" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Required/Date" HeaderText="Required <br/> Date" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center"
                                        AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="ExpDate" DataField="ExpDateBookingTimeFormat">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblRequire" Text='<%# DataBinder.Eval(Container.DataItem, "ExpDateBookingTime", "{0:dd/MMM/yyyy <br/> HH:mm}")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDate" Text='<%# DataBinder.Eval(Container.DataItem, "EqpRemarks")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDateTimePicker runat="server" ID="RequireDP" Skin="Office2007" Width="140px"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00">
                                            </telerik:RadDateTimePicker>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DateTxt" TextMode="SingleLine" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobNo" ItemStyle-HorizontalAlign="Center" DataField="JobNo"
                                        HeaderText="JobNo" SortExpression="JobNo" AutoPostBackOnFilter="true" ItemStyle-Width="117px" HeaderStyle-Width="117px" FilterControlWidth="60px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("JobNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Account/BookingNo" DataField="AcBookingNoEndCustomerPortnetNo" ItemStyle-HorizontalAlign="Center"
                                        HeaderText="Account <br/> BookingNo <br/> EndCustomer <br/> PortnetNo" SortExpression="AcCode" AutoPostBackOnFilter="true" ItemStyle-Width="135px" HeaderStyle-Width="135px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("AcBookingNoEndCustomerPortnetNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/Trailer" HeaderText="Vehicle <br/> Driver<br/> TrailerPark<br/> TrailerNo" ItemStyle-HorizontalAlign="Center"
                                        SortExpression="VehNo" AllowFiltering="true" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowSorting="true" DataField="VehicleDriverTrailerParkTrailerNo" AutoPostBackOnFilter="true">
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
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="DriverCBB_ItemsRequested"
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
                                                OnLoad="TrailerNoList_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px" OnItemDataBound="TrailerNoList_ItemDataBound"
                                                AllowCustomText="false" Filter="Contains" OnClientDropDownOpening="TrailerParkList_TrailerNoList_filter"
                                                OnClientSelectedIndexChanged="TrailerNoList_SelectedIndexChange" OnClientDropDownClosed="TrailerNoList_ClientDropDownClosed">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BillSizeType/TripOption/BillOption" HeaderText="BillSizeType <br/> TripOption <br/> BillOption"
                                        SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center">
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
                                                RenderMode="Lightweight" OnLoad="TripOptionDDL_Load" Width="140px">
                                            </telerik:RadDropDownList>
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOptionList" runat="server" Skin="WebBlue"
                                                OnLoad="BillOptionListDDL_Load" RenderMode="Lightweight" Width="140px">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status"
                                        SortExpression="StatusDescr" AllowFiltering="false" AllowSorting="true">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="84px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="84px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
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
                                    <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="JobSpecialInstruction" SortExpression="JobSpecialInstruction"
                                        AllowFiltering="false" ItemStyle-Width="145px" HeaderStyle-Width="145px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ContainerNo/SealNo" HeaderText="ContainerNo <br/> SealNo <br/> CrossDockContainer"
                                        SortExpression="ContainerNo" AllowFiltering="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="ContainerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>' Style="text-transform: uppercase"></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="CtnrStatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CtnrStatus")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="CrossDockContainerLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CrossDockContainer")%>'></asp:Label>
                                            &nbsp;
                                            <asp:Label runat="server" ID="TransLoadingLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Transloading")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ContainerNoTxt" TextMode="SingleLine" Width="130px" Style="text-transform: uppercase">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="SealNoTxt" TextMode="SingleLine" Width="130px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ETA/Vessel/Voyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage" ItemStyle-HorizontalAlign="Center" SortExpression="Vessel" AutoPostBackOnFilter="true" ItemStyle-Width="170px" HeaderStyle-Width="170px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblETA" Text='<%# Eval("INETA","{0:dd/MMM/yyyy HH:mm }") %>' Width="160px" CssClass="wordwrap"></asp:Label>
                                            <asp:Label runat="server" ID="lblVessel" Text='<%# Eval("Vessel") %>' Width="150px" CssClass="wordwrap"></asp:Label>
                                            <asp:Label runat="server" ID="lblVoyage" Text='<%# Eval("Voyage") %>' Width="150px" CssClass="wordwrap"></asp:Label>
                                            <br />
                                            </br>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDateTimePicker runat="server" ID="ETADateTime" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Office2007" Width="150px"></telerik:RadDateTimePicker>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="VesselList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="VesselList_ItemsRequested"
                                                HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                            </telerik:RadComboBox>

                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="VoyageTxt" TextMode="SingleLine" Width="110px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Shipper" HeaderText="Shipper" DataField="Shipper" ItemStyle-Width="150px" HeaderStyle-Width="150px"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Shipper" AutoPostBackOnFilter="true" FilterControlWidth="75px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("Shipper")) %>
                                            <br />
                                            </br>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ShipperList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ShipperCBB_ItemsRequested"
                                                HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="Trip <br/> SpecialInstruction" SortExpression="TripSpecialInstruction"
                                        AllowFiltering="false" ItemStyle-Width="125px" HeaderStyle-Width="125px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Width="110px" TextMode="MultiLine" Rows="3"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="InternalDocNo/OutsourceDocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                        SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                                 </br>
                                                 </br>
                                            <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CtnrDescr" HeaderText="ContainerDescription" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ContainerDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="CtnrDescrTxt" TextMode="MultiLine" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
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
                                    <telerik:GridTemplateColumn UniqueName="ContainerRemarks" HeaderText="ContainerRemarks" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Remarks")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ContainerRemarksTxt" TextMode="MultiLine" Width="140px" ReadOnly="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Carrier" ItemStyle-HorizontalAlign="Center" HeaderText="Carrier"
                                        SortExpression="Carrier" AllowFiltering="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CarrierName")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                    <telerik:GridBoundColumn DataField="status" Display="false" UniqueName="Status"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RequiredDateColour2" UniqueName="RequiredDateColour2" Display="False" />
                                    <telerik:GridBoundColumn DataField="CMSDone" UniqueName="CMSV" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                                    <telerik:GridBoundColumn DataField="TripOption" UniqueName="TripOption" Display="False" />
                                    <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" Display="False" />
                                    <telerik:GridBoundColumn DataField="CrossDockContainer" UniqueName="CrossDockContainer" Display="False" />
                                    <telerik:GridBoundColumn DataField="HTMLColourCode1" UniqueName="HTMLColourCode1" Display="False" />
                                    <telerik:GridBoundColumn DataField="CrossDockCtnrId" UniqueName="CrossDockCtnrId" Display="False" />
                                    <telerik:GridBoundColumn DataField="ContainerNo" UniqueName="ContainerNo" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="92%" ID="EXPRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="IMPRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="RERadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="RRERadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="OthersRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="LCRRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="SDRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="JobSchedulingRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="CompletedRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="ContainerSearchRadPageView" />
            <telerik:RadPageView runat="server" Height="92%" ID="AllTripRadPageView" />
        </telerik:RadMultiPage>

        <asp:HiddenField ID="HiddenField" runat="server" />
        <telerik:RadWindow ID="AttcIconRadWindow" runat="server" VisibleOnPageLoad="true" Title="Attc @ TripPlanningV6" Width="800px" Height="600px"
            NavigateUrl='<%# "TripPlanningV6Attc.aspx?JBId="+ HiddenField.Value %>'
            Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>

        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                // originally taken from https://vanillajstoolkit.com/polyfills/stringreplaceall/
                /**
                 * String.prototype.replaceAll() polyfill
                 * https://gomakethings.com/how-to-replace-a-section-of-a-string-with-another-one-with-vanilla-js/
                 * @author Chris Ferdinandi
                 * @license MIT
                 */
                if (!String.prototype.replaceAll) {
                    String.prototype.replaceAll = function (str, newStr) {

                        // If a regex pattern
                        if (Object.prototype.toString.call(str).toLowerCase() === '[object regexp]') {
                            return this.replace(str, newStr);
                        }

                        // If a string
                        return this.replace(new RegExp(str, 'g'), newStr);

                    };
                }

                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function saveChangesToGrid() {
                    // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                    var grid = $find('<%=ResultDG.ClientID%>');
                    grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
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
                            url: 'TripPlanningV6CE.aspx/CheckUsedTrailerNo',
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
                        for (var i = 0; i < trailerNoListItems.get_count() ; i++) {
                            var item = trailerNoListItems.getItem(i);
                            var vehParkCodeAttribute = item.get_attributes().getAttribute('vehparkcode');

                            if (!item.get_text()) {
                                // don't hide empty item
                                item.show();
                            }
                            else if (!vehParkCodeAttribute) {
                                item.hide()
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

                var TripOption_BillOption = function (tripOption, billOption, billSizeType, tripOptionValue, billOptionValue) {
                    // to display the text to user
                    this.tripOption = tripOption;
                    this.billOption = billOption;
                    this.billSizeType = billSizeType; // non-editable

                    // for server use
                    this.tripOptionValue = tripOptionValue;
                    this.billOptionValue = billOptionValue;
                }
                TripOption_BillOption.prototype.equals = function (tripOption_BillOption) {
                    if (this.tripOption === tripOption_BillOption.tripOption &&
                        this.billOption === tripOption_BillOption.billOption) {
                        return true;
                    }
                    return false;
                }
                TripOption_BillOption.prototype.toString = function () {
                    return JSON.stringify({
                        tripOption: this.tripOptionValue,
                        billOption: this.billOptionValue,
                        tripOptionText: this.tripOption,
                        billOptionText: this.billOption
                    }).replaceAll("'", "\\'");
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
                        required = moment(this.Required).format("DD/MMM/YYYY HH:mm");
                    return JSON.stringify({
                        Required: required, Date: this.Date
                    }).replaceAll("'", "\\'");
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

                var ETAVesselVoyage = function (ETA, Voyage, Vessel, VesselValue) {
                    this.ETA = ETA; // in javascript date object                   
                    this.Voyage = Voyage;
                    this.Vessel = Vessel;
                    this.VesselValue = VesselValue;
                }

                ETAVesselVoyage.prototype.equals = function (etaVesselVoyage) {
                    if (((!this.ETA && !etaVesselVoyage.ETA) || moment(this.ETA).isSame(moment(etaVesselVoyage.ETA)))
                         && this.Voyage === etaVesselVoyage.Voyage && this.Vessel === etaVesselVoyage.Vessel) {
                        return true;
                    }
                    return false;
                }

                ETAVesselVoyage.prototype.toString = function () {
                    var ETA = null;
                    if (this.ETA)
                        ETA = moment(this.ETA).format("DD/MMM/YYYY HH:mm");
                    return JSON.stringify({
                        ETA: ETA, Voyage: this.Voyage, Vessel: this.Vessel, VesselValue: this.VesselValue
                    });
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

                function GetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container();
                        var tripOption = $telerik.findElement(container, "lblTripOption").innerHTML;
                        var billOption = $telerik.findElement(container, "lblBillOption").innerHTML;
                        var billSizeType = $telerik.findElement(container, "lblBillSizeType").innerHTML;
                        args.set_value(new TripOption_BillOption(tripOption, billOption, billSizeType));
                    }
                    if (args.get_columnUniqueName() === "Required/Date") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var RequiredText = $telerik.findElement(Container, "lblRequire").innerText;
                        var Required = null;
                        if (RequiredText)
                            Required = moment(RequiredText, "DD/MMM/YYYY HH:mm").toDate();
                        var Date = $telerik.findElement(Container, "lblDate").innerHTML;
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
                    if (args.get_columnUniqueName() === "ETA/Vessel/Voyage") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var unformattedETA = $telerik.findElement(Container, "lblETA").innerHTML;
                        var ETA = null;
                        if (unformattedETA)
                            ETA = moment(unformattedETA, "DD/MMM/YYYY HH:mm").toDate();

                        var Vessel = $telerik.findElement(Container, "lblVessel").innerHTML;
                        var Voyage = $telerik.findElement(Container, "lblVoyage").innerHTML;
                        args.set_value(new ETAVesselVoyage(ETA, Voyage, Vessel));
                    }
                }

                function SetCellValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblTripOption").innerHTML = value.tripOption;
                        $telerik.findElement(container, "lblBillOption").innerHTML = value.billOption;
                    }
                    if (args.get_columnUniqueName() === "Required/Date") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        if (Value.Required)
                            $telerik.findElement(Container, "lblRequire").innerText = moment(Value.Required).format("DD/MMM/YYYY HH:mm");
                        else
                            $telerik.findElement(Container, "lblRequire").innerText = "";
                        $telerik.findElement(Container, "lblDate").innerHTML = Value.Date;
                    }
                    if (args.get_columnUniqueName() === "Vehicle/Driver/Trailer") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();
                        $telerik.findElement(container, "lblVehNo").innerHTML = value.vehNo;
                        $telerik.findElement(container, "lblDriver").innerHTML = value.driver;
                        $telerik.findElement(container, "lblTrailerNo").innerHTML = value.trailerNo;
                        $telerik.findElement(container, "lblTrailerPark").innerHTML = value.trailerPark;
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
                    if (args.get_columnUniqueName() === "ETA/Vessel/Voyage") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        if (value.ETA)
                            $telerik.findElement(container, "lblETA").innerText = moment(value.ETA).format("DD/MMM/YYYY HH:mm");
                        else
                            $telerik.findElement(container, "lblETA").innerText = "";

                        $telerik.findElement(container, "lblVoyage").innerHTML = value.Voyage;
                        $telerik.findElement(container, "lblVessel").innerHTML = value.Vessel;
                    }
                }

                function GetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            tripOption = $telerik.findControl(container, "TripOptionList").get_selectedItem().get_text(),
                            tripOptionValue = $telerik.findControl(container, "TripOptionList").get_selectedItem().get_value(),
                            billOption = $telerik.findControl(container, "BillOptionList").get_selectedItem().get_text(),
                            billOptionValue = $telerik.findControl(container, "BillOptionList").get_selectedItem().get_value();
                        args.set_value(new TripOption_BillOption(tripOption, billOption, null, tripOptionValue, billOptionValue));
                    }
                    if (args.get_columnUniqueName() === "Required/Date") {
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
                    if (args.get_columnUniqueName() === "ETA/Vessel/Voyage") {
                        args.set_cancel(true);
                        var container = args.get_container(),

                            ETA = $telerik.findControl(container, "ETADateTime").get_selectedDate(),
                            Voyage = $telerik.findControl(container, "VoyageTxt").get_value(),
                            Vessel = $telerik.findControl(container, "VesselList").get_text(),
                            VesselValue = ($telerik.findControl(container, "VesselList").get_value().split("|"))[0];

                        args.set_value(new ETAVesselVoyage(ETA, Voyage, Vessel, VesselValue));
                    }
                }

                function SetEditorValue(sender, args) {
                    if (args.get_columnUniqueName() === "BillSizeType/TripOption/BillOption") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "BillSizeTypeList").get_textElement().innerHTML = value.billSizeType;

                        $telerik.findControl(container, "TripOptionList").findItemByText(value.tripOption).select();
                        $telerik.findControl(container, "BillOptionList").findItemByText(value.billOption).select();
                    }
                    if (args.get_columnUniqueName() === "Required/Date") {
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
                    if (args.get_columnUniqueName() === "ETA/Vessel/Voyage") {
                        args.set_cancel(true);
                        var container = args.get_container(),
                            value = args.get_value();

                        $telerik.findControl(container, "ETADateTime").set_selectedDate(value.ETA);

                        if ($telerik.findControl(container, "VesselList") && $telerik.findControl(container, "VesselList").findItemByText(value.Vessel))
                            $telerik.findControl(container, "VesselList").findItemByText(value.Vessel).select();
                        else
                            $telerik.findControl(container, "VesselList").set_text(value.Vessel);

                        $telerik.findControl(container, "VoyageTxt").set_value(value.Voyage);
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
                        //var DefaultDriverComboItem = $telerik.findElement(currentRow, "DriverList").getElementsByTagName("input")[0].value = DefaultDriverName;
                        //DefaultDriverComboItem.select();
                    }
                    else {
                        //$telerik.findElement(currentRow, "DriverList").getElementsByTagName("input")[0].value = "";
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

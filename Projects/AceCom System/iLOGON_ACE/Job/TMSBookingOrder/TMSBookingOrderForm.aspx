<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderForm.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Main @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="BillingInstruction" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Party" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ContainerTab" Text="Container" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="TripTab" Text="Containerized Trip" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ManpowerTab" Text="Manpower" Value="160" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="EquipmentRentalTab" Text="Equipment Rental" Value="165" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="DieselProjectTab" Text="Diesel Project" Value="167" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="JobSummaryTab" Text="JobSummary" Value="170" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Billable" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Payable" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="P&L" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="QRCode" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="450" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <telerik:RadMenu ID="RadMenu1" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Blue">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp; Print" PostBack="false">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>

        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="JobsheetBtn" CssClass="longlabelblue" runat="server" OnClick="JobsheetBtn_Click"
                                Text="Job Sheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td style="position: relative;">
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_BKO" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_JBDESCR" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_Ctnr" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_CtnrItem" runat="server"></iWMS:iForm>
                                            </td>
                                            <td style="position: absolute;">
                                                <iWMS:iForm ID="formCtl_Branch" runat="server" />
                                            </td>
                                        </tr>
                                    </table>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" Skin="Windows7" SelectedIndex="0" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab Text="Non-Containerized Trip" Value="5" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="NonContainerizedTripRadPageView">
                        <br />
                        &nbsp;
                <asp:Button ID="NewTripBtn" runat="server" CssClass="white" OnClick="NewTripBtn_Click"
                    Text="New Trip" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                    Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;   
                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                    Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp; 
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                    Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp; 
                <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        <asp:Button ID="DeleteTripBtn" runat="server" CssClass="white" OnClick="DeleteTripBtn_Click"
                            Text="Delete Trip" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="TripDOBtn" Class="longlabelblue" runat="server" OnClick="TripDOBtn_Click"
                    Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="MassChangeBtn" runat="server" Text="Mass Change" CausesValidation="false"
                    CssClass="LongLabelWhite" OnClick="MassChangeBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="DetourBtn" runat="server" Text="Detour" CausesValidation="false"
                    CssClass="White" OnClick="DetourBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="TripUpdateBtn" runat="server" Text="Trip Update" CausesValidation="false"
                    CssClass="White" OnClick="TripUpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="TransferBtn" runat="server" Text="Transfer to Job" CausesValidation="false"
                    CssClass="LongLabelWhite" OnClick="TransferBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="PopToGR" runat="server" Text="Populate GR" CausesValidation="false"
                    CssClass="LongLabelGreen" OnClick="PopToGR_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="PopToGI" runat="server" Text="Populate GI" CausesValidation="false"
                    CssClass="LongLabelGreen" OnClick="PopToGI_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        <br />
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" RenderMode="Lightweight"
                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand">
                            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBTripId" Name="MainGrid" EditMode="Batch" AllowFilteringByColumn="false" CommandItemDisplay="TopAndBottom">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="SelectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="Icon" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton runat="server" ID="Add" ImageUrl="../../image/add.png"
                                        Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                        BorderWidth="0"></asp:ImageButton>
                                            <asp:Label runat="server" ID="CrescentMoonLbl" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShTypeJobTypeTripType" HeaderText="ShipmentType <br/> JobType <br/> TripType" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="ShTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ShipmentTypeDescr")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="JobTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "JobTypeDescr")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="TripTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TripTypeDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BillSizeTypeBillOption1" HeaderText="BillSizeType <br> BillOption1" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="BillSizeTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillSizeTypeDescr")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="BillOption1Lbl" Text='<%# DataBinder.Eval(Container.DataItem, "BillOption1Descr")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="FrExpToActDate" HeaderText="FromDate <br> ToDate" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="FrExpDateLbl" Text='<%#  string.Format("{0:dd/MMM/yyyy}",Eval("frexpdate"))%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="ToActDateLbl" Text='<%#  string.Format("{0:dd/MMM/yyyy}",Eval("toactdate"))%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="FrExpDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <br />
                                            <br />
                                            <telerik:RadDatePicker ID="ToActDatePicker" runat="server" Skin="Office2007" Width="140px" DateInput-DateFormat="dd/MMM/yyyy"
                                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripFrToExpTime" HeaderText="Expected <br/> From <br/> To" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="FrExpTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrExpTime")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="ToExpTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToExpTime")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTimePicker runat="server" ID="FrExpTimePicker" Skin="Office2007" Width="140px" TimeView-Interval="00:30:00" TimeView-TimeFormat="HH:mm"
                                                DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                                <ClientEvents OnDateSelected="FrExpTimeValueChanged" />
                                            </telerik:RadTimePicker>
                                            <br />
                                            <br />
                                            <telerik:RadTimePicker runat="server" ID="ToExpTimePicker" Skin="Office2007" Width="140px" TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00"
                                                DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                                <ClientEvents OnDateSelected="ToExpTimeValueChanged" />
                                            </telerik:RadTimePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripFrToActTime" HeaderText="Actual <br/> From <br/> To" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="FrActTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrActTime")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="ToActTimeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToActTime")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTimePicker runat="server" ID="FrActTimePicker" Skin="Office2007" Width="140px" TimeView-Interval="00:30:00" TimeView-TimeFormat="HH:mm"
                                                DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                            </telerik:RadTimePicker>
                                            <br />
                                            <br />
                                            <telerik:RadTimePicker runat="server" ID="ToActTimePicker" Skin="Office2007" Width="140px" TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00"
                                                DateInput-DisplayDateFormat="HH:mm" DateInput-DateFormat="HH:mm">
                                            </telerik:RadTimePicker>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="WorkThruLunch" HeaderText="WorkThroughLunch" HeaderStyle-Width="170px" ItemStyle-Width="170px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="WorkThroughLunchLbl" Text='<%# DataBinder.Eval(Container.DataItem, "WorkThruLunchDescr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="WorkThroughLunchDDL" runat="server" Skin="WebBlue" Width="160px" DropDownWidth="160px" OnLoad="WorkThroughLunchDDL_Load"></telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br> Driver" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="VehicleLbl" Text='<%# DataBinder.Eval(Container.DataItem, "VehNoDescr")%>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" ID="DriverLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="VehicleCombo" runat="server" DataTextField="Descr" DataValueField="Item" OnClientDropDownClosed="VehicleList_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="VehicleCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="DriverCombo_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TrailerNoTrailerPark" HeaderText="TrailerNo <br/> TrailerPark" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowSorting="true">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="TrailerNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TrailerNoDescr")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="TrailerParkLbl" Text='<%# DataBinder.Eval(Container.DataItem, "VehParkCode")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TrailerNoCombo" runat="server" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableLoadOnDemand="true"
                                                OnLoad="TrailerNoCombo_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px" AllowCustomText="false" Filter="Contains" DropDownAutoWidth="Enabled"
                                                OnItemDataBound="TrailerNo_ItemDataBound" OnClientSelectedIndexChanged="TrailerNo_SelectedIndexChange">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="TrailerParkCombo" runat="server" DataTextField="Descr" DataValueField="Item" RenderMode="Lightweight" EnableLoadOnDemand="true"
                                                OnLoad="TrailerParkCombo_Load" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px" AllowCustomText="false" Filter="Contains" DropDownAutoWidth="Enabled">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CtnrNoSealNo" HeaderText="ContainerNo <br/> SealNo" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="CtnrNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="SealNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="CtnrNoTxt" Width="140px" TextMode="SingleLine">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="SealNoTxt" Width="140px" TextMode="SingleLine">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DONo" HeaderText="DO Number" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("InternalDocNo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="DONoTxt" Width="140px" TextMode="SingleLine">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="PickUpServiceptLbl" Text='<%# DataBinder.Eval(Container.DataItem, "FrServicePt")%>'></asp:Label>
                                            <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("FrServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("FrAddr")))) ? "":"<br /><br />"%>
                                            <asp:Label runat="server" ID="PickUpAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="PickUpServicePtCombo" runat="server" DataTextField="descr" DataValueField="item"
                                                Skin="WebBlue" Width="120px" OnClientDropDownClosed="PickUpServicePt_DropDownClosed" DropDownAutoWidth="Enabled"
                                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                EnableLoadOnDemand="true" OnItemsRequested="ServicePtCombo_ItemsRequested">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="PickUpAddrTxt" TextMode="MultiLine" Rows="3" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="DropOffServiceptLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToServicePt")%>'></asp:Label>
                                            <%# (string.IsNullOrEmpty(string.Format("{0:}",Eval("ToServicePt"))) || string.IsNullOrEmpty(string.Format("{0:}",Eval("ToAddr")))) ? "":"<br /><br />"%>
                                            <asp:Label runat="server" ID="DropOffAddrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="DropOffServicePtCombo" runat="server" DataTextField="descr" DataValueField="item" OnClientDropDownClosed="DropOffServicePt_DropDownClosed"
                                                RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="ServicePtCombo_ItemsRequested" CausesValidation="false"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="DropOffAddrTxt" TextMode="MultiLine" Width="140px" Rows="3">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="EqpGoodsDescr" HeaderText="GoodsDescription" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("EqpGoodsDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="GoodsDescrTxt" Width="140px" Rows="3">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ActPkg" HeaderText="Packages" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:0.00}",Eval("ActPkg")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ActPkgTxt" TextMode="SingleLine" Width="140px" Rows="3">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripDescrTxt" Width="140px" Rows="3">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("EqpSpecialInstruction")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="EqpSpecialInstructionTxt" Width="140px" Rows="3">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="Status" ReadOnly="true" />
                                    <telerik:GridTemplateColumn UniqueName="ModifiedOn" HeaderText="ModifiedOn" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy hh:mm}",Eval("EditDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy hh:mm}",Eval("adddate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="AddUser" HeaderText="AddUser" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AddUser")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                                    <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="false" />
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="false" />
                                    <telerik:GridBoundColumn DataField="JBCtnrId" UniqueName="JBCtnrId" Display="false" />
                                    <telerik:GridBoundColumn DataField="acid" UniqueName="acid" Display="false" />
                                    <telerik:GridBoundColumn DataField="ShipmentType" Display="False" />
                                    <telerik:GridBoundColumn DataField="CrossDayJob" Display="False" />
                                    <telerik:GridBoundColumn DataField="TripDateColor" Display="False" />
                                    <telerik:GridBoundColumn DataField="ToActDate" Display="False" />
                                    <telerik:GridBoundColumn DataField="ToActDateColor" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>

                <asp:Panel ID="PackingPanel" runat="server">
                    <asp:UpdatePanel runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <br />
                            <telerik:RadGrid ID="PackingResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" EnableLinqExpressions="false" RenderMode="Lightweight" AllowFilteringByColumn="false"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="PackingResultDG_NeedDataSource" OnBatchEditCommand="PackingResultDG_BatchEditCommand">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" EditMode="Batch" AllowFilteringByColumn="false" CommandItemDisplay="TopAndBottom" DataKeyNames="Id">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="DimensionType" HeaderText="DimensionType" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="DimensionTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PackingTypeDescr")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="DimensionTypeCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                                    RenderMode="Lightweight" Skin="WebBlue" Width="140px" OnItemsRequested="DimensionTypeCombo_ItemsRequested"
                                                    HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                                </telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="WeightLbl" Text='<%# DataBinder.Eval(Container.DataItem, "WT")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="WeightTxt" Width="140px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Length" HeaderText="Length" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="LengthLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Length")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="LengthTxt" Width="140px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Width" HeaderText="Width" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="WidthLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Width")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="WidthTxt" Width="140px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Height" HeaderText="Height" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="HeightLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Height")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="HeightTxt" Width="140px">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Id" Display="false" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BillingInstructionRadPageView">
                <br />
                <asp:Button ID="UpdateBillingInstructionBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl_BillingInstruction" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="87%" ID="PartyRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="TripRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="ManpowerRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="EquipmentRentalRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="DieselProjectRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="JobSummaryRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="ChargeRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="PayableRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="PAndLRadPadeView" />
            <telerik:RadPageView runat="server" Height="87%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="QRCodePageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:PlaceHolder ID="QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="87%" ID="LogRadPageView" />
        </telerik:RadMultiPage>

        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    document.location.href = document.location.href;
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
            <script type="text/javascript">
            <%--Start Region : SelectedIndex Changed Event for Combobox And DropDownList --%>
                function PickUpServicePt_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var PickUpServicePt = $telerik.findControl(CurrentRow, "PickUpServicePtCombo").get_value();
                    if (PickUpServicePt != null && PickUpServicePt != "") {
                        var PickUpServicePtAddrPair = PickUpServicePt.split("|");
                        $telerik.findControl(CurrentRow, "PickUpAddrTxt").set_value(PickUpServicePtAddrPair[1]);
                    }
                }

                function DropOffServicePt_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var DropOffServicePt = $telerik.findControl(CurrentRow, "DropOffServicePtCombo").get_value();

                    if (DropOffServicePt != null && DropOffServicePt != "") {
                        var DropOffServicePtAddrPair = DropOffServicePt.split("|");
                        $telerik.findControl(CurrentRow, "DropOffAddrTxt").set_value(DropOffServicePtAddrPair[1]);
                    }
                }

                function VehicleList_DropDownClosed(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var VehicleList = $telerik.findControl(CurrentRow, "VehicleCombo").get_value();

                    if (VehicleList != null && VehicleList != "") {
                        var VehNoDriverPair = VehicleList.split("|");
                        var DefaultDriverId = VehNoDriverPair[1];
                        var DefaultDriverName = VehNoDriverPair[2];

                        if ($telerik.findControl(CurrentRow, "DriverCombo") && $telerik.findControl(CurrentRow, "DriverCombo").findItemByText(DefaultDriverName))
                            $telerik.findControl(CurrentRow, "DriverCombo").findItemByText(DefaultDriverName).select();
                        else
                            $telerik.findControl(CurrentRow, "DriverCombo").set_text(DefaultDriverName);
                    }
                    else {
                        $telerik.findControl(CurrentRow, "DriverCombo").set_text("");
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

                <%--Start Region : Selected Time Changed --%>

                function FrExpTimeValueChanged(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var FrExpTimePicker = $telerik.findControl(CurrentRow, "FrExpTimePicker");
                    var FrActTimePicker = $telerik.findControl(CurrentRow, "FrActTimePicker");
                    if (FrExpTimePicker != null && FrActTimePicker != null) {
                        var FrExpTime = FrExpTimePicker.get_dateInput().get_value();
                        FrActTimePicker.get_dateInput().set_value(FrExpTime);
                    }
                }

                function ToExpTimeValueChanged(sender, args) {
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var ToExpTimePicker = $telerik.findControl(CurrentRow, "ToExpTimePicker");
                    var ToActTimePicker = $telerik.findControl(CurrentRow, "ToActTimePicker");
                    if (ToExpTimePicker != null && ToActTimePicker != null) {
                        var ToExpTime = ToExpTimePicker.get_dateInput().get_value();
                        ToActTimePicker.get_dateInput().set_value(ToExpTime);
                    }
                }

                <%--End Region : Selected Time Changed --%>
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
            <script type="text/javascript">
                //TripFrToExpTime
                var TripFrToExpTime = function (FrExpTime, ToExpTime) {
                    this.FrExpTime = FrExpTime;
                    this.ToExpTime = ToExpTime;
                }

                TripFrToExpTime.prototype.equals = function (tripfrtoexptime) {
                    if (this.FrExpTime === tripfrtoexptime.FrExpTime && this.FrActTime === tripfrtoexptime.ToExpTime) {
                        return true;
                    }
                    return false;
                }

                TripFrToExpTime.prototype.toString = function () {
                    return JSON.stringify({
                        FrExpTime: this.FrExpTime, ToExpTime: this.ToExpTime
                    });
                }

                //TripFrToDate
                var TripFrToDate = function (FrExpDate, ToActDate) {
                    this.FrExpDate = FrExpDate;
                    this.ToActDate = ToActDate;
                }

                TripFrToDate.prototype.equals = function (tripfrtodate) {
                    if (this.FrExpDate === tripfrtodate.FrExpDate && this.ToActDate === tripfrtodate.ToActDate) {
                        return true;
                    }
                    return false;
                }

                TripFrToDate.prototype.toString = function () {
                    return JSON.stringify({
                        FrExpDate: this.FrExpDate, ToActDate: this.ToActDate
                    });
                }

                //TripFrToActTime
                var TripFrToActTime = function (FrActTime, ToActTime) {
                    this.FrActTime = FrActTime;
                    this.ToActTime = ToActTime;
                }

                TripFrToActTime.prototype.equals = function (tripfrtoacttime) {
                    if (this.FrActTime === tripfrtoacttime.FrActTime && this.ToActTime === tripfrtoacttime.ToActTime) {
                        return true;
                    }
                    return false;
                }

                TripFrToActTime.prototype.toString = function () {
                    return JSON.stringify({
                        FrActTime: this.FrActTime, ToActTime: this.ToActTime
                    });
                }

                //VehicleDriver
                var VehicleDriver = function (VehNo, Driver, VehNoValue, DriverValue) {
                    this.VehNo = VehNo;
                    this.VehNoValue = VehNoValue;
                    this.Driver = Driver;
                    this.DriverValue = DriverValue;
                }
                VehicleDriver.prototype.equals = function (vehicledriver) {
                    if (this.VehNo === vehicledriver.VehNo && this.Driver === vehicledriver.Driver) {
                        return true;
                    }
                    return false;
                }
                VehicleDriver.prototype.toString = function () {
                    return JSON.stringify({
                        VehNo: this.VehNoValue, VehNoDescr: this.VehNo,
                        Driver: this.DriverValue, DriverDescr: this.Driver
                    }).replaceAll("'", "\\'");
                }

                //TrailerNoTrailerPark
                var TrailerNoTrailerPark = function (TrailerNo, TrailerPark, TrailerNoValue, TrailerParkValue) {
                    this.TrailerNo = TrailerNo;
                    this.TrailerNoValue = TrailerNoValue;
                    this.TrailerPark = TrailerPark;
                    this.TrailerParkValue = TrailerParkValue;
                }
                TrailerNoTrailerPark.prototype.equals = function (trailernotrailerpark) {
                    if (this.TrailerNo === trailernotrailerpark.TrailerNo && this.TrailerPark === trailernotrailerpark.TrailerPark) {
                        return true;
                    }
                    return false;
                }
                TrailerNoTrailerPark.prototype.toString = function () {
                    return JSON.stringify({
                        TrailerNo: this.TrailerNoValue, TrailerNoDescr: this.TrailerNo,
                        TrailerPark: this.TrailerParkValue, TrailerParkDescr: this.TrailerPark
                    }).replaceAll("'", "\\'");
                }

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

                //ContainerNoSealNo
                var ContainerNoSealNo = function (CtnrNo, SealNo) {
                    this.CtnrNo = CtnrNo;
                    this.SealNo = SealNo;
                }
                ContainerNoSealNo.prototype.equals = function (ContainerSealNo) {
                    if (this.CtnrNo === ContainerSealNo.CtnrNo && this.SealNo === ContainerSealNo.SealNo) {
                        return true;
                    }
                    return false;
                }
                ContainerNoSealNo.prototype.toString = function () {
                    return JSON.stringify({
                        CtnrNo: this.CtnrNo, SealNo: this.SealNo
                    }).replaceAll("'", "\\'");
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock4" runat="server">
            <script type="text/javascript">
                function GetCellValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "TripFrToExpTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpTime = $telerik.findElement(Container, "FrExpTimeLbl").innerText;
                        var ToExpTime = $telerik.findElement(Container, "ToExpTimeLbl").innerText;
                        args.set_value(new TripFrToExpTime(FrExpTime, ToExpTime));
                    }

                    //TripFrToDate
                    if (args.get_columnUniqueName() === "FrExpToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpDate = $telerik.findElement(Container, "FrExpDateLbl").innerText;
                        var ToActDate = $telerik.findElement(Container, "ToActDateLbl").innerText;
                        args.set_value(new TripFrToDate(FrExpDate, ToActDate));
                    }

                    //TripFrToActTime
                    if (args.get_columnUniqueName() === "TripFrToActTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrActTime = $telerik.findElement(Container, "FrActTimeLbl").innerText;
                        var ToActTime = $telerik.findElement(Container, "ToActTimeLbl").innerText;
                        args.set_value(new TripFrToActTime(FrActTime, ToActTime));
                    }

                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var VehNo = $telerik.findElement(Container, "VehicleLbl").innerText;
                        var Driver = $telerik.findElement(Container, "DriverLbl").innerText;
                        args.set_value(new VehicleDriver(VehNo, Driver));
                    }

                    //TrailerNoTrailerPark
                    if (args.get_columnUniqueName() === "TrailerNoTrailerPark") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var TrailerNo = $telerik.findElement(Container, "TrailerNoLbl").innerText;
                        var TrailerPark = $telerik.findElement(Container, "TrailerParkLbl").innerText;
                        args.set_value(new TrailerNoTrailerPark(TrailerNo, TrailerPark));
                    }

                    //PickUp
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "PickUpAddrLbl").innerText;
                        var ServicePtDescr = $telerik.findElement(Container, "PickUpServiceptLbl").innerText;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }

                    //DropOff
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var Addr = $telerik.findElement(Container, "DropOffAddrLbl").innerText;
                        var ServicePtDescr = $telerik.findElement(Container, "DropOffServiceptLbl").innerText;
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr));
                    }

                    //ContainerNoSealNo
                    if (args.get_columnUniqueName() === "CtnrNoSealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var CtnrNo = $telerik.findElement(Container, "CtnrNoLbl").innerText;
                        var SealNo = $telerik.findElement(Container, "SealNoLbl").innerText;
                        args.set_value(new ContainerNoSealNo(CtnrNo, SealNo));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock5" runat="server">
            <script type="text/javascript">
                function SetCellValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "TripFrToExpTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "FrExpTimeLbl").innerText = Value.FrExpTime;
                        $telerik.findElement(Container, "ToExpTimeLbl").innerText = Value.ToExpTime;
                    }

                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "FrExpDateLbl").innerText = Value.FrExpDate;
                        $telerik.findElement(Container, "ToActDateLbl").innerText = Value.ToActDate;
                    }

                    //TripFrToActTime
                    if (args.get_columnUniqueName() === "TripFrToActTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "FrActTimeLbl").innerText = Value.FrActTime;
                        $telerik.findElement(Container, "ToActTimeLbl").innerText = Value.ToActTime;
                    }

                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "VehicleLbl").innerText = Value.VehNo;
                        $telerik.findElement(Container, "DriverLbl").innerText = Value.Driver;
                    }

                    //TrailerNoTrailerPark
                    if (args.get_columnUniqueName() === "TrailerNoTrailerPark") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "TrailerNoLbl").innerText = Value.TrailerNo;
                        $telerik.findElement(Container, "TrailerParkLbl").innerText = Value.TrailerPark;
                    }

                    //PickUp
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "PickUpServiceptLbl").innerText = Value.ServicePtDescr;
                        $telerik.findElement(Container, "PickUpAddrLbl").innerText = Value.Addr;
                    }

                    //DropOff
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findElement(Container, "DropOffServiceptLbl").innerText = Value.ServicePtDescr;
                        $telerik.findElement(Container, "DropOffAddrLbl").innerText = Value.Addr;
                    }

                    //ContainerNoSealNo
                    if (args.get_columnUniqueName() === "CtnrNoSealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();
                        $telerik.findElement(Container, "CtnrNoLbl").innerText = Value.CtnrNo;
                        $telerik.findElement(Container, "SealNoLbl").innerText = Value.SealNo;
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock6" runat="server">
            <script type="text/javascript">
                function GetEditorValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "TripFrToExpTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpTime = $telerik.findControl(Container, "FrExpTimePicker").get_dateInput().get_value();
                        var ToExpTime = $telerik.findControl(Container, "ToExpTimePicker").get_dateInput().get_value();
                        args.set_value(new TripFrToExpTime(FrExpTime, ToExpTime));
                    }

                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrExpDate = $telerik.findControl(Container, "FrExpDatePicker").get_dateInput().get_value();
                        var ToActDate = $telerik.findControl(Container, "ToActDatePicker").get_dateInput().get_value();
                        args.set_value(new TripFrToDate(FrExpDate, ToActDate));
                    }

                    //TripFrToActTime
                    if (args.get_columnUniqueName() === "TripFrToActTime") {
                        args.set_cancel(true);
                        var Container = args.get_container();
                        var FrActTime = $telerik.findControl(Container, "FrActTimePicker").get_dateInput().get_value();
                        var ToActTime = $telerik.findControl(Container, "ToActTimePicker").get_dateInput().get_value();
                        args.set_value(new TripFrToActTime(FrActTime, ToActTime));
                    }

                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            VehNo = $telerik.findControl(Container, "VehicleCombo").get_text(),
                            VehNoValue = ($telerik.findControl(Container, "VehicleCombo").get_value().split("|"))[0],
                            Driver = $telerik.findControl(Container, "DriverCombo").get_text(),
                            DriverValue = $telerik.findControl(Container, "DriverCombo").get_value();
                        args.set_value(new VehicleDriver(VehNo, Driver, VehNoValue, DriverValue));
                    }

                    //TrailerNoTrailerPark
                    if (args.get_columnUniqueName() === "TrailerNoTrailerPark") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            TrailerNo = $telerik.findControl(Container, "TrailerNoCombo").get_text(),
                            TrailerNoValue = ($telerik.findControl(Container, "TrailerNoCombo").get_value().split("|"))[0],
                            TrailerPark = $telerik.findControl(Container, "TrailerParkCombo").get_text(),
                            TrailerParkValue = $telerik.findControl(Container, "TrailerParkCombo").get_value();
                        args.set_value(new TrailerNoTrailerPark(TrailerNo, TrailerPark, TrailerNoValue, TrailerParkValue));
                    }

                    //PickUp
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "PickUpAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "PickUpServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "PickUpServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }

                    //DropOff
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Addr = $telerik.findControl(Container, "DropOffAddrTxt").get_value(),
                            ServicePtCode = ($telerik.findControl(Container, "DropOffServicePtCombo").get_value().split("|"))[0],
                            ServicePtDescr = $telerik.findControl(Container, "DropOffServicePtCombo").get_text();
                        args.set_value(new ServicePtDescrAndAddr(ServicePtDescr, Addr, ServicePtCode));
                    }

                    //ContainerNoSealNo
                    if (args.get_columnUniqueName() === "CtnrNoSealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            CtnrNo = $telerik.findControl(Container, "CtnrNoTxt").get_value(),
                            SealNo = $telerik.findControl(Container, "SealNoTxt").get_value();
                        args.set_value(new ContainerNoSealNo(CtnrNo, SealNo));
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock ID="RadCodeBlock7" runat="server">
            <script type="text/javascript">
                function SetEditorValue(sender, args) {
                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "TripFrToExpTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "FrExpTimePicker").get_dateInput().set_value(Value.FrExpTime);
                        $telerik.findControl(Container, "ToExpTimePicker").get_dateInput().set_value(Value.ToExpTime);
                    }

                    //TripFrToExpTime
                    if (args.get_columnUniqueName() === "FrExpToActDate") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "FrExpDatePicker").get_dateInput().set_value(Value.FrExpDate);
                        $telerik.findControl(Container, "ToActDatePicker").get_dateInput().set_value(Value.ToActDate);
                    }

                    //TripFrToActTime
                    if (args.get_columnUniqueName() === "TripFrToActTime") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();
                        $telerik.findControl(Container, "FrActTimePicker").get_dateInput().set_value(Value.FrActTime);
                        $telerik.findControl(Container, "ToActTimePicker").get_dateInput().set_value(Value.ToActTime);
                    }

                    //VehicleDriver
                    if (args.get_columnUniqueName() === "VehicleDriver") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();

                        if ($telerik.findControl(Container, "VehicleCombo") && $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo))
                            $telerik.findControl(Container, "VehicleCombo").findItemByText(Value.VehNo).select();
                        else
                            $telerik.findControl(Container, "VehicleCombo").set_text(Value.VehNo);

                        if ($telerik.findControl(Container, "DriverCombo") && $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver))
                            $telerik.findControl(Container, "DriverCombo").findItemByText(Value.Driver).select();
                        else
                            $telerik.findControl(Container, "DriverCombo").set_text(Value.Driver);
                    }

                    //TrailerNoTrailerPark
                    if (args.get_columnUniqueName() === "TrailerNoTrailerPark") {
                        args.set_cancel(true);
                        var Container = args.get_container(), Value = args.get_value();

                        if ($telerik.findControl(Container, "TrailerNoCombo") && $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo))
                            $telerik.findControl(Container, "TrailerNoCombo").findItemByText(Value.TrailerNo).select();
                        else
                            $telerik.findControl(Container, "TrailerNoCombo").set_text(Value.TrailerNo);

                        if ($telerik.findControl(Container, "TrailerParkCombo") && $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark))
                            $telerik.findControl(Container, "TrailerParkCombo").findItemByText(Value.TrailerPark).select();
                        else
                            $telerik.findControl(Container, "TrailerParkCombo").set_text(Value.TrailerPark);
                    }

                    //PickUp
                    if (args.get_columnUniqueName() === "PickUp") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "PickUpAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "PickUpServicePtCombo") && $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "PickUpServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "PickUpServicePtCombo").set_text(Value.ServicePtDescr);
                    }

                    //DropOff
                    if (args.get_columnUniqueName() === "DropOff") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "DropOffAddrTxt").set_value(Value.Addr);

                        if ($telerik.findControl(Container, "DropOffServicePtCombo") && $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr))
                            $telerik.findControl(Container, "DropOffServicePtCombo").findItemByText(Value.ServicePtDescr).select();
                        else
                            $telerik.findControl(Container, "DropOffServicePtCombo").set_text(Value.ServicePtDescr);
                    }

                    //ContainerNoSealNo
                    if (args.get_columnUniqueName() === "CtnrNoSealNo") {
                        args.set_cancel(true);
                        var Container = args.get_container(),
                            Value = args.get_value();

                        $telerik.findControl(Container, "CtnrNoTxt").set_value(Value.CtnrNo);
                        $telerik.findControl(Container, "SealNoTxt").set_value(Value.SealNo);
                    }
                }
            </script>
        </telerik:RadCodeBlock>

        <telerik:RadCodeBlock runat="server" ID="RadCodeBlock8">
            <script type="text/javascript">
                function SelectAll(id) {
                    var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    var row = MasterTable.get_dataItems();
                    if (id.checked == true) {
                        for (var i = 0; i < row.length; i++) {
                            MasterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                        }
                    }
                    else {
                        for (var i = 0; i < row.length; i++) {
                            MasterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                        }
                    }
                }
            </script>
        </telerik:RadCodeBlock>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderDieselProject.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderDieselProject" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Diesel Project @ TMS Booking Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <asp:Panel ID="Panel" runat="server">
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" OnClick="EditBtn_Click1"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="AssignBtn" runat="server" Text="Assign" OnClick="AssignBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="CompleteBtn" runat="server" Text="Complete" OnClick="CompleteBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="OpenBtn" runat="server" Text="Open" OnClick="OpenBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        &nbsp;
                          <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                              OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                        <asp:Button ID="CancelConfirmBtn" Text="" Style="display: none;" OnClick="CancelConfirmBtn_Click" runat="server" />
                         &nbsp;
                        <asp:Button ID="TripUpdateBtn" runat="server" Text="Trip Update" CausesValidation="false"
                    CssClass="White" OnClick="TripUpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
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
                            <asp:ImageButton runat="server" ID="EditBtn" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="EditBtn_Click"></asp:ImageButton>&nbsp;
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
                    <telerik:GridTemplateColumn UniqueName="FrExpDate" HeaderText="TripDate" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
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
                    <telerik:GridTemplateColumn UniqueName="DONo" HeaderText="DO Number" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("InternalDocNo")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="DONoTxt" Width="140px" TextMode="SingleLine">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="PurchaseOrderNo" HeaderText="PO No" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("PurchaseOrderNo")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="FromMeterReading" HeaderText="Meter Reading (Before)" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("FromMeterReading")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="FromMeterReadingTxtBox" Width="140px" TextMode="SingleLine">
                                <ClientEvents OnValueChanged="FromMeterReadingTxtBox_ValueChanged" />
                            </telerik:RadNumericTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ToMeterReading" HeaderText="Meter Reading (After)" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("ToMeterReading")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox runat="server" ID="ToMeterReadingTxtBox" Width="140px" TextMode="SingleLine">
                                <ClientEvents OnValueChanged="ToMeterReadingTxtBox_ValueChanged" />
                            </telerik:RadNumericTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="TotalDieselUsage" HeaderText="Usage" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("TotalDieselUsage")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="TotalDieselUsageTxtBox" Width="140px" TextMode="SingleLine" ReadOnly="true">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" HeaderText="Status" UniqueName="Status" HeaderStyle-Width="130px" ItemStyle-Width="130px" ReadOnly="true" />
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
                    <telerik:GridBoundColumn DataField="PurchaseOrderNo" Display="false" />
                    <telerik:GridBoundColumn DataField="acid" UniqueName="acid" Display="false" />
                    <telerik:GridBoundColumn DataField="ShipmentType" Display="False" />
                    <telerik:GridBoundColumn DataField="CrossDayJob" Display="False" />
                    <telerik:GridBoundColumn DataField="TripDateColor" Display="False" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
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

                <%--Start Region : Text Changed --%>
                function FromMeterReadingTxtBox_ValueChanged(sender, args) {
                    var TotalDieselUsageDT;
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var FromMeterReadingTxtBox = $telerik.findControl(CurrentRow, "FromMeterReadingTxtBox");
                    var ToMeterReadingTxtBox = $telerik.findControl(CurrentRow, "ToMeterReadingTxtBox");
                    var TotalDieselUsageTxtBox = $telerik.findControl(CurrentRow, "TotalDieselUsageTxtBox");
                    if (FromMeterReadingTxtBox != null && ToMeterReadingTxtBox != null) {
                        var FromMeterReading = FromMeterReadingTxtBox.get_value();
                        var ToMeterReading = ToMeterReadingTxtBox.get_value();

                        if (FromMeterReading != null && FromMeterReading != "" && ToMeterReading != null && ToMeterReading != "") {
                            var FromMeterReading_Decimal = parseFloat(FromMeterReading);
                            var ToMeterReading_Decimal = parseFloat(ToMeterReading);
                            TotalDieselUsageDT = ToMeterReading_Decimal - FromMeterReading_Decimal;

                            if (TotalDieselUsageTxtBox != null) {
                                TotalDieselUsageTxtBox.set_value(TotalDieselUsageDT.toFixed(2));
                            }
                        }
                        else {
                            if (TotalDieselUsageTxtBox != null) {
                                TotalDieselUsageTxtBox.set_value("");
                            }
                        }
                    }
                }

                function ToMeterReadingTxtBox_ValueChanged(sender, args) {
                    var TotalDieselUsageDT;
                    var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var FromMeterReadingTxtBox = $telerik.findControl(CurrentRow, "FromMeterReadingTxtBox");
                    var ToMeterReadingTxtBox = $telerik.findControl(CurrentRow, "ToMeterReadingTxtBox");
                    var TotalDieselUsageTxtBox = $telerik.findControl(CurrentRow, "TotalDieselUsageTxtBox");
                    if (FromMeterReadingTxtBox != null && ToMeterReadingTxtBox != null) {
                        var FromMeterReading = FromMeterReadingTxtBox.get_value();
                        var ToMeterReading = ToMeterReadingTxtBox.get_value();

                        if (FromMeterReading != null && FromMeterReading != "" && ToMeterReading != null && ToMeterReading != "") {
                            var FromMeterReading_Decimal = parseFloat(FromMeterReading);
                            var ToMeterReading_Decimal = parseFloat(ToMeterReading);
                            TotalDieselUsageDT = ToMeterReading_Decimal - FromMeterReading_Decimal;

                            if (TotalDieselUsageTxtBox != null) {
                                TotalDieselUsageTxtBox.set_value(TotalDieselUsageDT.toFixed(2));
                            }
                        }
                        else {
                            if (TotalDieselUsageTxtBox != null) {
                                TotalDieselUsageTxtBox.set_value("");
                            }
                        }
                    }
                }

                <%--End Region : Text Changed --%>
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
                    });
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
    </form>
</body>
</html>

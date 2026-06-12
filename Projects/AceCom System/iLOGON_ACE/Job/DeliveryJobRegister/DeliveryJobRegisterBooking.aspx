<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterBooking.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterBooking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliveriesPlanningBooking</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .PrevNext {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .PrevNext:hover {
                background: #6885ca;
            }

        .CancelChk {
            margin-left: 370px;
        }

        .totalWeightLbl {
            margin-left: 70px;
        }

         .WeightLbl {
            margin-left: 40px;
        }
    </style>
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
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;              
            }
        </script>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function OnClose(sender, args) {               
                var masterTable = $find("<%=ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>

    <script type="text/javascript">
        var PartnerVehicleDriver = function (vehNo, driver, partner, vehNoValue, driverValue, partnerValue) {
            this.vehNo = vehNo;
            this.vehNoValue = vehNoValue;
            this.driver = driver;
            this.driverValue = driverValue;
            this.partner = partner;
            this.partnerValue = partnerValue;
        }
        PartnerVehicleDriver.prototype.equals = function (PartnervehicleDriver) {
            if (this.vehNo === PartnervehicleDriver.vehNo &&
                this.driver === PartnervehicleDriver.driver &&
                this.partner === PartnervehicleDriver.partner) {
                return true;
            }
            return false;
        }
        PartnerVehicleDriver.prototype.toString = function () {
            return JSON.stringify({
                vehNo: this.vehNoValue, driver: this.driverValue,
                vehNoText: this.vehNo, driverText: this.driver,
                partner: this.partnerValue, partnerText: this.partner
            });
        }

        var RemarksTripSpecialInstruction = function (Remarks, TripSpecialInstruction) {
            this.Remarks = Remarks;
            this.TripSpecialInstruction = TripSpecialInstruction;
        }

        RemarksTripSpecialInstruction.prototype.equals = function (RemarksSpecialInstruction) {
            if (this.Remarks === RemarksSpecialInstruction.Remarks &&
                this.TripSpecialInstruction === RemarksSpecialInstruction.TripSpecialInstruction) {
                return true;
            }
            return false;
        }

        RemarksTripSpecialInstruction.prototype.toString = function () {
            return JSON.stringify({
                Remarks: this.Remarks, TripSpecialInstruction: this.TripSpecialInstruction
            }).replaceAll("'", "\\'");
        }

        var PickUpFromRoute = function (FrAddr, FrRoute) {
            this.FrAddr = FrAddr;
            this.FrRoute = FrRoute;
        }

        PickUpFromRoute.prototype.equals = function (PickUpFRRoute) {
            if (this.FrAddr === PickUpFRRoute.FrAddr &&
                this.FrRoute === PickUpFRRoute.FrRoute) {
                return true;
            }
            return false;
        }

        PickUpFromRoute.prototype.toString = function () {
            return JSON.stringify({
                FrAddr: this.FrAddr, FrRoute: this.FrRoute
            }).replaceAll("'", "\\'");
        }

        function GetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "PartnerVehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container();
                var vehNo = $telerik.findElement(container, "lblVehNo").innerHTML;
                var driver = $telerik.findElement(container, "lblDriver").innerHTML;
                var partner = $telerik.findElement(container, "lblPartner").innerHTML;
                args.set_value(new PartnerVehicleDriver(vehNo, driver, partner));
            }
            if (args.get_columnUniqueName() === "Remarks/TripSpecialInstruction") {
                args.set_cancel(true);
                var Container = args.get_container();
                var Remarks = $telerik.findElement(Container, "RemarksLbl").innerHTML;
                var TripSpecialInstruction = $telerik.findElement(Container, "TripSpecialInstructionLbl").innerHTML;
                args.set_value(new RemarksTripSpecialInstruction(Remarks, TripSpecialInstruction));
            }

            if (args.get_columnUniqueName() === "PickUp/FromRoute") {
                args.set_cancel(true);
                var Container = args.get_container();
                var FrAddr = $telerik.findElement(Container, "FrAddrLbl").innerHTML;
                var FrRoute = $telerik.findElement(Container, "FrRouteLbl").innerHTML;
                args.set_value(new PickUpFromRoute(FrAddr, FrRoute));
            }
        }

        function SetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "PartnerVehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container(),
                    value = args.get_value();
                $telerik.findElement(container, "lblVehNo").innerHTML = value.vehNo;
                $telerik.findElement(container, "lblDriver").innerHTML = value.driver;
                $telerik.findElement(container, "lblPartner").innerHTML = value.partner;
            }

            if (args.get_columnUniqueName() === "Remarks/TripSpecialInstruction") {
                args.set_cancel(true);
                var Container = args.get_container(), Value = args.get_value();
                $telerik.findElement(Container, "RemarksLbl").innerHTML = Value.Remarks;
                $telerik.findElement(Container, "TripSpecialInstructionLbl").innerHTML = Value.TripSpecialInstruction;
            }

            if (args.get_columnUniqueName() === "PickUp/FromRoute") {
                args.set_cancel(true);
                var Container = args.get_container(), Value = args.get_value();
                $telerik.findElement(Container, "FrAddrLbl").innerHTML = Value.FrAddr;
                $telerik.findElement(Container, "FrRouteLbl").innerHTML = Value.FrRoute;
            }
        }

        function GetEditorValue(sender, args) {
            GetEditorValue
            if (args.get_columnUniqueName() === "PartnerVehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container(),
                    vehNo = $telerik.findControl(container, "VehicleList").get_text(),
                    vehNoValue = ($telerik.findControl(container, "VehicleList").get_value().split("|"))[0],
                    driver = $telerik.findControl(container, "DriverList").get_text(),
                    driverValue = $telerik.findControl(container, "DriverList").get_value();
                partner = $telerik.findControl(container, "PartnerList").get_text(),
               partnerValue = $telerik.findControl(container, "PartnerList").get_value();
                args.set_value(new PartnerVehicleDriver(vehNo, driver, partner, vehNoValue, driverValue, partnerValue));
            }
            if (args.get_columnUniqueName() === "Remarks/TripSpecialInstruction") {
                args.set_cancel(true);
                var Container = args.get_container(),
                    Remarks = $telerik.findControl(Container, "RemarksTxt").get_value(),
                    TripSpecialInstruction = $telerik.findControl(Container, "TripSpecialInstructionTxt").get_value();
                args.set_value(new RemarksTripSpecialInstruction(Remarks, TripSpecialInstruction));
            }
            if (args.get_columnUniqueName() === "PickUp/FromRoute") {
                args.set_cancel(true);
                var Container = args.get_container(),
                    FrAddr = $telerik.findControl(Container, "FrAddrTxt").get_value(),
                    FrRoute = $telerik.findControl(Container, "FrRouteTxt").get_value();
                args.set_value(new PickUpFromRoute(FrAddr, FrRoute));
            }
        }

        function SetEditorValue(sender, args) {
            if (args.get_columnUniqueName() === "PartnerVehicleDriver") {
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

                if ($telerik.findControl(container, "PartnerList") && $telerik.findControl(container, "PartnerList").findItemByText(value.partner))
                    $telerik.findControl(container, "PartnerList").findItemByText(value.partner).select();
                else
                    $telerik.findControl(container, "PartnerList").set_text(value.partner);
            }

            if (args.get_columnUniqueName() === "Remarks/TripSpecialInstruction") {
                args.set_cancel(true);
                var Container = args.get_container(),
                    Value = args.get_value();

                $telerik.findControl(Container, "RemarksTxt").set_value(Value.Remarks);
                $telerik.findControl(Container, "TripSpecialInstructionTxt").set_value(Value.TripSpecialInstruction);
            }

            if (args.get_columnUniqueName() === "PickUp/FromRoute") {
                args.set_cancel(true);
                var Container = args.get_container(),
                    Value = args.get_value();

                $telerik.findControl(Container, "FrAddrTxt").set_value(Value.FrAddr);
                $telerik.findControl(Container, "FrRouteTxt").set_value(Value.FrRoute);
            }
        }
    </script>
    <%--On Vehicle SelectedIndexchange, show the default driver on Driver column--%>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function VehicleList_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var VehicleList = $telerik.findControl(currentRow, "VehicleList").get_value();

                if (VehicleList != null && VehicleList != "") {
                    var VehNoDriverPair = VehicleList.split("|");
                    var DefaultDriverId = VehNoDriverPair[1];
                    var DefaultDriverName = VehNoDriverPair[2];
                    var DefaultDriverComboItem = $telerik.findElement(currentRow, "DriverList").getElementsByTagName("input")[0].value = DefaultDriverName;
                    DefaultDriverComboItem.select();
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <script type="text/javascript">
        function BatchEditClosed(sender, args) {
            var DataItems = args.get_tableView().get_dataItems();
            var BatchManager = sender.get_batchEditingManager();
            var Grid = sender;
            var MasterTable = Grid.get_masterTableView();

            for (var i = 0 ; i < DataItems.length; i++) {
                var Row = MasterTable.get_dataItems()[i];
                var OfferStatusCol = MasterTable.getCellByColumnUniqueName(Row, "OfferStatus"); //Get OfferStatus Column (OfferStatus column is not BatEditColumn and display false so we will use getCellByColumnUniqueName with row feature)
                var OfferStatus = OfferStatusCol.innerHTML; //Get value from OfferStatus Column
                var PartnerCombo = MasterTable.get_dataItems()[i].findControl("PartnerList"); // Get Partner Combobox

                if (OfferStatus.includes("20") || OfferStatus.includes("30")) { // If OfferStatus is containing 20 or 30 we will disible Partner Combo
                    if (PartnerCombo != null) {
                        PartnerCombo.disable(); // Set disable for Partner Combo
                    }
                }
                else {
                    if (PartnerCombo != null) {
                        PartnerCombo.enable(); // Set enable for Partner Combo
                    }
                }
            }
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <%--Changed the <asp:ScriptManager> to <telerik:RadScriptManager> because Cancel Changes button in Batch Grid is not working well--%>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>      
       <%-- <telerik:RadWindowManager ID="RadWindowManager" runat="server" Visible="false"></telerik:RadWindowManager>--%>
        <%--Please note that If u add the new Tab between the existing tab , please also check in RadTabStrip1_TabClick --%>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="BookingTab" Text="Booking" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QueueTab" Text="Queue" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="75" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotCompletedTab" Text="NotCompleted" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuickSurfTab" Text="QuickSurf" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MonitorTab" Text="Monitor" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DriverLocTab" Text="Driver Loc" Value="350" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Id="LogTab" Text="Log" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <%-- When we used the Batch Edit in RadMultiPage, we need to set RenderSelectedPageOnly="true" beacuse of Command Item display .
             If we don't use this cannot show correctly Header commandItem--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="BookingRadPageView" Height="700px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="PrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                            </asp:Label>
                            <br />
                            <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:Button ID="NextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                         <td>                              
                             <br />                            
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <br />
                            <asp:Panel ID="NewTripPanel" runat="server">
                                <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click"
                                    Text="Copy" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="ConfirmCopy" Text="" Style="display: none;" OnClick="ConfirmCopyBtn_Click" runat="server" />
                                <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                                    Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                                    Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                                    Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <asp:Button ID="PODCollectedBtn" class="longlabelwhite burlyWoodBtn" runat="server" OnClick="PODCollectedBtn_Click"
                                    Text="POD Return" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                                <asp:CheckBox ID="Cluchk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="CluchkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="IncludeCompleted" ForeColor="Black"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%-- <asp:CheckBox ID="IncludeCancelChk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="IncludeCanceLbl" runat="server" Font-Bold="true" Font-Size="Small" Text="IncludeCancelled" ForeColor="Black"></asp:Label>--%>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="WeightLbl" runat="server" Text="Total Weight" Font-Size="Small" CssClass="WeightLbl"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <%--<asp:Button ID="SpeedUpBtn" runat="server" CssClass="white" Text="SpeedUp"
                                OnClick="SpeedUpBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />--%>
                            <asp:Button ID="CreateNew" runat="server" CssClass="white" OnClick="CreateNewBtn_Click"
                                Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="DOBtn" CssClass="Blue" runat="server" OnClick="DOBtn_Click"
                                Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="JobSheetBtn" CssClass="Blue" runat="server" OnClick="JobSheetBtn_Click" Enabled="false"
                                Text="JobSheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="SMSbtn" CssClass="LongLabelBlue" runat="server" OnClick="SMSbtn_Click"
                                Text="SMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="IncentiveBtn_Click" Text="Incentive" />
                            <asp:Button ID="BillCustomerBtn" runat="server" CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="BillCustomerBtn_Click" Text="&nbsp;&nbsp;&nbsp;Bill&nbsp;&nbsp;&nbsp; Customer" />
                            <asp:Button ID="OfferBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="OfferBtn_Click" Text="Offer" />
                            <%--<asp:Button ID="PODCollectedBtn" class="longlabelwhite burlyWoodBtn" runat="server" OnClick="PODCollectedBtn_Click" Text="POD Return" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />--%>
                        </td>
                        <td>
                            <asp:CheckBox ID="IncludeCancelChk" ToolTip="SMS" runat="server" CssClass="CancelChk" />
                            <asp:Label ID="IncludeCanceLbl" runat="server" Font-Bold="true" Font-Size="Small" Text="IncludeCancelled" ForeColor="Black"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="TotalWeightLbl" runat="server" ForeColor="Red" Font-Size="X-Large" CssClass="totalWeightLbl"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Silk" RenderMode="Lightweight" ShowStatusBar="true"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource"
                            OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnBatchEditOpened="BatchEditClosed" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="BookingGrid"
                                PageSize="50" HeaderStyle-HorizontalAlign="Left" CommandItemDisplay="TopAndBottom" EditMode="Batch">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                        ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ID="Add" ImageUrl="../../image/add.png"
                                                Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcBtn_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="No" HeaderText="No" ItemStyle-Width="100px" HeaderStyle-Width="50px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status<br/>OfferStatus<br/>AttachmentStatus"
                                        AutoPostBackOnFilter="true" SortExpression="shtype" ItemStyle-Width="110px" HeaderStyle-Width="110px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("offerstatusdescr")) %>
                                            <br />
                                            <%# string.Format("{0:}", Eval("AttachmentStatus")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account<br />JobNo<br />CustReference" DataField="AcJobRef"
                                        AutoPostBackOnFilter="true" SortExpression="AcJobRef"
                                        ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcJobRef")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShpType" HeaderText="ShipmentType<br/>JobType"
                                        AutoPostBackOnFilter="true" SortExpression="shtype" ItemStyle-Width="110px" HeaderStyle-Width="110px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("shtype")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("jobtype")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Time" HeaderText="FromTime<br/>ToTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%--<%# string.Format("{0:}",Eval("TripFrTime")) %>--%>
                                            <%# string.Format("{0:}",Eval("TripFrActTime")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("triptotime")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PartnerVehicleDriver" HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;Partner&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;Vehicle&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;Driver&nbsp;&nbsp;&nbsp;&nbsp;"
                                        ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblPartner" Text='<%# string.Format("{0:}",Eval("Partner")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblVehNo" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDriver" Text='<%# string.Format("{0:}",Eval("Driver")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>

                                            <telerik:RadComboBox ID="PartnerList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                                OnItemsRequested="PartnerList_ItemsRequested" HighlightTemplatedItems="true" Skin="Sunset" Width="120px"
                                                EnableLoadOnDemand="true" AllowCustomText="false" Filter="Contains">
                                            </telerik:RadComboBox>

                                            <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="Sunset" Width="120px" OnItemsRequested="VehicleList_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnClientDropDownClosed="VehicleList_DropDownClosed">
                                            </telerik:RadComboBox>
                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="Sunset" Width="120px" OnItemsRequested="DriverCBB_ItemsRequested"
                                                HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUpName/PickUpAddress" HeaderText="PickUpName<br/>PickUpAddress"
                                        SortExpression="PickUpName" ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false"
                                        ItemStyle-Height="80px">
                                        <ItemTemplate>
                                            <b> <%# string.Format("{0:}",Eval("FrServicePtDescr")) %> </b>
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrAddr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="CityCode" HeaderText="FromCity<br/>FromRoute"
                                        AutoPostBackOnFilter="true" SortExpression="shtype" ItemStyle-Width="110px" HeaderStyle-Width="110px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FrCityCode")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrRoute")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOffName/DropOffAddress" HeaderText="DropOffName<br/>DropOffAddress"
                                        SortExpression="DropOff" ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false"
                                        ItemStyle-Height="80px">
                                        <ItemTemplate>
                                            <b> <%# string.Format("{0:}",Eval("ToServicePtDescr")) %> </b>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToAddr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp/FromRoute" HeaderText="ToCity<br/>ToRoute"
                                        SortExpression="PickUp" ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ToCityCode")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToRoute")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Remarks/TripSpecialInstruction" HeaderText="RecipientName<br/>Remarks<br/>SpecialInstruction"
                                        SortExpression="Remarks" ItemStyle-Width="125px" HeaderStyle-Width="140px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("RecipientName")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("Remarks1")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Status" Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="StatusLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" HeaderText="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OfferStatus" UniqueName="OfferStatus" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" Display="False" />
                                    <telerik:GridBoundColumn DataField="FrAddr" UniqueName="FrAddr" Display="False" />
                                    <telerik:GridBoundColumn DataField="ToAddr" UniqueName="ToAddr" Display="False" />
                                    <telerik:GridBoundColumn DataField="PerId" UniqueName="PerId" Display="False" />
                                    <telerik:GridBoundColumn DataField="MobileNo" UniqueName="MobileNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TourGuideName" UniqueName="TourGuideName" Display="False" />
                                    <telerik:GridBoundColumn DataField="TourGuideContactNo" UniqueName="TourGuideContactNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="False" />
                                    <telerik:GridBoundColumn DataField="billsizetype" UniqueName="BillSizeType" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ExcelBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="QueueRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="NotBilledRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LicenseNameLbl" Visible="false" runat="server"></asp:Label>
                            <telerik:RadMenu ID="RadMenu" runat="server" ExpandAnimation-Type="None" ShowToggleHandle="false" ClickToOpen="true" CssClass="mainMenu"
                                OnItemClick="RadMenu_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="Bill" PostBack="false" Value="Bill" CssClass="WrappingItem">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SINGLE" Text="Single" CssClass="WrappingItem"
                                                Visible="true" BackColor="White" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CONSOLIDATED" Text="Consolidated" CssClass="WrappingItem"
                                                Visible="true" BackColor="White" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            &nbsp; &nbsp;
                             <asp:Button ID="NonBillableBtn" runat="server" CssClass="White" Text="Non Billable"
                                 OnClick="NonBillableBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmNonBillableBtn" Text="" Style="display: none;" OnClick="ConfirmNonBillableBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <asp:Button ID="AssignQuotationBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Quotation"
                                OnClick="AssignQuotationBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmAssignQuotationBtn" Text="" Style="display: none;" OnClick="ConfirmAssignQuotationBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDGRNB" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDGRNB_NeedDataSource" OnItemDataBound="ResultDGRNB_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="NotBilledGrid">
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
                            <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustReference" UniqueName="CustReference" SortExpression="CustReference" HeaderText="CustReference">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="PODDate" HeaderText="POD Date"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoOfTrips" UniqueName="NoOfTrips" SortExpression="NoOfTrips" HeaderText="NoOfTrips">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoOfChargeLine" UniqueName="NoOfChargeLine" SortExpression="NoOfChargeLine" HeaderText="NoOfChargeLine">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CreatedOn" UniqueName="CreatedOn" SortExpression="CreatedOn" HeaderText="CreatedOn" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CreatedBy" UniqueName="CreatedBy" SortExpression="CreatedBy" HeaderText="CreatedBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="BillableItemsRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="NotCompletedRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QuickSurfRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="MonitorRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="DriverLocRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

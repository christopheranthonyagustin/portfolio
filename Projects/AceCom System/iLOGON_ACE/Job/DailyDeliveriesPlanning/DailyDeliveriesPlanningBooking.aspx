<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveriesPlanningBooking.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanning.DailyDeliveriesPlanningBooking" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ByDeliveryDate_OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG_ByDeliveryDate.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

        // VehicleDriver object is required for Telerik
        // RadComboBox methods ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/combobox/client-side-programming/objects/radcombobox-object
        // custom code for multiple control in a cell ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/edit-mode/batch-editing/working-with-templates
        var VehicleDriver = function (vehNo, driver, vehNoValue, driverValue) {
            this.vehNo = vehNo; // to display the text to user
            this.vehNoValue = vehNoValue; // for server use
            this.driver = driver; // to display the text to user
            this.driverValue = driverValue; // for server use
        }
        VehicleDriver.prototype.equals = function (vehicleDriver) {
            if (this.vehNo === vehicleDriver.vehNo &&
                this.driver === vehicleDriver.driver) {
                return true;
            }
            return false;
        }
        VehicleDriver.prototype.toString = function () {
            //return this.vehNoValue + " " + this.driverValue;
            return JSON.stringify({
                vehNo: this.vehNoValue, driver: this.driverValue,
                vehNoText: this.vehNo, driverText: this.driver // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
            });
        }

        function GetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container();
                var vehNo = $telerik.findElement(container, "lblVehNo").innerHTML;
                var driver = $telerik.findElement(container, "lblDriver").innerHTML;
                args.set_value(new VehicleDriver(vehNo, driver));
            }
        }

        function SetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container(),
                    value = args.get_value();
                $telerik.findElement(container, "lblVehNo").innerHTML = value.vehNo;
                $telerik.findElement(container, "lblDriver").innerHTML = value.driver;
            }
        }

        function GetEditorValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container(),
                    vehNo = $telerik.findControl(container, "VehicleList").get_text(),
                    vehNoValue = ($telerik.findControl(container, "VehicleList").get_value().split("|"))[0],
                    driver = $telerik.findControl(container, "DriverList").get_text(),
                    driverValue = $telerik.findControl(container, "DriverList").get_value();
                args.set_value(new VehicleDriver(vehNo, driver, vehNoValue, driverValue));
            }
        }

        function SetEditorValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
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

    <style type="text/css">
        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <%--Changed the <asp:ScriptManager> to <telerik:RadScriptManager> because Cancel Changes button in Batch Grid is not working well--%>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Silk" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager runat="server" SkinID="Silk" ID="RadAjaxManager">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ResultDG">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" LoadingPanelID="LoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadWindowManager ID="RadWindowManager" runat="server"></telerik:RadWindowManager>
        <%--Please note that If u add the new Tab between the existing tab , please also check in RadTabStrip1_TabClick --%>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="BookingTab" Text="Booking" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ScheduleTab" Text="Schedule" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QueueTab" Text="Queue" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="75" runat="server">
                </telerik:RadTab>
                <%--                <telerik:RadTab Id="BillableItemsTab" Text="BillableItems" Value="150" runat="server">
                </telerik:RadTab>--%>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotCompletedTab" Text="NotCompleted" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UploadTab" Text="Upload" Value="175" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuickSurfTab" Text="QuickSurf" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MapPlanningTab" Text="Plan On Map" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="400" runat="server">
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
                            <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
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
                            <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Panel ID="NewTripPanel" runat="server">
                                <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="CreateNew" runat="server" CssClass="LongLabelWhite" OnClick="CreateNewBtn_Click"
                                    Text="&nbsp;&nbsp;&nbsp;&nbsp;New&nbsp;&nbsp;&nbsp;&nbsp; Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                 <asp:Button ID="CopyBookingBtn" runat="server" CssClass="LongLabelWhite" OnClick="CopyBookingBtn_Click"
                                    Text="&nbsp;&nbsp;&nbsp;&nbsp;Copy&nbsp;&nbsp;&nbsp;&nbsp; Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                    Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                                    Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:CheckBox ID="Cluchk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="CluchkLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Completed" ForeColor="Black"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:CheckBox ID="IncludeCancelChk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="IncludeCanceLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Cancelled" ForeColor="Black"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                                Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="SpeedUpBtn" runat="server" CssClass="LongLabelWhite" Text="Mass Booking Update"
                                OnClick="SpeedUpBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="SMSbtn" CssClass="LongLabelBlue" runat="server" OnClick="SMSbtn_Click"
                                Text="SMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="IncentiveBtn_Click" Text="Incentive" />
                                &nbsp;
                            <asp:Button ID="BillCustomerBtn" runat="server" CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="BillCustomerBtn_Click" Text="&nbsp;&nbsp;&nbsp;Bill&nbsp;&nbsp;&nbsp; Customer" />
                                &nbsp;
                            <asp:Button ID="DOBtn" CssClass="Blue" runat="server" OnClick="DOBtn_Click"
                                Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                Text="Export Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="JobSheetBtn" CssClass="Blue" runat="server" OnClick="JobSheetBtn_Click" Enabled="false"
                                Text="JobSheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" ShowStatusBar="true"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource"
                            OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="BookingGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
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
                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account<br />JobNo<br />CustReference" DataField="AcJobRef"
                                        AutoPostBackOnFilter="true" SortExpression="AcJobRef"
                                        ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcJobRef")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShpType" HeaderText="ShipmentType<br/>BillsizeType<br/>BillOption1"
                                        AutoPostBackOnFilter="true" SortExpression="shtype" ItemStyle-Width="110px" HeaderStyle-Width="110px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("shtype")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetype")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Time" HeaderText="FromTime<br/>ToTime" ItemStyle-Width="80px" HeaderStyle-Width="80px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("triptotime")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;Vehicle&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;Driver&nbsp;&nbsp;&nbsp;&nbsp;"
                                        ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblVehNo" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDriver" Text='<%# string.Format("{0:}",Eval("Driver")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
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
                                    <telerik:GridTemplateColumn UniqueName="TrailerNo" HeaderText="TrailerNo"
                                        ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TrailerNo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                                OnItemsRequested="TrailerNoList_ItemsRequested" HighlightTemplatedItems="true" Skin="Sunset" Width="120px"
                                                EnableLoadOnDemand="true" AllowCustomText="false" Filter="Contains">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DoNumber" HeaderText="DoNumber"
                                        ItemStyle-Width="105px" HeaderStyle-Width="105px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("DONo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="SingleLine" Width="100px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp"
                                        ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FrAddr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Width="120px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff"
                                        ItemStyle-Width="125px" HeaderStyle-Width="125px" AllowFiltering="false"
                                        ItemStyle-Height="80px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("toaddr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Width="120px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription<br/>SpecialInstruction"
                                        ItemStyle-Width="130px" HeaderStyle-Width="130px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("EqpSpecialInstruction")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Status" Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="StatusLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" HeaderText="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
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
            <telerik:RadPageView runat="server" ID="ScheduleRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="QueueRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="NotBilledRadPageView">
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    OnTabClick="RadTabStrip_ByJobTab_TabClick"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab ID="ByJobTab" Text="By Job" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="BillableItemsTab1" Text="BillableItems" Value="100" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="ByDeliveryDateTab" Text="By Delivery Date" Value="200" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                        <table>
                            <tr>
                                <td><br />
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
                                    <asp:Button ID="AssignQuotationBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Quotation" style="margin-top: 14px !important;"
                                        OnClick="AssignQuotationBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Button ID="ConfirmAssignQuotationBtn" Text="" Style="display: none;" OnClick="ConfirmAssignQuotationBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                                </td>
                            </tr>
                        </table><br />
                        <telerik:RadGrid ID="ResultDGRNB" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDGRNB_NeedDataSource" OnItemDataBound="ResultDGRNB_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
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
                                    <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
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
                    <telerik:RadPageView runat="server" ID="ByDeliveryDateRadPageView" Height="700px">
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="BillBtn_ByDeliveryDate" runat="server" CssClass="LongLabelWhite" Text="Bill"
                                        OnClick="BillBtn_ByDeliveryDate_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG_ByDeliveryDate" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_ByDeliveryDate_NeedDataSource">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="ACID" Name="ByDeliveryDateGrid">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" HeaderText="QuotationNo">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <%--            <telerik:RadPageView runat="server" ID="BillableItemsRadPageView" Height="700px" />--%>
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="NotCompletedRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QuickSurfRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="MapPlanningView" Height="700px" />
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView" Height="700px" />
        </telerik:RadMultiPage>
         <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>

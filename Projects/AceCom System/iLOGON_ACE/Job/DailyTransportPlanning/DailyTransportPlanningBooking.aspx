<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningBooking.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningBooking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyTransportPlanningBooking</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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

            function ResultDGRNB_EditBooking_OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDGRNB.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }

            function ResultDG_EditBooking_OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
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
            return JSON.stringify({
                vehNo: this.vehNoValue, driver: this.driverValue,
                vehNoText: this.vehNo, driverText: this.driver // for server to check whether is this set to empty as the value can be empty if the comboBox is not init
            });
        }

        function GetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container();
                var vehNo = $telerik.findElement(container, "lblVehNo").innerText;
                var driver = $telerik.findElement(container, "lblDriver").innerText;
                args.set_value(new VehicleDriver(vehNo, driver));
            }
        }

        function SetCellValue(sender, args) {
            if (args.get_columnUniqueName() === "VehicleDriver") {
                args.set_cancel(true);
                var container = args.get_container(),
                    value = args.get_value();
                $telerik.findElement(container, "lblVehNo").innerText = value.vehNo;
                $telerik.findElement(container, "lblDriver").innerText = value.driver;
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
        <%--Please note that If u add the new Tab between the existing tab , please also check in RadTabStrip1_TabClick --%>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="BookingTab" Text="Booking" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="FailedTab" Text="Failed" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QueueTab" Text="Queue" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotCompletedTab" Text="NotCompleted" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UploadTab" Text="Upload" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuickSurfTab" Text="Quick Surf" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MapPlanningTab" Text="Plan On Map" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <%-- When we used the Batch Edit in RadMultiPage, we need to set RenderSelectedPageOnly="true" beacuse of Command Item display .
             If we don't use this cannot show correctly Header commandItem--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="BookingRadPageView" Height="700px">
                <table>
                    <tr>
                        <td>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <div style="background-color: White; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>New</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Cyan; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Assigned</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Gold; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Accepted</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Cancelled Pickup</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Pink; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Arrived Pickup</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Failed Pickup</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: LightBlue; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Completed Pickup</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Khaki; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Arrived Dropoff</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Failed Dropoff</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: LightGreen; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Completed Dropoff</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Cancelled</td>
                                        <td style="padding-left: 5px"></td>

                                        <td>
                                            <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                        </td>
                                        <td>Deleted</td>
                                    </tr>
                                </table>
                            </div>
                        </td>

                    </tr>
                </table>

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
                                    Text="New Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                 <asp:Button ID="EditBtn" runat="server" CssClass="LongLabelWhite" Text="Edit Booking"
                                     OnClick="EditBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                 <asp:Button ID="CopyBookingBtn" runat="server" CssClass="LongLabelWhite" OnClick="CopyBookingBtn_Click"
                                     Text="Copy Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="DeleteBookingBtn" runat="server" CssClass="LongLabelWhite" OnClick="DeleteBookingBtn_Click"
                                    Text="Delete Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:CheckBox ID="IncludeCompletedChk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="IncludeCompletedLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Completed" ForeColor="Black"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:CheckBox ID="IncludeCancelledChk" ToolTip="SMS" runat="server" />
                                <asp:Label ID="IncludeCancelledLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Cancelled" ForeColor="Black"></asp:Label>
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
                            <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                                Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id); if ( !confirm('Confirm to cancel job?')) return false;" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ReopenJobBtn" runat="server" CssClass="white" OnClick="ReopenJobBtn_Click"
                                Text="Reopen Job" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="MassBookingUpdateBtn" runat="server" CssClass="LongLabelWhite" Text="Mass Booking Update"
                                OnClick="MassBookingUpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="SMSbtn" CssClass="LongLabelBlue" runat="server" OnClick="SMSbtn_Click"
                                Text="SMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="BillCustomerBtn" runat="server" CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="BillCustomerBtn_Click" Text="Bill Customer" />
                            &nbsp;
                            <asp:Button ID="DOBtn" CssClass="Blue" runat="server" OnClick="DOBtn_Click"
                                Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="JobSheetBtn" CssClass="Blue" runat="server" OnClick="JobSheetBtn_Click" Enabled="false"
                                Text="JobSheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CheckpointBtn" CssClass="white" runat="server" OnClick="CheckpointBtn_Click"
                                Text="Checkpoint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>

                        <td style="float: right">
                            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" ShowStatusBar="true"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true"
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
                            <MasterTableView AllowMultiColumnSorting="true" Name="BookingGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                PageSize="50" HeaderStyle-HorizontalAlign="Left" CommandItemDisplay="TopAndBottom" EditMode="Batch" DataKeyNames="JobId">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                        ItemStyle-Width="65px" HeaderStyle-Width="65px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                            <asp:ImageButton runat="server" ID="AttcImgBtn" ImageUrl="../../image/attached.jpg" BorderWidth="0" OnClick="AttcImgBtn_Click"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" Visible="false"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                        AllowFiltering="false" HeaderText="S/N" SortExpression="S/N">
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="AcCode" HeaderText="AcCode" ItemStyle-Width="140px" HeaderStyle-Width="140px"
                                        DataField="AcCode" SortExpression="AcCode">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcCode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobNo_OrderNo_ProjectCode" HeaderText="JobNo <br/> OrderNo <br/>ProjectCode" ItemStyle-Width="140px" HeaderStyle-Width="140px"
                                        DataField="JobNo_OrderNo_ProjectCode" AutoPostBackOnFilter="true" SortExpression="JobNo_OrderNo_ProjectCode">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("JobNo_OrderNo_ProjectCode")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Pickup" HeaderText="Pickup" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="PickupInfo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("PickupInfo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Dropoff" HeaderText="Dropoff" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="DropoffInfo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("DropoffInfo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="OrderBy" HeaderText="OrderBy" ItemStyle-Wrap="true" ItemStyle-Width="220px" HeaderStyle-Width="220px" DataField="OrderBy">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("OrderBy")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TimeStamp" HeaderText="Time Stamp" ItemStyle-Wrap="true" ItemStyle-Width="220px" HeaderStyle-Width="220px" DataField="TimeStamp">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TimeStamp")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="Job Instruction" ItemStyle-Wrap="true" ItemStyle-Width="220px" HeaderStyle-Width="220px" DataField="JobSpecialInstruction">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("JobSpecialInstruction")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="BillSizeType" HeaderText="Bill Size Type" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px" DataField="BillSizeType">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("BillSizeType")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver"
                                        ItemStyle-Width="170px" HeaderStyle-Width="170px" AllowFiltering="false" DataField="VehicleNo_DeliveryAgentName">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblVehNo" Text='<%# string.Format("{0:}",Eval("VehicleNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDriver" Text='<%# string.Format("{0:}",Eval("DeliveryAgentName")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="Sunset" BackColor="#ded7c6" Width="155" OnItemsRequested="VehicleList_ItemsRequested"
                                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnClientDropDownClosed="VehicleList_DropDownClosed">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                RenderMode="Lightweight" Skin="Sunset" BackColor="#ded7c6" Width="155" OnItemsRequested="DriverCBB_ItemsRequested"
                                                HighlightTemplatedItems="true" EnableLoadOnDemand="true" Filter="Contains">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="DeliveryWindow" HeaderText="Delivery Window" ItemStyle-Width="130px" HeaderStyle-Width="130px" AllowFiltering="false" ReadOnly="true"></telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="CODInfo" HeaderText="COD Info" ItemStyle-Width="150px" HeaderStyle-Width="150px" AllowFiltering="false" DataField="CODInfo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CODInfo")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CODCollected" HeaderText="COD Collected" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false" DataField="CODCollectedAmount">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CODCollectedAmount")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CargoInfo" HeaderText="Cargo Info" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" ItemStyle-Width="180px" HeaderStyle-Width="180px" AllowFiltering="false" DataField="CargoInfo">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CargoInfo")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="InternalRemarks" HeaderText="Internal Remark" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="InternalRemarks">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("InternalRemarks")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox ID="InternalRemarksTxtBox" runat="server" Skin="WebBlue" Rows="3" TextMode="MultiLine" Width="200"></telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="OrderStatus" HeaderText="Order Status" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" ItemStyle-Width="150px" HeaderStyle-Width="150px"
                                        AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" DataField="FriendlyOrderStatus">
                                        <ItemTemplate>
                                            <div id="OrderStatusDiv" runat="server" class="StatusBox">
                                                <%# string.Format("{0:}",Eval("FriendlyOrderStatus")) %>
                                            </div>
                                            <asp:Label runat="server" ID="InvoiceNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "InvoiceNo")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ReasonDescription" HeaderText="Reason Description" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="ReasonDescription">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ReasonDescription")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DriverRemarks" HeaderText="Driver's Remark" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="DriverRemarks">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("DriverRemarks")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CreatedOn" HeaderText="CreatedOn" ItemStyle-Width="220px" HeaderStyle-Width="220px" AllowFiltering="false" DataField="CreatedOn">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CreatedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="OrderStatusColourCode" UniqueName="OrderStatusColourCode" Display="False" />
                                    <telerik:GridBoundColumn DataField="DeliveryAgentId" Display="False" />
                                    <telerik:GridBoundColumn DataField="JobId" UniqueName="JobId" Display="False" />
                                    <telerik:GridBoundColumn DataField="JBCtnrId" Display="False" />
                                    <telerik:GridBoundColumn DataField="JobAttachment" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="VehicleNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="JobNo" Display="false" />
                                    <telerik:GridBoundColumn DataField="InvoiceNo" Display="false" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ExcelBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="FailedRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="QueueRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="NotBilledRadPageView">
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    OnTabClick="RadTabStrip_ByJobTab_TabClick"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab ID="ByJobTab" Text="By Job" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="BillableItemsTab1" Text="Billable Items" Value="100" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab ID="ByDeliveryDateTab" Text="By Delivery Date" Value="200" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                        <table>
                            <tr>
                                <td>
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div style="background-color: White; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>New</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Cyan; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Assigned</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Gold; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Accepted</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Cancelled Pickup</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Pink; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Arrived Pickup</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Failed Pickup</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: LightBlue; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Completed Pickup</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Khaki; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Arrived Dropoff</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Failed Dropoff</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: LightGreen; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Completed Dropoff</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Cancelled</td>
                                                <td style="padding-left: 5px"></td>

                                                <td>
                                                    <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                                </td>
                                                <td>Deleted</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td>
                                    <br />
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
                                    <asp:Button ID="AssignQuotationBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Quotation" Style="margin-top: 14px !important;"
                                        OnClick="AssignQuotationBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Button ID="EditBookingBtn" runat="server" CssClass="LongLabelWhite" Text="Edit Booking" Style="margin-top: 14px !important;"
                                        OnClick="EditBookingBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <asp:Button ID="ConfirmAssignQuotationBtn" Text="" Style="display: none;" OnClick="ConfirmAssignQuotationBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                                </td>
                                <td>
                                    <asp:Button ID="NonBillableCkpBtn" CssClass="white" runat="server" OnClick="NonBillableCheckpointBtn_Click" Style="margin-top: 14px !important;"
                                        Text="Checkpoint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td> 

                                <td align="right"><br />
                                    <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <telerik:RadGrid ID="ResultDGRNB" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
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
                                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CustReference" UniqueName="CustReference" SortExpression="CustReference" HeaderText="CustReference" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" HeaderText="QuotationNo" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BookingDate" UniqueName="BookingDate" SortExpression="BookingDate" HeaderText="BookingDate"
                                        DataFormatString="{0:dd/MMM/yyyy}" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NoOfChargeLine" UniqueName="NoOfChargeLine" SortExpression="NoOfChargeLine" HeaderText="NoOfChargeLine" AllowFiltering="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="CODAmt" UniqueName="CODAmt" SortExpression="CODAmt" HeaderText="COD Amount" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CODCollectedAmt" UniqueName="CODCollectedAmt" SortExpression="CODCollectedAmt" HeaderText="COD Collected" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DriverRemarks" UniqueName="DriverRemarks" SortExpression="DriverRemarks" HeaderText="DriverRemarks" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReasonDescription" UniqueName="ReasonDescription" SortExpression="ReasonDescription" HeaderText="Reason Description" AllowFiltering="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="InternalRemarks" UniqueName="InternalRemarks" SortExpression="InternalRemarks" HeaderText="Internal Remarks" AllowFiltering="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CreatedOn" UniqueName="CreatedOn" SortExpression="CreatedOn" HeaderText="CreatedOn" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CreatedBy" UniqueName="CreatedBy" SortExpression="CreatedBy" HeaderText="CreatedBy" AutoPostBackOnFilter="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBCTNRID" UniqueName="JBCTNRID" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobId" HeaderText="TripId" Display="False">
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
            <telerik:RadPageView runat="server" ID="NotCompletedRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QuickSurfRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="MapPlanningView" Height="700px" />
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

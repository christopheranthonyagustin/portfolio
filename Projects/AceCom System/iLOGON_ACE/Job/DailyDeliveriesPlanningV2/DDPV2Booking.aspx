<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2Booking.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2Booking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Booking @ DDPV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

        var VehicleDriver = function (vehNo, driver, vehNoValue, driverValue) {
            this.vehNo = vehNo;
            this.vehNoValue = vehNoValue;
            this.driver = driver;
            this.driverValue = driverValue;
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
                vehNoText: this.vehNo, driverText: this.driver
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

                    if ($telerik.findControl(currentRow, "DriverList") && $telerik.findControl(currentRow, "DriverList").findItemByText(DefaultDriverName))
                        $telerik.findControl(currentRow, "DriverList").findItemByText(DefaultDriverName).select();
                    else
                        $telerik.findControl(currentRow, "DriverList").set_text(DefaultDriverName);
                }

                else {
                    $telerik.findControl(currentRow, "DriverList").set_text("");
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
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%-- RadAlert with ScrollBar--%>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Behaviors="Close, Move" Modal="true" CenterIfModal="true">
            <AlertTemplate>
                <div class="rwDialogPopup radalert" style="height: 180px; width: 400px; overflow: auto;">
                    <div class="rwDialogText">
                        {1}
                    </div>
                    <div>
                        <br />
                        <a onclick="$find('{0}').close();" class="rwPopupButton" href="javascript:void(0);">
                            <span class="rwOuterSpan"><span class="rwInnerSpan">##LOC[OK]##</span> </span></a>
                    </div>
                </div>
            </AlertTemplate>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="BookingTab" Text="Booking" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ScheduleTab" Text="Schedule" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotBilledTab" Text="NotBilled" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="NotCompletedTab" Text="NotCompleted" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UploadTab" Text="Upload" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuickSurfTab" Text="QuickSurf" Value="300" runat="server">
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
                        <td style="padding-top: 15px">&nbsp;
                            <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CreateNew" runat="server" CssClass="white" OnClick="CreateNewBtn_Click"
                                Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AssignBtn" runat="server" CssClass="blue" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="green" OnClick="CompletedBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:CheckBox ID="Cluchk" ToolTip="SMS" runat="server" />
                             <asp:Label ID="CluchkLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Completed" ForeColor="Black"></asp:Label>
                                
                        </td>
                        <td style="padding-left: 30px; padding-top: 10px">
                            <asp:CheckBox ID="IncludeCancelChk" ToolTip="SMS" runat="server" />
                            <asp:Label ID="IncludeCanceLbl" runat="server" Font-Bold="true" Width="120px" Font-Size="Small" Text="&nbsp;Include Cancelled" ForeColor="Black"></asp:Label>
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
                            <asp:Button ID="SMSBtn" CssClass="blue" runat="server" OnClick="SMSBtn_Click"
                                Text="SMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="IncentiveBtn_Click" Text="Incentive" />
                            &nbsp;
                            <asp:Button ID="BillCustomerBtn" runat="server" CssClass="LongLabelWhite" OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" OnClick="BillCustomerBtn_Click" Text="&nbsp;&nbsp;&nbsp;Bill&nbsp;&nbsp;&nbsp; Customer" />
                            &nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="JobSheetBtn" CssClass="blue" runat="server" OnClick="JobSheetBtn_Click"
                                Text="JobSheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true"
                            OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand" Width="115%"
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
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="Add" ImageUrl="../../image/add.png"
                                                Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcBtn_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account<br />JobNo<br />CustReference" DataField="AcJobRef"
                                        AutoPostBackOnFilter="true" SortExpression="AcJobRef"
                                        ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("AcJobRef")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ShpType" HeaderText="ShipmentType<br/>BillsizeType<br/>BillOption1" DataField="shtype"
                                        AutoPostBackOnFilter="true" SortExpression="shtype" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("shtype")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetype")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="OrderByAndContactNo" HeaderText="OrderBy<br/>ContactNo" DataField="CustName"
                                        AutoPostBackOnFilter="true" SortExpression="CustName" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("CustName")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("OrderByPhone")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Time" HeaderText="FromTime<br/>ToTime" ItemStyle-Width="120px" HeaderStyle-Width="120px" DataField="TripFrTime" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("triptotime")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver" DataField="VehNo"
                                        ItemStyle-Width="145px" HeaderStyle-Width="145px" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblVehNo" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDriver" Text='<%# string.Format("{0:}",Eval("Driver")) %>'></asp:Label>
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
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TrailerNo" HeaderText="TrailerNo" DataField="TrailerNo"
                                        ItemStyle-Width="145px" HeaderStyle-Width="145px" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TrailerNo")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                                OnItemsRequested="TrailerNoList_ItemsRequested" HighlightTemplatedItems="true" Skin="WebBlue" Width="140px"
                                                EnableLoadOnDemand="true" AllowCustomText="false" Filter="Contains">
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" DataField="FrAddr"
                                        ItemStyle-Width="145px" HeaderStyle-Width="145px" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FrAddr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" TextMode="MultiLine" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" DataField="ToAddr"
                                        ItemStyle-Width="145px" HeaderStyle-Width="145px" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ToAddr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" TextMode="MultiLine" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription<br/>SpecialInstruction"
                                        ItemStyle-Width="130px" HeaderStyle-Width="130px" DataField="EqpSpecialInstruction" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("EqpSpecialInstruction")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-Width="120px" HeaderStyle-Width="120px" DataField="statusdescr" AutoPostBackOnFilter="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("statusdescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="AddDate" HeaderText="AddDate" DataField="AddDate" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="AddUser" HeaderText="AddUser" DataField="AddUser"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="EditDate" HeaderText="EditDate" DataField="EditDate" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="EditUser" HeaderText="EditUser" DataField="EditUser"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False"> </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PerId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="MobileNo" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="acId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TourGuideName" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TourGuideContactNo" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobNo" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billsizetype" Display="false"></telerik:GridBoundColumn>
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
            <telerik:RadPageView runat="server" ID="NotBilledRadPageView" Height="90%" />
            <telerik:RadPageView runat="server" ID="NotCompletedRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QuickSurfRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="MapPlanningRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceBooking.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceBooking" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliveryServiceBooking</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                <telerik:RadTab Id="FailedTab" Text="Failed" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CastingTab" Text="Casting" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DashboardTab" Text="Dashboard" Value="28" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SummaryTab" Text="Summary" Value="30" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MapPlanningTab" Text="Plan On Map" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QuickSurfTab" Text="Quick Surf" Value="75" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UploadTab" Text="Upload" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PostalCodeNotesTab" Text="Postal Code Notes" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
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
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:Button ID="Button1" class="white" runat="server" OnClick="RefereshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                            </asp:Panel>
                        </td>
                        <td>

                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click"
                                Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="SMSbtn" CssClass="LongLabelBlue" runat="server" OnClick="SMSbtn_Click"
                                Text="SMS" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                                Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PrintPODBtn" runat="server" CssClass="white" OnClick="PrintPODBtn_Click" ToolTip="POD printout"
                                Text="Print POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                                <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                    Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="ConfirmCompletedBtn" Text="" Style="display: none;" OnClick="ConfirmCompletedBtn_Click" runat="server" />

                            <asp:CheckBox ID="PCNchkObjective" ToolTip="PostalCodeNotes" runat="server" AutoPostBack="true" />
                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="PostalCodeNotes" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>

                </table>

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Panel ID="NewTripPanel" runat="server">
                                <asp:Button ID="CreateNew" runat="server" CssClass="white" OnClick="CreateNewBtn_Click"
                                    Text="New Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </asp:Panel>
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
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="TripId" Name="BookingGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
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
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click" ToolTip="Edit Booking"></asp:ImageButton>&nbsp;                                           
                                            <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="AttcBtn_Click" ToolTip="View Attach"></asp:ImageButton>
                                            <br />
                                            <asp:Label ID="PostalCodeNotesDetectedLbl" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account"
                                        AutoPostBackOnFilter="true" SortExpression="Account" AllowFiltering="false" HeaderStyle-Wrap="true" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Account")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="OrderNo" HeaderText="Order No" AllowFiltering="false" HeaderStyle-Wrap="true" ItemStyle-Wrap="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Order No")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="OrderStatus" HeaderText="Order Status" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <div id="OrderStatusDiv" runat="server" class="StatusBox">
                                                <%# string.Format("{0:}",Eval("Order Status")) %>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="JobType" HeaderText="Job<br/>Type" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("JobType")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn UniqueName="TransportType" HeaderText="Transport Type" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Transport Type")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="DeliveryWindow" HeaderText="Delivery<br/>Window" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:} <br/>",Eval("DeliveryWindow")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="Pick Up"
                                        HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Pick Up")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="Drop Off"
                                        HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false"
                                        ItemStyle-Height="80px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Drop Off")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="PostalCode" HeaderText="Postal<br/>Code" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Postal Code")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="Route" HeaderText="Route" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Route")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver"
                                        HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblVehNo" Text='<%# string.Format("{0:}",Eval("VehNo")) %>'></asp:Label>
                                            <br />
                                            <asp:Label runat="server" ID="lblDriver" Text='<%# string.Format("{0:}",Eval("DriverName")) %>'></asp:Label>
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
                                    <telerik:GridBoundColumn DataField="PostalCodeNotesDetected" UniqueName="PostalCodeNotesDetected" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderStatusColourCode" UniqueName="OrderStatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TripId" HeaderText="TripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JOBID" HeaderText="JOBID" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DriverId" HeaderText="DriverId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="VehNo" HeaderText="VehNo" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="ExcelBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="FailedRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="CastingRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="DDSDashboardRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="SummaryRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="MapPlanningView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QuickSurfRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="UploadRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="PostalCodeNotesRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

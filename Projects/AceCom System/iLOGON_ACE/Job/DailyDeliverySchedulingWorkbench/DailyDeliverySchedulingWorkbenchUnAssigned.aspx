<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliverySchedulingWorkbenchUnAssigned.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliverySchedulingWorkbench.DailyDeliverySchedulingWorkbenchUnAssigned" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyDeliverySchedulingWorkbenchUnAssigned</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

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

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: right;
        }

        .ReturnImgCSS {
            float: right !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="UnAssignedTab" Text="UnAssigned" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SectorCoverageTab" Text="Sector Coverage" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MapPlanningTab" Text="MapPlanning" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BookingTab" Text="Booking" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TransportTakeOverTab" Text="Transport Take Over" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="UnAssignedRadPageView" Height="700px">
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="frdatelbl" runat="server" Text="Date" />
                            <br />
                            <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
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
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="CastingBtn" runat="server" CssClass="LongLabelWhite" Text="Run Casting" OnClick="CastingBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:CheckBox ID="LesserInfoChk" runat="server" CssClass="BigCheckBox" OnCheckedChanged="LesserInfoChk_CheckedChanged" AutoPostBack="true" />
                        </td>
                        <td>
                            <br />
                            <asp:Label ID="LesserInfoChkLbl" runat="server" Font-Size="Small" Font-Bold="true" Text="LessInfo" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="AssignBtn" runat="server" CssClass="blue" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="UnAssignBtn" runat="server" CssClass="blue" OnClick="UnAssignBtn_Click"
                                Text="UnAssign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="SelectUnassignTripBtn" runat="server" CssClass="LongLabelBlue" OnClientClick="SelectUnassignTripBtn_Click(); return false" Width="100px" Font-Size="10px"
                                Text="SelectUnAssigned Trips" UseSubmitBehavior="false" />
                            <asp:Button ID="EditBookingBtn" runat="server" CssClass="LongLabelWhite" OnClick="EditBookingBtn_Click"
                                Text="Edit Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="SelectAllBookingBtn" runat="server" CssClass="LongLabelWhite"
                                Text="Select All Bookings" OnClientClick="selectAllBookingBtn_click(); return false" UseSubmitBehavior="false" />
                            <asp:Button ID="JobSheetBtn" CssClass="Blue" runat="server" OnClick="JobSheetBtn_Click"
                                Text="JobSheet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="JobSheet2Btn" CssClass="Blue" runat="server" OnClick="JobSheet2Btn_Click"
                                Text="JobSheet2" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="VehicleRouteBtn" CssClass="white" runat="server" OnClick="VehicleRouteBtn_Click"
                                Text="VehicleRoute" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="PairBtn" CssClass="white" runat="server" OnClick="PairBtn_Click"
                                Text="Pair" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;<br />
                            <br />
                            <asp:Label runat="server" ID="TotalDropPointsLbl"></asp:Label>
                            &nbsp;
                            <asp:Label runat="server" ID="TotalPackagesLbl"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro"
                            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                            ItemStyle-Wrap="true" Width="100%" Height="90%">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true"></HeaderStyle>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridBoundColumn UniqueName="Hidden" Display="false" />
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox" onclick="checkCurrentRowTrips(this)" AutoPostBack="false" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
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
                    </script>
                    <script type="text/javascript">
                        // https://github.com/uxitten/polyfill/blob/master/string.polyfill.js
                        // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart
                        if (!String.prototype.padStart) {
                            String.prototype.padStart = function padStart(targetLength, padString) {
                                targetLength = targetLength >> 0; //truncate if number or convert non-number to 0;
                                padString = String((typeof padString !== 'undefined' ? padString : ' '));
                                if (this.length > targetLength) {
                                    return String(this);
                                }
                                else {
                                    targetLength = targetLength - this.length;
                                    if (targetLength > padString.length) {
                                        padString += padString.repeat(targetLength / padString.length); //append to original to ensure we are longer than needed
                                    }
                                    return padString.slice(0, targetLength) + String(this);
                                }
                            };
                        }
                        if (!String.prototype.repeat) {
                            String.prototype.repeat = function (count) {
                                'use strict';
                                if (this == null) {
                                    throw new TypeError('can\'t convert ' + this + ' to object');
                                }
                                var str = '' + this;
                                count = +count;
                                if (count != count) {
                                    count = 0;
                                }
                                if (count < 0) {
                                    throw new RangeError('repeat count must be non-negative');
                                }
                                if (count == Infinity) {
                                    throw new RangeError('repeat count must be less than infinity');
                                }
                                count = Math.floor(count);
                                if (str.length == 0 || count == 0) {
                                    return '';
                                }
                                // Ensuring count is a 31-bit integer allows us to heavily optimize the
                                // main part. But anyway, most current (August 2014) browsers can't handle
                                // strings 1 << 28 chars or longer, so:
                                if (str.length * count >= 1 << 28) {
                                    throw new RangeError('repeat count must not overflow maximum string size');
                                }
                                var maxCount = str.length * count;
                                count = Math.floor(Math.log(count) / Math.log(2));
                                while (count) {
                                    str += str;
                                    count--;
                                }
                                str += str.substring(0, maxCount - str.length);
                                return str;
                            }
                        }

                        function checkCurrentRowTrips(element) {
                            var checkboxes = element.closest("tr").querySelectorAll('input[type="checkbox"]');
                            for (var i = 0; i < checkboxes.length; i++)
                                if (checkboxes[i].id !== element.id)
                                    checkboxes[i].checked = element.checked;
                        }

                        function selectAllBookingBtn_click() {
                            var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();

                            // get highest no in column
                            var highestNoColumn = 0;
                            var columns = masterTable.get_columns();
                            for (var k = 0; k < columns.length; k++) {
                                var columnNo = parseInt(columns[k].get_uniqueName());
                                if (columnNo > highestNoColumn) highestNoColumn = columnNo;
                            }

                            var row = masterTable.get_dataItems();
                            for (var i = 0; i < row.length; i++) {
                                for (var colIndex = 1; colIndex <= highestNoColumn; colIndex++) {
                                    var colIndexStr = colIndex + '';
                                    colIndexStr = colIndexStr.padStart(4, '0');

                                    var tripId = masterTable.getCellByColumnUniqueName(row[i], colIndexStr + "TripId").innerText;
                                    if (!isNaN(parseInt(tripId))) {
                                        row[i].findElement('TripCB' + tripId).checked = true;
                                    }
                                }
                            }
                        }

                        function SelectUnassignTripBtn_Click() {
                            var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();

                            // get highest no in column
                            var highestNoColumn = 0;
                            var columns = masterTable.get_columns();
                            for (var k = 0; k < columns.length; k++) {
                                var columnNo = parseInt(columns[k].get_uniqueName());
                                if (columnNo > highestNoColumn) highestNoColumn = columnNo;
                            }

                            var row = masterTable.get_dataItems();
                            for (var i = 0; i < row.length; i++) {
                                for (var colIndex = 1; colIndex <= highestNoColumn; colIndex++) {
                                    var colIndexStr = colIndex + '';
                                    colIndexStr = colIndexStr.padStart(4, '0');

                                    var tripId = masterTable.getCellByColumnUniqueName(row[i], colIndexStr + "TripId").innerText;
                                    if (!isNaN(parseInt(tripId))) {
                                        var tripStatusCode = masterTable.getCellByColumnUniqueName(row[i], colIndexStr + "TripStatusCode").innerText;
                                        var isUnassignedTrip = parseInt(tripStatusCode) < 20;
                                        row[i].findElement('TripCB' + tripId).checked = isUnassignedTrip;
                                    }
                                }
                            }
                        }
                    </script>
                </telerik:RadCodeBlock>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RoadMapRadPageView" Height="900px" ContentUrl ="DailyDeliverySchedulingWorkbenchSectorCoverage.aspx" />
            <telerik:RadPageView runat="server" Height="700px" ID="MapPlanningRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="BookingRadPageView" Height="900px" />
            <telerik:RadPageView runat="server" ID="TransportTakeOverRadPageView" Height="900px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

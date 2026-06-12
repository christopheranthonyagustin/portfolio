<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripSchedWorkbench.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripSchedWorkbench" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <%--  <title>TripScheduleWorkbench</title>--%>
   <title id="title1" runat="server"></title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
        .RadScheduler .rsContent .rsHorizontalHeaderTable th div
        {
            color: Black;
        }
        .RadScheduler .rsVerticalHeaderTable div
        {
            height: auto !important;
            width: auto !important;
            text-align: center !important;
            vertical-align: middle !important;
        }
        .RadScheduler .rsVerticalHeaderTable th
        {
            vertical-align: middle;
            background-color: #0047B3 !important;
            color: White !important;
        }
        .rsAptResize
        {
            visibility: hidden;
        }
        .rsAdvancedModal
        {
            left: 200px !important;
            top: 120px !important;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <script type="text/javascript">
        var $ = $telerik.$;
        function pageLoad() {
            var hiddenfield = document.getElementById("<%= HiddenField1.ClientID %>");
            var height = getDocHeight() - 100;
            //alert(height);
            var scheduler = $find('<%=RadScheduler1.ClientID %>');
            hiddenfield.value = height;
            scheduler.set_height("" + height + "px");
            
            var $element = $('.rsHorizontalHeaderTable').find("th:contains('05:30')");
            var offset = $element.offset();
            var $scrollArea = $('.rsContentScrollArea');

            if (document.getElementById("<%= OrigPos.ClientID %>").value == "")
                document.getElementById("<%= OrigPos.ClientID %>").value = offset.left + 10;

            var origOffSet = document.getElementById("<%= OrigPos.ClientID %>").value;

            $scrollArea.scrollLeft(origOffSet);

            
        }

        function getDocHeight() {
            //utility function to find dimensions of page
            var D = document;
            return Math.max(
               Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
               Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
               Math.max(D.body.clientHeight, D.documentElement.clientHeight)
            );
        }

        function OnClientAppointmentClick(sender, args) {
            var appID = args.get_appointment().get_id()
            openWindow(appID);

            var oWnd = $find("<%= TripDetails.ClientID %>");
            oWnd.setSize(1600, 800);
        }

        function OnClientAppointmentMoveEnd(sender, args) {

            var appointment = args.get_appointment();

            // Calculate the duration of the appointment
            var appointmentDuration = appointment.get_end() - appointment.get_start();

            // The new start time is provided in the event arguments
            var newStartTime = args.get_newStartTime();
            var dtStartTime = new Date(args.get_newStartTime()).format("dd/MMM/yyyy HH:mm");

            // Add the duration of the appointment to the new start time to get the new end time
            var newEndTime = new Date(newStartTime.getTime() + appointmentDuration);
            var dtEndTime = new Date(newStartTime.getTime() + appointmentDuration).format("dd/MMM/yyyy HH:mm");

            // Get target Resource (vehicle)
            var targetResource = args.get_targetSlot().get_resource();
            var newVeh = targetResource.get_key();

            var appID = args.get_appointment().get_id()
            openCfmUpdateWindow(appID, dtStartTime, dtEndTime, newVeh);

            var oWnd = $find("<%= TripDetails.ClientID %>");
            oWnd.setSize(1600, 800);

            sender.postback = function() { };
            args.set_cancel(true);
        }

        function openWindow(id) {
            var guid = document.getElementById("<%= hfProcessID.ClientID %>").value;
            var win = window.radopen('TripSchedWBDetl.aspx?id=' + id + '&guid=' + guid, 'TripDetails');
            //win.center();
        }

        function openCfmUpdateWindow(id, start, end, resource) {
            var guid = document.getElementById("<%= hfProcessID.ClientID %>").value;
            var win = window.radopen('TripSchedWBDetl.aspx?id=' + id + '&guid=' + guid + '&newstart=' + start + '&newend=' + end + '&vehno=' + resource + '&cfmupd=Y', 'TripDetails');
            //win.center();
        }
    </script>

    <table width="100%">
        <tr>
            <td>
                <div class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Trip Scheduling Workbench</asp:Label>
                    <asp:HiddenField ID="hfProcessID" runat="server" />
                    <asp:HiddenField ID="OrigPos" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
        <Items>
            <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                Style="text-align: center; font-size: 15px; font-weight: bold;">
                <Items>
                    <telerik:RadPanelItem runat="server" Value="Panel">
                        <ItemTemplate>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td class="style2">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 200px" valign="top">
                                                    <asp:Label ID="FrDateLbl" runat="server" Text="ExecutionDate" /><br />
                                                    <telerik:RadDatePicker ID="frExpDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                                        <Calendar>
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="AccountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadDropDownList ID="AccountDDL" runat="server" DropDownHeight="150px" Width="150px"
                                                        Skin="WebBlue" DefaultMessage="Select an account" DropDownWidth="180px">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td style="width: 400px" valign="top">
                                                    <asp:Label ID="OpsUnitLbl" runat="server" Text="ShipmentType" />
                                                    <br />
                                                    <telerik:RadListBox runat="server" ID="OpsUnitSrcBox" Height="120px" Width="185px"
                                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="OpsUnitDestBox"
                                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                        AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" OnTransferred="OpsUnitSrcBox_Transferred">
                                                    </telerik:RadListBox>
                                                    <telerik:RadListBox runat="server" ID="OpsUnitDestBox" Height="120px" Width="150px"
                                                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                        AllowDelete="false">
                                                    </telerik:RadListBox>
                                                </td>
                                                <td style="width: 10px">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 200px" valign="top">
                                                    <asp:Label ID="refreshLbl" runat="server" Text="Refresh" /><br />
                                                    <telerik:RadDropDownList ID="refreshDdl" runat="server" DropDownHeight="100px" Width="150px"
                                                        Skin="WebBlue" DefaultMessage="Select a Refresh Interval" DropDownWidth="150px">
                                                    </telerik:RadDropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:CheckBox id="inactiveChkBox" runat="server" Text="Inactive Vehicles Only"></asp:CheckBox>
                                                </td>
                                                <td style="width: 10px">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 200px" valign="top">
                                                    &nbsp;
                                                    <br />
                                                    <telerik:RadButton ID="refreshBtn" runat="server" OnClick="refreshBtn_Click" Text="Refresh"
                                                        Skin="WebBlue">
                                                    </telerik:RadButton>
                                                    <br />
                                                    <br />
                                                    <asp:CheckBox id="ExcludeSpecAccChkBox" runat="server" Text="Exclude Special Account" AutoPostBack="true" OnCheckedChanged="ExcludeSpecAccChkBox_CheckChanged"></asp:CheckBox>
                                                </td>
                                                <td style="width: 10px">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 300px" valign="top">
                                                    <input id="HIDDEN_date" type="hidden" runat="server" />
                                                    <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                                    <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                                                    <br />
                                                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                                        Visible="False"></asp:Label>                                                    
                                                    <br />
                                                    <br />
                                                    <asp:CheckBox id="OnlySpecAccChkBox" runat="server" Text="Only Special Account" AutoPostBack="true"
                                                     OnCheckedChanged="OnlySpecAccChkBox_CheckChanged"></asp:CheckBox>    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
        </Items>
        <ExpandAnimation Type="None" />
        <CollapseAnimation Type="None" />
    </telerik:RadPanelBar>
    <br />
    <telerik:RadWindowManager runat="server" ID="RadWindowManager1" RenderMode="Lightweight">
        <Windows>
            <telerik:RadWindow runat="server" ID="TripDetails" Width="635px" Height="530px" AutoSize="false"
                Behaviors="Move,Close" ShowContentDuringLoad="false" Modal="true" CenterIfModal="false"
                Left="20" Top="20">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <telerik:RadButton ID="exportBtn" runat="server" OnClick="exportBtn_Click" Text="Export to PDF"
        Visible="false" Skin="WebBlue">
    </telerik:RadButton>
    <br />
    <br />
    <telerik:RadScheduler runat="server" ID="RadScheduler1" AppointmentStyleMode="Default"
        EnableExactTimeRendering="true" Visible="false" ColumnWidth="50" EnableRecurrenceSupport="false"
        SelectedView="TimelineView" Skin="Office2007" DataKeyField="id" DataStartField="frexpdate"
        DataEndField="toexpdate" DataSubjectField="jobno" DataDescriptionField="fraddr"
        DayStartTime="00:00:00" DayEndTime="23:59:59" ShowNavigationPane="false" AllowInsert="false"
        RowHeight="45px" AllowDelete="false" OnAppointmentClick="RadScheduler1_AppointmentClick"
        OnAppointmentDataBound="RadScheduler1_AppointmentDataBound" OnAppointmentCreated="RadScheduler1_AppointmentCreated"
        CustomAttributeNames="status,statuscolor,fraddr,toaddr,jobno,triptype,accode,shortFrAddr,shortToAddr,billsizetype,jbcisimpt,actpkg,actplt,actwt,actvol,exppkg,expplt,fractdate,fracttime,eqptypedescr,ctnrno,jbcjobtypeHTMLColourCode,triptypeColorMetaphor,jbcdescr,remarks2,trailerno,ctnrwt"
        OnClientAppointmentClick="OnClientAppointmentClick" OnClientAppointmentMoveEnd="OnClientAppointmentMoveEnd">
        <AdvancedForm Modal="true" Width="300" MaximumHeight="300" Enabled="false"></AdvancedForm>
        <MonthView UserSelectable="false"></MonthView>
        <DayView UserSelectable="false"></DayView>
        <WeekView UserSelectable="false"></WeekView>
        <TimelineView UserSelectable="false"></TimelineView>
        <ResourceHeaderTemplate>
            <%--<telerik:RadToolTip ID="RadToolTip1" runat="server" TargetControlID="ResourcePanel"
                Text='<%# ReturnResourceDescr(Eval("Text"))%>'>
            </telerik:RadToolTip>--%>
            <asp:Panel ID="ResourcePanel" runat="server">
                <%#Eval("Key")%>
                <asp:Label ID="StatusLbl" runat="server" Width="10px" Height="10px" BackColor='<%# ReturnColor(Eval("Text"))%>'></asp:Label>
            </asp:Panel>
            <asp:Image ID="VehOffIcon" runat="server" Width="25px" Height="25px" ImageUrl="../../Image/off.png"
                Visible='<%# ReturnVehOff(Eval("Text"))%>' ToolTip='<%# ReturnToolTip(Eval("Text"))%>' />
        </ResourceHeaderTemplate>
        <AppointmentTemplate>
            <asp:Label ID="jobTypeBoxLbl" runat="server" Width="10" Height="10" Visible="false" />
            <asp:Label ID="tripTypeImgLbl" runat="server" Visible="false" />
            <%#Eval("jobno")%>
            ≈
            <i><b><%#Eval("fracttime")%></b></i>
            ≈
            <%#Eval("accode")%>
            ~
            <%#Eval("triptype")%>
            ~
            <%#Eval("billsizetype")%>
            ~
            <%#Eval("shortFrAddr")%>
            ~
            <%#Eval("shortToAddr")%>
            ~
            <%#Eval("Eqptypedescr")%>
        </AppointmentTemplate>
        <TimeSlotContextMenuSettings EnableDefault="false"></TimeSlotContextMenuSettings>
        <AppointmentContextMenuSettings EnableDefault="false"></AppointmentContextMenuSettings>
    </telerik:RadScheduler>
    </form>
</body>
</html>

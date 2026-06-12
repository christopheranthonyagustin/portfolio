<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManpowerSchedWorkbench.aspx.cs"
    Inherits="iWMS.Web.Job.ManpowerPlanning.ManpowerSchedWorkbench" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ManpowerScheduleWorkbench</title>
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
            var appID = args.get_appointment().get_id();
            var list = args.get_appointment().get_attributes();
            //var optype = list.getAttribute('optype');
            openWindow(appID);

            var oWnd = $find("<%= ManpowerDetails.ClientID %>");
            oWnd.setSize(1300, 700);
        }

        function OnClientAppointmentMoveStart(sender, args) {
            var appID = args.get_appointment().get_id();
            if (appID = 0) {
                args.set_cancel(true);
            }
            else {
                args.set_cancel(false);
            }
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
            //var optype = targetResource.get_attributes().getAttribute("optype");

            var appID = args.get_appointment().get_id();
            openCfmUpdateWindow(appID, dtStartTime, dtEndTime, newVeh);

            var oWnd = $find("<%= ManpowerDetails.ClientID %>");
            oWnd.setSize(1300, 700);

            sender.postback = function() { };
            args.set_cancel(true);
        }

        function openWindow(id) {
            if (id != 0) {
                var guid = document.getElementById("<%= hfProcessID.ClientID %>").value;
                var win = window.radopen('ManpowerSchedWBDetl.aspx?id=' + id + '&guid=' + guid, 'ManpowerDetails');
                //win.center();
            }
        }

        function openCfmUpdateWindow(id, start, end, resource) {
            if (id != 0) {
                var guid = document.getElementById("<%= hfProcessID.ClientID %>").value;
                var win = window.radopen('ManpowerSchedWBDetl.aspx?id=' + id + '&guid=' + guid + '&newstart=' + start + '&newend=' + end + '&opid=' + resource + '&cfmupd=Y', 'ManpowerDetails');
                //win.center();
            }
        }
    </script>

    <table width="100%">
        <tr>
            <td class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Manpower Scheduling Workbench</asp:Label>
                    <asp:HiddenField ID="hfProcessID" runat="server" />
                    <asp:HiddenField ID="OrigPos" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
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
                                                </td>
                                                <td style="width: 400px" valign="top">
                                                    <asp:Label ID="OptionLbl" runat="server" Text="Option" />
                                                    <br />
                                                    <telerik:RadListBox runat="server" ID="OptionSrcBox" Height="120px" Width="185px"
                                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="OptionDestBox"
                                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                        AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true" OnTransferred="OptionSrcBox_Transferred">
                                                    </telerik:RadListBox>
                                                    <telerik:RadListBox runat="server" ID="OptionDestBox" Height="120px" Width="150px"
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
                                                </td>
                                                <td style="width: 10px">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 100px" valign="top">
                                                    &nbsp;
                                                    <br />
                                                    <telerik:RadButton ID="refreshBtn" runat="server" OnClick="refreshBtn_Click" Text="Refresh"
                                                        Skin="WebBlue">
                                                    </telerik:RadButton>
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
    <telerik:RadWindowManager runat="server" ID="RadWindowManager1">
        <Windows>
            <telerik:RadWindow runat="server" ID="ManpowerDetails" VisibleStatusbar="false" Width="635px"
                Height="530px" AutoSize="false" Behaviors="Close, Move" ShowContentDuringLoad="false" Modal="true" CenterIfModal="false"
                Left="20" Top="20">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <telerik:RadScheduler runat="server" ID="RadScheduler1" AppointmentStyleMode="Default" EnableExactTimeRendering="true"
        Visible="false" ColumnWidth="50" EnableRecurrenceSupport="false" SelectedView="TimelineView"
        Skin="Office2007" DataKeyField="id" DataStartField="inctstartdate"
        DataEndField="inctenddate" DataSubjectField="jbno" DataDescriptionField="jpafraddr"
        DayStartTime="00:00:00" DayEndTime="23:59:59" ShowNavigationPane="false" RowHeight="45px"
        AllowInsert="false" AllowDelete="false" OnAppointmentClick="RadScheduler1_AppointmentClick"
        OnAppointmentDataBound="RadScheduler1_AppointmentDataBound" OnDataBound="RadScheduler1_DataBound"
        OnAppointmentCreated="RadScheduler1_AppointmentCreated" CustomAttributeNames="id,status,statuscolor,jpafraddr,jbno,peratvtcodedescr,accode,shortFrAddr,shortToAddr,typedescr,longFrAddr,longToAddr,AtvtRemarks,BillSizeType,VehNo,Trailer,TripDriverRemark,TripRemark,tprperdtColorMetaphor,opdescr"
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
                <%# ReturnResourceName(Eval("Text"))%>
              <asp:Label ID="StatusLbl" runat="server" Width="10px" Height="10px" BackColor='<%# ReturnColor(Eval("Text"))%>' ></asp:Label> 
            </asp:Panel>
           <asp:Label ID="OffLbl" runat="server" Text='<%# ReturnToolTip(Eval("Text"))%>'  BackColor='<%# ReturnLblColor(Eval("Text"))%>' />
            <asp:Image ID="VehOffIcon" runat="server" Width="25px" Height="25px" ImageUrl="../../Image/off.png" Visible='<%# ReturnVehOff(Eval("Text"))%>' ToolTip='<%# ReturnToolTip(Eval("Text"))%>' />
        </ResourceHeaderTemplate>
        <AppointmentTemplate>
            <asp:Label ID="MetaphorImgLbl" runat="server" Visible="false" />            
            <%#Eval("opdescr")%>
            ~
            <%#Eval("jbno")%>
            ~
            <%#Eval("accode")%>
            ~
            <%#Eval("peratvtcodedescr")%>
            ~
            <%#Eval("typedescr")%>
            ~
            <%#Eval("shortFrAddr")%>
            ~
            <%#Eval("shortToAddr")%>            
        </AppointmentTemplate>
        <TimeSlotContextMenuSettings EnableDefault="false"></TimeSlotContextMenuSettings>
        <AppointmentContextMenuSettings EnableDefault="false"></AppointmentContextMenuSettings>
    </telerik:RadScheduler>
    </form>
</body>
</html>

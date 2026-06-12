<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyRidesPlanningGantt.aspx.cs" Inherits="iWMS.Web.BusManagement.DailyRidesPlanning.DailyRidesPlanningGantt" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyRidesPlanningGantt</title>
     <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self" />
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

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
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <script type="text/javascript">
        var $ = $telerik.$;
        function pageLoad() {
      <%--var hiddenfield = document.getElementById("<%= HiddenField1.ClientID %>");--%>
            var height = getDocHeight() - 100;
            //alert(height);
            var scheduler = $find('<%=RadScheduler1.ClientID %>');
            1 = height;
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
            var appointmentDuration = appointment.get_end() - appointment.get_start();
            var newStartTime = args.get_newStartTime();
            var dtStartTime = new Date(args.get_newStartTime()).format("dd/MMM/yyyy HH:mm");
            var newEndTime = new Date(newStartTime.getTime() + appointmentDuration);
            var dtEndTime = new Date(newStartTime.getTime() + appointmentDuration).format("dd/MMM/yyyy HH:mm");
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
            var win = window.radopen('DailyRidesPlanningGanttDetl.aspx?id=' + id + '&guid=' + guid, 'TripDetails');
            //win.center();
        }

        function openCfmUpdateWindow(id, start, end, resource) {
            var guid = document.getElementById("<%= hfProcessID.ClientID %>").value;
            var win = window.radopen('DailyRidesPlanningGanttDetl.aspx?id=' + id + '&guid=' + guid + '&newstart=' + start + '&newend=' + end + '&vehno=' + resource + '&cfmupd=Y', 'TripDetails');
            //win.center();
        }
    </script>
    <table width="100%">
        <tr>
            <td>
                <div class="NewModuleTitle">
                    <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server">Daily Rides Planning Gantt</asp:Label>
                    <asp:HiddenField ID="hfProcessID" runat="server" />
                    <asp:HiddenField ID="OrigPos" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
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
            </td>
            <td>
                <br />
                <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
            </td>
            <td>
                <br />
                <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                    Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>

    <telerik:RadWindowManager runat="server" ID="RadWindowManager1" RenderMode="Lightweight">
        <Windows>
            <telerik:RadWindow runat="server" ID="TripDetails" Width="635px" Height="530px" AutoSize="false"
                Behaviors="Move,Close" ShowContentDuringLoad="false" Modal="true" CenterIfModal="false"
                Left="20" Top="20">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <br />
    <br />
    <telerik:RadScheduler runat="server" ID="RadScheduler1" AppointmentStyleMode="Default" Height="500"
        EnableExactTimeRendering="true" Visible="false" ColumnWidth="50" EnableRecurrenceSupport="false"
        SelectedView="TimelineView" Skin="Office2007" DataKeyField="jbtripid" DataStartField="frexpdate"
        DataEndField="toexpdate" DataSubjectField="jobno" DataDescriptionField="fraddr"
        DayStartTime="00:00:00" DayEndTime="23:59:59" ShowNavigationPane="false" AllowInsert="false"
        RowHeight="45px" AllowDelete="false" OnAppointmentClick="RadScheduler1_AppointmentClick"
        OnAppointmentDataBound="RadScheduler1_AppointmentDataBound" OnAppointmentCreated="RadScheduler1_AppointmentCreated"
        CustomAttributeNames="tripfrtime,status,statuscolor,fraddr,toaddr,jobno,triptype,accode,shortfraddr,shorttoaddr,billsizetype,jbcjobtypeHTMLColourCode,triptypeColorMetaphor"
        OnClientAppointmentClick="OnClientAppointmentClick" OnClientAppointmentMoveEnd="OnClientAppointmentMoveEnd">
        <AdvancedForm Modal="true" Width="300" MaximumHeight="300" Enabled="false"></AdvancedForm>
        <MonthView UserSelectable="false"></MonthView>
        <DayView UserSelectable="false"></DayView>
        <WeekView UserSelectable="false"></WeekView>
        <TimelineView UserSelectable="false"></TimelineView>
        <ResourceHeaderTemplate>
            <asp:Panel ID="ResourcePanel" runat="server">
                <%#Eval("Key")%>
                <asp:Label ID="StatusLbl" runat="server" Width="10px" Height="10px" BackColor='<%# ReturnColor(Eval("Text"))%>'></asp:Label>
            </asp:Panel>
<%--            <asp:Image ID="VehOffIcon" runat="server" Width="25px" Height="25px" ImageUrl="../../Image/off.png"
                Visible='<%# ReturnVehOff(Eval("Text"))%>' ToolTip='<%# ReturnToolTip(Eval("Text"))%>' />--%>
        </ResourceHeaderTemplate>
        <AppointmentTemplate>
            <asp:Label ID="jobTypeBoxLbl" runat="server" Width="10" Height="10" Visible="false" />
            <asp:Label ID="tripTypeImgLbl" runat="server" Visible="false" />
            <%#Eval("jobno")%>
            ≈
            <i><b><%#Eval("tripfrtime")%></b></i>
            ≈
            <%#Eval("accode")%>
            ~
            <%#Eval("billsizetype")%>
            ~
            <%#Eval("shortfraddr")%>
            ~
            <%#Eval("shorttoaddr")%>
        </AppointmentTemplate>
        <TimeSlotContextMenuSettings EnableDefault="false"></TimeSlotContextMenuSettings>
        <AppointmentContextMenuSettings EnableDefault="false"></AppointmentContextMenuSettings>
    </telerik:RadScheduler>
    </form>
</body>
</html>

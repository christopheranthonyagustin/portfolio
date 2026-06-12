<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs"
    Inherits="iWMS.Web.Graphlet.PersonnelAnalysis.Result" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PersonnelAttendanceAnalysis</title>
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
            args.set_cancel(true);
        }
    </script>
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
         <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" class="graytitle" Text="Department :" />
                <asp:Label ID="DeptLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" class="graytitle" Text="Personnel :" />
                <asp:Label ID="PerLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="frmat" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadScheduler runat="server" ID="RadScheduler1" AppointmentStyleMode="Default" ReadOnly="true"
        EnableExactTimeRendering="true" ColumnWidth="50" EnableRecurrenceSupport="false"
        SelectedView="TimelineView" Skin="Office2007" DataKeyField="perid" DataStartField="frdate"
        DataEndField="todate" DataSubjectField="abstype" DataDescriptionField="abstype"
        DayStartTime="00:00:00" DayEndTime="23:59:59" ShowNavigationPane="false" AllowInsert="false"
        AllowDelete="false" OnAppointmentDataBound="RadScheduler1_AppointmentDataBound" OnAppointmentCreated="RadScheduler1_AppointmentCreated"
        CustomAttributeNames="abstype,abscolor,abstypedescr"
        OnClientAppointmentClick="OnClientAppointmentClick">
        <AdvancedForm Modal="true" Width="300" MaximumHeight="300" Enabled="false"></AdvancedForm>
        <MonthView UserSelectable="false"></MonthView>
        <DayView UserSelectable="false"></DayView>
        <WeekView UserSelectable="false"></WeekView>
        <TimelineView UserSelectable="false"></TimelineView>
        <ResourceHeaderTemplate>
            <%#Eval("Text")%>
        </ResourceHeaderTemplate>
        <AppointmentTemplate>
            <b><%#Eval("abstype")%></b>
        </AppointmentTemplate>
        <TimeSlotContextMenuSettings EnableDefault="false"></TimeSlotContextMenuSettings>
        <AppointmentContextMenuSettings EnableDefault="false"></AppointmentContextMenuSettings>
    </telerik:RadScheduler>
    </form>
</body>
</html>

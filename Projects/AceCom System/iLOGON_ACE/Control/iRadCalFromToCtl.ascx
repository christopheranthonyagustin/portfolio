<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="iRadCalFromToCtl.ascx.cs"
    Inherits="iWMS.Web.Control.iRadCalFromToCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    function SetFromDate(sender, args) {
        var dt = new Date();

        sender
            ._textbox
            .set_Value('FROM ' + sender._selectedDate.format(sender._format));
    }

    function SetToDate(sender, args) {
        var dt = new Date();

        sender
            ._textbox
            .set_Value('TO ' + sender._selectedDate.format(sender._format));
    }
</script>

<telerik:RadDatePicker ID="FromDateTxt" MinDate="1/1/1800"  runat="server" Width="155" DateInput-DateFormat= "dd/MMM/yyyy" Skin="Office2007">
    <DateInput ID="DateInput1" EmptyMessage="  From" runat="server" DisplayDateFormat="FRO'M' dd/MMM/yyyy" >
    </DateInput>
    <Calendar runat="server">
        <SpecialDays>
            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
        </SpecialDays>
    </Calendar>
</telerik:RadDatePicker>
<br />
<telerik:RadDatePicker ID="ToDateTxt" MinDate="1/1/1800"  runat="server" Width="155" DateInput-DateFormat="TO dd/MMM/yyyy 23:59:59" Skin="Office2007">
    <DateInput ID="DateInput2" EmptyMessage="  To" runat="server">
    </DateInput>
    <Calendar runat="server">
        <SpecialDays>
            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
        </SpecialDays>
    </Calendar>
</telerik:RadDatePicker>

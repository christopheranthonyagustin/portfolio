<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iCalFromToCtl.ascx.cs" Inherits="iWMS.Web.Control.iCalFromToCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script type="text/javascript">
function SetFromDate(sender,args) {
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
<asp:TextBox ID="FromDateTxt" runat="server" Width="155"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="FromDateTxt_TextBoxWatermarkExtender" 
    runat="server" Enabled="True" TargetControlID="FromDateTxt" 
    WatermarkText="From" WatermarkCssClass="watermark">
</asp:TextBoxWatermarkExtender>
<asp:CalendarExtender ID="FromDateTxt_CalendarExtender" runat="server" 
    Enabled="True" TargetControlID="FromDateTxt"
    DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" 
    Format="dd/MMM/yyyy" OnClientDateSelectionChanged="SetFromDate">
</asp:CalendarExtender>
<br />
<asp:TextBox ID="ToDateTxt" runat="server" Width="155"></asp:TextBox>
<asp:TextBoxWatermarkExtender ID="ToDateTxt_TextBoxWatermarkExtender" 
    runat="server" Enabled="True" TargetControlID="ToDateTxt"
    WatermarkText="To" WatermarkCssClass="watermark">
</asp:TextBoxWatermarkExtender>
<asp:CalendarExtender ID="ToDateTxt_CalendarExtender" runat="server" 
    Enabled="True" TargetControlID="ToDateTxt"
    DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" 
    Format="dd/MMM/yyyy 23:59:59" OnClientDateSelectionChanged="SetToDate">
</asp:CalendarExtender>


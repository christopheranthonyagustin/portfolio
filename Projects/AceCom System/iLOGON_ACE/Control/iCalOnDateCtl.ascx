<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iCalOnDateCtl.ascx.cs" Inherits="iWMS.Web.Control.iCalOnDateCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:TextBox ID="ReturnTxt" runat="server"></asp:TextBox>
<asp:CalendarExtender ID="ReturnTxt_CalendarExtender" runat="server" 
    Enabled="True" TargetControlID="ReturnTxt"
    DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" 
    Format="dd/MMM/yyyy" >
</asp:CalendarExtender>
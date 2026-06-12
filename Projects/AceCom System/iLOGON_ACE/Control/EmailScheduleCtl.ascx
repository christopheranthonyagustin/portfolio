<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="EmailScheduleCtl.ascx.cs" Inherits="iWMS.Web.Control.EmailScheduleCtl" %>
<div style="text-align:center"><asp:Label id="AddLbl" runat="server" CssClass="pagetitle">Add New Schedule</asp:Label></div>
<br />
<iwms:iform id="formCtl" runat="server"></iwms:iform>


<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iPartnerSearchCtl.ascx.cs" Inherits="iWMS.Web.Control.iPartnerSearchCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:textbox id="ReturnTxt" runat="server" AutoPostBack="True" width = "155px" ontextchanged="ReturnTxt_TextChanged"></asp:textbox>
<asp:LinkButton CausesValidation="False" id="LookupBtn" runat="server">
	<img align="absmiddle" src="../../Image/icon-lookup.gif" border="0"></asp:LinkButton>


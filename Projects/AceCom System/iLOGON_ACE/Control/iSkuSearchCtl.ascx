<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iSkuSearchCtl.ascx.cs" Inherits="iWMS.Web.Control.iSkuSearchCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:textbox id="ReturnTxt" runat="server" AutoPostBack="True" ontextchanged="ReturnTxt_TextChanged" Width = "155px"></asp:textbox>
<asp:LinkButton CausesValidation="False" id="LookupBtn" runat="server">
	<img align="absmiddle" src="../../Image/icon-lookup.gif" border="0"></asp:LinkButton>


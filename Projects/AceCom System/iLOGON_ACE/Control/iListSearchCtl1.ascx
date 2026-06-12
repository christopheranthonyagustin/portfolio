<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iListSearchCtl1.ascx.cs" Inherits="iWMS.Web.Control.iListSearchCtl1" %>
<asp:textbox id="ReturnTxt" runat="server" AutoPostBack="True" ontextchanged="ReturnTxt_TextChanged"></asp:textbox>
<%--<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>
<asp:LinkButton CausesValidation="False" id="LookupBtn" runat="server">
	<img aJBCHARGElign="absmiddle" src="../../Image/icon-lookup.gif" border="0"></asp:LinkButton>

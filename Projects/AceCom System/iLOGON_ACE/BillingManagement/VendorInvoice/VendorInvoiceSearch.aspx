<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorInvoiceSearch.aspx.cs" Inherits="iWMS.Web.BillingManagement.VendorInvoice.VendorInvoiceSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorInvoiceSearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<BR />&nbsp
			  <asp:button id="SearchBtn" runat="server" Text="Search" CssClass="formbtn" onclick="SearchBtn_Click" /><br>
			<BR />
			  <iwms:iForm id="formCtl" runat="server"></iwms:iForm>&nbsp;&nbsp;
			  <asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" Font-Bold="True" Visible="False" CssClass="errorLabel" />
		</form>
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

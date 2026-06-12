<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="BillingInstructionSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>BillingInstructionSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<SCRIPT type="text/javascript" src="../../js/row.js"></SCRIPT>
	</head>
	<body onload='displayRow("table1");' bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<br />
			<asp:button style="Z-INDEX: 0" id="SearchBtn" runat="server" CssClass="detailbutton" Text="Search" onclick="SearchBtn_Click"></asp:button>
			<br />
			<br />
			<table id="table1" border="0" cellSpacing="0" cellPadding="0" width="100%" runat="server">
				<tr>
					<td style="HEIGHT: 20px"><input id="tab1" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
							value="Header" runat="server" readonly="true">
					</td>
				</tr>
				<tr>
					<td><iwms:iform id="formCtl" runat="server"></iwms:iform></td>
				</tr>
				<tr>
					<td><iwms:iform id="formCtl2" runat="server"></iwms:iform></td>
				</tr>
				<tr>
					<td><iwms:iform id="formCtl3" runat="server"></iwms:iform></td>
				</tr>
			</table>
			&nbsp;<asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label></form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

<%@ Page language="c#" Codebehind="DetailInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.RestaurantIssue.DetailInput" %>
<%@ Register TagPrefix="iWMS" TagName="iInput" Src="../../Control/iInputCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>DetailInput</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<base target="_self">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	</head>
	<body leftMargin="0" topMargin="0" onload="javascript:window.focus();">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td class="pagetitle">&nbsp;
						<asp:label id="ModeLbl" runat="server"></asp:label>&nbsp;Detail&nbsp;
						<asp:label id="IdLbl" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td>&nbsp;Reason :
						<asp:dropdownlist id="TEXT_Reason" runat="server"></asp:dropdownlist><iwms:iinput id="iInput" runat="server"></iwms:iinput><BR>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="center"><asp:button id="SaveNextBtn" runat="server" Text="Save &amp; Next" CssClass="formbtn" onclick="SaveNextBtn_Click"></asp:button>&nbsp;<asp:button id="SaveBtn" runat="server" Text="Save &amp; Close" CssClass="formbtn" onclick="SaveBtn_Click"></asp:button>&nbsp;
						<asp:button id="CloseBtn" runat="server" Text="Close" CssClass="formbtn" onclick="CloseBtn_Click"></asp:button></td>
				</tr>
			</table>
		</form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

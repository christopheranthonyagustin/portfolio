<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>
<%@ Page language="c#" Codebehind="InboundHandlingSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Billing.InboundHandling.InboundHandlingSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReportSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table border="0" cellSpacing="2" cellPadding="2">
				<tr>
					<td noWrap>&nbsp;
						<asp:label id="AccountLbl" runat="server">Account</asp:label></td>
					<td>:
						<asp:dropdownlist id="AccountList" runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td nowrap>&nbsp;
						<asp:Label id="FromLbl" runat="server">From Date</asp:Label></td>
					<td>:&nbsp;<iwms:iCalOnDate id="FromDateCal" runat="server"></iwms:iCalOnDate></td>
				</tr>
				<tr>
					<td nowrap>&nbsp;
						<asp:Label id="ToLbl" runat="server">To Date</asp:Label></td>
					<td style="Z-INDEX: 0">:&nbsp;<iwms:iCalOnDate id="ToDateCal" runat="server"></iwms:iCalOnDate></td>
				</tr>
				<tr>
					<td noWrap>&nbsp;
						<asp:label id="UOMLbl" runat="server">Base UOM</asp:label></td>
					<td>:
						<asp:dropdownlist id="UOMList" runat="server"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td noWrap>&nbsp;
						<asp:label id="BasisLbl" runat="server">Basis</asp:label></td>
					<td>:
						<asp:dropdownlist id="BasisList" runat="server">
							<asp:ListItem Value="qty" Selected="True">Quantity</asp:ListItem>
							<asp:ListItem Value="vol">Volume</asp:ListItem>
							<asp:ListItem Value="wt">Weight</asp:ListItem>
						</asp:dropdownlist></td>
				</tr>
				<tr>
					<td noWrap>&nbsp;
						<asp:label id="UOMRateLbl" runat="server">Rate per Basis</asp:label></td>
					<td>:
						<asp:textbox id="UOMRateTxt" runat="server"></asp:textbox><asp:comparevalidator id="UOMRateVal" runat="server" Display="dynamic" ErrorMessage="* Enter a rate (numbers only)"
							Type="Double" Operator="DataTypeCheck" ControlToValidate="UOMRateTxt"></asp:comparevalidator>&nbsp;
						<asp:RequiredFieldValidator id="UOMRateReq" runat="server" ControlToValidate="UOMRateTxt" ErrorMessage="*" EnableClientScript="True"></asp:RequiredFieldValidator></td>
				<tr>
					<td noWrap>&nbsp;
						<asp:label id="MinimumLbl" runat="server"> Minimum per Receipt</asp:label></td>
					<td>:
						<asp:textbox id="MinimumTxt" runat="server"></asp:textbox><asp:comparevalidator id="MinimumVal" runat="server" Display="dynamic" ErrorMessage="* Enter a minimum amount (numbers only)"
							Type="Double" Operator="DataTypeCheck" ControlToValidate="MinimumTxt"></asp:comparevalidator>&nbsp;
						<asp:RequiredFieldValidator id="MinimumReq" runat="server" ControlToValidate="MinimumTxt" ErrorMessage="*" EnableClientScript="True"></asp:RequiredFieldValidator></td>
				<tr>
					<td noWrap></td>
					<td>&nbsp;
						<asp:button id="CompileBtn" runat="server" Text="Compile" CssClass="formbtn" onclick="CompileBtn_Click"></asp:button>
						<INPUT class="formbtn" value="Reset" type="reset">
						<asp:Label style="Z-INDEX: 0" id="lblError" runat="server" CssClass="Graytext" Visible="False"></asp:Label></td>
				</tr>
			</table>
		</form>
	</body>
</html>

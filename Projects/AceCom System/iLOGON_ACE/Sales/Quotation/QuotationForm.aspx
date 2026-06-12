<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="QuotationForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation.QuotationForm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>QuotationForm</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<SCRIPT type="text/javascript" src="../../js/row.js"></SCRIPT>
	</head>
	<body onload='displayRow("table1");' bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" border="0" cellSpacing="3" cellPadding="3" width="100%" runat="server">
				<tr>
					<td><input id="tab1" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
							value="Header" runat="server">&nbsp;&nbsp;&nbsp;&nbsp; <input id="tab2" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
							value="Detail" runat="server">&nbsp;
					</td>
					<TD width="45%" align="right"><asp:label style="Z-INDEX: 0" id="MessageLbl" Runat="server" CssClass="errorLabelBig"></asp:label>&nbsp;<asp:button style="Z-INDEX: 0" id="UpdateBtn" runat="server" CssClass="detailButton" Visible="False"
							Text="Update" onclick="UpdateBtn_Click"></asp:button>&nbsp;
						&nbsp;
						<asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="< Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button>&nbsp;
					</TD>
				</tr>
				<TR>
					<TD style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2"><asp:label id="IdLbl" runat="server" CssClass="pagetitle"></asp:label><BR>
						<iwms:iform id="formCtl" runat="server"></iwms:iform></TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="QTDetlFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2">
						<P>
							<asp:button style="Z-INDEX: 0" id="RefreshButton" runat="server" CssClass="detailButton" Text="Refresh"
								Visible="True" CausesValidation="False" Width="120px" onclick="RefreshButton_Click"></asp:button></P>
					</TD>
				</TR>
			</table>
			<asp:validationsummary id="valSummary" runat="server" CssClass="RedText" EnableClientScript="true" DisplayMode="BulletList"
				HeaderText="The following field(s) need to be entered correctly:"></asp:validationsummary></form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

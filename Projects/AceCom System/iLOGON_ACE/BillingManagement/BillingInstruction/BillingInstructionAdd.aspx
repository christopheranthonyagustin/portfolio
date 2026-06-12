<%@ Page language="c#" Codebehind="BillingInstructionAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>BillingInstructionAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/row.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload='displayRow("table1");'>
		<form id="Form1" method="post" runat="server">
			<br />
			<asp:button id="AddBtn" runat="server" Text="  Add  " CssClass="detailbutton" onclick="AddBtn_Click"></asp:button>
			<br />
			<br />
			<table id="table1" cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
				<tbody>	<tr>
					<td style="HEIGHT: 20px"><input id="tab1" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");'  readonly="true"
							value="Header" runat="server">&nbsp;
						<%--<input id="tab2" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
							value="EXIM" runat="server">&nbsp;
						<input id="tab3" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
							value="Party" runat="server">--%>
					</td>
				</tr>
					<tr>
						<td>
							<iwms:iForm id="formCtl" runat="server" />
						</td>
					</tr>					
					<tr>
						<td>
							<iwms:iForm id="formCtl2" runat="server" />
						</td>
					</tr>			
					<tr>
						<td>
							<iwms:iForm id="formCtl3" runat="server" />
						</td>
					</tr>
				</tbody>
			</table>
			&nbsp;<asp:Button ID="CopyBtn" Runat="server" Text="Copy" Visible="False" CssClass="detailbutton" onclick="CopyBtn_Click" />
			<asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
				EnableClientScript="true" runat="server" ID="valSummary" CssClass="RedText" />
		</form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

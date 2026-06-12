<%@ Page language="c#" Codebehind="TranslateForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Translate.TranslateForm" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Form</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	<SCRIPT src="../../js/row.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload='displayRow("table1");'>
		<form id="Form1" method="post" runat="server">
			<table id="table1" width="100%" border="0" runat="server">
				<tr>
					<td>
					&nbsp;
						<input id="tab1" class="TabTitle" value="Header" onclick='clickRow(1, "table1");' style='CURSOR:pointer'
							runat="server"> <input id="tab2" class="TabTitle" value="Detail" onclick='clickRow(2, "table1");' style='CURSOR:pointer'
							runat="server">
					</td>
					<td align="right">&nbsp						
					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button></td>
				</tr>
				<tr>
				<td colspan="2">
					<br />
					&nbsp<asp:Button id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton" onclick="UpdateBtn_Click"></asp:Button>
							<br />
							<br />
					<iwms:iForm id="formCtl" runat="server"></iwms:iForm></td>
				</tr>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2">
                        <IFRAME id="detailFrame" runat="server" style="WIDTH: 100%; HEIGHT: 100%" marginHeight="0" frameBorder="0" marginWidth="0"></IFRAME>
					</TD>
				</TR>
			</table>
		</form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

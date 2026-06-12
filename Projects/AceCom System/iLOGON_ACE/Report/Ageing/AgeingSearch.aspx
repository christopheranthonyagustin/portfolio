<%@ Page language="c#" Codebehind="AgeingSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.Ageing.AgeingSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>AgeingSearch</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<script language="javascript" type="text/javascript" src="../../js/checkbox.js"></script>
		<form id="Form1" method="post" runat="server">
			<table border="0" cellSpacing="2" cellPadding="2" width="100%">
				<tr>
					<td vAlign="top" width="30%">
						<table>
							<tr>
								<td><iwms:iform id="formCtl" runat="server"></iwms:iform></td>
							</tr>
						</table>
					</td>
					<td vAlign="top" width="70%">
						<table border="0" cellSpacing="2" cellPadding="2" width="100%">
							<tr>
								<td><asp:label id="SelectLbl" runat="server">Display</asp:label>&nbsp;: <input onclick="checkBoxes(this.form, this.checked)" value="ALL SBU" CHECKED type="checkbox"
										name="checkall">&nbsp;ALL</td>
							</tr>
							<tr>
								<td>
									<asp:checkboxlist id="DisplayChkBoxList" runat="server" RepeatColumns="1" Width="511px" RepeatDirection="Horizontal"
										CellSpacing="4" CellPadding="2"></asp:checkboxlist></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><asp:button id="CompileBtn" runat="server" Text="Compile" CssClass="detailbutton" onclick="CompileBtn_Click"></asp:button>&nbsp;<INPUT class="detailbutton" value="Reset" type="reset"><BR>
						<asp:label style="Z-INDEX: 0" id="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:label></td>
				</tr>
			</table>
		</form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

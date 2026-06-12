<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.KPI.JobKPI17.Search" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<HEAD runat="server">
		<title>Search</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
			<TABLE style="Z-INDEX: 0" id="Table1" border="0" cellSpacing="2" cellPadding="2" width="100%">
				<TR>
					<TD vAlign="top" width="30%">
						<TABLE>
							<TR>
								<TD>
									<iwms:iform id="formCtl" runat="server"></iwms:iform></TD>
							</TR>
						</TABLE>
					</TD>
					<td valign="top" width="70%">
						<table border="0" cellspacing="2" cellpadding="2" width="100%">
							<tr>
								<td><asp:label id="SelectLbl" runat="server">Display</asp:label>&nbsp;: <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
										name="checkall" />&nbsp;ALL</td>
							</tr>
							<tr>
								<td>
									<br />
									<br />
									<asp:checkboxlist id="DisplayChkBoxList" runat="server" RepeatColumns="2" Width="511px" CellSpacing="4"
										CellPadding="5"></asp:checkboxlist></td>
							</tr>
						</table>
					</td>
				</TR>
				<TR>
					
					<TD>
						<asp:button id="CompileBtn" runat="server" Text="Compile" 
                            CssClass="detailbutton" onclick="CompileBtn_Click"></asp:button>&nbsp;<INPUT class="detailbutton" value="Reset" type="reset"><BR>
						<asp:label style="Z-INDEX: 0" id="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:label></TD>
				</TR>
			</TABLE>
			</form>
	   </body>
</html>

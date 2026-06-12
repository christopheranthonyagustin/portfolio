<%@ Page language="c#" Codebehind="SkuSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuSearch"%>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>SkuSearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT type="text/javascript" src="../../js/row.js"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload='displayRow("table1");'>
		<form id="Form1" method="post" runat="server" style="Z-INDEX: 0">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<%--<asp:Label id="SearchLbl" runat="server" CssClass="pagetitle">Search SKU:</asp:Label><br>
			<br>--%>
			<BR />
			<asp:button style="Z-INDEX: 0" id="Button1" runat="server" CssClass="detailbutton" Text="Search" onclick="SearchBtn_Click"></asp:button>
			<BR />
			<BR />
			<table id="table1" border="0" cellSpacing="0" cellPadding="0" width="100%" runat="server">
				<tr>
					<td><input id="tab1" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
							value="Main Info" runat="server"> <input id="tab2" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
							value="Attributes" runat="server"> <input id="tab3" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
							value="Ordering Info" runat="server"> <input id="tab4" style="CURSOR: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
							value="User Defined" runat="server">
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
				<tr>
					<td><iwms:iform id="formCtl4" runat="server"></iwms:iform></td>
				</tr>
			</table>
			&nbsp;
			<asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
		</form>
	</body>
</html>

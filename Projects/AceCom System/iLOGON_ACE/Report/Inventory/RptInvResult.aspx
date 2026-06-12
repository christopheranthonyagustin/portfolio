<%@ Page language="c#" Codebehind="RptInvResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.Inventory.RptInvResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Inventory Report</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td><asp:label id="ReportLbl" runat="server" CssClass="graytitle">Report</asp:label></td>
					<td class="graytitle">:</td>
					<td><asp:label id="Inventory" runat="server" CssClass="Graytitle">Inventory</asp:label></td>
					<td width="80%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr>
					<td><asp:label id="DateLbl" runat="server" CssClass="Graytitle">Date</asp:label></td>
					<td class="graytitle">:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
			<div id="div-datagrid" style="HEIGHT:90%"><asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid></div>
		</form>
	</body>
</html>

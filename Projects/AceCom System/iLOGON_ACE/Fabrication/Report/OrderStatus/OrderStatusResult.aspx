<%@ Page language="c#" Codebehind="OrderStatusResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OrderStatus.OrderStatusResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Order Status Report</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../../css/iWMS.css">
		<script language="javascript" type="text/javascript" src="../../../js/fullscreen.js"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td>Order Status</td>
					<td width="80%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
					<td>Date</td>
					<td>:</td>
					<td colSpan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<div style="HEIGHT: 90%" id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True" CellPadding="2"
					GridLines="Both" BorderStyle="None" AutoGenerateColumns="True">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid></div>
		</form>
	</body>
</html>

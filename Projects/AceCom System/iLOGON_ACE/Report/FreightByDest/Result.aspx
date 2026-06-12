<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.FreightByDest.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>FreightByDest</title>
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
		    <tr class="graytitle">
					<td width="80%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
						    <img id="excelImg" border="0" alt="Export to Excel" align="right" src="../../Image/excel.gif" height="20" runat="server">
						</a>
					</td>
				</tr>
				
				</table>				
			<table width="100%" id="report" runat="server">					
				<tr class="graytitle">
				<td colspan="4"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
				<td width = "10%"><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Job Listing</asp:label>
                        <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                        <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                    </td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="AccLbl" Runat="server">Account</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="AccountLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
				<tr>
				<td colspan="4">
				<div id="div-datagrid" style="HEIGHT:90%"><asp:datagrid id="ResultDG" 
                        runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid></div>
				</td>
				</tr>
			</table>
			
		</form>
	</body>
</html>

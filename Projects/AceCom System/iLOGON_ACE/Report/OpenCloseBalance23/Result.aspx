<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OpenCloseBalance23.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Open Close Balance Report</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
	</head>
	<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
		<form id="Form1" method="post" runat="server">
		<table width="100%">
			    <tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
					<td width="70%" align="right"><A id="A1" runat="server" onserverclick="ExportExcel"><IMG id="IMG1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
				<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Open Close Balance</asp:label><asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="AccLbl" Runat="server">Account</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="AccountLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="DateLbl" Runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>		
				<tr class="graytitle">
					<td><asp:label ID="FormatLbl" Runat="server">Format</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="FormatTypeLbl" runat="server"></asp:Label></td>
				</tr>						
				<tr>
			        <td colspan="5">
			            <asp:Label runat="server" ID="MessageLbl" CssClass="errorLabelBig" Visible="false">No Inventory Movement were found.</asp:Label>
			        </td>
				</tr>
			</table>			
			<div id="div-datagrid">
                <asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
										CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
				<%--<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False" CssClass=">--%>
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid>
		  </div>
		</form>
	</body>
</html>

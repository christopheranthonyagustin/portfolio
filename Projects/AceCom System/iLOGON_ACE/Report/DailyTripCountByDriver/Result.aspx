<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyTripCountByDriver.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DailyTripCountByDriver</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 146px;
        }
        .style2
        {
            width: 49px;
        }
        .style3
        {
            width: 268435488px;
        }
    </style>
</head>
<body  bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
    <form id="Form1" method="post" runat="server">
			<table width="100%">
			    <tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
					<td width="70%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
				<td class="style1"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Daily Trip Count By Driver</asp:label></td>
					<td colspan="4" class="style3"><asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
				
				
			</table>
			<table width = "100%">
			<tr class="graytitle">
					<td class="style2"><asp:label id="ouLbl" runat="server">Opsunit: </asp:label></td>
					<td colSpan="2">
						<asp:Label id="opsunitLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
			<div id="div-datagrid" style="HEIGHT:85%">
			    <asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False" CssClass=">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid>
			</div>
		</form>
</body>
</html>

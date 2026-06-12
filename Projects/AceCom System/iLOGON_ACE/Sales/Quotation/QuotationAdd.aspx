<%@ Page language="c#" Codebehind="QuotationAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation.QuotationAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>QuotationAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/row.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload='displayRow("table1");'>
		<form id="Form1" method="post" runat="server">
			<asp:Label id="SearchLbl" runat="server" CssClass="pagetitle" Text="Add Quotation"></asp:Label>
			<span class="pagetitle">&nbsp;</span>
			<table id="table1" cellSpacing="0" cellPadding="0" width="100%" border="0" runat="server">
				<tbody>
					<tr>
						<td style="HEIGHT: 20px">
							<input id="tab1" class="TabTitle" value="Header" onclick='clickRow(1, "table1");' style='CURSOR:pointer' runat="server">							
						</td>
					</tr>
					<tr>
						<td>
							<iwms:iForm id="formCtl" runat="server" />
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
					</tr>
				</tbody>
			</table>
			<asp:button id="AddBtn" runat="server" Text="  Add  " CssClass="detailbutton" onclick="AddBtn_Click"></asp:button>
			<asp:button id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailbutton" onclick="UpdateBtn_Click"></asp:button>&nbsp;
			<asp:Button id="AddDetailBtn" runat="server" Text="Add Detail" Visible="False" CssClass="detailbutton" onclick="AddDetailBtn_Click"></asp:Button>&nbsp;
			<asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
				EnableClientScript="true" runat="server" ID="valSummary" CssClass="RedText" />
		</form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

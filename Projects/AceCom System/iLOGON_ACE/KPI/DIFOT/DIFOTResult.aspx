<%@ Page language="c#" Codebehind="DIFOTResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.KPI.DIFOT.DIFOTResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReportResult</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table border="0" cellSpacing="1" cellPadding="1" width="100%">
				<tr>
					<td class="boldtext"><asp:label id="AccountLbl" runat="server" CssClass="Graytitle">Account : </asp:label><BR>
						<asp:label id="FromDateLbl" runat="server" CssClass="Graytitle">From Date : </asp:label><BR>
						<asp:label id="ToDateLbl" runat="server" CssClass="Graytitle"> To Date : </asp:label><P>
							<asp:label id="UniqIsLbl" runat="server" CssClass="Graytitle">Total Unique Issue : </asp:label><BR>
							<asp:label id="NoVarianceIsLbl" runat="server" CssClass="Graytitle">Total Unique Issue (No Variance) : </asp:label><BR>
							<BR>
							<asp:label id="UniqIsSkuLbl" runat="server" CssClass="Graytitle">Total Unique Issue SKU : </asp:label><BR>
							<asp:label id="NoVarianceIsSkuLbl" runat="server" CssClass="Graytitle">Total Unique Issue SKU (No Variance) : </asp:label><BR>
							<BR>
						</P>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="ResultDG" runat="server" CellPadding="2" GridLines="Both" BorderStyle="None"
							AutoGenerateColumns="True">
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
						</asp:datagrid>
						<asp:Label id="ErrorLbl" runat="server" CssClass="Graytext" Visible="False"></asp:Label></td>
				</tr>
			</table>
		</form>
	</body>
</html>

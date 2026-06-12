<%@ Page language="c#" Codebehind="OpeningResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Billing.Opening.OpeningResult" %>
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
						<asp:label id="MonthLbl" runat="server" CssClass="Graytitle">Opening Month : </asp:label><BR>
						<asp:label id="DaysLbl" runat="server" CssClass="Graytitle"> Opening Date : </asp:label><BR>
						<asp:label id="UOMLbl" runat="server" CssClass="Graytitle">Chargeable UOM : </asp:label><BR>
						<asp:label id="RateLbl" runat="server" CssClass="Graytitle">Rate Per UOM : $</asp:label><BR>
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

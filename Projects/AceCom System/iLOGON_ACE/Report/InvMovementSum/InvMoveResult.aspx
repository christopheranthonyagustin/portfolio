<%@ Page language="c#" Codebehind="InvMoveResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.InvMovementSum.InvMoveResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>InvMoveResult</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" nowrap>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="1" cellPadding="1" border="0">
				<tr>
					<td class="boldtext"  nowrap><asp:label id="AccountTextLbl" runat="server" CssClass="Graytitle">Account</asp:label>:
						<asp:label id="AccountLbl" runat="server"></asp:label><BR>
						<asp:label id="FromDateTextLbl" runat="server" CssClass="Graytitle">From Date</asp:label>:
						<asp:label id="FromDateLbl" runat="server"></asp:label><BR>
						<asp:label id="ToDateTextLbl" runat="server" CssClass="Graytitle">To Date</asp:label>:
						<asp:label id="ToDateLbl" runat="server"></asp:label><BR>
						<asp:label id="GroupTextLbl" runat="server" CssClass="Graytitle">SKU Group</asp:label>:
						<asp:label id="GroupLbl" runat="server"></asp:label><BR>
						<asp:label id="TypeTextLbl" runat="server" CssClass="Graytitle">SKU Type</asp:label>:
						<asp:label id="TypeLbl" runat="server"></asp:label><BR>
						<asp:label id="ClassTextLbl" runat="server" CssClass="Graytitle">SKU Class</asp:label>:
						<asp:label id="ClassLbl" runat="server"></asp:label><BR>
						<asp:label id="FromAccountingCodeTextLbl" runat="server" CssClass="Graytitle">From Accounting Code</asp:label>:
						<asp:label id="FromAccountingCodeLbl" runat="server"></asp:label><BR>
						<asp:label id="ToAccountingCodeTextLbl" runat="server" CssClass="Graytitle">To Accounting Code</asp:label>:
						<asp:label id="ToAccountingCodeLbl" runat="server"></asp:label><BR>
					</td>
				</tr>
				<tr>
					<td nowrap><asp:datagrid id="ResultDG" runat="server" CellPadding="2" GridLines="Both" BorderStyle="None"
							AutoGenerateColumns="True">
							<AlternatingItemStyle Wrap="False" BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle Wrap="False" ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9E9E9E" Wrap="False"></HeaderStyle>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</html>

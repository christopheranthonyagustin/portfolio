<%@ Page language="c#" Codebehind="PayHistResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.PaymentHistory.PayHistResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PayHistResult</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="1" cellPadding="1" border="0">
				<tr>
					<td>
						<table class="BoldText">
							<tr>
								<td><asp:label id="AccountTextLbl" runat="server" CssClass="Graytitle">Account</asp:label></td>
								<td>:</td>
								<td><asp:label id="AccountLbl" runat="server"></asp:label></td>
							</tr>
							<tr>
								<td><asp:label id="FromDateTextLbl" runat="server" CssClass="Graytitle">From Date</asp:label></td>
								<td>:</td>
								<td><asp:label id="FromDateLbl" runat="server"></asp:label></td>
							</tr>
							<tr>
								<td><asp:label id="ToDateTextLbl" runat="server" CssClass="Graytitle">To Date</asp:label></td>
								<td>:</td>
								<td><asp:label id="ToDateLbl" runat="server"></asp:label></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><asp:repeater id="ResultRPT" Runat="server">
							<ItemTemplate>
								<table class="BlackText">
									<tr>
										<td>
											<asp:Label ID="SiteCodeLbl" Runat="server">Site Code</asp:Label></td>
										<td>:</td>
										<td class="BoldOnly">
											<asp:Label ID="SiteCodeValueLbl" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "sitecode") %>'>
											</asp:Label></td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="SiteDescrLbl" Runat="server">Site Description</asp:Label></td>
										<td>:</td>
										<td class="BoldOnly">
											<asp:Label ID="SiteDescrValueLbl" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "sitedescr") %>'>
											</asp:Label></td>
									</tr>
								</table>
								<asp:datagrid id="ResultDG" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="2"
									GridLines="Both" BorderStyle="None" OnItemDataBound="ResultDG_ItemDataBound">
									<AlternatingItemStyle Wrap="False" BackColor="Gainsboro"></AlternatingItemStyle>
									<ItemStyle Wrap="False" ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
									<HeaderStyle ForeColor="White" BackColor="#9E9E9E" Wrap="False"></HeaderStyle>
									<Columns>
										<asp:BoundColumn DataField="lot6" HeaderText="Duty Payment Number"></asp:BoundColumn>
										<asp:BoundColumn DataField="lot3" HeaderText="Duty Payment Date" DataFormatString="{0:dd/MMM/yyyy}"></asp:BoundColumn>
										<asp:BoundColumn DataField="lot5" HeaderText="Customs Lot Number"></asp:BoundColumn>
										<asp:BoundColumn DataField="qty4payment" HeaderText="Customs Lot Number Quantity"></asp:BoundColumn>
									</Columns>
								</asp:datagrid>
							</ItemTemplate>
							<SeparatorTemplate>
								<br>
							</SeparatorTemplate>
						</asp:repeater></td>
				</tr>
			</table>
		</form>
	</body>
</html>

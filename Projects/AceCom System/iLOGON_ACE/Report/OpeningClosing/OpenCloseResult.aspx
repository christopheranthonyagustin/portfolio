<%@ Page language="c#" Codebehind="OpenCloseResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OpeningClosing.OpenCloseResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>OpenCloseResult</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td class="boldtext">
						<asp:Label id="AccountTextLbl" runat="server" CssClass="Graytitle">Account</asp:Label>
						:
						<asp:Label id="AccountLbl" runat="server"></asp:Label><BR>
						<asp:Label id="FromSkuTextLbl" runat="server" CssClass="Graytitle">From Sku</asp:Label>
						:
						<asp:Label id="FromSkuLbl" runat="server"></asp:Label><BR>
						<asp:Label id="ToSkuTextLbl" runat="server" CssClass="Graytitle">To Sku</asp:Label>
						:
						<asp:Label id="ToSkuLbl" runat="server"></asp:Label><BR>
						<asp:Label id="FromDateTextLbl" runat="server" CssClass="Graytitle">From Date</asp:Label>
						:
						<asp:Label id="FromDateLbl" runat="server"></asp:Label><BR>
						<asp:Label id="ToDateTextLbl" runat="server" CssClass="Graytitle">To Date</asp:Label>
						:
						<asp:Label id="ToDateLbl" runat="server"></asp:Label><BR>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="Both"
							CellPadding="2">
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderTemplate>
										No
									</HeaderTemplate>
									<ItemTemplate>
										<%#Container.ItemIndex+1%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="family" SortExpression="family" HeaderText="SKU Family">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="code" SortExpression="code" HeaderText="SKU Code">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="code2" SortExpression="code2" HeaderText="SKU Code2">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="descr" SortExpression="descr" HeaderText="SKU Descr">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Opening" SortExpression="Opening" HeaderText="Opening">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="ReceivingIn" SortExpression="ReceivingIn" HeaderText="Receiving In">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="AdjustmentIn" SortExpression="AdjustmentIn" HeaderText="Adjustment In">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="AdjustmentOut" SortExpression="AdjustmentOut" HeaderText="Adjustment Out">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="ShipmentOut" SortExpression="ShipmentOut" HeaderText="Shipment Out">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="SelectedClosing" SortExpression="SelectedClosing" HeaderText="Closing">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

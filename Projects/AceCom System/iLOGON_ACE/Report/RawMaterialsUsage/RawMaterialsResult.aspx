<%@ Page language="c#" Codebehind="RawMaterialsResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.RawMaterialsUsage.RawMaterialsResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>RawMaterialsResult</title>
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
					<td><asp:datagrid id="ResultDG" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="2"
							GridLines="Both" BorderStyle="None">
							<AlternatingItemStyle Wrap="False" BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle Wrap="False" ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9E9E9E" Wrap="False"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderTemplate>
										S/No.
									</HeaderTemplate>
									<ItemTemplate>
										<%#Container.ItemIndex+1%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="rcid" HeaderText="Reciept ID"></asp:BoundColumn>
								<asp:BoundColumn DataField="rcdate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}"></asp:BoundColumn>
								<asp:BoundColumn DataField="lot5" HeaderText="Customs Lot Number"></asp:BoundColumn>
								<asp:BoundColumn DataField="prodvol" HeaderText="Production Volume (Litres)" DataFormatString="{0:0}"></asp:BoundColumn>
								<asp:BoundColumn DataField="less4%round" HeaderText="Less 4%"></asp:BoundColumn>
								<asp:BoundColumn DataField="qty4payment" HeaderText="Payment Quantity"></asp:BoundColumn>
								<asp:BoundColumn DataField="rawsum" HeaderText="Raw Materials (Malt & Hops) (KG)"></asp:BoundColumn>
								<asp:BoundColumn DataField="lot6" HeaderText="Duty Payment Number"></asp:BoundColumn>
								<asp:BoundColumn DataField="roundratio" HeaderText="Production to Raw Material Ratio"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</html>

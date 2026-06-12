<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.InvMovement.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Inventory Movement</title>
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
					<td><asp:Label ID="ReportLbl" runat="server">Report</asp:Label></td>
					<td>:</td>
					<td><asp:label id="Inventory" runat="server" CssClass="Graytitle">Inventory Movement</asp:label><asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label></td>
					<td width="70%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
					<td>Date</td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
			<table id="movementTable" runat="server" width="100%">
				<tr>
					<td>
						<asp:repeater id="InvMoveRpt" Runat="server">
							<ItemTemplate>
								<table width="100%" border="0" cellpadding="1" cellspacing="1">
									<tr>
										<td class="pagetitle">
											<asp:Label id="SkuIDLbl" runat="server" Visible =False Text='<%# DataBinder.Eval(Container.DataItem, "skuid") %>' />
											<asp:Label id="SkuTextLbl" runat="server" CssClass="pagetitle">SKU</asp:Label>
											:
											<asp:Label id="SkuLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>' /><BR>
											<asp:Label id="DescrTextLbl" runat="server" CssClass="pagetitle">Description</asp:Label>
											&nbsp;:
											<asp:Label id="DescrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>' /><BR>
											<asp:Label id="BalanceTextLbl" runat="server" CssClass="pagetitle">Balance</asp:Label>&nbsp;:
											<asp:Label id="BalanceLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "onhandqty") %>' />
										</td>
									</tr>
								</table>
								<div id="div-datagrid" style="HEIGHT:auto">
									<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="Both"
										CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
										<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
										<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
										<Columns>
											<asp:TemplateColumn>
												<HeaderTemplate>
													No
												</HeaderTemplate>
												<ItemTemplate>
													<%#Container.ItemIndex+1%>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="src" SortExpression="src" HeaderText="Source">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="srcid" SortExpression="srcid" HeaderText="Source Id">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="permit" SortExpression="permit" HeaderText="Permit">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="open" SortExpression="open" HeaderText="Open Qty" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dp" SortExpression="dp" HeaderText="Deposit" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wd" SortExpression="wd" HeaderText="Withdraw" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="close" SortExpression="close" HeaderText="Close Qty" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></div>
								<br />
								<hr height="1" color="Black">
							</ItemTemplate>
						</asp:repeater>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OpenCloseByVolQty.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Open Close One Period Report</title>
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
					<td width="70%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>
					<td colspan="2">
					    <asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Open Close One Period </asp:label>
					    <asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label>
					</td>
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
			</table>
			&nbsp;<asp:Label runat="server" ID="MessageLbl" CssClass="errorLabelBig">No Inventory Movement were found.</asp:Label><table id="movementTable" runat="server" width="100%">
				<tr>
					<td>
						<asp:repeater id="InvMoveRpt" Runat="server">
							<ItemTemplate>
							<asp:Panel ID="ItemPnl" runat="server">
								<table width="100%" border="0" cellpadding="1" cellspacing="1">
									<tr>
										<td class="pagetitle">
											<asp:Label id="SkuIDLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "skuid") %>' />
											<asp:Label id="SkuTextLbl" runat="server" CssClass="pagetitle">SKU</asp:Label>
											:
											<asp:Label id="SkuLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>' />
											<BR>
											<asp:Label id="DescrTextLbl" runat="server"  CssClass="pagetitle">Description</asp:Label>
											&nbsp;:
											<asp:Label id="DescrLbl" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>' /><BR>
											<asp:Label id="BalanceTextLbl" runat="server" CssClass="pagetitle" Visible = "false">Balance</asp:Label><%--&nbsp;:--%> 
											<asp:Label id="BalanceLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "onhand") %>' Visible="false"/>
											<asp:Label id="LotIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lotid") %>' Visible="false" />
										</td>
									</tr>
								</table>
                                <div id="div-datagrid" style="HEIGHT:auto">
									<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="Both"
										CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
										<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
										<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="No" Visible="false">
												<ItemTemplate>
													<%#Container.ItemIndex+1%>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="fromdate" SortExpression="fromdate" HeaderText="From" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="todate" SortExpression="todate" HeaderText="To" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Date" DataFormatString="{0:dd/MMM/yyyy}" Visible="false">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKU Descr">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol" DataFormatString="{0:#,0.000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot 1" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot 2" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot 3" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot 5">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot 6">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot 7">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot 8">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="open" SortExpression="open" HeaderText="Open Qty" DataFormatString="{0:#,0.##}" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="opwhole" SortExpression="opWhole" HeaderText="Open Whole" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="oploose" SortExpression="oploose" HeaderText="Open Loose" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="oplhu" SortExpression="oplhu" HeaderText="Open" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openvol" SortExpression="openvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dp" SortExpression="dp" HeaderText="Deposit" DataFormatString="{0:#,0.##}" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dpwhole" SortExpression="dpWhole" HeaderText="Deposit Whole" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dploose" SortExpression="dploose" HeaderText="Deposit Loose" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dplhu" SortExpression="dplhu" HeaderText="Deposit" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="dpvol" SortExpression="dpvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wd" SortExpression="wd" HeaderText="Withdraw" DataFormatString="{0:#,0.##}" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wdwhole" SortExpression="wdWhole" HeaderText="Withdraw Whole" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wdloose" SortExpression="wdloose" HeaderText="Withdraw Loose" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wdlhu" SortExpression="wdlhu" HeaderText="Withdraw" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wdvol" SortExpression="wdvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="close" SortExpression="close" HeaderText="Close Qty" DataFormatString="{0:#,0.##}" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="clwhole" SortExpression="clWhole" HeaderText="Close Whole" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="clloose" SortExpression="clloose" HeaderText="Close Loose" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="cllhu" SortExpression="cllhu" HeaderText="Close" DataFormatString="{0:#,0.##}" HeaderStyle-Width="50px">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closevol" SortExpression="closevol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></div>
								<br />
								<hr height="1" color="Black">
								</asp:Panel>
							</ItemTemplate>
						</asp:repeater>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

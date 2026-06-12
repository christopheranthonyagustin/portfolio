<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OpenCloseBalance17.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Open Close Balance By Lot</title>
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
					<td width="70%" align="right"><A id="A1" runat="server" onserverclick="ExportExcel"><IMG id="IMG1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
				<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Open Close Balance By Lot</asp:label><asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label></td>
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
				<tr class="graytitle">
					<td><asp:label ID="FormatLbl" Runat="server">Format</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="FormatTypeLbl" runat="server"></asp:Label></td>
				</tr>						
				<tr>
			        <td colspan="5">
			            <asp:Label runat="server" ID="MessageLbl" CssClass="errorLabelBig">No Inventory Movement were found.</asp:Label>
			        </td>
				</tr>
			</table>			
			<div id="div-datagrid">
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
											
											<asp:BoundColumn DataField="FromDate" SortExpression="FromDate" HeaderText="From" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="ToDate" SortExpression="ToDate" HeaderText="To" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sku" SortExpression="Sku" HeaderText="SKU">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="Description">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="rcno" SortExpression="rcno" HeaderText="RcNo">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcDate"  DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
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
											<asp:BoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot 9">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot 10">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot 11">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot 12">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot13" SortExpression="lot13" HeaderText="Lot 13">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot14" SortExpression="lot14" HeaderText="Lot 14">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lot15" SortExpression="lot15" HeaderText="Lot 15">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU1">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU2">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openqty" SortExpression="openqty" HeaderText="Open" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openwholeqty" SortExpression="openwholeqty" HeaderText="OP whole" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openlooseqty" SortExpression="openlooseqty" HeaderText="OP Loose" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openlowestqty" SortExpression="openlowestqty" HeaderText="OP LHU" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openvol" SortExpression="openvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="openwt" SortExpression="openwt" HeaderText="Wt (KG)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositqty" SortExpression="depositqty" HeaderText="Deposit" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositwholeqty" SortExpression="depositwholeqty" HeaderText="DP Whole" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositlooseqty" SortExpression="depositlooseqty" HeaderText="DP Loose" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositlowestqty" SortExpression="depositlowestqty" HeaderText="DP LHU" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositvol" SortExpression="depositvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="depositwt" SortExpression="depositwt" HeaderText="Wt (KG)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawqty" SortExpression="withdrawqty" HeaderText="Withdraw" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawwholeqty" SortExpression="withdrawwholeqty" HeaderText="WD Whole" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawlooseqty" SortExpression="withdrawlooseqty" HeaderText="WD Loose" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawlowestqty" SortExpression="withdrawlowestqty" HeaderText="WD LHU" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawvol" SortExpression="withdrawvol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="withdrawwt" SortExpression="withdrawwt" HeaderText="Wt (KG)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closeqty" SortExpression="closeqty" HeaderText="Close" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closewholeqty" SortExpression="closewholeqty" HeaderText="CL Whole" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closelooseqty" SortExpression="closelooseqty" HeaderText="CL Loose" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closelowestqty" SortExpression="closelowestqty" HeaderText="CL LHU" DataFormatString="{0:#,0.##}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closevol" SortExpression="closevol" HeaderText="Vol (m3)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="closewt" SortExpression="closewt" HeaderText="Wt (KG)" DataFormatString="{0:#,0.0000}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>											
											<asp:BoundColumn DataField="wholeuom" SortExpression="wholeuom" HeaderText="Whole UOM" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="looseuom" SortExpression="looseuom" HeaderText="Loose UOM" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lhuuom" SortExpression="lhuuom" HeaderText="LHU UOM" >
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="wholevol" SortExpression="wholevol" HeaderText="Whole Vol (m3)" DataFormatString="{0:#,0.####}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="loosevol" SortExpression="loosevol" HeaderText="Loose Vol (m3)" DataFormatString="{0:#,0.####}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lhuvol" SortExpression="lhuvol" HeaderText="LHU Vol (m3)" DataFormatString="{0:#,0.####}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid>
		    </div>
		</form>
	</body>
</html>

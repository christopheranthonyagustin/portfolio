<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.InvoiceSummaryListByChargeGrp.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html>
	<head id="Head1" runat="server">
		<title>InvoiceSummaryListByChargeGrpReport</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
		<tr class="graytitle">
				
					<td width="80%" align="right">
						<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="right" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				
				</table>
				
			<table width="100%" id="report" runat="server">
			
			
				<tr class="graytitle">
					<td><asp:label id="LicenseNameLbl" runat="server"></asp:label> </td>
				</tr>
			
				<tr class="graytitle"><td>Report : Invoice Summary List By Charge - From <asp:Label ID="fromDateLbl" runat="server"></asp:Label> &nbsp;to  <asp:Label ID="toDateLbl" runat="server"></asp:Label>
			</td>
			</tr>
		
			
		
			<tr><td colspan="11">
			<table >
			<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label> : <asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			</td></tr>
			<tr><td colspan="11">
			<table>
			<tr class="graytitle">
			<td>Account : <asp:Label ID="AccountLbl" runat="server" Text = "All"></asp:Label></td>
			</tr>
			</table>
			</td></tr>
			
			
			
			<tr><td>
			
			<table >
			<tr><td colspan="11">
			<div style="HEIGHT: 90%" id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True" CellPadding="2"
					GridLines="Both" BorderStyle="None" AutoGenerateColumns="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
					<Columns>
						<asp:BoundColumn DataField="invmonth" SortExpression="invmonth" HeaderText="Invoice Month">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeType" SortExpression="ChargeType" HeaderText="Type" DataFormatString="{0:dd/MMM/yyyy}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeID" SortExpression="ChargeID" HeaderText="Charge ID">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeCode" SortExpression="ChargeCode" HeaderText="Charge Code">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDescr" SortExpression="ChargeDescr" HeaderText="Description">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="AmtOpen" SortExpression="AmtOpen" HeaderText="Amt Open" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="AmtLocked" SortExpression="AmtLocked" HeaderText="Amt Locked" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="AmtPrinted" SortExpression="AmtPrinted" HeaderText="Amt Printed" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="AmtPosted" SortExpression="AmtPosted" HeaderText="Amt Posted" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="AmtCancelled" SortExpression="AmtCancelled" HeaderText="Amt Cancelled" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
					
						
						
					</Columns>
					
				</asp:datagrid></div>
				</td></tr>
				</table>
			</td></tr>
			
				</table>
		</form>
	</body>
</html>
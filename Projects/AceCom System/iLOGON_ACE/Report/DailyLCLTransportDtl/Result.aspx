<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyLCLTransportDtl.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
    <head id="Head1" runat="server">
		<title>Daily LCL Transport Details Report</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
	</head>
    <body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="form1" method="post" runat="server">
			<table width="100%">
				<tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td>Daily LCL Transport Details From <asp:Label ID="FrmDate_Lbl" runat="server" /> To <asp:Label ID="ToDate_Lbl" runat="server" /></td>
					<td width="50%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></a></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<div style="HEIGHT: 90%" id="div-datagrid">
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" AllowSorting="False" UseAccessibleHeader="True"
					AllowPaging="False">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
					    <asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
						<asp:BoundColumn DataField="jobadddate" SortExpression="jobadddate" HeaderText="JobAddDate">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="orderby" SortExpression="orderby" HeaderText="OrderBy">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="jbcjobtype" SortExpression="jbcjobtype" HeaderText="JobType">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustomerRef">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="exportername" SortExpression="exportername" HeaderText="Shipper">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FromAddress">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddress">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="frexpdate" SortExpression="frexpdate" HeaderText="ExecutionDate" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="outdischargeport" SortExpression="outdischargeport" HeaderText="POD">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="inloadingport" SortExpression="inloadingport" HeaderText="POL">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="NoOfPackages" DataFormatString="{0:N0}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt" DataFormatString="{0:N0}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol" DataFormatString="{0:N0}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
				</asp:datagrid>
			</div>
		</form>
	</body>
</html>

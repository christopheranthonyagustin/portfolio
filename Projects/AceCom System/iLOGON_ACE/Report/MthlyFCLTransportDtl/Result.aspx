<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.MthlyFCLTransportDtl.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
    <head id="Head1" runat="server">
		<title>Monthly FCL Transport Summary Report</title>
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
					<td>Monthly FCL Transport Summary From <asp:Label ID="FrmDate_Lbl" runat="server" /> To <asp:Label ID="ToDate_Lbl" runat="server" /></td>
					<td width="50%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></a></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="Acc_Lbl" runat="server">Account</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="AccLbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<div style="HEIGHT: 90%" id="div-datagrid">
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" AllowSorting="False" UseAccessibleHeader="True" HeaderStyle-BorderColor="Black" 
					AllowPaging="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" HorizontalAlign="Right" Wrap="False"></ItemStyle>
					<Columns>
					    <asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
					    <asp:TemplateColumn HeaderText="Month" SortExpression="Month" ItemStyle-Font-Bold="true">          
					        <ItemTemplate>                 
					            <asp:Label ID="Mth_Lbl" runat="server" Text='<%# RetMthYear(Eval("Month")) %>' />
					        </ItemTemplate>         
					    </asp:TemplateColumn>
						<asp:BoundColumn DataField="IMP20" SortExpression="IMP20" HeaderText="Import(20FT)" HeaderStyle-BackColor="Yellow" HeaderStyle-ForeColor="Black">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="IMP40" SortExpression="IMP40" HeaderText="Import(40FT)" HeaderStyle-BackColor="Yellow" HeaderStyle-ForeColor="Black">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="IMP00" SortExpression="IMP00" HeaderText="Import(Others)" HeaderStyle-BackColor="Yellow" HeaderStyle-ForeColor="Black">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="EXP20" SortExpression="EXP20" HeaderText="Export(20FT)" HeaderStyle-BackColor="Red">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="EXP40" SortExpression="EXP40" HeaderText="Export(40FT)" HeaderStyle-BackColor="Red">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="EXP00" SortExpression="EXP00" HeaderText="Export(Others)" HeaderStyle-BackColor="Red">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="OTH20" SortExpression="OTH20" HeaderText="Local(20FT)" HeaderStyle-BackColor="Green">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="OTH40" SortExpression="OTH40" HeaderText="Local(40FT)" HeaderStyle-BackColor="Green">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="OTH00" SortExpression="OTH00" HeaderText="Local(Others)" HeaderStyle-BackColor="Green">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
				</asp:datagrid>
			</div>
		</form>
	</body>
</html>

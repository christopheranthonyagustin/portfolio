<%@ Page language="c#" Codebehind="QuotationDetlList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation.QuotationDetlList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>QuotationDetlList</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table border="0" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td class="pagetitle"><asp:label id="IdLbl" runat="server"></asp:label></td>
					<td align="right"><asp:button id="AddDetailBtn" runat="server" Text="+ Detail" Visible="true" CssClass="detailButton" onclick="AddDetailBtn_Click"></asp:button>&nbsp;
					</td>
				</tr>
			</table>
			<br>
			<div style="HEIGHT: 80%" id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" PageSize="8" GridLines="Both" CellPadding="2" AutoGenerateColumns="False"
					DataKeyField="id" OnItemCommand="QtDetail_Edit" AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
							<ItemTemplate>
								<asp:ImageButton Runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif" Width="15"
									Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail" CommandName="Edit"
									CausesValidation="False"></asp:ImageButton>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')" 
								onserverclick="QtDetail_Delete" runat=server><img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Detail"
										runat="server"></a>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<HeaderTemplate>
								S/N
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="frqty" SortExpression="frqty" HeaderText="From Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="toqty" SortExpression="toqty" HeaderText="To Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="From Service Point">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="To Service Point">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="Exchange Rate">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="costprice" SortExpression="costprice" HeaderText="Cost Price">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="markuppct" SortExpression="markuppct" HeaderText="Mark Up %">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="sellingprice" SortExpression="sellingprice" HeaderText="Selling Price">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="rem" SortExpression="rem" HeaderText="Remark">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages"></PagerStyle>
				</asp:datagrid></div>
		</form>
	</body>
</html>

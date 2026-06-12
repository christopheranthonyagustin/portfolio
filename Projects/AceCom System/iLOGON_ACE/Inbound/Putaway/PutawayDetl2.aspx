<%@ Page language="c#" Codebehind="PutawayDetl2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Putaway.PutawayDetl2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PTDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%" cellSpacing="0" cellPadding="0" border="0">
				<tr>
						
					<td class="pagetitle">
						<asp:label id="IdLbl" runat="server"></asp:label>						
					    </td>
					    <td align="right">&nbsp						
					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button></td>
				</tr>
			</table><br>
			<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" PageSize="8" AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" DataKeyField="id" AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<HeaderTemplate>
								No
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="skuid" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="uomqty" SortExpression="uomqty" HeaderText="Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="From Loc">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="paloccode" SortExpression="paloccode" HeaderText="To Loc">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv Date" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
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
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
				</asp:datagrid></div>
		</form>
	</body>
</html>

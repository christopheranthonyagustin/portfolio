<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Recount.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Recount" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>InvCountV3Recount</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
						<div class="pagetitle"><asp:label id="IcIdLbl" runat="server"></asp:label></div>
					</td>
					<td align="right">
                        <asp:Button id="PrintBtn" runat="server" Text="Print Recount List" CssClass="detailButton" 
                            onclick="PrintBtn_Click"></asp:Button>&nbsp;&nbsp;
					</td>
				</tr>
			</table><br>
			<div id="div-datagrid">
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" CellPadding="3"
					BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#999999" GridLines="Vertical"
					PageSize="8" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<HeaderTemplate>
								No
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot ID">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="tuno1" SortExpression="tuno2" HeaderText="TU#1">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="On Hand Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="countedqty" SortExpression="countedqty" HeaderText="Counted Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="recntno" SortExpression="recntno" HeaderText="Count">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv.Date" DataFormatString="{0:dd/MMM/yyyy}">
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
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
				</asp:datagrid>
			</div>
		</form>
	</body>
</html>

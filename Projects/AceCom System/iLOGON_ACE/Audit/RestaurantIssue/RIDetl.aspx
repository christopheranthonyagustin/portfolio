<%@ Page language="c#" Codebehind="RIDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.RestaurantIssue.RIDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>RIDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td class="pagetitle">Issue Detail :
						<asp:label id="AjIdLbl" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td><asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None"
							GridLines="Both" CellPadding="2" PageSize="8" AllowSorting="True">
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<asp:Label id="DetailLbl" runat="server"></asp:Label>
										<a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete adjustment detail?')" onserverclick="AJDetail_Delete" runat=server>
											<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Issue Detail"
												runat="server"></a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<HeaderTemplate>
										No
									</HeaderTemplate>
									<ItemTemplate>
										<%#Container.ItemIndex+1%>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
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
								<asp:BoundColumn DataField="adjusteduomqty" SortExpression="adjusteduomqty" HeaderText="Qty">
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv.Date" DataFormatString="{0:dd/MMM/yyyy}">
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
						</asp:datagrid></td>
				</tr>
			</table>
			<iwms:ipopup id="InputPopup" runat="server" Visible="False" Type="BTN" Mode="ADD" PageUrl="DetailInput.aspx"
				InputBoxHeight="280" InputBoxWidth="550" ButtonText="Add Issue Detail"></iwms:ipopup></form>
	</body>
</html>

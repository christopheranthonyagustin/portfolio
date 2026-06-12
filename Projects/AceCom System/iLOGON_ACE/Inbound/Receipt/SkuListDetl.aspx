<%@ Page language="c#" Codebehind="SkuListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.SkuListDetl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>SkuListDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="2" cellPadding="2" width="100%" border="0">
				<tr>
					<td>
						<asp:label style="Z-INDEX: 0" id="SkuLbl" runat="server" CssClass="pagetitle"></asp:label></td>
				</tr>
				<tr>
					<td>
						<asp:label id="ErrorLbl" runat="server" Visible="False" ForeColor="Red" Font-Bold="True">There are no suppliers found for this SKU.</asp:label>
						<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" AllowSorting="True" DataKeyField="sucode" AllowPaging="True"
								CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False" PageSize="8" UseAccessibleHeader="True">
								<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
								<ItemStyle CssClass="DGItem"></ItemStyle>
								<Columns>
									<asp:BoundColumn DataField="rcid" SortExpression="rcid" HeaderText="Receipt#">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Code">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suname" SortExpression="suname" HeaderText="Name">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suaddr1" SortExpression="suaddr1" HeaderText="Address#1">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suaddr2" SortExpression="suaddr2" HeaderText="Address#2">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suaddr3" SortExpression="suaddr3" HeaderText="Address#3">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suaddr4" SortExpression="suaddr4" HeaderText="Address#4">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="suzipcode" SortExpression="suzipcode" HeaderText="Zip Code">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="sucitycode" SortExpression="sucitycode" HeaderText="City">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="sucountrycode" SortExpression="sucountrycode" HeaderText="Country">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="rcstatusdescr" SortExpression="rcstatusdescr" HeaderText="Status">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="rcadddate" SortExpression="rcadddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="rcadduser" SortExpression="rcadduser" HeaderText="Add User">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="rceditdate" SortExpression="rceditdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="rcedituser" SortExpression="rcedituser" HeaderText="Edit User">
										<HeaderStyle Wrap="False"></HeaderStyle>
										<ItemStyle Wrap="False"></ItemStyle>
									</asp:BoundColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

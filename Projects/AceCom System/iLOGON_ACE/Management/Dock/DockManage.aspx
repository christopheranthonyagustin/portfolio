<%@ Page language="c#" Codebehind="DockManage.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Management.Dock.DockManage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Dock Manage</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="3" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<tr>
					<td bgColor="#ffffff"></td>
					<td>
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">&nbsp;Dock Manage</td>
							</tr>
							<tr bgColor="#ffffff">
								<td vAlign="top" width="35%"><span class="Pagetitle">Dock :</span>
									<asp:RequiredFieldValidator id="DockReq" runat="server" ErrorMessage="*" ControlToValidate="DockList"></asp:RequiredFieldValidator><asp:radiobuttonlist id="DockList" runat="server"></asp:radiobuttonlist></td>
								<td vAlign="top"><span class="Pagetitle">Inbound :</span>
									<BR>
									<asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" AllowPaging="True"
										BorderStyle="None" GridLines="Both" CellPadding="2" PageSize="8">
										<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
										<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
										<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn>
												<ItemTemplate>
													<asp:CheckBox id="SelectCB" Runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="acid" Visible="False"></asp:BoundColumn>
											<asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="id" SortExpression="id" HeaderText="Receipt#">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
											<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="priority" SortExpression="priority" HeaderText="Priority">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="Expected Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="exref1" SortExpression="exref1" HeaderText="Ext.Ref# 1">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="Ext.Date 1" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="suname" SortExpression="suname" HeaderText="Supplier Name">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr align="center" bgColor="#ffffff">
								<td colSpan="2"><asp:button id="AssignBtn" runat="server" Text="Assign to Dock" CssClass="formbtn" onclick="AssignBtn_Click"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ Page language="c#" Codebehind="InvInUseSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Enquiry.InvInUse.InvInUseSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>InUseItem</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<tr>
					<td bgColor="#ffffff"></td>
					<td>
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td class="subtabletitle" bgColor="#eeeeee">&nbsp;
									<asp:Label id="InvInUseLbl" runat="server">Inventory In Use</asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<table>
										<tr>
											<td>
												<asp:Label id="SiteLbl" runat="server">Site</asp:Label></td>
											<td>:
												<asp:DropDownList id="SiteList" runat="server"></asp:DropDownList>
												<asp:RequiredFieldValidator id="SiteReq" runat="server" ControlToValidate="SiteList" ErrorMessage="*"></asp:RequiredFieldValidator></td>
										</tr>
										<tr>
											<td>
												<asp:Label id="AccountLbl" runat="server">Account</asp:Label></td>
											<td>:
												<asp:DropDownList id="AccountList" runat="server"></asp:DropDownList></td>
										</tr>
										<tr>
											<td>
												<asp:Label id="SkuLbl" runat="server">SKU Code</asp:Label></td>
											<td>:
												<asp:TextBox id="SkuTxt" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator id="SkuReq" runat="server" ErrorMessage="*" ControlToValidate="SkuTxt"></asp:RequiredFieldValidator></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<asp:Button id="SearchBtn" runat="server" Text="Search" CssClass="formbtn" onclick="SearchBtn_Click"></asp:Button>&nbsp;<INPUT type="reset" value="Reset" runat="server" class="formbtn"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="Both"
										CellPadding="2" PageSize="8" DataKeyField="id">
										<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
										<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
										<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn>
												<ItemTemplate>
													<asp:Label id="DetailLbl" runat="server"></asp:Label>
												</ItemTemplate>
												<ItemStyle Wrap="False"></ItemStyle>
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
											<asp:BoundColumn DataField="skuid" Visible="False"></asp:BoundColumn>
											<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot#">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
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
											<asp:BoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="On Hand">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="allocatedqty" SortExpression="allocatedqty" HeaderText="Allocated">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="pickedqty" SortExpression="pickedqty" HeaderText="Picked">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="heldqty" SortExpression="heldqty" HeaderText="Held">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="availqty" SortExpression="availqty" HeaderText="Available">
												<HeaderStyle Wrap="False"></HeaderStyle>
												<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
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
										</Columns>
									</asp:datagrid>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

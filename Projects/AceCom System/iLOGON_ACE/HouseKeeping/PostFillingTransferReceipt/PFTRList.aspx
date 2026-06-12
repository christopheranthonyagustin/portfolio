<%@ Page language="c#" Codebehind="PFTRList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.PostFillingTransferReceipt.PFTRList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>InvMoveList</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body leftMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="2" cellPadding="2" width="100%" border="0">
				<tr>
					<td class="pagetitle">Inventory&nbsp;Transfer Wizard : Step 1 of 2</td>
				</tr>
				<tr>
					<td><asp:label id="MessageLbl" runat="server" ForeColor="Red"></asp:label><asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" CellPadding="2"
							GridLines="Both" BorderStyle="None" PageSize="8">
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<input id="SelectRBtn" type="radio" name="SelectRBtn" value='<%# DataBinder.Eval(Container.DataItem,"id") %>' />
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot">
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
								<asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receive Date" DataFormatString="{0:dd/MMM/yyyy}">
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
								<asp:BoundColumn DataField="uomlot" SortExpression="uomlot" HeaderText="UOM Lot">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages"></PagerStyle>
						</asp:datagrid><asp:button id="NextBtn" runat="server" CssClass="formbtn" Text=" Next " onclick="NextBtn_Click"></asp:button>&nbsp;
						<asp:button id="CancelBtn" runat="server" CssClass="formbtn" Text="Cancel" onclick="CancelBtn_Click"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>

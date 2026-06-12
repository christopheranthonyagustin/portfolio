<%@ Page language="c#" Codebehind="ProductOrderHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.ProductOrder.ProductOrderHead" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>RegisterLotNo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/sub_global.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../../js/sub_menu.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" >
		<form id="Form1" method="post" runat="server">
		<asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
			<div id="div-datagrid" style="HEIGHT:92%">
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="id" 
                    AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" PageSize="16" AllowSorting="True" UseAccessibleHeader="True"
					AllowPaging="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemStyle Wrap="False"></ItemStyle>
							<ItemTemplate>
								<iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn Visible="False" DataField="acid"></asp:BoundColumn>
						<asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>						
						<asp:BoundColumn DataField="id" SortExpression="id" HeaderText="ID" Visible="False">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="number" SortExpression="number" HeaderText="JobNo">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Customer">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="status"></asp:BoundColumn>
						<asp:BoundColumn DataField="lotno" SortExpression="lotno" HeaderText="LotNo">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="gradedescr" SortExpression="gradedescr" HeaderText="Grade">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="bagsizedescr" SortExpression="bagsizedescr" HeaderText="BagSize">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="produceddate" SortExpression="produceddate" HeaderText="ProducedDate" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="lotrunningno" SortExpression="lotrunningno" HeaderText="LotRunningNo">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="expirydate" SortExpression="expirydate" HeaderText="ExpiryDate" DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="packingstation" SortExpression="packingstation" HeaderText="PackingStation">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>						
						<asp:BoundColumn DataField="totwt" SortExpression="totwt" HeaderText="TotalKG">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="noofplt" SortExpression="noofplt" HeaderText="NoOfPallets">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="TotalBags">
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

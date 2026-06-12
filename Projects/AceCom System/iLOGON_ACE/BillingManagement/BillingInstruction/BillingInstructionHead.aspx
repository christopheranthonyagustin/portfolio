<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Page language="c#" Codebehind="BillingInstructionHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionHead" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>BillingInstructionHead</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<SCRIPT src="../../js/sub_global.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../../js/sub_menu.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<div id="div-datagrid" style="HEIGHT:92%">
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
				<div id="div1" style="height: 92%">
        <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None"
					GridLines="Both" CellPadding="2" PageSize="16" AllowSorting="True" UseAccessibleHeader="True"
					AllowPaging="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemStyle Wrap="False"></ItemStyle>
							<ItemTemplate>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
								<iwms:iSubMenu id="subMenuPrintCtl" runat="server"></iwms:iSubMenu>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>

						<asp:BoundColumn DataField="number" SortExpression="number" HeaderText="BI#">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="status" SortExpression="status" HeaderText="Status" Visible="false">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="completedate" SortExpression="completedate" HeaderText="CompleteDate" DataFormatString="{0:dd/MMM/yyyy}" Visible="false">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="src" SortExpression="src" HeaderText="Source">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="mdocno" SortExpression="mdocno" HeaderText="MasterDocNo" >
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="shipmenttype" SortExpression="shipmenttype" HeaderText="ShipmentType">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="cargopacktype" SortExpression="cargopacktype" HeaderText="CargoPackType">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="tpttype" SortExpression="tpttype" HeaderText="TansportType">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="shippercode" SortExpression="shippercode" HeaderText="ShipperCode">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="shippername" SortExpression="shippername" HeaderText="ShipperName">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="consigneecode" SortExpression="consigneecode" HeaderText="ConsigneeCode ">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="consigneename" SortExpression="consigneename" HeaderText="ConsigneeName">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="frservicept" SortExpression="frservicept" HeaderText="FromServicePoint">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="FromAddress" Visible="false">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="etd" SortExpression="etd" HeaderText="ETD"  DataFormatString="{0:dd/MMM/yyyy}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="toservicept" SortExpression="toservicept" HeaderText="ToServicePoint">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddress" Visible="false">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="eta" SortExpression="eta" HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
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
						<%-- <asp:BoundColumn DataField="cargoPackTypeUSR02" Visible="False"></asp:BoundColumn>--%>
						<asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>	
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
				</asp:datagrid>
    </div>
			</div>
		</form>
	</body>
</html>

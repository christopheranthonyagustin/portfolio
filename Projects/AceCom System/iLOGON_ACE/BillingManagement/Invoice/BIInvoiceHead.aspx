<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIInvoiceHead.aspx.cs" Inherits="iWMS.Web.BillingManagement.Invoice.BIInvoiceHead" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BillingInstructionInvoice</title>
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
								  <iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
								  <iwms:iSubMenu id="subMenuPrintCtl" runat="server"></iwms:iSubMenu>
								  <asp:Label id="DetailLbl" runat="server"></asp:Label>
							  </ItemTemplate>
						  </asp:TemplateColumn>
						  <asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
						  <asp:BoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Customer">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="divcode" SortExpression="divcode" HeaderText="Div">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billname" SortExpression="billname" HeaderText="BillName">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billaddr1" SortExpression="billaddr1" HeaderText="BillAddr1">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billaddr2" SortExpression="billaddr2" HeaderText="BillAddr2">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billaddr3" SortExpression="billaddr3" HeaderText="BillAddr3">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billaddr4" SortExpression="billaddr4" HeaderText="BillAddr4">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billcontact" SortExpression="billcontact" HeaderText="Contact">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billtel" SortExpression="billtel" HeaderText="Telephone">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billtelexfax" SortExpression="billtelexfax" HeaderText="Fax">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="billemail" SortExpression="billemail" HeaderText="Email">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="invdate" SortExpression="invdate" HeaderText="InvoiceDate" DataFormatString="{0:dd/MMM/yyyy}">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Cur">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="gstrate" SortExpression="gstrate" HeaderText="GSTRate" DataFormatString="{0:F2}">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>
						  <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>	
						  <asp:BoundColumn DataField="rem" SortExpression="rem" HeaderText="Remarks">
							  <HeaderStyle Wrap="False"></HeaderStyle>
							  <ItemStyle Wrap="False"></ItemStyle>
						  </asp:BoundColumn>					  						  
						<asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
							DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
							DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						  <asp:BoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="exchrate" visible="false" />
						  <asp:BoundColumn DataField="status" SortExpression="status" HeaderText="status" visible="false" />
						  <asp:BoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" visible="false" />
					  </Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
				  </asp:datagrid>
      </div>
    </div>
    </form>
</body>
</html>

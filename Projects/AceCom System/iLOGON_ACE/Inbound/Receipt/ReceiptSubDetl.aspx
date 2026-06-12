<%@ Page language="c#" Codebehind="ReceiptSubDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptSubDetl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReceiptSubDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
						<asp:label id="ReceiptLbl" runat="server" cssclass="pagetitle" Visible="False">Receipt #</asp:label>
						<asp:label id="ReceiptIdLbl" runat="server" cssclass="pagetitle"></asp:label>
						<asp:label id="DetailDescrLbl" runat="server" cssclass="pagetitle" Visible="False">Received Detail</asp:label></td>
				</tr>
			</table>
			<br>
			<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" AllowSorting="True" PageSize="8" BorderStyle="None"
					GridLines="Both" CellPadding="2" AutoGenerateColumns="False" DataKeyField="id" UseAccessibleHeader="True"><ALTERNATINGITEMSTYLE CssClass="DGAlternateItem"></ALTERNATINGITEMSTYLE>
					<ITEMSTYLE CssClass="DGItem"></ITEMSTYLE>
					<COLUMNS>
						<ASP:TEMPLATECOLUMN>
							<ITEMSTYLE HorizontalAlign="Center" Wrap="False"></ITEMSTYLE>
							<ITEMTEMPLATE>
								<A 
id=lnkFinalize onclick="return confirm('Confirm finalize Receipt Detail?')" 
href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" 
onserverclick="FinalizeRcsDetl"><IMG id="finalizeImg" border="0" alt="Finalize Receipt Detail" src="..\..\image\recvsubdetail-finalize.gif"
										width="15" height="15" runat="server"></A>
								<ASP:LABEL id="DetailLbl" runat="server"></ASP:LABEL><A id=lnkDelete 
onclick="return confirm('Confirm delete Receipt Detail?')" 
href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" 
onserverclick="DeleteRcsDetl"><IMG id="delImg" border="0" alt="Delete Receipt Detail" src="..\..\image\bin.gif" width="15"
										height="15" runat="server"></A>
							</ITEMTEMPLATE>
						</ASP:TEMPLATECOLUMN>
						<ASP:TEMPLATECOLUMN>
							<HEADERTEMPLATE>
								No
							</HEADERTEMPLATE>
							<ITEMTEMPLATE>
								<%#Container.ItemIndex+1%>
							</ITEMTEMPLATE>
						</ASP:TEMPLATECOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Line#" SortExpression="line" DataField="line">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Sku" SortExpression="skucode" DataField="skucode">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="skuid"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Description" SortExpression="skudescr" DataField="skudescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="status"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Status" SortExpression="statusdescr" DataField="statusdescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="UOM" SortExpression="uomdescr" DataField="uomdescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Qty" SortExpression="uomqty" DataField="uomqty" DataFormatString="{0:#,0.##}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="To Loc" SortExpression="loccode" DataField="loccode">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Rcv Date" SortExpression="rcdate" DataField="rcdate" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot4" SortExpression="lot4" DataField="lot4">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot1" SortExpression="lot1" DataField="lot1" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot5" SortExpression="lot5" DataField="lot5">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot6" SortExpression="lot6" DataField="lot6">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot7" SortExpression="lot7" DataField="lot7">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot2" SortExpression="lot2" DataField="lot2" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot3" SortExpression="lot3" DataField="lot3" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Lot8" SortExpression="lot8" DataField="lot8">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="TU#1" SortExpression="tuno1" DataField="tuno1">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="TU#2" SortExpression="tuno2" DataField="tuno2">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Add Date" SortExpression="adddate" DataField="adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Add User" SortExpression="adduser" DataField="adduser">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Edit Date" SortExpression="editdate" DataField="editdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Edit User" SortExpression="edituser" DataField="edituser">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
					</COLUMNS>
					<PAGERSTYLE HorizontalAlign="Left" Mode="NumericPages" Position="TopAndBottom" ForeColor="Black"></PAGERSTYLE>
				</asp:datagrid>
			</div>
		</form>
	</body>
</html>

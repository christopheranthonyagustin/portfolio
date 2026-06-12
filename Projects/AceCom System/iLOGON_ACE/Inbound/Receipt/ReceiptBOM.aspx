<%@ Page language="c#" Codebehind="ReceiptBOM.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptBOM" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReceiptBOM</title>
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
					<td class="pagetitle">Receipt ID[<asp:label id="ReceiptIdLbl" runat="server"></asp:label>]&nbsp;Receipt 
						BOM&nbsp;:</td>
				</tr>
				<TR>
					<TD><asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" CellPadding="2"
							GridLines="Both" BorderStyle="None" PageSize="8" AllowSorting="True">
							<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
							<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
							<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
									<ItemTemplate>
										<a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm finalize Receipt BOM?')" onserverclick="FinalizeRcBOM" runat=server>
											<img id="finalizeImg" src="..\..\image\recvsubdetail-finalize.gif" Width="15" Height="15"
												border="0" alt="Finalize Receipt BOM" runat="server"></a>
										<asp:Label id="DetailLbl" runat="server"></asp:Label>
										<a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Receipt BOM?')" onserverclick="DeleteRcBOM" runat=server>
											<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Receipt BOM"
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
								<asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="skuid" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="uomqty" SortExpression="uomqty" HeaderText="Qty">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="bomqty" SortExpression="bomqty" HeaderText="BOM Qty">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="bomuomdescr" SortExpression="bomuomdescr" HeaderText="BOM UOM">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="User Define 01">
									<HeaderStyle Wrap="False"></HeaderStyle>
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="User Define 02">
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
						</asp:datagrid></TD>
				</TR>
			</table>
			<asp:panel id="AddPanel" runat="server" Visible="False" BackColor="#eeeeee">
				<BR>
				<A name="#AddDetailBtn"></A>
				<TABLE border="0" cellSpacing="1" cellPadding="1">
					<TR>
						<TD colSpan="4"><B>Add Panel</B>&nbsp;
							<asp:Label id="MessageLbl" runat="server" ForeColor="Red"></asp:Label></TD>
					</TR>
					<TR>
						<TD noWrap>SKU Code:
							<asp:RequiredFieldValidator id="SkuVal" runat="server" ControlToValidate="SkuTxt" ErrorMessage="*"></asp:RequiredFieldValidator><BR>
							<asp:TextBox id="SkuTxt" runat="server" AutoPostBack="True" ontextchanged="SkuTxt_TextChanged"></asp:TextBox></TD>
						<TD noWrap>Qty:
							<asp:RequiredFieldValidator id="QtyReqVal" runat="server" ControlToValidate="QtyTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
							<asp:CompareValidator id="QtyVal" runat="server" ControlToValidate="QtyTxt" ErrorMessage="#" Operator="DataTypeCheck"
								Type="Integer"></asp:CompareValidator><BR>
							<asp:TextBox id="QtyTxt" runat="server"></asp:TextBox></TD>
						<TD noWrap>BOM Qty
							<asp:RequiredFieldValidator id="BomQtyReqVal" runat="server" ControlToValidate="BomQtyTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
							<asp:CompareValidator id="BomQtyVal" ControlToValidate="BomQtyTxt" ErrorMessage="#" Operator="DataTypeCheck"
								Type="Double" Runat="server"></asp:CompareValidator><BR>
							<asp:TextBox id="BomQtyTxt" Runat="server"></asp:TextBox></TD>
						<TD noWrap>BOM UOM<BR>
							<asp:DropDownList id="BomUomList" Runat="server"></asp:DropDownList></TD>
					</TR>
					<TR>
						<TD colSpan="4" noWrap>
							<asp:Button id="SaveNextBtn" runat="server" Text="Save &amp; Next" onclick="SaveNextBtn_Click"></asp:Button>&nbsp;
							<asp:Button id="SaveBtn" runat="server" Text="Save" onclick="SaveBtn_Click"></asp:Button>&nbsp;
							<asp:Button id="ClosePanelBtn" runat="server" Text="Close Panel" CausesValidation="False" onclick="ClosePanelBtn_Click"></asp:Button></TD>
					</TR>
				</TABLE>
			</asp:panel><br>
			<asp:button id="AddDetailBtn" runat="server" Visible="False" CssClass="formbtn" Text="Add Detail" onclick="AddDetailBtn_Click"></asp:button><BR>
		</form>
	</body>
</html>

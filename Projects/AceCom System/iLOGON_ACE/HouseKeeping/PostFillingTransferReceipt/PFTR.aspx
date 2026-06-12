<%@ Page language="c#" Codebehind="PFTR.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.PostFillingTransferReceipt.PFTR" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>InvMove</title>
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
					<td class="pagetitle">Inventory Transfer Wizard : Step 2 of 2</td>
				</tr>
				<tr>
					<td>
						<asp:repeater id="rptResults" Runat="server">
							<ItemTemplate>
								<table cellspacing="1" cellpadding="2" width="100%" style="BORDER: #d3d3d3 2px solid;">
									<tr>
										<td colspan="7" class="GrayTitle">From:</td>
									</tr>
									<tr style="COLOR: white; BACKGROUND-COLOR: #9e9e9e">
										<td>
											<asp:Label ID="AccountLbl" Runat="server">Account</asp:Label></td>
										<td>
											<asp:Label ID="SKUCodeLbl" Runat="server">SKU</asp:Label></td>
										<td>
											<asp:Label ID="SKUDescrLbl" Runat="server">Description</asp:Label></td>
										<td>
											<asp:Label ID="LowestUOMLbl" Runat="server">Lowest UOM</asp:Label></td>
										<td>
											<asp:Label ID="QuantityLbl" Runat="server">Quantity</asp:Label></td>
										<td>
											<asp:Label ID="VolumeLbl" Runat="server">Volume</asp:Label></td>
										<td>
											<asp:Label ID="BalanceLbl" Runat="server">Balance</asp:Label></td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="AccountValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "accode") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="SKUCodeValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="SKUDescrValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="LowestUOMValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="QuantityValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "availqty") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="VolumeValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "volume") %>'>
											</asp:Label></td>
										<td>
											<asp:Label ID="BalanceValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "volume") %>'>
											</asp:Label></td>
									</tr>
									<tr>
										<td colspan="7" class="GrayTitle">To:</td>
									</tr>
									<tr>
										<td colspan="7">
											<asp:Label ID="SKUIDValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skuid") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="SKUFamilyValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skufamily") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="SiteCodeValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "sitecode") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="ZoneCodeValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "zonecode") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="LocCodeValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "loccode") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="TUNO1Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="TUNO2Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno2") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="RcDateValue" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rcdate") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot1Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot2Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot3Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot4Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot5Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot6Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot7Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>' Visible="False">
											</asp:Label>
											<asp:Label ID="Lot8Value" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>' Visible="False">
											</asp:Label>
											<asp:DataGrid id="ResultDG" runat="server" DataKeyField="skuid" AutoGenerateColumns="False" BorderStyle="None"
												GridLines="Both" CellPadding="2" Width="100%" OnItemDataBound="ResultDG_ItemDataBound" OnCancelCommand="ResultDG_CancelCommand"
												OnEditCommand="ResultDG_EditCommand" OnUpdateCommand="ResultDG_UpdateCommand">
												<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
												<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
												<HeaderStyle ForeColor="White" BackColor="#9e9e9e"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:ImageButton Runat="server" Visible="True" ID="QtyEdit" ImageUrl="..\..\image\pencil.gif" Width="15"
																Height="15" AlternateText="Edit" CommandName="Edit" CausesValidation="False"></asp:ImageButton>
															<asp:Label id="DetailLbl" runat="server"></asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:ImageButton Runat="server" Visible="True" ID="QtyUpdate" ImageUrl="..\..\image\floppy.gif" Width="15"
																Height="15" AlternateText="Update" CommandName="Update" CausesValidation="True"></asp:ImageButton>
															<asp:ImageButton Runat="server" Visible="True" ID="QtyCancel" ImageUrl="..\..\image\arrow6.gif" Width="15"
																Height="15" AlternateText="Cancel" CommandName="Cancel" CausesValidation="False"></asp:ImageButton>
														</EditItemTemplate>
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
													<asp:BoundColumn DataField="sitecode" HeaderText="sitecode" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="zonecode" HeaderText="zonecode" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="loccode" HeaderText="loccode" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="LocCode">
														<ItemTemplate>
															<%# DataBinder.Eval(Container.DataItem, "loccode") %>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList ID="ddlLocCode" Runat="server" DataTextField="code" DataValueField="code"></asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="FromSkuId" HeaderText="FromSkuId" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="skucode" HeaderText="SKU" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="skudescr" HeaderText="Description" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="LowestHU" HeaderText="Lowest HU" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="reorderqty" HeaderText="Reorder Qty" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="availqty" HeaderText="availqty" ReadOnly="True" Visible="False"></asp:BoundColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Available Qty">
														<ItemTemplate>
															<asp:Label ID="AvailQtyLbl" Runat="server"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="transferqty" HeaderText="transferqty" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Transfer Qty">
														<ItemTemplate>
															<%# DataBinder.Eval(Container.DataItem, "transferqty") %>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox Runat="server" Width="60px" ID="TransferQtyTxt"></asp:TextBox>
															<asp:RequiredFieldValidator id="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="TransferQtyTxt"></asp:RequiredFieldValidator>
															<asp:CompareValidator id="QtyCompVal" runat="server" ErrorMessage="#" ControlToValidate="TransferQtyTxt"
																Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="uom" HeaderText="Lowest UOM" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="qty" HeaderText="qty" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn DataField="vol" HeaderText="vol" Visible="False" ReadOnly="True"></asp:BoundColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Qty">
														<ItemTemplate>
															<asp:Label ID="QtyLbl" Runat="server"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Volume">
														<ItemTemplate>
															<asp:Label ID="VolLbl" Runat="server"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Balance">
														<ItemTemplate>
															<asp:Label ID="BalLbl" Runat="server"></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
												</Columns>
											</asp:DataGrid>
										</td>
									</tr>
								</table>
								<br />
							</ItemTemplate>
						</asp:repeater>
						<asp:button id="SaveBtn" runat="server" CssClass="formbtn" Text=" Save " onclick="SaveBtn_Click"></asp:button>&nbsp;
						<asp:button id="CancelBtn" runat="server" CssClass="formbtn" Text="Cancel" CausesValidation="False" onclick="CancelBtn_Click"></asp:button></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</form>
	</body>
</html>

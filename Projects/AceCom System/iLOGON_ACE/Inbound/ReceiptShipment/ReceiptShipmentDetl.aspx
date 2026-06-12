<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptShipmentDetl.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ReceiptShipmentDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ReceiptDetl</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table border="0" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td>
						<asp:label id="ReceiptLbl" runat="server" cssclass="pagetitle" Visible="False">Receipt #</asp:label>
						<asp:label id="ReceiptIdLbl" runat="server" cssclass="pagetitle"></asp:label>
						<asp:label id="DetailDescrLbl" runat="server" cssclass="pagetitle" Visible="False">Detail</asp:label>
					</td>
					<td align="right"><iwms:ipopup style="Z-INDEX: 0" id="InputPopup" runat="server" Visible="False" Type="BTN" Mode="ADD"
							PageUrl="DetailInput.aspx" InputBoxHeight="170" InputBoxWidth="430" ButtonText="+ Quick Detail"></iwms:ipopup>&nbsp;
						<asp:button style="Z-INDEX: 0" id="InputPopupMultipleBtn" runat="server" Visible="False" CssClass="detailButton"
							Text="+ Details" onclick="InputPopupMultipleBtn_Click"></asp:button>&nbsp;&nbsp;&nbsp;<asp:button style="Z-INDEX: 0" id="PopulateFromPOBtn" runat="server" Visible="False" CssClass="detailButton"
							Text="+ Detail [PO]" onclick="PopulateFromPOBtn_Click"></asp:button>&nbsp;&nbsp;</td>
				</tr>
			</table>
			<br>
			<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" GridLines="Both"
					CellPadding="2" PageSize="8" AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<HeaderTemplate>
								&nbsp;<a id="lnkSysPopulate" href='#' onclick="return confirm('Confirm System Populate?')"
									onserverclick="SysPopulate" runat="server"><img id="sysPopulateImg" src="..\..\image\rcsdetl.gif" Width="15" Height="15" border="0"
										alt="System Populate" runat="server"></a>&nbsp;
							</HeaderTemplate>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
							<ItemTemplate>
								<a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="RCDetail_Finalize" onclick="return confirm('Confirm Finalize Detail?')" runat=server>
									<img id="finalizeImg" src="..\..\image\finalize.gif" Width="15" Height="15" border="0"
										alt="Finalize Receipt Detail" runat="server"></a>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<a id="lnkBOM" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="BOM_Explode" onclick="return confirm('Confirm Explode BOM?')" runat=server>
									<img id="BOMImg" src="..\..\image\BOM.png" Width="15" Height="15" border="0" alt="Explode BOM"
										runat="server"></a> <a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')" onserverclick="RCDetail_Delete" runat=server>
									<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Receipt Detail"
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
						<asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="expectedqty" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Expected"
							DataFormatString="{0:#,0.##}">
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="intransitqty" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="intransituomqty" SortExpression="intransituomqty" HeaderText="In Transit"
							DataFormatString="{0:#,0.##}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="receivedqty" Visible="False"></asp:BoundColumn>
						<asp:BoundColumn DataField="receiveduomqty" SortExpression="receiveduomqty" HeaderText="Received"
							DataFormatString="{0:#,0.##}">
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="bom_sku" Visible="False"></asp:BoundColumn>
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
				</asp:datagrid></div>
		</form>
	</body>
</html>
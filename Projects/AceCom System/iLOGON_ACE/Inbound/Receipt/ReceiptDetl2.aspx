<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Page language="c#" Codebehind="ReceiptDetl2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptDetl2" %>
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
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
						<asp:label id="ReceiptLbl" runat="server" cssclass="pagetitle" Visible="False">Receipt #</asp:label>
						<asp:label id="ReceiptIdLbl" runat="server" cssclass="pagetitle"></asp:label>
						<asp:label id="DetailDescrLbl" runat="server" cssclass="pagetitle" Visible="False">Detail</asp:label>
					</td>
					<td align="right">
						<iwms:ipopup style="Z-INDEX: 0" id="InputPopup" runat="server" ButtonText="+ Quick Detail" InputBoxWidth="430"
							InputBoxHeight="170" PageUrl="DetailInput.aspx" Mode="ADD" Type="BTN" Visible="False"></iwms:ipopup>&nbsp;
						<asp:Button id="InputPopupMultipleBtn" runat="server" Text="+ Details" CssClass="detailButton"
							style="Z-INDEX: 0" Visible="False"></asp:Button>&nbsp;&nbsp;&nbsp;<asp:Button id="MoreFunctionBtn" runat="server" Text="+ More Functions" CssClass="detailButton"
							style="Z-INDEX: 0" Visible="False" onclick="MoreFunctionBtn_Click"></asp:Button>&nbsp;&nbsp;</td>
				</tr>
			</table>
			<br>
			<div id="div-datagrid" style="HEIGHT:90%"><asp:datagrid id="ResultDG" runat="server" UseAccessibleHeader="True" AllowSorting="False" PageSize="8"
					CellPadding="2" GridLines="Both" AutoGenerateColumns="False" DataKeyField="id"><ALTERNATINGITEMSTYLE CssClass="DGAlternateItem"></ALTERNATINGITEMSTYLE>
					<ITEMSTYLE CssClass="DGItem"></ITEMSTYLE>
					<COLUMNS>
						<ASP:TEMPLATECOLUMN Visible="False">
							<HEADERTEMPLATE>
								<A id="lnkSysPopulate" onclick="return confirm('Confirm System Populate?')" href="#"
									runat="server" onserverclick="SysPopulate"><IMG id="sysPopulateImg" border="0" alt="System Populate" src="..\..\image\rcsdetl.gif"
										width="15" height="15" runat="server"></A>
							</HEADERTEMPLATE>
							<ITEMSTYLE HorizontalAlign="Center" Wrap="False"></ITEMSTYLE>
							<ITEMTEMPLATE>
								<A id=lnkFinalize 
onclick="return confirm('Confirm Finalize Detail?')" 
href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" 
onserverclick="RCDetail_Finalize"><IMG id="finalizeImg" border="0" alt="Finalize Receipt Detail" src="..\..\image\finalize.gif"
										width="15" height="15" runat="server"></A>
								<ASP:LABEL id="DetailLbl" runat="server"></ASP:LABEL><A 
id=lnkBOM onclick="return confirm('Confirm Explode BOM?')" 
href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" 
onserverclick="BOM_Explode"><IMG id="BOMImg" border="0" alt="Explode BOM" src="..\..\image\BOM.png" width="15" height="15"
										runat="server"></A> <A id=lnkDelete 
onclick="return confirm('Confirm delete?')" 
href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" 
onserverclick="RCDetail_Delete"><IMG id="delImg" border="0" alt="Delete Receipt Detail" src="..\..\image\bin.gif" width="15"
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
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="Line#" SortExpression="line" DataField="line">
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
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="Status" SortExpression="statusdescr" DataField="statusdescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="UOM" SortExpression="uomdescr" DataField="uomdescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="expectedqty"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Expected" SortExpression="expecteduomqty" DataField="expecteduomqty"
							DataFormatString="{0:0.00}">
							<ITEMSTYLE HorizontalAlign="Center" Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="intransitqty"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="In Transit" SortExpression="intransituomqty" DataField="intransituomqty"
							DataFormatString="{0:0.00}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE HorizontalAlign="Center" Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="receivedqty"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="Received" SortExpression="receiveduomqty" DataField="receiveduomqty"
							DataFormatString="{0:0.00}">
							<ITEMSTYLE HorizontalAlign="Center" Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="bom_sku"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Add Date" SortExpression="adddate" DataField="adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN HeaderText="Add User" SortExpression="adduser" DataField="adduser">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="Edit Date" SortExpression="editdate" DataField="editdate"
							DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" HeaderText="Edit User" SortExpression="edituser" DataField="edituser">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
					</COLUMNS>
					<PAGERSTYLE Mode="NumericPages" HorizontalAlign="Left" Position="TopAndBottom" ForeColor="Black"></PAGERSTYLE>
				</asp:datagrid></div>
		</form>
	</body>
</html>

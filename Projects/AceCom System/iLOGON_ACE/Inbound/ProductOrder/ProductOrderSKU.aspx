<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Page MaintainScrollPositionOnPostback="true" language="c#" Codebehind="ProductOrderSKU.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderSKU" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>RegisterLotNo</title>
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
						<br />&nbsp
						<asp:label id="ReceiptIdLbl" runat="server" cssclass="pagetitle"></asp:label>						
					    <br /><br />						
					</td>
					<td align="right">&nbsp;</td>
				</tr>
			</table>
			<br>
			<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" UseAccessibleHeader="True" AllowSorting="True"
					CellPadding="2" GridLines="Both" AutoGenerateColumns="False" DataKeyField="rcdtid"><ALTERNATINGITEMSTYLE CssClass="DGAlternateItem"></ALTERNATINGITEMSTYLE>
					<ITEMSTYLE CssClass="DGItem"></ITEMSTYLE>
					<COLUMNS>
					<ASP:TEMPLATECOLUMN>
                        <ITEMSTYLE HorizontalAlign="left" Wrap="False"></ITEMSTYLE>
                        <ITEMTEMPLATE>                            
                        <a id=lnkPrint href='<%#DataBinder.Eval(Container,"DataItem.rcdtid")%>'
                            onserverclick="Bag_PrintLabel"  runat=server>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <img id="editImg" src="../../Image/pencil.gif" Width="15" Height="15" 
                                border="0" alt="Edit"
	                            runat="server" visible="False"></a>
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
						<ASP:BOUNDCOLUMN Visible="False" DataField="id"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="line" HeaderText="Line#" SortExpression="line">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot1" HeaderText="Lot1" SortExpression="lot1" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot2" HeaderText="Lot2" SortExpression="lot2" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot4" HeaderText="Lot4" SortExpression="lot4">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot5" HeaderText="Lot5" SortExpression="lot5">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot6" HeaderText="Lot6" SortExpression="lot6">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="qty" HeaderText="Qty" SortExpression= "qty" >
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"  HorizontalAlign="Right"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot7" HeaderText="Lot7" SortExpression="lot7" DataFormatString="{0:#,#}" Visible="false">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN Visible="False" DataField="rcdstatus"></ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="rcdstatusdescr" HeaderText="Status" SortExpression="rcdstatusdescr">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot8" HeaderText="Lot8" SortExpression="lot8" DataFormatString="{0:#,#}" Visible="false">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="wt" HeaderText="StandardWt" SortExpression="wt"  DataFormatString="{0:#,0.000}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"  HorizontalAlign="Right"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="netwt" HeaderText="ActualWt" SortExpression="netwt" DataFormatString="{0:#,0.000}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"  HorizontalAlign="Right"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="lot3" HeaderText="Lot3" SortExpression="lot3" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="vol" HeaderText="ShiftNo" SortExpression="vol"  DataFormatString="{0:#,#}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="rem1" HeaderText="VoidLabel" SortExpression="rem1">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="tuno1" HeaderText="BarCode1" SortExpression="tuno1">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN DataField="tuno2" HeaderText="BarCode2" SortExpression="tuno2">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
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
						<ASP:BOUNDCOLUMN Visible="False" DataField="rcdstatuscolor"></ASP:BOUNDCOLUMN>
					</COLUMNS>
					<PAGERSTYLE Mode="NumericPages" HorizontalAlign="Left" Position="TopAndBottom" ForeColor="Black"></PAGERSTYLE>
				</asp:datagrid></div>
		</form>
	</body>
</html>

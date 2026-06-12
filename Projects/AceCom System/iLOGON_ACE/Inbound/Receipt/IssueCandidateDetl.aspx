<%@ Page language="c#" Codebehind="IssueCandidateDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.IssueCandidateDetl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>IssueCandidateDetl</title>
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
					<td>
						<asp:label id="IssueLbl" runat="server" cssclass="pagetitle" Visible="False">Issue #</asp:label>
						<asp:label id="IssueIdLbl" runat="server" cssclass="pagetitle"></asp:label>
						<asp:label id="DetailDescrLbl" runat="server" cssclass="pagetitle" Visible="False">Detail</asp:label>
					</td>
				</tr>
			</table>
			<div id="div-datagrid"><asp:datagrid id="ResultDG" runat="server" PageSize="8" BorderStyle="None" GridLines="Both" CellPadding="2"
					AutoGenerateColumns="False" DataKeyField="id" AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<HeaderTemplate>
								No
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="packedqty" SortExpression="packedqty" HeaderText="Qty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</asp:BoundColumn>
					</Columns>
				</asp:datagrid></div>
		</form>
	</body>
</html>

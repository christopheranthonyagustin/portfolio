<%@ Page language="c#" Codebehind="TranslateHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Translate.TranslateHead" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>TranslateHead</title>
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
				<asp:datagrid id="ResultDG" runat="server" DataKeyField="code" AutoGenerateColumns="False" AllowPaging="True"
					BorderStyle="None" GridLines="Both" CellPadding="2" PageSize="16" AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="code" SortExpression="code" HeaderText="Code">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
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
				</asp:datagrid>
			</div>
		</form>
	</body>
</html>

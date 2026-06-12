<%@ Page language="c#" Codebehind="ModuleList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.ModuleList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ModuleList</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<tr>
					<td bgColor="#ffffff"></td>
					<td>
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td class="tabletitle" bgColor="#19509f" colSpan="2">&nbsp;Profile Management</td>
							</tr>
							<tr bgColor="#ffffff">
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">&nbsp;Module List</td>
							</tr>
							<tr bgColor="#ffffff">
								<td colspan="2">
									<asp:DataGrid id="ListDG" runat="server"></asp:DataGrid>
									<asp:Label id="Label1" runat="server">Label</asp:Label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

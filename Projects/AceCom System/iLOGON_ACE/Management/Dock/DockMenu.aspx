<%@ Page language="c#" Codebehind="DockMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Management.Dock.DockMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>DockMenu</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" bgColor="#e2e3e3" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></td>
					<td class="ModuleTitle" align="right">[
						<asp:Label id="ResourceLbl" runat="server">Resource</asp:Label>&nbsp;:
						<asp:Label id="DockMgmtLbl" runat="server">Dock</asp:Label>]</td>
				</tr>
			</table>
		</form>
	</body>
</html>

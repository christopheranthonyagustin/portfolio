<%@ Page language="c#" Codebehind="ModuleStructure.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Module.ModuleStructure" %>
<%@ Register TagPrefix="iWMS" TagName="Modules" Src="../../Control/Module.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ModuleStructure</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
		    <asp:Label id="SearchLbl" runat="server" CssClass="pagetitle" Text="Module Structure"></asp:Label><br></td>
							</tr>
							<tr bgColor="#ffffff">
								<td><iwms:Modules id="Modules" runat="server"></iwms:Modules></td>
							</tr>
						</table>
		</form>
	</body>
</html>

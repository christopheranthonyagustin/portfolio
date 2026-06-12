<%@ Page language="c#" Codebehind="ProfileMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Profile.ProfileMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ProfileMenu</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="5" style="BORDER-BOTTOM: #D5D5D5 1px solid;">
		<form id="Form1" method="post" runat="server">
			<table width="100%" style="padding-top: 2px;">
				<tr>
					<td><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></td>
					
				</tr>
			</table>
		</form>
	</body>
</html>

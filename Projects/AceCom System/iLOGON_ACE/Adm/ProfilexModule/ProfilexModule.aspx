<%@ Register TagPrefix="iWMS" TagName="Modules" Src="../../Control/Module.ascx" %>
<%@ Page language="c#" Codebehind="ProfilexModule.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.ProfilexModule.ProfilexModule" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ProfilexModule</title>
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
						<div class="pagetitle">
							Module for Profile
							<asp:Label id="ProfileLbl" runat="server"></asp:Label></div>
					</td>
				</tr>
				<tr bgColor="#ffffff">
					<td><iwms:Modules id="Modules" runat="server"></iwms:Modules></td>
				</tr>
			</table>
			</td> </tr> </table>
		</form>
		</TR></TBODY></TABLE></form>
	</body>
</html>

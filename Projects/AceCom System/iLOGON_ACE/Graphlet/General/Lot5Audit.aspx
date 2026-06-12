<%@ Page language="c#" Codebehind="Lot5Audit.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Graphlet.General.Lot5Audit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Lot5Audit</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<tr>
					<td bgColor="#ffffff"></td>
					<td>
						<table cellSpacing="1" cellPadding="1" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td width="20%">&nbsp;
									<asp:Label id="ZoneLbl" runat="server">Customs Lot</asp:Label></td>
								<td>:<asp:TextBox id="Lot5Txt" runat="server"></asp:TextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td></td>
								<td>&nbsp;
									<asp:button id="GetGraphletBtn" runat="server" Text="Get Graphlet" onclick="GetGraphletBtn_Click"></asp:button></td>
							</tr>
							<tr bgColor="#ffffff">
								<td vAlign="top" colSpan="2">
									<asp:image id="ChartImage" runat="server" visible="False" borderwidth="0"></asp:image></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

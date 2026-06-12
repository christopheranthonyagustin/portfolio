<%@ Page language="c#" Codebehind="InfoBoardSetup.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Graphlet.InfoBoard.InfoBoardSetup" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>InfoBoardSetup</title>
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
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">&nbsp;
									<asp:Label id="InfoBoardLbl" runat="server">Info Board</asp:Label>&nbsp;
									<asp:Label id="SetupLbl" runat="server">Setup</asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td width="25%">&nbsp;
									<asp:Label id="AccountLbl" runat="server">Account</asp:Label></td>
								<td>:
									<asp:dropdownlist id="AccountList" runat="server"></asp:dropdownlist></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>&nbsp;
									<asp:Label id="RefreshLbl" runat="server">Refresh Interval</asp:Label></td>
								<td>:
									<asp:DropDownList id="IntervalList" runat="server">
										<asp:ListItem Value="60">1 Minute</asp:ListItem>
										<asp:ListItem Value="300">5 Minutes</asp:ListItem>
										<asp:ListItem Value="600">10 Minutes</asp:ListItem>
										<asp:ListItem Value="900">15 Minutes</asp:ListItem>
									</asp:DropDownList></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>&nbsp;
									<asp:Label id="InfoLbl" runat="server">Information</asp:Label></td>
								<td>:
									<asp:DropDownList id="InfoList" runat="server">
										<asp:ListItem Value="Issue">Issue</asp:ListItem>
									</asp:DropDownList></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>&nbsp;
									<asp:Label id="SelectLbl" runat="server">Select View</asp:Label></td>
								<td>:
									<asp:dropdownlist id="drpChartType" runat="server">
										<asp:ListItem Value="pie">Pie Chart</asp:ListItem>
										<asp:ListItem Value="bar">Bar Graph</asp:ListItem>
									</asp:dropdownlist></td>
							</tr>
							<tr bgColor="#ffffff">
								<td></td>
								<td>
									<asp:Button id="ViewBtn" runat="server" Text="View Info Board" onclick="ViewBtn_Click"></asp:Button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

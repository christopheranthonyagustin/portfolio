<%@ Page language="c#" Codebehind="InfoBoard.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Graphlet.InfoBoard.InfoBoard" %>

<html>
	<head>
		<title>InfoBoard</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<META runat="server" id="RefreshMeta" http-equiv="Refresh" />
		</META>
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
									<asp:Label id="InfoBoardLbl" runat="server">Info Board </asp:Label>
									&nbsp;: Outbound - Issue [
									<asp:Label id="AcCodeLbl" runat="server"></asp:Label>]</td>
							</tr>
							<tr bgColor="#ffffff">
								<td colspan="2">&nbsp;
									<asp:Label id="Refresh2Lbl" runat="server">Refresh Interval</asp:Label>
									:&nbsp;
									<asp:Label id="RefreshLbl" runat="server"></asp:Label>
									<BR>
									&nbsp;
									<asp:Label id="LastLbl" runat="server">Last refresh</asp:Label>
									:
									<asp:Label id="LastRefreshLbl" runat="server"></asp:Label>
									<BR>
									<asp:image id="ChartImage" runat="server" visible="False" borderwidth="0"></asp:image></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

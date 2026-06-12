<%@ Page language="c#" Codebehind="ExplodeInput2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ExplodeInput2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ExplodeInput2</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<base target="_self">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	</head>
	<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td>
						<asp:Label id="ExplodeLbl" runat="server" CssClass="pagetitle">Explode Receipt Detail</asp:Label><br>
					</td>
				</tr>
				<tr>
					<td style="HEIGHT: 76px">
						<P><asp:Label id="InfoLbl" runat="server">Explode receipt detail Line# [</asp:Label>
							<asp:Label id="LineLbl" runat="server"></asp:Label>]<BR>
							&nbsp;
							<asp:Label ID="Info2Lbl" Runat="server">will create more than 50 receiving lines.</asp:Label>
							<br>
							&nbsp;
							<asp:Label ID="Info3Lbl" Runat="server">Are you sure you want to proceed?</asp:Label>&nbsp;<BR>
							<BR>
							&nbsp; <FONT color="#0000ff">
								<asp:Label ID="Info4Lbl" Runat="server">Reminder: Respond time may be slow</asp:Label>
								<BR>
								&nbsp;
								<asp:Label ID="Info5Lbl" Runat="server">when explode detail into too many lines.</asp:Label></FONT>
						</P>
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">&nbsp;<asp:button id="YesBtn" runat="server" Text="  Yes  " CssClass="detailbutton" onclick="YesBtn_Click"></asp:button>&nbsp;
						<asp:button id="CloseBtn" runat="server" Text="   No   " CssClass="detailbutton"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>

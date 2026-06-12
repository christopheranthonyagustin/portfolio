<%@ Page language="c#" Codebehind="TipDisplay.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Tip.TipDisplay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>TipDisplay</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body>
		<form id="Form1" method="post" runat="server" style="overflow:hidden;">
			<table border="0" cellSpacing="0" cellPadding="0" align="center" width="100%">
				<tr>
					<td><asp:panel style="PADDING-BOTTOM: 5px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; PADDING-TOP: 5px"
							id="tipPnl" Runat="server" BackColor="White" BorderWidth="1" BorderColor="Black" BorderStyle="Dashed" width="100%" height="100%">
							<DIV style="BORDER-BOTTOM: #d5d5d5 1px solid; BORDER-LEFT: #d5d5d5 1px solid; PADDING-BOTTOM: 5px; BACKGROUND-COLOR: #eeeeee; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; BORDER-TOP: #d5d5d5 1px solid; BORDER-RIGHT: #d5d5d5 1px solid; PADDING-TOP: 5px"
								align="right">
								<asp:Label id="tipTypeLbl" Runat="server" CssClass="pageTitle">iWMS</asp:Label></DIV>
							<BR>
							<DIV align="left"><IMG src="../../Image/quote_open.png"></DIV>
							<BR>
							<DIV align="center">
								<asp:TextBox style="FONT-SIZE: 12px; OVERFLOW: auto; align: justify" id="tipTxt" BorderWidth="0"
									BackColor="Transparent" Runat="server" CssClass="pageTitle" ReadOnly="True" Rows="10" Wrap="True"
									TextMode="MultiLine" Columns="40">i-Warehouse Management System - A total warehouse management solution.</asp:TextBox></DIV>
							<BR>
							<DIV align="right"><IMG src="../../Image/quote_close.png"></DIV>
							<DIV align="right">&nbsp;</DIV>
							<DIV align="right">
								<asp:LinkButton id="lnkNext" runat="server" Font-Bold="True" ForeColor="Black" onclick="lnkNext_Click">Next Tip</asp:LinkButton></DIV>
						</asp:panel>
						<div align="right"><asp:label style="COLOR: white" id="lblFromSvr" runat="server"></asp:label></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ Page language="c#" Codebehind="OrderStatusMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.OrderStatus.OrderStatusMenu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>OrderStatusMenu</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="15" style="BORDER-BOTTOM: #d5d5d5 1px solid">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
					<td class="ModuleTitle" align="right">
						<div class="rounded-box1" style="BACKGROUND-COLOR:#660000;WIDTH:30%">
							<div class="top-right-corner1">
								<div class="top-right-inside1" style="BACKGROUND-COLOR: #ffffff;COLOR: #660000">•</div>
							</div>
							<div class="top-left-corner1">
								<div class="top-left-inside1" style="BACKGROUND-COLOR: #ffffff;COLOR: #660000">•</div>
							</div>
							<div class="box-contents1" style="PADDING-BOTTOM:5px;PADDING-LEFT:3px;PADDING-RIGHT:5px;FONT-SIZE:10pt;FONT-WEIGHT:bold;PADDING-TOP:3px;LEFT:2px">
								<asp:Label id="GraphletLbl" runat="server">Report</asp:Label>&nbsp;:
								<asp:Label id="ReportLbl" runat="server">Order Status</asp:Label></div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

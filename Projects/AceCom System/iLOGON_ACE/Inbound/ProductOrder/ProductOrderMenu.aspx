<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Page language="c#" Codebehind="ProductOrderMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderMenu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>RegisterLotNo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="8" style="BORDER-BOTTOM: #d5d5d5 1px solid" >
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td><input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></a></td>
					<td class="ModuleTitle" align="right">
						<div class="rounded-box1" style="width:80%;background-color:#336600;">
							<div class="top-right-corner1">
								<div class="top-right-inside1" style="BACKGROUND-COLOR: #ffffff;color:#336600">•</div>
							</div>
							<div class="top-left-corner1">
								<div class="top-left-inside1" style="BACKGROUND-COLOR: #ffffff;color:#336600">•</div>
							</div>
							<div class="box-contents1" style="font-size:10pt;font-weight:bold;left:2px;padding:3px 5px 5px 3px;">
								<asp:Label id="ReceiptDocLbl" runat="server">Register LotNo</asp:Label>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

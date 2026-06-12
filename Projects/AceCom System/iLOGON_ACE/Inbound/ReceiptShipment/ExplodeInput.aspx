<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExplodeInput.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.ExplodeInput" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PopulateInput</title>
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
					<td><asp:Label id="ExplodeLbl" runat="server" CssClass="pagetitle">Explode Receipt Detail</asp:Label><br>
					</td>
				</tr>
				<tr>
					<td>
						<P><asp:Label id="InfoLbl" runat="server">Explode receipt detail Line# [</asp:Label>
							<asp:Label id="LineLbl" runat="server"></asp:Label>]<BR>
							<BR>
							<asp:Label id="ToLbl" runat="server"> To</asp:Label>
							<asp:DropDownList id="ExplodeUomList" runat="server"></asp:DropDownList>&nbsp;<asp:Label id="LevelLbl" runat="server"> Level.</asp:Label><BR>
							<BR>
							&nbsp;&nbsp;
							<asp:CheckBox id="SameLotCB" runat="server" Text="With same lot"></asp:CheckBox><BR>
						</P>
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">&nbsp;<asp:button id="PopulateBtn" runat="server" Text="Populate" CssClass="formbtn" onclick="PopulateBtn_Click"></asp:button>&nbsp;
						<asp:button id="CloseBtn" runat="server" Text="Close" CssClass="formbtn"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>
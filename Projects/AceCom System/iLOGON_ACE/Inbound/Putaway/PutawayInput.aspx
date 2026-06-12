<%@ Page language="c#" Codebehind="PutawayInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Putaway.PutawayInput" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PutawayInput</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<base target="_self">
	</head>
	<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td class="pagetitle">
						&nbsp;&nbsp;&nbsp;Edit Putaway
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td>SKU:<br>
									<asp:Label id="SkuCodeLbl" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td>Description:<br>
									<asp:Label id="DescrLbl" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td>To Location :
									<asp:RequiredFieldValidator id="LocCodeReq" runat="server" ErrorMessage="*" ControlToValidate="LocCodeTxt"></asp:RequiredFieldValidator><BR>
									<asp:TextBox id="LocCodeTxt" runat="server"></asp:TextBox>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">&nbsp;<asp:button id="SaveBtn" runat="server" Text="Save" CssClass="detailbutton" onclick="SaveBtn_Click"></asp:button>&nbsp;
						<asp:button id="CloseBtn" runat="server" Text="Close" CssClass="detailbutton"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>

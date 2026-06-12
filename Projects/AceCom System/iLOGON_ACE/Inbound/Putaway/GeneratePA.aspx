<%@ Page language="c#" Codebehind="GeneratePA.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Putaway.GeneratePA" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>GeneratePA</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
		<script src="../../js/CastleBusyBox.js" language="javascript"></script>	
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="2" cellPadding="2" width="100%" border="0">
				<tr>
					<td class="pagetitle" style="HEIGHT: 25px"><asp:Label id="GenerateLbl" runat="server" CssClass="pagetitle">Generate Putaway For Receipt </asp:Label>
						<asp:label id="RcIdLbl" runat="server" CssClass="pagetitle"></asp:label>
						<asp:TextBox id="RcIdTxt" runat="server" Visible="False"></asp:TextBox></td>
				</tr>
				<tr>
					<td><asp:Label id="InfoLbl" runat="server">Please note that only pending putaway will be generate into Putaway List</asp:Label></td>
				</tr>
				<tr>
					<td>
						<asp:Label id="RemarkLbl" runat="server">Remark</asp:Label>
						:
						<asp:textbox id="RemarkTxt" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td><asp:button id="GenerateBtn" runat="server" Text="Generate" CssClass="detailbutton" onclick="GenerateBtn_Click" OnClientClick="busyBox.Show();"></asp:button>&nbsp;<INPUT type="button" value="Cancel" runat="server" class="detailbutton" onclick="history.back();">&nbsp;
						<asp:Label id="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label></td>
				</tr>
			</table>
			<iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
			<script>
			    // Instantiate our BusyBox object
			    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
			</script>
		</form>
	    <p>
&nbsp;
        </p>
	</body>
</html>

<%@ Page language="c#" Codebehind="UpdateLicense.aspx.cs" AutoEventWireup="false" Inherits="LicenseUpdate.UpdateLicense" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>UpdatePassword</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="./css/keyfields.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<img src="./img/kf1.jpg">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#cccccc" border="0">
				<tr>
					<td bgColor="#ffffff"></td>
					<td>
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr bgColor="#ffffff">
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">
									&nbsp;License Renewal</td>
							</tr>
							<tr vAlign="top" bgColor="#ffffff">
								<td colspan="2">
									Please enter the License Code.<BR>
									<BR>
									<asp:TextBox id="SerialTxt" runat="server" Width="400px"></asp:TextBox>
									<asp:RequiredFieldValidator id="SerialReq" runat="server" ErrorMessage="*" ControlToValidate="SerialTxt"></asp:RequiredFieldValidator>&nbsp;
									<asp:Button id="RenewBtn" runat="server" Text="Renew License"></asp:Button><BR>
									<asp:Label id="MessageLbl" runat="server" ForeColor="Red"></asp:Label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

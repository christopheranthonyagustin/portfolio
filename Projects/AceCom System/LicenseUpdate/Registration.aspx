<%@ Page language="c#" Codebehind="Registration.aspx.cs" AutoEventWireup="false" Inherits="LicenseUpdate.Registration" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Registration</title>
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
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">&nbsp;Registration Form</td>
							</tr>
							<tr bgColor="#ffffff">
								<td width="20%">Registration Key</td>
								<td>:&nbsp;<asp:Label id="RegKeyLbl" runat="server"></asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td width="20%">Product</td>
								<td>:&nbsp;.net version 3</td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Company Name</td>
								<td>:&nbsp;<asp:TextBox id="CompNameTxt" runat="server" Width="300px"></asp:TextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Contact Person</td>
								<td>:&nbsp;<asp:TextBox id="ContactTxt" runat="server"></asp:TextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Number of Users</td>
								<td>:&nbsp;<asp:TextBox id="NoOfUserTxt" runat="server"></asp:TextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td></td>
								<td>
									<asp:Button id="RegBtn" runat="server" Text="Register"></asp:Button>&nbsp;<INPUT type="reset" value="Reset"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

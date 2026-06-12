<%@ Page language="c#" Codebehind="RegConfirm.aspx.cs" AutoEventWireup="false" Inherits="LicenseUpdate.RegConfirm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>RegConfirm</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">&nbsp;Registration Detail</td>
							</tr>
							<tr bgColor="#ffffff">
								<td width="20%">Registration Key</td>
								<td>:&nbsp;<asp:Label id="RegKeyLbl" runat="server"></asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Product</td>
								<td>:&nbsp;.net version 3</td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Company Name</td>
								<td>:&nbsp;<asp:Label id="CompNameLbl" runat="server"></asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Contact Person</td>
								<td>:&nbsp;<asp:Label id="ContactLbl" runat="server"></asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>Number of Users</td>
								<td>:&nbsp;<asp:Label id="NoOfUserLbl" runat="server"></asp:Label></td>
							</tr>
							<tr bgColor="#ffffff">
								<td colspan="2"></td>
							</tr>
							<tr bgColor="#ffffff">
								<td colspan="2">
									<P>Thank you for choosing KEYfields product. To complete the registration, kindly 
										send this page to KEYfields Pte Ltd by :<BR>
										<BR>
										a) Email :&nbsp;<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="mailto:registration@keyfields.com">registration@keyfields.com</A>
										or<BR>
										<BR>
										b) Mail :
										<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KEYfields Pte Ltd<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Enterprise #09-55<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No.1 Science Centre Road<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Singapore 609077<BR>
										<BR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attn : Registration Dept.<BR>
										<BR>
										** You will receive the license code by the next working day.</P>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>

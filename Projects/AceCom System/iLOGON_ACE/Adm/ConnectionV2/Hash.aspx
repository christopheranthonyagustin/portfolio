<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hash.aspx.cs" Inherits="iWMS.Web.Adm.ConnectionV2.Hash" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>Hash</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<tr>
					<td>
						<table cellSpacing="1" cellPadding="2" width="100%" border="0">
							<tr>
								<td>
									<iwms:iForm id="formCtl" runat="server"></iwms:iForm>
								</td>
							</tr>
							<tr>
								<td>
									<asp:button id="UpdateBtn" runat="server" Text="Update" CssClass="detailbutton" onclick="UpdateBtn_Click" Visible="false"></asp:button>&nbsp;<br />
                                    <asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ Page language="c#" Codebehind="AccountParmBG.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.AccountRate.AccountParmBG" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>AccountParmBG</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table id="table1" border="0" width="100%" runat="server">
				<tr>
					<td>&nbsp;
					</td>
					<td align="right"><asp:button style="Z-INDEX: 0" id="AddBtn" runat="server" CssClass="detailButton" Text=" Add "
							Visible="False" onclick="AddBtn_Click"></asp:button><asp:button style="Z-INDEX: 0" id="UpdateBtn" runat="server" CssClass="detailButton" Text="Update"
							Visible="False" onclick="UpdateBtn_Click"></asp:button>&nbsp;</td>
				</tr>
				<tr>
					<td colSpan="2"><iwms:iform id="formCtl" runat="server"></iwms:iform></td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="SkuSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.SkuSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>SkuSearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
						<br />&nbsp;<asp:button id="SearchBtn" runat="server" Text="Search" CssClass="detailbutton" onclick="SearchBtn_Click"></asp:button><br /><br>
			<iwms:iForm id="formCtl" runat="server"></iwms:iForm>&nbsp;
			&nbsp;
			<asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
		</form>
	</body>
</html>

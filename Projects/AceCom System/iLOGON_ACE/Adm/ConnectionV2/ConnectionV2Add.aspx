<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionV2Add.aspx.cs" Inherits="iWMS.Web.Adm.ConnectionV2.ConnectionV2Add" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>Connection</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
		    <br />&nbsp;<%--<asp:button id="AddBtn" runat="server" Text="   Add   " CssClass="formbtn" onclick="AddBtn_Click"></asp:button>--%>
		    <telerik:RadButton id="AddBtn" runat="server" Text="   Add   " CssClass="formbtn" onclick="AddBtn_Click"></telerik:RadButton>
		    <br /><br>
			<iwms:iForm id="formCtl" runat="server"></iwms:iForm>&nbsp;
			<telerik:RadButton id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn" onclick="UpdateBtn_Click"></telerik:RadButton>
			<%--<asp:button id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn" onclick="UpdateBtn_Click"></asp:button>--%>&nbsp;
            </form>
	</body>
</html>

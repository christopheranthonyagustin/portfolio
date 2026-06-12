<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page language="c#" Codebehind="InvCountAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>AdjustmentAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
            <script src="../../js/Script.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<br />&nbsp;<telerik:RadButton id="AddBtn" runat="server" Text="  Add  " CssClass="formbtn" onclick="AddBtn_Click"></telerik:RadButton><br />
			<span class="pagetitle">&nbsp;</span>
			<iwms:iForm id="formCtl" runat="server"></iwms:iForm>&nbsp;
			
		<%--	<telerik:RadButton id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="formbtn" onclick="UpdateBtn_Click"></telerik:RadButton>&nbsp;
			<telerik:RadButton id="AddDetailBtn" runat="server" Text="Add Detail" Visible="False" CssClass="formbtn" onclick="AddDetailBtn_Click"></telerik:RadButton>--%>
		<asp:Button ID="UpdateBtn" class="white" runat="server" Visible="False" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
			
            &nbsp;
            <asp:Button ID="AddDetailBtn" class="white" runat="server" Visible="False" OnClick="AddDetailBtn_Click" Text="Add Detail" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        </form>
	</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Menu.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Menu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
	<head id="Head1" runat="server">
		<title>InvCountV3Menu</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script src="../../js/Script.js" type="text/javascript"></script>
         <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="11" style="BORDER-BOTTOM: #D5D5D5 1px solid;" onload="javascript:window.focus();">
		<form id="Form1" method="post" runat="server">
             <asp:ScriptManager ID="ScriptManager1" runat="server" />
			<table width="100%">
				<tr>
					<td>
                        <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                        <iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></td>
					<td class="NewModuleTitle" align="right">
						<asp:Label id="InvCountLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
            </form>
	</body>
</html>

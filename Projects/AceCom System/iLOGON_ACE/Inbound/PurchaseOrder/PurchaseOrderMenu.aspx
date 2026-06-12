<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Page language="c#" Codebehind="PurchaseOrderMenu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.PurchaseOrder.PurchaseOrderMenu" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PurchaseOrder</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
        <script src="../../js/Script.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="8" style="BORDER-BOTTOM: #d5d5d5 1px solid">
		<form id="Form1" method="post" runat="server">
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
		<table width="100%">
				<tr>
					<td><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></td>
					<td class="ModuleTitle" align="right">
                        <div class="NewModuleTitle">
                             <asp:Label ID="ListDetlLbl" labelclass="NewModuleTitle" runat="server"></asp:Label></div>
				    </td>
				</tr>
			</table>
			<p>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </p>
		</form>
	</body>
</html>

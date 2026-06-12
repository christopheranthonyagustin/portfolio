<%@ Page language="c#" Codebehind="Menu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.ListDetl.Menu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ListDetailMenu</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	    <style type="text/css">
            .style1
            {
                height: 28px;
            }
            .style2
            {
                font-family: Verdana,Arial,sans-serif;
                color: #330099;
                text-align: right;
                height: 28px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="5" style="BORDER-BOTTOM: #D5D5D5 1px solid;">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr>
					<td><iwms:tabs id="MenuTabs" runat="server"></iwms:tabs></td>
					<td class="ModuleTitle" align="right">
                        <div class="NewModuleTitle">
                             <asp:Label ID="ListDetlLbl" labelclass="NewModuleTitle" runat="server">ListDetail</asp:Label></div>
				    </td>
				</tr>
			</table>
			<p>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </p>
		</form>
	</body>
</html>

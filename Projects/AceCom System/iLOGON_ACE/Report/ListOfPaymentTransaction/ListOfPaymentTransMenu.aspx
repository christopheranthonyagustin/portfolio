<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfPaymentTransMenu.aspx.cs" Inherits="iWMS.Web.Report.ListOfPaymentTransaction.ListOfPaymentTransMenu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>ListOfPaymentTransaction</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	    <style type="text/css">
            .style1
            {
                width: 160px;
            }
        </style>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="15" style="BORDER-BOTTOM: #D5D5D5 1px solid;">
		<form id="Form1" method="post" runat="server">
		
			<table width="100%">
				<tr>					
                    <td>
                        <iWMS:tabs id="MenuTabs" runat="server"></iWMS:tabs>
                    </td>
					<td class="NewModuleTitle" align="right">
					<asp:Label runat="server">List of Payment Transaction</asp:Label>						
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="QuotationDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation.QuotationDetl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>QuotationDetl</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<SCRIPT type="text/javascript" src="../../js/row.js"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" border="0" cellSpacing="0" cellPadding="0" width="100%" runat="server">
				<tr>
					<td class="pagetitle"><asp:label id="IdLbl" runat="server"></asp:label></td>
					<td align="right">
					     &nbsp;
						<asp:button style="Z-INDEX: 0" id="SaveNextBtn" runat="server" CssClass="detailButton" Text="Save &amp; Next"
							Visible="False" onclick="SaveNextBtn_Click"></asp:button>&nbsp;
						<asp:button style="Z-INDEX: 0" id="SaveBtn" runat="server" CssClass="detailButton" Text="Save"
							Visible="False" onclick="SaveBtn_Click"></asp:button><asp:button style="Z-INDEX: 0" id="UpdateBtn" runat="server" CssClass="detailButton" Text="Update"
							Visible="False" onclick="UpdateBtn_Click"></asp:button>&nbsp;
						<asp:button style="Z-INDEX: 0" id="BackButton" runat="server" CssClass="detailButton" Text="All Detail(s)"
							Visible="True" CausesValidation="False" onclick="BackButton_Click"></asp:button>&nbsp;</td>
				</tr>
				<TR>
					<td colSpan="2"><iwms:iform id="formCtl" runat="server"></iwms:iform></td>
				</TR>
			</table>
			<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	    </form>
	</body>
</html>

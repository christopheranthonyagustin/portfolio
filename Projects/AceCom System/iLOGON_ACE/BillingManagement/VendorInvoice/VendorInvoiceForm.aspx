<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorInvoiceForm.aspx.cs" Inherits="iWMS.Web.BillingManagement.VendorInvoice.VendorInvoiceForm" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorInvoiceForm</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<SCRIPT type="text/javascript" src="../../js/row.js"></SCRIPT>
	</head>
	<body onload='displayRow("table1");' bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table id="table1" border="0" cellSpacing="3" cellPadding="3" width="100%" runat="server">
				<tr>
					<td>
					  <input id="tab1" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");' value="Header" runat="server" readonly="readonly"> 	
						<input id="tab2" style="WIDTH: 80px; CURSOR: pointer" class="TabTitle" onclick='clickRow(2, "table1");' value="Detail" runat="server" readonly="readonly">
          </td>
					<td width="20%" align="right">
					  <asp:label style="Z-INDEX: 0" id="MessageLbl" Runat="server" CssClass="errorLabelBig"></asp:label>
						&nbsp;&nbsp;
						<asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="false" Text="Search Results"
							Width="120px" CausesValidation="False" OnClick="BackButton_Click"></asp:button>&nbsp;
					</td>
				</tr>
				<tr>
					<td style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2">
            <asp:button style="Z-INDEX: 0" id="UpdateFormBtn" runat="server" CssClass="detailButton" Visible="False" Text="Update" onclick="UpdateBtn_Click" />
            &nbsp;<asp:label id="IdLbl" runat="server" CssClass="pagetitle"></asp:label>
            <br />
            <br>
						<iwms:iform id="formCtl" runat="server"></iwms:iform>
				  </td>
				</tr>
				<tr style="DISPLAY: none">					
					<td style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="DetailFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</td>					
				</tr>
				<tr style="DISPLAY: none">
					<td style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2">
						<P><asp:label id="Id4Lbl" runat="server" CssClass="pagetitle"></asp:label>&nbsp;<BR>
							<iwms:iform id="formCtl4" runat="server"></iwms:iform></P>
						<P>
							<asp:button style="Z-INDEX: 0" id="RefreshButton" runat="server" CssClass="detailButton" Text="Refresh"
								Visible="True" CausesValidation="False" Width="120px" onclick="RefreshButton_Click"></asp:button></P>
					</td>
				</tr>
			</table>
			<asp:validationsummary id="valSummary" runat="server" CssClass="RedText" EnableClientScript="true" DisplayMode="BulletList"
				HeaderText="The following field(s) need to be entered correctly:"></asp:validationsummary>
	  </form>
	  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

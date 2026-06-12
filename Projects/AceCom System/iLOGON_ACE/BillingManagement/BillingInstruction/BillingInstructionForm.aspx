<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page language="c#" Codebehind="BillingInstructionForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionForm" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>BillingInstructionForm</title>
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
					<td><input id="tab1" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(1, "table1");' value="Header" runat="server" readonly="readonly"> 	
							<input id="tab2" style="WIDTH: 80px; CURSOR: pointer" class="TabTitle" onclick='clickRow(2, "table1");' value="Equipment" runat="server" readonly="readonly"> 
							<input id="tab3" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(3, "table1");' value="House" runat="server" readonly="readonly"> 
          		<input id="tab4" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(4, "table1");'	value="Do/Inv" runat="server" readonly="readonly"> 
          		<input id="tab5" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(5, "table1");' value="Service" runat="server" readonly="readonly"> 
          		<input id="tab6" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(6, "table1");' value="Charge" runat="server" readonly="readonly"> 
          	
							<%--	<input id="tab7" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(7, "table1");' value="Jobs" runat="server" readonly="true"> 
							<input id="tab6" style="WIDTH: 80px; CURSOR: pointer" class="TabTitle" onclick='clickRow(6, "table1");'
							value="Manpower" runat="server"> <input id="tab7" style="WIDTH: 80px; CURSOR: pointer" class="TabTitle" onclick='clickRow(7, "table1");'
							value="Personnel" runat="server"> <input id="tab8" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(8, "table1");'
							value="Attc" runat="server"> <input id="tab9" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(9, "table1");'
							value="Task" runat="server"> <input id="tab10" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(10, "table1");'
							value="Charge" runat="server"> <input id="tab11" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(11, "table1");'
							value="Cost" runat="server"> <input id="tab12" style="WIDTH: 70px; CURSOR: pointer" class="TabTitle" onclick='clickRow(12, "table1");'
							value="Resource" runat="server">--%>

					</td>
					<TD width="20%" align="right"><asp:label style="Z-INDEX: 0" id="MessageLbl" Runat="server" CssClass="errorLabelBig"></asp:label>&nbsp;
						&nbsp;
						<asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="false" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button>&nbsp;
					</TD>
				</tr>
				<TR>
					<TD style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2">
                        <asp:button style="Z-INDEX: 0" id="UpdateFormBtn" runat="server" 
                            CssClass="detailButton" Visible="False"
							Text="Update" onclick="UpdateBtn_Click"></asp:button>&nbsp;<asp:label id="IdLbl" runat="server" CssClass="pagetitle"></asp:label><br />
                        <BR>
						<iwms:iform id="formCtl" runat="server"></iwms:iform></TD>
				</TR>
				<TR style="DISPLAY: none">					
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="BICtnrFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="BIHseFrame" marginHeight="100%" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="DoInvFrame" marginHeight="100%" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="BISvcFrame" marginHeight="100%" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="SvcDetlFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="jobCtnrTripFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="jobPerHeadFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="jobPerDetlFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="jobImageFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="jobTaskFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="chargeFrame2" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="costFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" height="480" colSpan="2"><IFRAME style="WIDTH: 100%; HEIGHT: 100%" id="resourceFrame" marginHeight="0" frameBorder="no"
							marginWidth="0" runat="server"></IFRAME>
					</TD>
				</TR>
				<TR style="DISPLAY: none">
					<TD style="BORDER-TOP: #c0c0c0 1px solid" colSpan="2">
						<P><asp:label id="Id4Lbl" runat="server" CssClass="pagetitle"></asp:label>&nbsp;<BR>
							<iwms:iform id="formCtl4" runat="server"></iwms:iform></P>
						<P>
							<asp:button style="Z-INDEX: 0" id="RefreshButton" runat="server" CssClass="detailButton" Text="Refresh"
								Visible="True" CausesValidation="False" Width="120px" onclick="RefreshButton_Click"></asp:button></P>
					</TD>
				</TR>
			</table>
			<asp:validationsummary id="valSummary" runat="server" CssClass="RedText" EnableClientScript="true" DisplayMode="BulletList"
				HeaderText="The following field(s) need to be entered correctly:"></asp:validationsummary></form><asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
	</body>
</html>

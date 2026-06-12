<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3BySkuLocLot4CandSearch.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3BySkuLocLot4CandSearch" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>InvCountV3BySkuLocLot4CandSearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/row.js"></script>
        <script src="../../js/Script.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table cellSpacing="0" cellPadding="0" border="0" width="60%">
				<tr>
					<td>
						<div class="pagetitle">Step 1 of 2</div>
					</td>
					<td align="right">
						<asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        &nbsp;
                        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Visible="false" Text="Search" 
                             OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
					</td>
				</tr>
				<tr>
                     <asp:Button ID="SaveCandidates" class="white" runat="server" OnClick="SaveCandidates_Click" Text="Save" 
                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                     <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" 
                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
				</tr>
			</table>
			<br>
			<iwms:iForm id="formCtl" runat="server"></iwms:iForm>&nbsp;
		</form>
	</body>
</html>

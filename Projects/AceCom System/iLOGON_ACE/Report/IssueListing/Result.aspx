<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.IssueListing.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
	<head runat="server">
		<title>IssueListingReport</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />
		<link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table width="100%">
			    <tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
					<td width="70%" align="right"><a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></a></td>
				</tr>
				<tr class="graytitle">
				<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Issue Listing</asp:label>
                        <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                        <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                    </td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="AccLbl" Runat="server">Account</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="AccountLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="SiteLbl" Runat="server">Site</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="SiteDescrLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="InfoLbl" Runat="server">Info</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="InfoDescrLbl" runat="server"></asp:Label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
			<div id="div-datagrid" style="HEIGHT:90%">
			<telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AutoGenerateColumns="true"
            OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" >
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <ExportSettings UseItemStyles="True">
        </ExportSettings>
    </telerik:RadGrid>
    </div>
		</form>
	</body>
</html>

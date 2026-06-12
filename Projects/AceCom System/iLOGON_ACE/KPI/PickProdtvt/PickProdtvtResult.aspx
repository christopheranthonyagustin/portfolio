<%@ Page language="c#" Codebehind="PickProdtvtResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.KPI.PickProdtvt.PickProdtvtResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Picking Productivity Result</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table width="100%">
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td>Picking Productivity <asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label></td>
					<td width="60%" align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2">
						<asp:Label id="NowLbl" runat="server"></asp:Label></td>
				</tr>
			</table>
			<%--<div id="div-datagrid" style="HEIGHT:90%"><asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid></div>--%>
				 <div id="div1" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                        OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true" BorderStyle="Solid" >
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <ExportSettings UseItemStyles="True">
                        </ExportSettings>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:RadGrid></div>
		</form>
	</body>
</html>

<%@ Page language="c#" Codebehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.PumpSummary.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>PumpSummary</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<%--<table width="100%">
		    <tr class="graytitle">
					<td width="80%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
						    <img id="excelImg" border="0" alt="Export to Excel" align="right" src="../../Image/excel.gif" height="20" runat="server">
						</a>
					</td>
				</tr>
				
			</table>--%>				
			<table width="100%" id="report" runat="server">					
				<tr class="graytitle">
				<td colspan="4"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
				<%--<td width = "10%"><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
					<td>:</td>--%>
					<td colspan="2"><asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Pump Summary</asp:label>
                        <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                        <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                    </td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date :</asp:label>
					    <asp:Label id="NowLbl" runat="server"></asp:Label>
					</td>
				</tr>
				<%--<td>:</td>--%>					
				<%--<tr>
				<td colspan="4">
				<div id="div-datagrid" style="HEIGHT:90%"><asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
				</asp:datagrid></div>
				</td>
				</tr>--%>--%>
			</table><br />			
			<asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/Excel.png"       
                ImageAlign="AbsMiddle" ToolTip="Export To Excel" OnClick="ExportExcel" />
               
            <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
                EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" Width="80%">
                
                <ClientSettings>
                  <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                  <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                  <Columns>
                  </Columns>
                </MasterTableView>
             </telerik:RadGrid>  
		</form>
	</body>
</html>

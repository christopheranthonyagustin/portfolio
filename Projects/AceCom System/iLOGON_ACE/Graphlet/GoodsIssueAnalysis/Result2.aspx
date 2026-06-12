<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>WhseGIAnalysis</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
	</head>
	<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
		
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
		    <tr class="graytitle">
					<td width="80%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
						    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif" height="20" runat="server">
						</a>
					</td>
				</tr>
				
	</table>
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Goods Issue Analysis " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="accLbl" runat="server" class="graytitle" Text="Account :" />
                <asp:Label ID="accountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="IsTLbl" runat="server" class="graytitle" Text="IssueType :" />
                <asp:Label ID="IsTypeLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="skuGrp" runat="server" class="graytitle" Text="SKU Group :" />
                <asp:Label ID="skuGrplbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="frmat" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>  
		</table>
				
		<h2><asp:Label ID="Label1" runat="server">Issue Summary report by Issue Type, SKUgroup monthly (Qty)</asp:Label></h2>
         <telerik:RadGrid ID="ResultDG1" runat="server" GridLines="None" AutoGenerateColumns="true"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDG1_ItemDataBound"
         OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true">
        <%--OnItemDataBound="ResultDG_ItemDataBound"--%>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
            
        </MasterTableView>
    </telerik:RadGrid>
    
     <h2><asp:Label ID="Label4" runat="server">Issue Summary report by Issue Type, SKUgroup monthly (WT)</asp:Label></h2>
    <telerik:RadGrid ID="ResultDG2" runat="server" GridLines="None" AutoGenerateColumns="true"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDG2_ItemDataBound">
        <%--OnItemDataBound="ResultDG_ItemDataBound"--%>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">

        </MasterTableView>
    </telerik:RadGrid>
    
		</form>
	</body>
</html>

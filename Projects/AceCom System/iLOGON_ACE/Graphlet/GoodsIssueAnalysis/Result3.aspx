<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>WhseGIAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
	<meta name="CODE_LANGUAGE" content="C#">
	<meta name="vs_defaultClientScript" content="JavaScript">
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
	<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" runat="server">
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
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="DateLbl" runat="server" class="graytitle" Text="Goods Issue Analysis " />
                <asp:Label ID="DateRangeLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="accLbl" runat="server" class="graytitle" Text="Account" />
            </td>
            <td>
            :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="accountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format" />
            </td>
            <td>
            :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="IsTLbl" runat="server" class="graytitle" Text="IssueType" />
            </td>
            <td>
            :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="IsTypeLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
       <%-- <tr>
            <td colspan="2">
                <asp:Label ID="skuGrp" runat="server" class="graytitle" Text="SKU Group :" />
                <asp:Label ID="skuGrplbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>--%>
        <tr>
            <td colspan="2">
                <asp:Label ID="frmat" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>  
		</table>
		
		<h2><asp:Label ID="Label1" runat="server">Issue Summary report by Issue Type, Destination (YTD)</asp:Label></h2>
         <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" 
         OnGridExporting="RadGrid_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
         ExportSettings-UseItemStyles="true" GroupPanelPosition="Top">
         <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
         <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
         <Selecting AllowRowSelect="true" />
         </ClientSettings>
         <SortingSettings EnableSkinSortStyles="false" />
         <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
         <ItemStyle Wrap="false"></ItemStyle>
         <HeaderStyle Wrap="false"></HeaderStyle>
         <ExportSettings UseItemStyles="True">
         </ExportSettings>
    </telerik:RadGrid>
    
    </form>
</body>
</html>

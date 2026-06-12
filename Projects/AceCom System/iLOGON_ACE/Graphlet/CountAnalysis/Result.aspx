<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.CountAnalysis.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CycleCount</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
<body>
   <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Format : </asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
    </table>
    
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" AutoGenerateColumns="true"
         GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" ExportSettings-UseItemStyles="true" 
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" 
        ItemStyle-Wrap="False" ongridexporting="ResultDG_GridExporting">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
		<AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
		<ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
		<MasterTableView AllowMultiColumnSorting="true">
		    <Columns>
		   
			</Columns>
	    </MasterTableView>
		</telerik:RadGrid>
    </form>
</body>
</html>

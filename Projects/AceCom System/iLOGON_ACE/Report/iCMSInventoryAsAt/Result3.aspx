<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Result3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>iCMSInventoryAsAt</title>
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
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Depot SizeType Summary</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="deLbl" runat="server">Depot</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="DepotLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="stLbl" runat="server">Size Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="sizetypeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
     </table>
    
     <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnGridExporting="ResultDG_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true"
        GroupPanelPosition="Top" AutoGenerateColumns="false">
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
        <MasterTableView AllowMultiColumnSorting="true">
		    <Columns>
            <telerik:GridBoundColumn DataField="depot" SortExpression="depot" HeaderText="Depot" />
            <telerik:GridBoundColumn DataField="sizetype" SortExpression="sizetype" HeaderText="Size Type" />
            <telerik:GridBoundColumn DataField="noofctnr" SortExpression="noofctnr" HeaderText="No of Containers" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <telerik:GridBoundColumn DataField="OutstandingSO" SortExpression="OutstandingSO" HeaderText="Oustanding SO"
                 HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <telerik:GridBoundColumn DataField="OutstandingRO" SortExpression="OutstandingRO" HeaderText="Outstanding RO" 
                 HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />            
			</Columns>
	    </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

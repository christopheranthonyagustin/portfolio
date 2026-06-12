<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Report.PSAFEDIAnalysis.Result2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>PSAFEDIAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">PSA FEDI Analysis - MTD Rebates - Peak VS Off-Peak from </asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>--%>
                 <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExportExcel"  
                     Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export to Excel" />
            </td>
        </tr>
    </table>    
     <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AutoGenerateColumns="false"
        OnGridExporting="ResultDG_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender"
        OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true"
        GroupPanelPosition="Top">
       <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
		<AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
		<ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <ExportSettings UseItemStyles="True">
        </ExportSettings>
        <MasterTableView AllowMultiColumnSorting="true">
        <ColumnGroups>
            <telerik:GridColumnGroup HeaderStyle-HorizontalAlign="Center" HeaderText="20FT" Name="20FT"/>
            <telerik:GridColumnGroup HeaderStyle-HorizontalAlign="Center" HeaderText="40FT" Name="40FT"/>            
        </ColumnGroups>
		<Columns>
		    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center" 
		        UniqueName="Total" DataField="Total" HeaderText=""/>    
		    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="260px" HeaderStyle-HorizontalAlign="Center" 
		        UniqueName="20FT-RB-Amt-Peak" DataField="20FT-RB-Amt-Peak" ColumnGroupName="20FT" HeaderText="Peak"/>
		    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="260px" HeaderStyle-HorizontalAlign="Center" 
		        UniqueName="20FT-RB-Amt-OffPeak" DataField="20FT-RB-Amt-OffPeak" ColumnGroupName="20FT" HeaderText="Off-Peak"/>
		    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="260px" HeaderStyle-HorizontalAlign="Center" 
		        UniqueName="40FT-RB-Amt-Peak" DataField="40FT-RB-Amt-Peak" ColumnGroupName="40FT" HeaderText="Peak"/>
		    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="260px" HeaderStyle-HorizontalAlign="Center" 
		        UniqueName="40FT-RB-Amt-OffPeak" DataField="40FT-RB-Amt-OffPeak" ColumnGroupName="40FT" HeaderText="Off-Peak"/>
             <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" Width="1000"></ItemStyle>
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate></ItemTemplate>
                </telerik:GridTemplateColumn>
		</Columns>	
	    </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result5.aspx.cs" Inherits="iWMS.Web.Report.ContainerAnalysis.Result5" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>ContainerAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                <td colspan="4">
                    <asp:Label ID="TitleLbl" runat="server">Container Analysis - </asp:Label>
                    <asp:Label ID="FormatDescLbl" runat="server"></asp:Label> 
                    <asp:Label ID="lblfrdate" runat="server"></asp:Label>
                    <asp:Label ID="lbltodate" runat="server"></asp:Label>                  
                </td>
            </tr> 
            <tr>
                <td class="style4">
                    <asp:Label ID="acLbl" runat="server">Account : </asp:Label>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>                
            </tr>  
            <tr>
                <td>
                     <asp:Button ID="ExcelBtn" CssClass="green" runat="server" OnClick="ExportExcel" 
                        Text="Excel" />
                </td>
            </tr>          
        </table>      
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true" GridLines="Both">
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
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

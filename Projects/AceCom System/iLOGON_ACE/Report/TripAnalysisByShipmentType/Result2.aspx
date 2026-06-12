<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Report.TripAnalysisByShipmentType.Result2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RevenueAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" class="graytitle" Text="Trip Analysis By ShipMent Type" />               
            </td>
        </tr>  
        <tr>
            <td colspan="2">
                <asp:Label ID="AccountLabel" runat="server" class="graytitle" Text="Account :" />
                <asp:Label ID="AccountLbl" class="graytitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="ShipmentLabel" runat="server" class="graytitle" Text="ShipmentType :" />
                <asp:Label ID="ShipmentLbl" class="graytitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="AsAtLabel" runat="server" class="graytitle" Text="AsAt :" />
                <asp:Label ID="AsAtLbl" class="graytitle" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>       
    </table>
    
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        OnClick="ButtonExcel_Click" />   
    
     <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
             OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" Width="80%">
           
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

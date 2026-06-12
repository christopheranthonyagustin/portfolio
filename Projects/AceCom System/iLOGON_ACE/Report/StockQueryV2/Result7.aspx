<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result7.aspx.cs" Inherits="iWMS.Web.Report.StockQueryV2.Result7" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stock Query V2</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
    <body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td class="style2" colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>    
            <td>
                <asp:Label ID="TitleLabel" runat="server" CssClass="Graytitle" Text="Stock Query V2-"></asp:Label>
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
           <tr>
                <td>
                <asp:Label ID="AccountLabel" runat="server" class="graytitle" Text="Account :" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="AccountLbl" class="graytitle" runat="server"></asp:Label>
            </td>
       </tr>
            <tr>
           <td>
                <asp:Label ID="RankByLable" runat="server" class="graytitle" Text="RankBy:" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="RankByLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
             <tr>
                <td colspan="2">
                 <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click"
                                            UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />

       <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>

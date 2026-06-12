<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FreightAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <%--- 
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
    </style>
        ----%>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <%--- <tr class="graytitle">--%>
<tr>
                <td>
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
        <tr>    
            <td>
                <asp:Label ID="TitleLabel" runat="server" CssClass="Graytitle" Text="Freight Analysis -"></asp:Label>
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
           <tr>
                <td>
                <asp:Label ID="AccountLabel" runat="server" class="graytitle" Text="Account :" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="AccountLbl" class="graytitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
           <td>
                <asp:Label ID="polLabel" runat="server" class="graytitle" Text="POL:" />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="polLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="podLabel" runat="server" class="graytitle" Text="POD:" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="podLbl" runat="server" class="graytitle"></asp:Label>
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

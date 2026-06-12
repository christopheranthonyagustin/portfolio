<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsReceiveAnalysis.Result3" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GoodsReceiveAnalysis</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="GrayTitle">
                <td>
                    <asp:Label ID="lblComapanyName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>Good Receive Analysis&nbsp;-&nbsp;&nbsp;
                    <asp:Label ID="lblFormat" runat="server"></asp:Label></td>
            </tr>  
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Account :" />
                    <asp:Label ID="AccountLbl" runat="server" class="graytitle" />
                </td>
           </tr>          
        </table>
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" GridLines="Both" OnItemDataBound="ResultDG_ItemDataBound"
                OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

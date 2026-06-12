<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result19.aspx.cs" Inherits="iWMS.Web.Graphlet.RMSAnalysis.Result19" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RMS Analysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
     <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="GrayTitle">
                <td >
                    <asp:Label ID="lblComapanyName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>RMS Analysis&nbsp;-&nbsp;&nbsp;
                    <asp:Label ID="lblFormat" runat="server"></asp:Label>
                    &nbsp;From&nbsp;
                    <asp:Label ID="lblfrdate" runat="server"></asp:Label>
                    &nbsp;To&nbsp;
                    <asp:Label ID="lbltodate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GrayTitle">
                <td>Account :
                    <asp:Label ID="lblAccount" runat="server"></asp:Label>
                </td>
            </tr>
             <tr class="GrayTitle">
                <td>SalesMan :
                    <asp:Label ID="LblSalesMan" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="div-datagrid" style="height: 92%">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result23.aspx.cs" Inherits="iWMS.Web.Graphlet.UserAnalysis.Result23" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE  html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UserAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblComapanyName" runat="server"></asp:Label>
                </td>
            </tr>
             <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" class="graytitle" Text="User Analysis" />
                </td>
            </tr>
            <tr class="GrayTitle">
            	<td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :" />
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="lblfrdate" class="graytitle" runat="server"></asp:Label>
                    <asp:Label ID="lbltodate" class="graytitle" runat="server"></asp:Label>
                </td>                   
            </tr>          
        </table>
        <br />
        <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" ToolTip="Export To Excel" />
        <br />
        <table>
        <tr>
                <td>
                    <div id="div-datagrid" style="height: 92%">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
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

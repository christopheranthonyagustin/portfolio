<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result23.aspx.cs" Inherits="iWMS.Web.Accounting.GLAnalysis.Result23" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GL Analysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
                    <tr class ="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="lblFormat" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="FrPeriodLbl" runat="server" class="graytitle" Text="from " />
                    <asp:Label ID="frPeriod" runat="server" class="graytitle"></asp:Label>
                    <asp:Label ID="ToPeriodLbl" runat="server" class="graytitle" Text="to " />
                    <asp:Label ID="toPeriod" runat="server" class="graytitle"></asp:Label>
                </td>
                </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Entity:" />
                    <asp:Label ID="entitylbl" runat="server" class="graytitle" />
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" class="graytitle" Text="Branch:" />
                    <asp:Label ID="Branchlbl" runat="server" class="graytitle" />
                </td>
            </tr>
        </table>
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
            UseSubmitBehavior="false" />
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label> <!--added by CT Ticket #11591 on 5 DEC 2023-->
        <br />
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="ResultDG_GridExporting" OnColumnCreated="ResultDG_ColumnCreated" ExportSettings-UseItemStyles="true">
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

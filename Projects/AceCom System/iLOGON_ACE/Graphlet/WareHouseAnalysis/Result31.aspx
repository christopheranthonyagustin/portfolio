<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result31.aspx.cs" Inherits="iWMS.Web.Graphlet.WareHouseAnalysis.Result31" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Warehouse Monthly Activities</title>
     <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style2 {
        }

        .style3 {
            width: 12px;
        }

        .style4 {
            width: 143px;
        }

        .stylewrap {
            white-space: pre-line;
        }
    </style>
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
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label1" runat="server">Report</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="Reportlbl" runat="server"></asp:Label>
                </td>             
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="Label2" runat="server">Format</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="userLbl1" runat="server">Account</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ExportExcelBtn" CssClass="LongLabelGreen" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, false)" runat="server" OnClick="ExportExcelBtn_Click" Text="Export Excel" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label5" runat="server" Text="(a)Summary of Break Down for In/Out" Font-Underline="true" Font-Bold="true" Font-Size="9"></asp:Label> <br/><br/>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" Width="70%"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
             ExportSettings-UseItemStyles="true">
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
        <br /><br/>

        <asp:Label ID="Label6" runat="server" Text="(b)Data for Manual Operation" Font-Underline="true" Font-Bold="true" Font-Size="9"></asp:Label> <br/><br/>
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="true" Width="70%"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound"
             ExportSettings-UseItemStyles="true">
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
        </telerik:RadGrid><br /><br/>

        <asp:Label ID="Label7" runat="server" Text="(c)Operating Data For Warehouse Activities" Font-Underline="true" Font-Bold="true" Font-Size="9"></asp:Label> <br/><br/>
        <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true" Width="70%"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG3_NeedDataSource" OnItemDataBound="ResultDG3_ItemDataBound"
             ExportSettings-UseItemStyles="true">
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
        </telerik:RadGrid><br /><br />

        <asp:Label ID="Label8" runat="server" Text="(d)Data For Lorry/Container Transfer" Font-Underline="true" Font-Bold="true" Font-Size="9"></asp:Label> <br/><br />
        <telerik:RadGrid ID="ResultDG4" runat="server" AutoGenerateColumns="true" Width="70%"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG4_NeedDataSource" OnItemDataBound="ResultDG4_ItemDataBound"
             ExportSettings-UseItemStyles="true">
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
        </telerik:RadGrid> <br /><br />

        <asp:Label ID="Label9" runat="server" Text="(e)Container Stuffing & Container Export" Font-Underline="true" Font-Bold="true" Font-Size="9"></asp:Label> <br/><br/>
        <telerik:RadGrid ID="ResultDG5" runat="server" AutoGenerateColumns="true" Width="70%"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG5_NeedDataSource" OnItemDataBound="ResultDG5_ItemDataBound"
             ExportSettings-UseItemStyles="true">
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


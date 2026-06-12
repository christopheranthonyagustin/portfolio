<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result19.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionInventoryQuery.Result19" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Inventory Query V2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
                <td>
                    <asp:Label ID="rptLbl" runat="server" class="graytitle" Text="Report&nbsp;&nbsp;:" />
                    <asp:Label ID="Reportlbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;:" />
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="Datelbl" runat="server" class="graytitle" Text="Generated on&nbsp;&nbsp;:" />
                    <asp:Label ID="DatetimeLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td align="left" style="width: 100%">
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" Width="100%" Height="490px"
                EnableLinqExpressions="False" AllowPaging="True" EnableHeadersVisualStyles="false" EnableEmbeddedSkins="false"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
                <ClientSettings Selecting-AllowRowSelect="true" AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

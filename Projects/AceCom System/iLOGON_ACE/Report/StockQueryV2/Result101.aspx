d<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result101.aspx.cs" Inherits="iWMS.Web.Report.StockQueryV2.Result101" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stock Query V2</title>
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
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="userLbl2" runat="server">Generated on</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="DatetimeLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td align="left" style="width: 100%">
                    <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExportExcel"
                        Text="Excel" />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" Width="100%" Height="490px"
                EnableLinqExpressions="False" AllowPaging="True" EnableHeadersVisualStyles="false" EnableEmbeddedSkins="false"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                ExportSettings-UseItemStyles="true" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting">

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

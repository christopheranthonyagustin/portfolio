<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result19.aspx.cs" Inherits="iWMS.Web.Graphlet.PaymentAnalysis.Result19" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>PaymentAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
                <td width="70%" align="right">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" src="../../Image/excel.gif"
                            height="20" runat="server" /></a>
                </td>
            </tr>            
            <tr>
                <td class="style2">
                    <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                <td class="style1">
                    <asp:Label ID="FormatDescLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="AccLabel" runat="server">Account </asp:Label>
                </td>
                <td>:
                </td>
                <td class="style1">
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td class="style2">
                    <asp:Label ID="PaymentDateLbl" runat="server">Payment Date Range </asp:Label>
                </td>
                <td>:
                </td>
                <td class="style1">
                    <asp:Label ID="PaymentDateRange" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="VendorDocDateLbl" runat="server">Vendor Doc Date Range </asp:Label>
                </td>
                <td>:
                </td>
                <td class="style1">
                    <asp:Label ID="VendorDocDateRange" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnGridExporting="ResultDG_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true" GroupPanelPosition="Top">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
        </telerik:RadGrid>
    </form>
</body>
</html>

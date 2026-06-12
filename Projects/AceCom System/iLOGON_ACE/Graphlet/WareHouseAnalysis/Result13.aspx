<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result13.aspx.cs" Inherits="iWMS.Web.Graphlet.WareHouseAnalysis.Result13" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>WareHouse Analysis</title>
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
                    <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExportExcel" 
                        Text="Excel" />   
                </td>
            </tr>
        </table>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true">

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


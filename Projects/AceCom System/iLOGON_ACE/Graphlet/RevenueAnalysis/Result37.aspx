<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result37.aspx.cs" Inherits="iWMS.Web.Graphlet.RevenueAnalysis.Result37" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RevenueAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
                    <asp:Label ID="TitleLabel" runat="server">Revenue Analysis</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="EntityLabel" runat="server">Entity</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="EntityLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="AccountLabel" runat="server">Account</asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="PanelResult" runat="server">
        </asp:Panel>

            <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
             OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
           
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
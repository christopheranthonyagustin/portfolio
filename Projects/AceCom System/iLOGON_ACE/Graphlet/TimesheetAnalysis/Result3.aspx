<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Graphlet.TimesheetAnalysis.Result3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TimesheetAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .graytitle {
            font-weight: bold;
            text-align:center;
        }
        .shiftleft {
            text-align:left;
        }
        .graytitle2 {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;

        }
        article { 
            position: relative;
            display: inline-block;
            width: auto;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LicneseNameLBL" runat="server" CssClass="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle2">
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" class="graytitle" Text="Timesheet Analysis" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :" />
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="datelabel" runat="server" class="graytitle" Text="AsAtDate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:" />
                    <asp:Label ID="datelbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
           
        </table>

        <br />
        <asp:Button ID="ButtonExcel" Class="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="False" GridLines="Both"  
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" OnPreRender="RadGrid1_PreRender">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false" ></ItemStyle>
            <HeaderStyle Wrap="false" HorizontalAlign="Center" ></HeaderStyle>
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

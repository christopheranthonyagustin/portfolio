<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result51.aspx.cs" Inherits="iWMS.Web.Report.TripAnalysis.Result51" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TripAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }
        .green{
            background-color:lawngreen;
        }       
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" class="graytitle" Text="Trip Analysis" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="AccountLabel" runat="server" class="graytitle" Text="Account :" />
                    <asp:Label ID="AccountLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="AsAtLabel" runat="server" class="graytitle" Text="AsAtDate :" />
                    <asp:Label ID="AsAtLbl" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <asp:Label ID="FrCityLbl" runat="server" class="graytitle" Text="From City :" />
                    <asp:Label ID="FrCity" class="graytitle" runat="server"></asp:Label>
                </td>
                <td colspan="1">
                    <asp:Label ID="ToCityLbl" runat="server" class="graytitle" Text="To City :" />
                    <asp:Label ID="ToCity" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                    <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
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
            OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" Width="80%" OnColumnCreated="ResultDG_ColumnCreated">
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
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

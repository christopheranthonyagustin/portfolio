<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.EmptyLocation.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>EmptyLocation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" id="report" runat="server">
            <tr class="graytitle">
                <td colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label></td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" CssClass="Graytitle">Report :</asp:Label>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Empty Location Report</asp:Label>
                </td>
            </tr>
        <tr>
                <td colspan="2">
                    <asp:Label ID="TiTleLbl2" runat="server" CssClass="Graytitle">Location :</asp:Label>                   
                    <asp:Label ID="LocCatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="DateLbl" runat="server">Print Date :</asp:Label>
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true" Text="Excel"
             ToolTip="Export To Excel" />
        <br />
        <br />
      <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
             OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" PageSize="50">
           
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



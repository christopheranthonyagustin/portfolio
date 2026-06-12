<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.LocationAnalysis.Result" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LocationAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />    
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="LicenseNameLbl" runat="server" class="graytitle"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>         
        <tr>
            <td colspan="2">
                <asp:Label ID="fmtLbl" runat="server" class="graytitle" Text="Format :" />
                <asp:Label ID="FormatLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>         
         <tr>
            <td colspan="2">
                <asp:Label ID="stLbl" runat="server" class="graytitle" Text="Site :" />
                <asp:Label ID="SiteLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="znLb1" runat="server" class="graytitle" Text="Zone :" />
                <asp:Label ID="ZoneLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lcLbl" runat="server" class="graytitle" Text="LocationCategory :" />
                <asp:Label ID="LocCodeLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>  
        <tr>
            <td colspan="2">
                <asp:Label ID="AcLbl" runat="server" class="graytitle" Text="Account :" />
                <asp:Label ID="AccountLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>   
    </table>
    <br />
    <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true" Text="Excel"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowSorting="true"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="Both" AllowFilteringByColumn="true"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated"
            OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" Width="135%" Height="80%">
            <ClientSettings>
                <Scrolling ScrollHeight="400px" UseStaticHeaders="True" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
                <Resizing AllowColumnResize="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="500">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>


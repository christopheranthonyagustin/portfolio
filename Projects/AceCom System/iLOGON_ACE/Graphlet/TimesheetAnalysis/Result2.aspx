<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Graphlet.TimesheetAnalysis.Result2" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TimesheetAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
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
         <tr class="graytitle">
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" class="graytitle" Text="Department :" />
                <asp:Label ID="DeptLbl" runat="server" class="graytitle" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" class="graytitle" Text="Personnel :" />
                <asp:Label ID="PerLbl" runat="server" class="graytitle"></asp:Label>
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
                <asp:Label ID="FrDateLbl" runat="server" class="graytitle" Text="FromDate :" />
                <asp:Label ID="fromdateLbl" runat="server" class="graytitle"></asp:Label>

                <asp:Label ID="ToDateLbl" runat="server" class="graytitle" Text="ToDate :" />
                <asp:Label ID="tdateLbl" runat="server" class="graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true" Text="Excel"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true" Width="80%">
            <ClientSettings>
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

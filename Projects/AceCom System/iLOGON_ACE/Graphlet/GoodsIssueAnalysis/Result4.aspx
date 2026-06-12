<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result4.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsIssueAnalysis.Result4" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">


<html>
<head runat="server">
    <title>Good Issue Analysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style2"  colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                       runat="server"></a>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Good Issue Anaysis</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDesrLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="DateLbl" runat="server">DateRange</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
        <ClientSettings>
        <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <MasterTableView AllowMultiColumnSorting="true">        
            <Columns>                
              <%--  <telerik:GridBoundColumn DataField="SizeType" SortExpression="SizeType" HeaderText="SizeType" />
                <telerik:GridBoundColumn DataField="TotalLeasedCtnr" SortExpression="TotalLeasedCtnr" HeaderText="Total No of Containers Leased"/>              
                <telerik:GridBoundColumn DataField="TotalReturnCtnr" SortExpression="TotalReturnCtnr" HeaderText="Total No of Containers Returned" />               
                <telerik:GridBoundColumn DataField="BalanceOnHand" SortExpression="BalanceOnHand" HeaderText="Balance On Hand"/>--%>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
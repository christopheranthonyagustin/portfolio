<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.InventoryAnalysis.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InventoryAnalysisResults</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <div>
                  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <table width="100%">
                <tr class="graytitle">
                    <td colspan="2"><a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                            runat="server"></a></td>
                </tr>
                <tr class="graytitle">
                    <td colspan="2">
                        <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td width="60px">
                        <asp:Label ID="ReportLbl" runat="server">Report</asp:Label></td>
                    <td>:&nbsp; &nbsp;  
                        <asp:Label ID="TitleLbl" runat="server">Inventory Analysis</asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td class="auto-style1">
                        <asp:Label ID="AccLbl" runat="server">Account</asp:Label></td>
                    <td>:&nbsp; &nbsp; 
                        <asp:Label ID="AccountLbl" runat="server"></asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td class="auto-style1">
                        <asp:Label ID="DateLbl" runat="server">Date</asp:Label></td>
                    <td>:&nbsp; &nbsp;   
                        <asp:Label ID="NowLbl" runat="server"></asp:Label></td>
                </tr>
                <tr class="graytitle">
                    <td class="auto-style1">
                        <asp:Label ID="frmtLbl" runat="server">Format</asp:Label></td>
                    <td>:&nbsp; &nbsp;  
                        <asp:Label ID="FormatLbl" runat="server"></asp:Label></td>
                </tr>
            </table>
            <%--      <div id="div-datagrid" style="height: 92%">
                <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False" BorderStyle="None" GridLines="Both"
                    Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False"
                    OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting"
                    ExportSettings-UseItemStyles="true">
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGAlternateItem" Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                </asp:DataGrid>
            </div>--%>
            <div>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AutoGenerateColumns="true"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"   ExportSettings-UseItemStyles="true"
                    ItemStyle-Wrap="False" GridLines="Both" OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" OnItemDataBound="ResultDG_ItemDataBound">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False" ></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="true">
                        <Columns>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Report.ReceiptTaskSummary.Result2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Receipt Task Summary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Receipt Task Summary</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AccountTextLbl" runat="server">Account</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="TaskCodeLbl" runat="server">TaskCode</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="TaskLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="FormatTypeLbl" runat="server">Format</asp:Label>
            </td>
            <td>
            </td>
            <td colspan="2">
                :
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div>
        <a id="a1" runat="server" onserverclick="ExportExcel">
            <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                height="20" runat="server" />
        </a>
        <br />
        <telerik:RadGrid ID="ResultDG"  runat="server" AutoGenerateColumns="true" 
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
       
    </div>
    </form>
</body>
</html>

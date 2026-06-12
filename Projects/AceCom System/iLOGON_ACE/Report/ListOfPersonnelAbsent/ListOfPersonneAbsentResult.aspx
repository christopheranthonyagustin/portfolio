<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfPersonneAbsentResult.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfPersonnelAbsent.ListOfPersonneAbsentResult" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>List Of Personnel Absent</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>   

    <style type="text/css">
        .style1
        {
            width: 112px;
        }
        .div-datagrid
        {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
        </tr>
    </table>
    <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">List Of Personnel Absent</asp:Label>
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <%-- <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="DeptId" runat="server">Department</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="DeptID" runat="server" CssClass="Graytitle"></asp:Label>
            </td>
        </tr>
          <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="TypeId" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TypeLbl" runat="server" CssClass="Graytitle"></asp:Label>
            </td>
        </tr>--%>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
        </tr>
    </table>
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="RadGrid1_GridExporting" ExportSettings-UseItemStyles="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling UseStaticHeaders="true" ScrollHeight="450px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="DeptDescr" SortExpression="DeptDescr" HeaderText="Dept"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="FrDate"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="ToDate"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totdays" SortExpression="totdays" HeaderText="TotDays"
                        AllowFiltering="false" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ampmdescr" SortExpression="ampmdescr" HeaderText="AM/PM"
                        AllowFiltering="false" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Graphlet.iCMSReleaseOrderAnalysis.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iCMSReleaseOrderAnalysis</title>
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
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">iCMS Release Order Analysis</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="FormatDescLbl" runat="server" CssClass="Graytitle">Release Order Container Details from </asp:Label><asp:Label
                    ID="DateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="TypeDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" GridLines="None"
        AutoGenerateColumns="false" GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true"
        FilterType="Classic" AllowSorting="true" BorderStyle="Solid" ExportSettings-UseItemStyles="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
            Resizing-AllowColumnResize="true">
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
        <MasterTableView AllowMultiColumnSorting="false" TableLayout="Fixed" Name="Master"
            Width="100%">
            <Columns>
                <telerik:GridBoundColumn FilterControlWidth="50px" HeaderStyle-Width="100px" ItemStyle-Width="80px"
                    AllowFiltering="true" DataField="ReleaseOrder" ColumnGroupName="ReleaseOrder"
                    SortExpression="ReleaseOrder" UniqueName="ReleaseOrder" HeaderText="ReleaseOrder">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ROType" DataField="TypeDescr" ItemStyle-Width="80px"
                    AllowFiltering="true" HeaderStyle-Width="100px" FilterControlWidth="50px" ColumnGroupName="TypeDescr"
                    SortExpression="TypeDescr" UniqueName="TypeDescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReleasedTo" DataField="ReleasedTo" AllowFiltering="true"
                    HeaderStyle-Width="150px" FilterControlWidth="100px" ColumnGroupName="ReleasedTo"
                    SortExpression="ReleasedTo" UniqueName="ReleasedTo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="skucode" SortExpression="skucode"
                    UniqueName="skucode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SizeType" DataField="sizetype" AllowFiltering="true"
                    FilterControlWidth="190px" ColumnGroupName="sizetype" SortExpression="sizetype"
                    UniqueName="sizetype">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReleaseDate" DataField="lot1" AllowFiltering="true" SortExpression="lot1" UniqueName="lot1"
                    HeaderStyle-Width="130px" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="StoringOrder" DataField="SOnumber" AllowFiltering="true"
                    FilterControlWidth="100px" HeaderStyle-Width="150px" ColumnGroupName="SOnumber"
                    SortExpression="SOnumber" UniqueName="SOnumber">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="SOContainerNo" DataField="SOContainerNo" AllowFiltering="true"
                    ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="150px" ColumnGroupName="SOContainerNo"
                    SortExpression="SOContainerNo" HeaderStyle-HorizontalAlign="Left" UniqueName="SOContainerNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SOContainerType" DataField="SOContainerType"
                    AllowFiltering="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="150px"
                    ColumnGroupName="SOContainerType" SortExpression="SOContainerType" UniqueName="SOContainerType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Commodity" DataField="lot5" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot5" SortExpression="lot5"
                    UniqueName="lot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot6" SortExpression="lot6"
                    UniqueName="lot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rate" DataField="lot7" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot7" SortExpression="lot7" UniqueName="lot7"
                    DataFormatString="{0:#,0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Currency" DataField="lot9" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot9" SortExpression="lot9"
                    UniqueName="lot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TaxType" DataField="lot10" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot10" SortExpression="lot10"
                    UniqueName="lot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Period" DataField="lot11" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="lot11" SortExpression="lot11" UniqueName="lot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="StatusDescr" DataField="statusdescr" AllowFiltering="true"
                    HeaderStyle-Width="150px" ColumnGroupName="statusdescr" SortExpression="statusdescr"
                    UniqueName="statusdescr">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

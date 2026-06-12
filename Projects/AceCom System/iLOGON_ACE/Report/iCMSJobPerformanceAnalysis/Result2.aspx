<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result2.aspx.cs" Inherits="iWMS.Web.Report.iCMSJobPerformanceAnalysis.Result2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>iCMS Tank Travel Detail By Job Result</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 6%;
        }

        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style2" colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <br>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="FormatLbl" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="FormatDescrLbl" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button runat="server" ID="ExportExcelBtn" OnClick="ExportExcel" CssClass="green" ToolTip="Export to Excel" Text="Excel" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" GroupPanelPosition="Top"
            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
            ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting" GridLines="Both">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true">
                <ColumnGroups>
                    <telerik:GridColumnGroup HeaderStyle-HorizontalAlign="Center" HeaderText="Leg1" Name="Leg1" />
                    <telerik:GridColumnGroup HeaderStyle-HorizontalAlign="Center" HeaderText="Leg2" Name="Leg2" />
                </ColumnGroups>
                <Columns>
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="MainJobNo" DataField="MainJobNo" HeaderText="MainJobNo" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="CostingsheetNo" DataField="CostingsheetNo" HeaderText="CostingSheetNo" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_JobNo" DataField="P1_JobNo" ColumnGroupName="Leg1" HeaderText="JobNo" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_POL" DataField="P1_POL" ColumnGroupName="Leg1" HeaderText="POL" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_POD" DataField="P1_POD" ColumnGroupName="Leg1" HeaderText="POD" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_RONO" DataField="P1_RONO" ColumnGroupName="Leg1" HeaderText="RONO" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_SONO" DataField="P1_SONO" ColumnGroupName="Leg1" HeaderText="SONO" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_FromDate" DataField="P1_FromDate" ColumnGroupName="Leg1" HeaderText="From Date(Gate Out)" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P1_ToDate" DataField="P1_ToDate" ColumnGroupName="Leg1" HeaderText="To Date(Gate In)" ItemStyle-BackColor="LightBlue" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_JobNo" DataField="P2_JobNo" ColumnGroupName="Leg2" HeaderText="JobNo" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_POL" DataField="P2_POL" ColumnGroupName="Leg2" HeaderText="POL" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_POD" DataField="P2_POD" ColumnGroupName="Leg2" HeaderText="POD" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_RONO" DataField="P2_RONO" ColumnGroupName="Leg2" HeaderText="RONO" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_SONO" DataField="P2_SONO" ColumnGroupName="Leg2" HeaderText="SONO" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_FromDate" DataField="P2_FromDate" ColumnGroupName="Leg2" HeaderText="From Date(Gate Out)" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="P2_ToDate" DataField="P2_ToDate" ColumnGroupName="Leg2" HeaderText="To Date(Gate In)" ItemStyle-BackColor="LightSalmon" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="TotalTank" DataField="TotalTank" HeaderText="TotalTank" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="EstDay" DataField="EstDay" HeaderText="EstDay" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ActDay" DataField="ActDay" HeaderText="ActDay" />
                    <telerik:GridBoundColumn ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="Variance" DataField="Variance" HeaderText="Variance" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>



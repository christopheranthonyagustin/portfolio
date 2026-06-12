<%@ Page Language="c#" CodeBehind="SYSDetail_21.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.DebitNote.SYSDetail_21" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>System Detail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 98px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td width="80%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
                    AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
                    ExportSettings-UseItemStyles="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="True" />
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
                            <telerik:GridBoundColumn HeaderText="Date" DataField="Expdate" AllowFiltering="true"
                                SortExpression="Expdate" UniqueName="Expdate" Reorderable="true" Display="true"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="L-(Loose)/P-(Palletized)" DataField="cargopackingtype"
                                AllowFiltering="true" SortExpression="cargopackingtype" UniqueName="cargopackingtype"
                                Reorderable="true" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Description of Work" DataField="chargedescr"
                                AllowFiltering="true" SortExpression="chargedescr" UniqueName="chargedescr" Reorderable="true"
                                Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Container No" DataField="ctnrno" AllowFiltering="true"
                                SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QTY(Ltr)" DataField="qty" AllowFiltering="true"
                                SortExpression="qty" UniqueName="qty" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Size" DataField="ctnrsize" AllowFiltering="true"
                                SortExpression="ctnrsize" UniqueName="ctnrsize" Reorderable="true" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalLtr/Day" DataField="totQtyByExpdate" AllowFiltering="true"
                                SortExpression="totQtyByExpdate" UniqueName="totQtyByExpdate" Reorderable="true"
                                Display="true" DataFormatString="{0:#,0.000}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InExcess/Ltr" DataField="TotBillingQtyByExpdate"
                                AllowFiltering="true" SortExpression="TotBillingQtyByExpdate" UniqueName="TotBillingQtyByExpdate"
                                Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalCharge" DataField="TotBillingAmtByExpdate"
                                AllowFiltering="true" SortExpression="TotBillingAmtByExpdate" UniqueName="TotBillingAmtByExpdate"
                                Reorderable="true" Display="true" DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr class="graytitle">
                        <td width="80%" align="right">
                            <a id="A1" runat="server" onserverclick="ExportExcel2">
                                <img id="Img1" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                                    height="20" runat="server">
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
                    AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource2"
                    OnItemDataBound="ResultDG_ItemDataBound2" OnGridExporting="RadGrid1_GridExporting2"
                    ExportSettings-UseItemStyles="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="True" />
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
                            <telerik:GridBoundColumn HeaderText="ContainerType" DataField="ctnrtype" AllowFiltering="true"
                                SortExpression="ctnrtype" UniqueName="ctnrtype" Reorderable="true" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ContainerSize" DataField="ctnrsize" AllowFiltering="true"
                                SortExpression="ctnrsize" UniqueName="ctnrsize" Reorderable="true" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CargoPacking" DataField="cargopackingtype" AllowFiltering="true"
                                SortExpression="cargopackingtype" UniqueName="cargopackingtype" Reorderable="true"
                                Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="No.Ctnr" DataField="NoofCtnr" AllowFiltering="true"
                                SortExpression="NoofCtnr" UniqueName="NoofCtnr" Reorderable="true" Display="true"
                                DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Costing" DataField="Unitrate" AllowFiltering="true"
                                SortExpression="Unitrate" UniqueName="Unitrate" Reorderable="true" Display="true"
                                DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Total:" DataField="Billingamt" AllowFiltering="true"
                                SortExpression="Billingamt" UniqueName="Billingamt" Reorderable="true" Display="true"
                                DataFormatString="{0:#,0.00}">
                                <ItemStyle HorizontalAlign="Right" />
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

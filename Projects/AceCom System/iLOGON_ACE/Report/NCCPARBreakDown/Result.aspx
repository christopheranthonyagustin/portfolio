<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.NCCPARBreakDown.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>NCPAR BreakDown</title>
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
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">NCPAR BreakDown Report</asp:Label>
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="StatusHeaderLbl" runat="server">Status</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="StatusLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="FormatHeaderLbl" runat="server">Format</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="FormatLbl" runat="server"></asp:Label>
            </td>
        </tr>
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
            <td colspan="4">
                <div id="div-datagrid" style="height: 92%">
                    <table>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <telerik:RadHtmlChart runat="server" ID="PieChart1" Width="800px" Height="500px"
                                    Skin="Silk">
                                    <Zoom Enabled="False">
                                    </Zoom>
                                    <ChartTitle Text="NCPAR Breakdown">
                                    </ChartTitle>
                                    <PlotArea>
                                        <Series>
                                            <telerik:PieSeries DataFieldY="ClassCount" ColorField="Color" ExplodeField="IsExploded"
                                                Name="Label" NameField="Classification" StartAngle="90">
                                                <LabelsAppearance DataFormatString="{0}">
                                                    <ClientTemplate>
                                                            

                                                            #=dataItem.Classification#
                                                           #=Math.round(percentage *100)#% 
                                                    </ClientTemplate>
                                                </LabelsAppearance>
                                                <TooltipsAppearance Color="White" />
                                            </telerik:PieSeries>
                                        </Series>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Position="Bottom">
                                        </Appearance>
                                    </Legend>
                                </telerik:RadHtmlChart>
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
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
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
                        </MasterTableView>
                    </telerik:RadGrid></div>
            </td>
        </tr>
    </table>
    </br>
    <table>
        <tr>
            <td align="right" class="style1">
                <a id="A1" runat="server" onserverclick="ExportExcel1">
                    <img id="Img1" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
        Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound">
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
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTranStatsResult.aspx.cs"
    Inherits="iWMS.Web.Report.InventoryOccupancy.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>InventoryOccupancy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <%--<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />--%>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <style type="text/css">
        .blackBoldText
        {
            color: #000000;
            font-size: 18px;
            font-family: Arial,Verdana,Helvetica;
            font-weight: bold;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr >
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel" visible="false">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
            </td>
        </tr>
        <tr >
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" Css>Inventory Occupancy</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td>
                <asp:Label ID="AccLbl" runat="server">site</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="lbl1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td>
                <asp:Label ID="lblsite" runat="server">Zone</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="lblzone" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:PlaceHolder ID="PH1" runat="server" />

    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Skin="Silk">
        <PlotArea>
            <Series>
                <telerik:ColumnSeries DataFieldY="Capacity" AxisName="Y1" Name="Capacity">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="Occupancy" AxisName="Y1" Name="Occupancy">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:LineSeries DataFieldY="Exceed" AxisName="Y2" Name="Exceed">
                    <LabelsAppearance Visible="true" />
                </telerik:LineSeries>
            </Series>
            <YAxis Step="50" Name = "Y1" >
                <TitleAppearance Text="Wt(KG)"/>
            </YAxis>
            <AdditionalYAxes>
               <telerik:AxisY Step="10" Name = "Y2">
                <TitleAppearance Text = "Exceed(%)"/>
               </telerik:AxisY>
            </AdditionalYAxes>            
            <XAxis DataLabelsField="zonecode">
                <TitleAppearance Text="Zone" />
            </XAxis>
        </PlotArea>
        <ChartTitle Text="">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
    
    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Skin="Silk">
        <PlotArea>
            <Series>
                <telerik:ColumnSeries DataFieldY="Capacity" Name="Capicity">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
                <telerik:ColumnSeries DataFieldY="Occupancy" Name="Occupancy">
                    <LabelsAppearance Visible="false" />
                </telerik:ColumnSeries>
            </Series>
            <YAxis Step="10">
                <TitleAppearance Text="(%)" />
            </YAxis>
            <XAxis DataLabelsField="sitecode">
                <TitleAppearance Text="site" />
            </XAxis>
        </PlotArea>
        <ChartTitle Text="">
        </ChartTitle>
        <Legend>
            <Appearance Position="Bottom">
            </Appearance>
        </Legend>
    </telerik:RadHtmlChart>
    
    <h2><asp:Label ID="Label1" runat="server">Occupancy By Zone</asp:Label></h2>
    <telerik:RadGrid ID="ResultDG1" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007">
        <%--OnItemDataBound="ResultDG_ItemDataBound"--%>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Site" DataField="sitecode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Zone" DataField="zonecode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Capacity" DataField="Capacity" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Occupancy" DataField="Occupancy" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Occupancy(%)" DataField="Occupancy(%)" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Exceed?(%)" DataField="Exceed?(%)" AllowFiltering="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    
     <h2><asp:Label ID="Label4" runat="server">Occupancy By Account,Site</asp:Label></h2>
    <telerik:RadGrid ID="ResultDG2" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007">
        <%--OnItemDataBound="ResultDG_ItemDataBound"--%>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Site" DataField="sitecode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Zone" DataField="zonecode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="WT(KG)" DataField="wt" AllowFiltering="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    
     <h2><asp:Label ID="Label7" runat="server">Occupancy By Site</asp:Label></h2>
    <telerik:RadGrid ID="ResultDG3" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" Skin="Office2007">
        <%--OnItemDataBound="ResultDG_ItemDataBound"--%>
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <ClientEvents OnGridCreated="onGridCreated" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Site" DataField="sitecode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Capacity" DataField="Capacity" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Occupancy" DataField="Occupancy" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Occupancy(%)" DataField="Occupancy(%)" AllowFiltering="true">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    
    </form>
</body>
</html>

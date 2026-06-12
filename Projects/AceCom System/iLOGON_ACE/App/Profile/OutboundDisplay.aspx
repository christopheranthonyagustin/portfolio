<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDisplay.aspx.cs" Inherits="iWMS.Web.App.Profile.OutboundDisplay" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Outbound Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <%--<link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />--%>

    <style type="text/css">
        .DGHeaderFontLargeBold {
            border: 1px solid #003366;
            background-color: #003366;
            color: White;
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-family: Helvetica;
            font-size: 18px;
            font-weight: bold;
            position: relative;
            cursor: default;
            line-height: 1.0;
        }

        .DGItemLargeBoldFont {
            color: Black;
            /*background-color:#EEEEEE;*/
            font-family: Courier New;
            font-size: 16px;
            font-weight: bold;
            padding: 3px 3px 3px 3px;
        }
    </style>
    <style type="text/css">
        .style2 {
            width: 125px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="50px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <asp:Label ID="refreshLbl" runat="server" Text="Refresh" /><br />
                            <telerik:RadDropDownList ID="refreshDdl" runat="server" DropDownHeight="100px" Width="150px"
                                Skin="WebBlue" DefaultMessage="Select a Refresh Interval" DropDownWidth="150px" OnSelectedIndexChanged="refreshDdl_SelectedIndexChanged" AutoPostBack="true">
                            </telerik:RadDropDownList>
                            <asp:Timer ID="Refreshtmr" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                        </td>
                        <td>&nbsp;
                              <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                            <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <br />
        <table id="resultTable" runat="server" cellspacing="0" cellpadding="0" width="100%"
            border="0">
            <tr>
                <td class="style2">
                    <asp:Label ID="GridLbl1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
                        EnableLinqExpressions="False" AllowPaging="True"
                        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                        GridLines="Both" CellPadding="0" Width="45%" Height="50%">

                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="15px"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center"></HeaderStyle>
                        <ExportSettings UseItemStyles="True">
                        </ExportSettings>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="GraphLbl" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
            Visible="False"></asp:Label>
        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Width="800px">
            <PlotArea>
                <Series>
                    <telerik:BarSeries Name="Today" DataFieldY="today" Stacked="false">
                        <Appearance>
                            <FillStyle BackgroundColor="Green" />
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0}" Position="Center" />
                        <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                    </telerik:BarSeries>
                    <telerik:BarSeries Name="Tomorrow" DataFieldY="tomorrow" Stacked="false">
                        <Appearance>
                            <FillStyle BackgroundColor="Blue" />
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0}" Position="Center" />
                        <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                    </telerik:BarSeries>
                </Series>
                <XAxis DataLabelsField="Account">
                    <MinorGridLines Visible="false"></MinorGridLines>
                    <MajorGridLines Visible="false"></MajorGridLines>
                    <%-- <TitleAppearance Position="Center" RotationAngle="0" Text="Account" />--%>
                </XAxis>

                <YAxis>
                    <LabelsAppearance DataFormatString="{0}" RotationAngle="0" />
                    <MajorGridLines Color="#EFEFEF" Width="1" />
                    <MinorGridLines Color="#F7F7F7" Width="1" />
                    <TitleAppearance Position="Center" RotationAngle="0" Text="NoOfLines" />
                </YAxis>
            </PlotArea>
            <%--<ChartTitle Text="Sales">
                </ChartTitle>--%>
            <Legend>
                <Appearance Position="Bottom" />
            </Legend>
        </telerik:RadHtmlChart>
        <br />
        <asp:Label ID="GraphLbl1" runat="server"  Font-Bold="true" Font-Size="16px"></asp:Label>
        <asp:Label ID="MessageLbl2" runat="server" CssClass="errorLabel" Style="z-index: 0"
            Visible="False"></asp:Label>
        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Width="800px" Skin="Silk" visible="false" >
            <PlotArea>
                <Series>
                    <telerik:BarSeries Name="Factor" DataFieldY="factor" Stacked="true"  StackType="Stack100" Visible="false">
                        <Appearance>
                            <FillStyle BackgroundColor="Green" />
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0}" Position="Center" />
                        <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                    </telerik:BarSeries>
                    <telerik:BarSeries Name="Packed" DataFieldY="packed" Stacked="true" StackType="Stack100">
                        <Appearance>
                            <FillStyle BackgroundColor="#3399ff" />
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0}" Position="Center" />
                        <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                    </telerik:BarSeries>
                      <telerik:BarSeries Name="NotPacked" DataFieldY="notpacked" Stacked="true" StackType="Stack100">
                        <Appearance>
                            <FillStyle BackgroundColor="Orange" />
                        </Appearance>
                        <LabelsAppearance DataFormatString="{0}" Position="Center" />
                        <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                    </telerik:BarSeries>
                </Series>
                <XAxis DataLabelsField="DateType">
                    <MinorGridLines Visible="false"></MinorGridLines>
                    <MajorGridLines Visible="false"></MajorGridLines>
                </XAxis>

                <YAxis>
                    <LabelsAppearance DataFormatString="{0}" RotationAngle="0" />
                    <MajorGridLines Color="#EFEFEF" Width="1" />
                    <MinorGridLines Color="#F7F7F7" Width="1" />
                    <TitleAppearance Position="Center" RotationAngle="0" Text="NoOfLines" />
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Position="Bottom" />
            </Legend>
        </telerik:RadHtmlChart>
        <br />
        <asp:Label ID="PieChartLbl" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <table id="Table1" runat="server" cellspacing="0" cellpadding="0" width="100%"
            border="0">
            <tr runat="server" visible="false" id="tr1">
                <td>
                    <telerik:RadHtmlChart runat="server" ID="PieChart1" Width="300" Height="300" Transitions="true"
                        Skin="Silk">
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries>
                                    <LabelsAppearance DataFormatString="{0}">
                                    </LabelsAppearance>
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <ChartTitle>
                            <Appearance Position="Bottom"></Appearance>
                        </ChartTitle>
                        <Legend>
                            <Appearance Position="Right">
                            </Appearance>
                        </Legend>
                    </telerik:RadHtmlChart>
                </td>
                <td>
                    <telerik:RadHtmlChart runat="server" ID="PieChart2" Width="300" Height="300" Transitions="true"
                        Skin="Silk">
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries>
                                    <LabelsAppearance DataFormatString="{0}">
                                    </LabelsAppearance>
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <ChartTitle>
                            <Appearance Position="Bottom"></Appearance>
                        </ChartTitle>
                        <Legend>
                            <Appearance Position="Right">
                            </Appearance>
                        </Legend>
                    </telerik:RadHtmlChart>
                </td>
                <td>
                    <telerik:RadHtmlChart runat="server" ID="PieChart3" Width="300" Height="300" Transitions="true"
                        Skin="Silk">
                        <PlotArea>
                            <Series>
                                <telerik:PieSeries>
                                    <LabelsAppearance DataFormatString="{0}">
                                    </LabelsAppearance>
                                </telerik:PieSeries>
                            </Series>
                        </PlotArea>
                        <ChartTitle>
                            <Appearance Position="Bottom"></Appearance>
                        </ChartTitle>
                        <Legend>
                            <Appearance Position="Right">
                            </Appearance>
                        </Legend>
                    </telerik:RadHtmlChart>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="GridLbl2" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl3" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl4" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG4" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl5" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG5" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl6" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG6" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

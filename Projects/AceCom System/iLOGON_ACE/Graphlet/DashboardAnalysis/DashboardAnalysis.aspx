<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysis.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysis" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DashboardAnalysis</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
    <script type="text/javascript">
        function selectAll(invoker) {
            if (invoker.checked) {
                legendSelectAll();
            }
            else {
                legendDeselectAll();
            }
        }

        function legendDeselectAll() {
            var chart = $find("RadHtmlChart1");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }

        function legendSelectAll() {
            var chart = $find("RadHtmlChart1");
            if (chart != null) {
                for (counter = 0; counter < chart._chartObject.options.series.length; counter++) {
                    if (!chart._chartObject.options.series[counter].visible) {
                        chart._chartObject._legendItemClick(counter);
                    }
                }
            }
        }
    </script>

    <%-- Start sp_TMSDashboardAnalysis_19  --%>

     <style type="text/css">
        .ReadyToExport {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: white;
            margin-bottom: 20px;
            margin-top: 10px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .ReadyToImport {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: white;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .ReadyToCollect {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: #990000;
            color: white;
            margin-bottom: 20px;
            margin-top: 10px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .ReadyToReturn {
            width: 300px;
            height: 140px;
            border: thin;
            background-color: orangered;
            color: white;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: x-large;
            font-family: Arial;
            border-radius: 7px;
            padding-left: 15px;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
        }

        .DashBoardlbl {
            float: right;
            margin-top: 35px;
            margin-right: 10px;
            font-size: xx-large;
            font-weight: bold;
            text-align: right;
        }

        .ContainerLbl {
            font-size: large;
            text-align: right;
            margin-left: 200px;
        }
    </style>

    <%-- End  sp_TMSDashboardAnalysis_19 --%>

    <%-- Start  sp_TMSDashboardAnalysis_23 --%>

    <style type="text/css">

        #infotable {
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse; 
            border: 1px solid #d0d7e5;
        }
        #infotable td {
            border: 1px solid #d0d7e5;
            padding: 8px;
        }

    </style>

    <%-- End  sp_TMSDashboardAnalysis_23 --%>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" ClientIDMode="Static"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="TMSTab" Text="TMS" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="WMSInboundTab" Text="WMSInbound" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="WMSOutboundTab" Text="WMSOutbound" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="WMSContainerTab" Text="WMSContainer" Value="110" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="WMSInventoryTab" Text="WMSInventory" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="FMSTab" Text="FMS" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManagementTab" Text="Management" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="150px">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <div style="margin-left: 8px; margin-right: 8px; margin-bottom: 8px">
                                            <table border="0" cellpadding="0" cellspacing="2" id="table1" runat="server" visible="false">
                                                <tr>
                                                    <td>
                                                        <br />
                                                        <%--<asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Text="<<" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />--%>
                                                        <asp:Button ID="PrevBtn" CssClass="white" runat="server" OnClick="PrevBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />            
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="formatLbl" runat="server" Text="Format" /><br />
                                                        <telerik:RadComboBox ID="FormatList" runat="server" Width="155px" AutoPostBack="true"
                                                            RenderMode="Lightweight" Filter="Contains" CausesValidation="false" Skin="WebBlue"
                                                            AllowCustomText="false" DropDownWidth="155px" OnSelectedIndexChanged="Format_OnComboBoxSelectedIndexChanged">
                                                        </telerik:RadComboBox>
                                                    </td>                      
                                                    <td>                              
                                                        <br />
                                                          &nbsp;
                            <%--                            <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Text=">>" OnClick="NextBtn_Click" UseSubmitBehavior="false" />--%>
                                                        <asp:Button ID="NextBtn" CssClass="white" runat="server" OnClick="NextBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="refreshLbl" runat="server" Text="RefreshEvery" /><br />
                                                        <telerik:RadDropDownList ID="refreshDdl" runat="server" DropDownHeight="100px" Width="150px"
                                                            Skin="WebBlue" DropDownWidth="150px" AutoPostBack="true" OnSelectedIndexChanged="refreshDdl_SelectedIndexChanged">
                                                        </telerik:RadDropDownList>
                                                        <asp:Timer ID="Refreshtmr" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                                                    </td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;                  
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AutoRefreshLbl" runat="server" Text="AutoRefresh" /><br />
                                                        <input type="checkbox" runat="server" id="RefreshCbx" checked="checked" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Panel runat="server" ID="TMS13Panel" Visible="false">
                                                <table border="0" cellpadding="0" cellspacing="2">
                                                    <tr>
                                                        <td>
                                                            <iWMS:iForm ID="formCtl_format13" runat="server" Visible="false"></iWMS:iForm>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;<asp:Button ID="RunBtn" class="white" runat="server" OnClick="compile_ClickBtn" Text="Run Now"
                                                            UseSubmitBehavior="true" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:Panel runat="server" ID="TMS23Panel" Visible="false">
                                                <table border="0" cellpadding="0" cellspacing="2">
                                                    <tr>
                                                        <td>
                                                            <iWMS:iForm ID="formCtl_format23" runat="server" Visible="false"></iWMS:iForm>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;<asp:Button ID="RunBtn_format23" class="white" runat="server" OnClick="compile_ClickBtn" Text="Run Now"
                                                            UseSubmitBehavior="true" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </div>
                                    </ItemTemplate>
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="false" CssClass="errorLabel" />
                <asp:Panel ID="TMS_13_GraphPanel" runat="server" Visible="false">
                    <asp:UpdatePanel runat="server" ID="TMS_13" RenderMode="Inline" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="GraphLbl1" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>
                            <asp:Label ID="MessageLbl2" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                Visible="False"></asp:Label>
                            <telerik:RadHtmlChart runat="server" ID="RadHtmlChart_13" Width="800px" Skin="Silk">
                                <PlotArea>
                                    <Series>
                                        <telerik:BarSeries Name="Factor" DataFieldY="factor" Stacked="true" StackType="Stack100" Visible="false">
                                            <Appearance>
                                                <FillStyle BackgroundColor="Green" />
                                            </Appearance>
                                            <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                            <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                        </telerik:BarSeries>
                                        <telerik:BarSeries Name="Delivered" DataFieldY="delivered" Stacked="true" StackType="Stack100">
                                            <Appearance>
                                                <FillStyle BackgroundColor="#3399ff" />
                                            </Appearance>
                                            <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                            <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                                        </telerik:BarSeries>
                                        <telerik:BarSeries Name="Outstanding" DataFieldY="outstanding" Stacked="true" StackType="Stack100">
                                            <Appearance>
                                                <FillStyle BackgroundColor="Orange" />
                                            </Appearance>
                                            <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                            <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                                        </telerik:BarSeries>
                                    </Series>
                                    <XAxis DataLabelsField="DriverName">
                                        <MinorGridLines Visible="false"></MinorGridLines>
                                        <MajorGridLines Visible="false"></MajorGridLines>
                                    </XAxis>

                                    <YAxis>
                                        <LabelsAppearance DataFormatString="{0}" RotationAngle="0" />
                                        <MajorGridLines Color="#EFEFEF" Width="1" />
                                        <MinorGridLines Color="#F7F7F7" Width="1" />
                                        <TitleAppearance Position="Center" RotationAngle="0" Text="Orders" />
                                    </YAxis>
                                </PlotArea>
                                <Legend>
                                    <Appearance Position="Bottom" />
                                </Legend>
                            </telerik:RadHtmlChart>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <asp:Panel ID="TMS_17_GraphPanel" runat="server" Visible="false">
                    <asp:Label ID="GraphLbl2" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>
                    <telerik:RadHtmlChart runat="server" ID="RadHtmlChart_17" Skin="Silk">
                        <ChartTitle Text="Trip Analysis">
                        </ChartTitle>
                        <Legend>
                            <Appearance Position="Bottom">
                                <TextStyle Margin="20 0 0 0" />
                            </Appearance>
                        </Legend>
                    </telerik:RadHtmlChart>
                </asp:Panel>
            
                <asp:Panel ID="TMS_19_GraphPanel" runat="server" Visible="false">
                    <table style="width: 100%; display:block;">
            <tr>
                <td>
                    <div id="ReadyToExport" class="ReadyToExport" onclick="OpenRadWindow('ReadyToExport')">
                        Ready To Export
                        <br />
                        <asp:Label ID="ReadyToExportLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="ReadyToExportLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    <div id="ReadyToImport" class="ReadyToImport" onclick="OpenRadWindow('ReadyToImport')">
                        Ready To Import
                        <br />
                        <asp:Label ID="ReadyToImportLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="ReadyToImportLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
                <td style="padding-left:15px">
                    <div id="ReadyToCollect" class="ReadyToCollect" onclick="OpenRadWindow('ReadyToCollect')">
                        Ready To Collect
                        <br />
                        <asp:Label ID="ReadyToCollectLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="ReadyToCollectLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                    <div id="ReadyToReturn" class="ReadyToReturn" onclick="OpenRadWindow('ReadyToReturn')">
                        Ready To Return
                        <br />
                        <asp:Label ID="ReadyToReturnLbl" runat="server" CssClass="DashBoardlbl"></asp:Label><br />
                        <asp:Label ID="ReadyToReturnLbl1" runat="server" Text="container(s)" Font-Bold="false" class="ContainerLbl"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="750px" Height="620px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
        <script type="text/javascript">
            function OpenRadWindow(DivId) {
                var Value = DivId;
                if (Value == "ReadyToExport") {
                    window.radopen("../DashboardAnalysis/DashboardAnalysisTMS.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToImport") {
                    window.radopen("../DashboardAnalysis/DashboardAnalysisTMS.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToCollect") {
                    window.radopen("../DashboardAnalysis/DashboardAnalysisTMS.aspx?DashBoardVal=" + Value);
                }
                else if (Value == "ReadyToReturn") {
                    window.radopen("../DashboardAnalysis/DashboardAnalysisTMS.aspx?DashBoardVal=" + Value);
                }
            }
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
                </asp:Panel>
                <asp:Panel ID="TMS_23_GraphPanel" runat="server" Visible="false">
                    <asp:Label ID="GraphLbl_23" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>

                    <br />
                    <% if (ViewState["InfoData_23"] != null && ((System.Data.DataTable)ViewState["InfoData_23"]).Rows.Count > 0)
                        { %>
                    <table style="font-size: 16px" id="infotable">
                        <tr>
                            <td><b>Total Jobs</b></td>
                            <td><%= ((System.Data.DataTable)ViewState["InfoData_23"]).Rows[0]["totalJobs"] %></td>
                        <% foreach (System.Data.DataRow item in ((System.Data.DataTable)ViewState["InfoData_23"]).Rows)
                            { %>
                            <td><b><%= item["status"] %></b></td>
                            <td><%= item["totalStatus"] %></td>
                        <% } %>
                        </tr>
                    </table>
                    <% } %>
                    <br />

                    <telerik:RadGrid ID="ResultDG_23" runat="server" AutoGenerateColumns="true" AllowSorting="True" OnColumnCreated="ResultDG_ColumnCreated"
                        BorderStyle="Solid" Skin="Office2007" onsorting="GridView1_Sorting" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
                        OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true" Font-Size="16px"></AlternatingItemStyle>
                        <ItemStyle Wrap="true" Font-Size="16px"></ItemStyle>
                        <HeaderStyle Wrap="false" Width="120px" Font-Size="16px" Font-Bold="true"></HeaderStyle>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="false" PageSize="20">
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="100%" ID="WMSInboundTabRadPageView" ContentUrl="DashboardAnalysisWMSInbound.aspx" />
            <telerik:RadPageView runat="server" Height="100%" ID="WMSOutboundTabRadPageView" ContentUrl="DashboardAnalysisWMSOutbound.aspx" />
            <telerik:RadPageView runat="server" Height="100%" ID="WMSContainerTabRadPageView" ContentUrl="DashboardAnalysisWMSContainer.aspx" />
            <telerik:RadPageView runat="server" Height="100%" ID="WMSInventoryTabRadPageView" ContentUrl="DashboardAnalysisWMSInventory.aspx" />
            <telerik:RadPageView runat="server" Height="100%" ID="FMSTabRadPageView" ContentUrl="DashboardAnalysisFMS.aspx" />
            <telerik:RadPageView runat="server" Height="100%" ID="WMSManagementPageView" ContentUrl="DashboardAnalysisManagement.aspx" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

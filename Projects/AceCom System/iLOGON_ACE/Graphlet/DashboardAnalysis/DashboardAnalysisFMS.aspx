<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAnalysisFMS.aspx.cs" Inherits="iWMS.Web.Graphlet.DashboardAnalysis.DashboardAnalysisFMS" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FMS</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style2 {
            width: 125px;
        }

        .paddingBottom {
            margin-bottom: 1.2em;
        }

        .togglefullscreenbtn {
            margin-left: 1.2em;
        }

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
</head>
<body>
    <script type="text/javascript">
        function ToggleFullscreenBtn_OnClick() {
            // Hide/Unhide the tabs
            var radTabStrip = window.frameElement.parentElement.parentElement.parentElement.querySelector('#RadTabStrip1');
            if (radTabStrip.style.display === 'none') {
                radTabStrip.setAttribute('style', 'display: block');

                // Unhide the text "Dashboard Analysis"
                if (window.parent.parent.document.body.tagName.toLowerCase() === 'frameset')
                    window.parent.parent.document.body.setAttribute('rows', '25,*')
            } else {
                radTabStrip.setAttribute('style', 'display: none');

                // Hide the text "Dashboard Analysis"
                // Ref: https://stackoverflow.com/questions/42843642/how-to-get-the-parent-iframes-parent-iframe-using-javascript
                if (window.parent.parent.document.body.tagName.toLowerCase() === 'frameset')
                    window.parent.parent.document.body.setAttribute('rows', '0,*')
            }
        }

        function BackBtn_Click() {
            var radTabStrip = window.frameElement.parentElement.parentElement.parentElement.querySelector('#RadTabStrip1');
            if (radTabStrip.style.display === 'none') {
                radTabStrip.setAttribute('style', 'display: block');
                if (window.parent.parent.document.body.tagName.toLowerCase() === 'frameset') {
                    // Unhide the text "Dashboard Analysis"
                    window.parent.parent.document.body.setAttribute('rows', '25,*')
                }
            }
        }

        document.onkeydown = function (event) {
            if (event.keyCode == 121 && document.getElementById('<%= ToggleFullscreenBtn.ClientID%>')) {
                // user press F10
                // Toggle Fullscreen mode
                document.getElementById('<%= ToggleFullscreenBtn.ClientID%>').click();
            }
        }
    </script>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" CssClass="paddingBottom" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <div style="margin-left: 8px; margin-right: 8px; margin-bottom: 8px">
                                   
                                    <asp:Panel runat="server" ID="FMSDAFormat13Panel" Visible="true">
                                        <table>
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl_format13" runat="server" Visible="true"></iWMS:iForm>
                                                </td>
                                                <td>
                                                     <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Small" Text="(Result will only show if there is Entity/Branch Selected)" />
                                                   			

                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>

                                     <table border="0" cellpadding="0" cellspacing="2" id="table1" runat="server" visible="true" height="100%">
                                        <tr>
                                            <td>
                                                <br />
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
                                         <tr>
                                             <td><br />
                                                 <asp:Button ID="RunBtn" class="white" runat="server" OnClick="compile_ClickBtn" Text="Run Now"
                                                 UseSubmitBehavior="true" />
                                             </td>
                                         </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <br />

        <table id="resultTable" runat="server" cellspacing="0" cellpadding="0" width="100%" height="100%"
                border="0" visible="false">
                <tr>
                    <td colspan="3" class="style2">
                        <asp:Label ID="GridLbl1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <asp:Button ID="ToggleFullscreenBtn" runat="server" CssClass="LongLabelWhite togglefullscreenbtn" OnClientClick="ToggleFullscreenBtn_OnClick()" OnClick="ToggleFullscreen_Click" Text="Fullscreen (F10)" UseSubmitBehavior="false" />
                        <asp:Button ID="BackBtn" CssClass="white" runat="server" Visible="false" Text="Back" CausesValidation="false" OnClientClick="BackBtn_Click()" OnClick="BackBtn_Click" UseSubmitBehavior="false" />
                        <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click" UseSubmitBehavior="false" />  
                        <br />
                        <asp:Panel runat="server" ID="WMSOutbound13ResultPnl">
                            <br />
                            <% if (ViewState["InfoData"] != null && ((System.Data.DataTable)ViewState["InfoData"]).Rows.Count > 0)
                                { %>
                            <table style="font-size: 16px" id="infotable">
                                <tr>
                                    <td><b>Total Jobs</b></td>
                                    <td><%= ((System.Data.DataTable)ViewState["InfoData"]).Rows[0]["totalJobs"] %></td>
                                    <% foreach (System.Data.DataRow item in ((System.Data.DataTable)ViewState["InfoData"]).Rows)
                                        { %>
                                    <td><b><%= item["status"] %></b></td>
                                    <td><%= item["totalStatus"] %></td>
                                    <% } %>
                                </tr>
                            </table>
                            <% } %>
                            <br />

                        </asp:Panel>
                         <br />

                        <asp:Label ID="lblGrid1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowSorting="True" OnColumnCreated="ResultDG_ColumnCreated"
                            BorderStyle="Solid" Skin="Office2007" onsorting="GridView1_Sorting" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound"
                            OnPageIndexChanged="ResultDG_PageIndexChanged" OnNeedDataSource="ResultDG_NeedDataSource"
                            GridLines="Both" ExportSettings-UseItemStyles="true" OnGridExporting="ResultDG_GridExporting">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true" Resizing-AllowColumnResize="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true" Font-Size="16px"></AlternatingItemStyle>
                            <ItemStyle Wrap="true" Font-Size="16px"></ItemStyle>
                            <HeaderStyle Wrap="false" Font-Bold="true" Width="120px" Font-Size="16px"></HeaderStyle>
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <MasterTableView AllowMultiColumnSorting="false" PageSize="20"></MasterTableView>
                        </telerik:RadGrid>

                         <br />
                         <asp:Label ID="lblGrid2" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <br />
                        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="true" AllowSorting="True" OnColumnCreated="ResultDG1_ColumnCreated"
                            BorderStyle="Solid" Skin="Office2007" onsorting="GridView1_Sorting" AllowPaging="true" OnItemDataBound="ResultDG1_ItemDataBound"
                            OnPageIndexChanged="ResultDG1_PageIndexChanged" OnNeedDataSource="ResultDG1_NeedDataSource"
                            GridLines="Both" ExportSettings-UseItemStyles="true" OnGridExporting="ResultDG1_GridExporting">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true" Resizing-AllowColumnResize="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true" Font-Size="16px"></AlternatingItemStyle>
                            <ItemStyle Wrap="true" Font-Size="16px"></ItemStyle>
                            <HeaderStyle Wrap="false" Font-Bold="true" Width="120px" Font-Size="16px"></HeaderStyle>
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <MasterTableView AllowMultiColumnSorting="false" PageSize="20"></MasterTableView>
                        </telerik:RadGrid>
                    </td>
                    <td>&nbsp;
                    </td>
                    <td>
                        
                    </td>
                </tr>              
            </table> 

        <table id="Format19_BarChat" runat="server">
             <tr>
             <td colspan="3" class="style2">
                        <asp:Label ID="GridLbl2" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <asp:Button ID="ToggleFullscreenBtn2" runat="server" CssClass="LongLabelWhite togglefullscreenbtn" OnClientClick="ToggleFullscreenBtn_OnClick()" OnClick="ToggleFullscreen_Click" Text="Fullscreen (F10)" UseSubmitBehavior="false" />
                        <asp:Button ID="BackBtn2" CssClass="white" runat="server" Visible="false" Text="Back" CausesValidation="false" OnClientClick="BackBtn_Click()" OnClick="BackBtn_Click" UseSubmitBehavior="false" />
       
                 <telerik:RadButton CssClass="Blue" runat="server" OnClientClicked="exportRadHtmlChart" Text="Export Chart to PDF" AutoPostBack="false" UseSubmitBehavior="false" Visible="false" />
                <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1"> </telerik:RadClientExportManager>
             </td>
                 </tr>
            <tr>
                <td>
                     <br />
                     <br />
                    <asp:Panel ID="FMS_19_GraphPanel1" runat="server">
                        <asp:UpdatePanel runat="server" ID="FMS_19" RenderMode="Inline" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label ID="GraphLbl1" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>
                                <asp:Label ID="MessageLbl2" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Width="650px"/>
                                   <%-- <PlotArea>
                                        <Series>
                                            <telerik:BarSeries Name="AIR_TON" DataFieldY="AIR_TON" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Gray" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="LCL_CBM" DataFieldY="LCL_CBM" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="DarkOrange" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="FCL_TEU" DataFieldY="FCL_TEU" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Blue" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                        </Series>
                                        <XAxis DataLabelsField="Date">
                                            <MinorGridLines Visible="true"></MinorGridLines>
                                            <MajorGridLines Visible="true"></MajorGridLines>
                                        </XAxis>

                                        <YAxis>
                                            <LabelsAppearance DataFormatString="{0}" RotationAngle="0" />
                                            <MajorGridLines Color="#EFEFEF" Width="1" />
                                            <MinorGridLines Color="#F7F7F7" Width="1" />
                                            <TitleAppearance Position="Center" RotationAngle="0" Text="Weight By Transport Mode">
                                                <TextStyle  FontFamily="Times New Roman"  Padding="10" Margin="10" FontSize="20" />
                                                </TitleAppearance>
                                        </YAxis>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Position="Bottom" />
                                    </Legend>--%>
                               
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
                <td>
                    <br />
                     <br />
                    <asp:Panel ID="FMS_19_GraphPanel2" runat="server">
                        <asp:UpdatePanel runat="server" ID="FMS_19_2" RenderMode="Inline" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>
                                <asp:Label ID="Label3" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                                <%--<telerik:RadHtmlChart runat="server" ID="RadHtmlChart2" Width="650px">
                                    <PlotArea>
                                        <Series>
                                            <telerik:BarSeries Name="AIR_JOB" DataFieldY="AIR_JOB" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Gray" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="LCL_JOB" DataFieldY="LCL_JOB" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="DarkOrange" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="Gray" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="FCL_JOB" DataFieldY="FCL_JOB" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Blue" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="ROAD_JOB" DataFieldY="ROAD_JOB" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Yellow" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                            <telerik:BarSeries Name="SERVICE_JOB" DataFieldY="SERVICE_JOB" Stacked="false">
                                                <Appearance>
                                                    <FillStyle BackgroundColor="Red" />
                                                </Appearance>
                                                <LabelsAppearance DataFormatString="{0}" Position="Center" />
                                                <TooltipsAppearance BackgroundColor="White" DataFormatString="{0}" />
                                            </telerik:BarSeries>
                                        </Series>
                                        <XAxis DataLabelsField="Date">
                                            <MinorGridLines Visible="true"></MinorGridLines>
                                            <MajorGridLines Visible="true"></MajorGridLines>
                                        </XAxis>

                                        <YAxis>
                                            <MajorGridLines Color="#EFEFEF" Width="1" />
                                            <MinorGridLines Color="#F7F7F7" Width="1" />                                             
                                            <TitleAppearance Position="Center" RotationAngle="0" Text="No of Job By Transport Mode" >
                                                <TextStyle  FontFamily="Times New Roman"  Padding="10" Margin="10" FontSize="20" />
                                                </TitleAppearance>                                           
                                        </YAxis>
                                    </PlotArea>
                                    <Legend>
                                        <Appearance Position="Bottom" />
                                    </Legend>
                                </telerik:RadHtmlChart>--%>
                                <telerik:RadHtmlChart ID="RadHtmlChart2" runat="server" Width="650px"></telerik:RadHtmlChart>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
           
        <script>
        var $ = $telerik.$; 
        function exportRadHtmlChart() {
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(document.getElementById("RadHtmlChart1")));
            $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(document.getElementById("RadHtmlChart2")));
        }

    </script>
        <br />
    </form>
</body>
</html>

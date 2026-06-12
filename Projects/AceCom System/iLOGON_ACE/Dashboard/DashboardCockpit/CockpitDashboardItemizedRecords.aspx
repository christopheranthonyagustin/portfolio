<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CockpitDashboardItemizedRecords.aspx.cs" Inherits="iWMS.Web.Dashboard.DashboardCockpit.CockpitDashboardItemizedRecords" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="ItemizedTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="BrowseBtn" runat="server" CssClass="white" Text="Browse" Visible="false"
                                OnClick="BrowseBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />

                            <asp:Button ID="VLMTaskBrowseBtn" runat="server" CssClass="LongLabelWhite" Text="Browse" Visible="false"
                                OnClick="VLMTaskBrowseBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="CloseWindowBtn" runat="server" CssClass="LongLabelWhite" Text="Close Window"
                        OnClick="CloseWindowBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="LongLabelGreen" Text="Excel"
                        OnClick="ExportExcel" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                     <asp:Timer ID="Refreshtmr" Interval="5000" runat="server" OnTick="Refreshtmr_Tick" Enabled="false"></asp:Timer>
                        </td>
                    </tr>
                </table>
                &nbsp;
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                        <br />
                        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="false"
                                    AllowMultiRowSelection="false" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound"
                                    AllowPaging="true" AutoGenerateColumns="true" GridLines="None" Visible="false">
                                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>

                                <%--CurrentMission and HistoryMission are only for sp_DashboardIndicator_10--%>
                                <asp:Label Style="z-index: 0" ID="CurrentMissionLbl" runat="server" Visible="False" CssClass="pagetitle" Text="Current Mission" />
                                <br />
                                <br />
                                <telerik:RadGrid ID="CurrentMissionResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Metro" OnNeedDataSource="CurrentMissionResultDG_NeedDataSource" OnItemDataBound="CurrentMissionResultDG_ItemDataBound">
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="missionid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <ItemStyle></ItemStyle>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="missionid" SortExpression="missionid" HeaderText="MissionId"
                                                ItemStyle-Wrap="False" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MissionType" SortExpression="MissionType" HeaderText="MissionType"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PickUpPoint" SortExpression="PickUpPoint" HeaderText="PickUpPoint"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Current Description" SortExpression="Current Description" HeaderText="Current Description"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DropOffPoint" SortExpression="DropOffPoint" HeaderText="DropOffPoint"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusHTMLColourCode" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StartDate" SortExpression="StartDate" HeaderText="StartDate"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <br />
                                <asp:Label Style="z-index: 0" ID="HistoricalMissionLbl" runat="server" Visible="False" CssClass="pagetitle" Text="Historical Mission" />
                                <br />
                                <br />
                                <telerik:RadGrid ID="HistoricalMissionResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="false" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Metro" OnNeedDataSource="HistoricalMissionResultDG_NeedDataSource" OnItemDataBound="HistoricalMissionResultDG_ItemDataBound">
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="missionid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <ItemStyle></ItemStyle>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="missionid" SortExpression="missionid" HeaderText="MissionId"
                                                ItemStyle-Wrap="False" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MissionType" SortExpression="MissionType" HeaderText="MissionType"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="OrderNo" SortExpression="OrderNo" HeaderText="OrderNo"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PickUpPoint" SortExpression="PickUpPoint" HeaderText="PickUpPoint"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DropOffPoint" SortExpression="DropOffPoint" HeaderText="DropOffPoint"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                                                ItemStyle-Wrap="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusHTMLColourCode" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StartDate" SortExpression="StartDate" HeaderText="StartDate"
                                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <%--CurrentMission and HistoryMission are only for sp_DashboardIndicator_10--%>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Refreshtmr" EventName="Tick" />
                <asp:PostBackTrigger ControlID="VLMTaskBrowseBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

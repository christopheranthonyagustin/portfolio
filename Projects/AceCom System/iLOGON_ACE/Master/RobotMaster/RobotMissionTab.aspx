<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RobotMissionTab.aspx.cs" Inherits="iWMS.Web.Master.RobotMaster.RobotMissionTab" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="PutawayOverviewTab" Text="Putaway Mission Overview" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IssuanceOverviewTab" Text="Issuance Mission Overview" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TimeoutMissionsTab" Text="Timeout Missions Overview" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="PitOverRadPageView">
                <asp:Panel ID="Panel_PitOverview" runat="server">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">

                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <%--<Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />--%>
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="MissionId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="IssuanceOverviewRadPageView">
                <asp:Panel ID="IssuanceOverview" runat="server" Visible="false">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="Button2" CssClass="white" runat="server" OnClick="IssuanceMissionOverview_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="IssuanceMissionOverviewResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="IssuanceMissionOverviewResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="MissionId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TimeoutMissionsRadPageView">
                <asp:Panel ID="TimeoutMissions" runat="server" Visible="false">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="Button1" CssClass="white" runat="server" OnClick="TimeoutMissions_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="TimeoutMissionsResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="TimeoutMissionsResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="MissionId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

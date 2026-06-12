<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneOccupancyTab.aspx.cs" Inherits="iWMS.Web.Master.Zone.ZoneOccupancyTab" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

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
        <iWMS:ModalPopup ID="ModalPopup" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="SiteOverview" Text="Site Overview" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PitOverviewTab" Text="Pit Overview" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="VLMOverviewTab" Text="VLM Overview" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView ID="SiteOverRadPageView" runat="server">
                <asp:Panel ID="Panel_SiteOverview" runat="server">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="SiteOverview_RefreshBtn" CssClass="white" runat="server" OnClick="SiteOverview_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="SiteOverview_ExcelBtn" CssClass="green" runat="server" OnClick="SiteOverview_ExcelBtn_Click"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="SiteOverviewResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="SiteOverviewResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="PitOverRadPageView">
                <asp:Panel ID="Panel_PitOverview" runat="server">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="Button1" CssClass="green" runat="server" OnClick="ExportExcelForPitOverview"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="VLM">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="true" ID="Paper" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="VLM Summary"
                                            OnClick="PitOverPaper_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <asp:Panel ID="Panel_VLMSummary" runat="server" Visible="false">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="VLMSummary_RefreshBtn" CssClass="white" runat="server" OnClick="VLMSummary_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="VLMSummaryBackBtn" CssClass="white" runat="server" OnClick="VLMSummaryBackBtn_Click" Text="Back" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="ExcelImgVLMSummaryBtn" CssClass="green" runat="server" OnClick="ExportExcelForVLMSummary"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG_VLMSummary" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="ResultDG_VLMSummary_NeedDataSource" DataKeyNames="VLM">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="VLM">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="true" ID="Paper" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="VLM Location"
                                            OnClick="PaperVLMSummary_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <asp:Panel ID="Panel_VLMLocation" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="VLMLocation_RefreshBtn" CssClass="white" runat="server" OnClick="VLMLocation_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="VLMLocationBackBtn" CssClass="white" runat="server" OnClick="VLMLocationBackBtn_Click" Text="Back" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ExcelVLMLocationBtn" CssClass="green" runat="server" OnClick="ExportExcelForVLMLocation"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="ResultDG_VLMLocation" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="ResultDG_VLMLocation_NeedDataSource" OnItemDataBound="ResultDG_VLMLocation_ItemDataBound" OnColumnCreated="ResultDG_VLMLocationColumnCreated">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="VLMLocationDetailImgBtn" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="VLM Location"
                                            OnClick="VLMLocationDetailImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="VLMOverviewRadPageView">
                <asp:Panel ID="VLMOverviewSummaryPanel" runat="server" Visible="false">
                    <table border="0" cellpadding="2" cellspacing="2" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="Button2" CssClass="white" runat="server" OnClick="VLMOverviewSummary_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                            <td>
                                <asp:Button ID="Button4" CssClass="green" runat="server" OnClick="ExportExcelForVLMOverviewSummary"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="VLMOverviewSummaryResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="VLMOverviewSummaryResultDG_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="VLM">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="true" ID="Paper" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="VLM Location"
                                            OnClick="PaperVLMOverviewSummary_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <asp:Panel ID="VLMOverviewLocationPanel" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="Button5" CssClass="white" runat="server" OnClick="VLMOverviewLocation_RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="Button6" CssClass="white" runat="server" OnClick="VLMOverviewLocationBackBtn_Click" Text="Back" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="Button7" CssClass="green" runat="server" OnClick="ExportExcelForVLMOverviewLocation"
                                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <telerik:RadGrid ID="VLMOverviewLocationResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                        EnableLinqExpressions="false" Skin="Metro" OnNeedDataSource="VLMOverviewLocationResultDG_NeedDataSource" OnItemDataBound="VLMOverviewLocationResultDG_ItemDataBound" OnColumnCreated="VLMOverviewLocationResultDG_ColumnCreated">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="true" ID="VLMOverviewLocationDetailImgBtn" ImageUrl="../../image/detail.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="VLM Overview Location"
                                            OnClick="VLMOverviewLocationDetailImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

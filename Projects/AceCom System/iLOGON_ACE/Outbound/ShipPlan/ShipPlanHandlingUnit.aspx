<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipPlanHandlingUnit.aspx.cs" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanHandlingUnit" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShipPlan HandlingUnit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            function CheckAll(id) {
                var masterTable = $find("<%= InShipPlanResultDG.ClientID %>").get_masterTableView();
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

            function CheckALLNotInShipPlanResultDG(id) {
                var masterTable = $find("<%= NotInShipPlanResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("NotInShipPlanResultDGCHKObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("NotInShipPlanResultDGCHKObjective").checked = false;
                    }
                }
            }

            function CheckALLNotInShipPlanHUContentResultDG(id) {
                var masterTable = $find("<%= HUContentNotInShipPlanResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("HUContentNotInShipPlanchk").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("HUContentNotInShipPlanchk").checked = false;
                    }
                }
            }

            function CheckALLInShipPlanHUContentResultDG(id) {
                var masterTable = $find("<%= HUContentInShipPlanResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("HUContentInShipPlanchk").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("HUContentInShipPlanchk").checked = false;
                    }
                }
            }

        </script>
    </telerik:RadCodeBlock>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="Refreshbtn" runat="server" CssClass="white" Text="Refresh"
                        OnClick="Refreshbtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <br />
                </td>
            </tr>

        </table>
        <br />
        <div>
            <telerik:RadTabStrip runat="server" ID="RadTabStrip_InShipPlan" MultiPageID="RadMultiPage1" AutoPostBack="true"
                CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_InShipPlan_TabClick">
                <Tabs>
                    <telerik:RadTab Id="RadTab1" Text="In this Ship Plan" Value="0" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab Id="CageContentInShipPlan" Text="Cage Content" Value="10" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <br />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" ID="RadPageView1" Height="500px">
                    <asp:Button ID="RemoveCageBtn" runat="server" CssClass="white" Text="Remove Cage" Font-Size="11px"
                        OnClick="RemoveHUBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button4" runat="server" CssClass="white" Text="Refresh"
                        OnClick="CageContentRefreshbtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />

                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                    <asp:UpdatePanel ID="InShipPlanUpdatePanel" runat="server">
                        <ContentTemplate>

                            <telerik:RadGrid ID="InShipPlanResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" OnItemDataBound="InShipPlanResultDG_ItemDataBound"
                                AllowMultiRowSelection="true" OnNeedDataSource="InShipPlanResultDG_NeedDataSource" AllowFilteringByColumn="True" Height="200px" OnColumnCreated="InShipPlanResultDG_ColumnCreated" OnPreRender="ResultDG_PreRender"
                                AllowPaging="true">
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="HUId" TableLayout="Fixed" Name="InShipPlanGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="InShipPlanDeleteIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ID="InShipPlanDelete" ImageUrl="../../image/bin.gif" ToolTip="Remove HU"
                                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                                    OnClick="InShipPlanDelete_Click" CausesValidation="False"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="200px" ID="HUContentRadPageView">
                    <asp:Button ID="Button5" runat="server" CssClass="white" Text="Refresh"
                        OnClick="HUContentInShipPlanRefreshbtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button1" CssClass="CircleBtn" runat="server" OnClick="CageContentSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                    <telerik:RadGrid ID="HUContentInShipPlanResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" OnItemDataBound="HUContentInShipPlanResultDG_ItemDataBound"
                        AllowMultiRowSelection="true" OnNeedDataSource="HUContentInShipPlanResultDG_NeedDataSource" AllowFilteringByColumn="True" OnColumnCreated="HUContentInShipPlanResultDG_ColumnCreated" Height="200px" OnPreRender="HUContentInShipPlanResultDG_PreRender"
                        AllowPaging="true">
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="5" DataKeyNames="HUId" TableLayout="Fixed" Name="InShipPlanContentHUGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckALLInShipPlanHUContentResultDG(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="HUContentInShipPlanchk" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip_NotInShipPlan" MultiPageID="RadMultiPage2" AutoPostBack="true" OnTabClick="RadTabStrip_NotInShipPlan_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Not in any Ship Plan" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="HUContentAssociateNotBL" Text="Cage Content" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:HiddenField ID="NetWtHiddenValue" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="400px">
                <asp:Button ID="IncludeCageBtn" runat="server" CssClass="white" Text="Include Cage"
                    OnClick="IncludeHUBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <asp:Button ID="Button3" runat="server" CssClass="white" Text="Refresh"
                    OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <asp:Button ID="SwapBtn2" CssClass="CircleBtn" runat="server" OnClick="NotInShipPlanSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <%--                <br />--%>
                <asp:UpdatePanel ID="NotInShipPlanUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="NotInShipPlanResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="NotInShipPlanResultDG_NeedDataSource" AllowFilteringByColumn="false"
                            AllowPaging="true" AutoGenerateColumns="true" GridLines="None" OnColumnCreated="NotInShipPlanResultDG_ColumnCreated" OnPreRender="NotInShipPlanResultDG_PreRender">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="HUId" TableLayout="Fixed" Name="NotInShipPlanGrid">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckALLNotInShipPlanResultDG(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="NotInShipPlanResultDGCHKObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="NotInShipPlanDeleteIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="NotInShipPlanAdd" ImageUrl="../../image/add.png"
                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" ToolTip="Include HU"
                                                OnClick="NotInShipPlanAdd_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <%-- <telerik:GridBoundColumn UniqueName="HUNO" HeaderText="HUNO" AllowFiltering="false" DataField="HUNO" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="HUType" HeaderText="HUType" AllowFiltering="false" DataField="HUType" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CreatedOn" SortExpression="CreatedOn" HeaderText="CreatedOn" ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="HUId" DataField="HUId" Display="false"></telerik:GridBoundColumn>--%>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="HUContentNotInShipPlan">
                <asp:Button ID="Button6" runat="server" CssClass="white" Text="Refresh"
                    OnClick="HUContentNotInShipPlanRefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <asp:Button ID="Button2" CssClass="CircleBtn" runat="server" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" OnClick="HUContentNotInShipSwapBtn_Click" />
                <telerik:RadGrid ID="HUContentNotInShipPlanResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" OnItemDataBound="HUContentNotInShipPlanResultDG_ItemDataBound"
                    AllowMultiRowSelection="true" OnNeedDataSource="HUContentNotInShipPlanResultDG_NeedDataSource" AllowFilteringByColumn="True" OnColumnCreated="HUContentNotInShipPlanResultDG_ColumnCreated" OnPreRender="HUContentNotInShipPlanResultDG_PreRender"
                    AllowPaging="true">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="HUId" TableLayout="Fixed" Name="NotInShipPlanContentHUGrid">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckALLNotInShipPlanHUContentResultDG(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="HUContentNotInShipPlanchk" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

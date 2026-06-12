<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundSortingUnSorted.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundSorting.OutboundSortingUnSorted" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script language="javascript" type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="UnsortedTab" Text="Unsorted" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="OrderItemTab" Text="Order Item" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManageRobotMissionTab" Text="Manage Robot Mission" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LoadRobotForIssuanceTab" Text="Load Robot For Issuance" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="650px" ID="UnsortedRadPageView">
                <asp:Panel ID="FormCtrlPanel" runat="server">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="FormCtl" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel ID="ButtonPanel" runat="server">
                    <table>
                        <tr>
                            <td>
                                <br />
                                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="200" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="650px" ID="OrderItemRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="650px" ID="ManageRobotMissionRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="650px" ID="LoadRobotForIssuanceRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

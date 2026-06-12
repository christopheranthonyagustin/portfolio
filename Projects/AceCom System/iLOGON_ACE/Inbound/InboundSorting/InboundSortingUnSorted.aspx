<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundSortingUnSorted.aspx.cs" Inherits="iWMS.Web.Inbound.InboundSorting.InboundSorting" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UnSorted @ Inbound Sorting</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Unsorted" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Pending Putaway" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Ready for Pick-up" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Manage Robot Mission" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Load Robot For Putaway" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="680px" ID="UnsortedRadPageView">
                <asp:Panel ID="FormCtrlPanel" runat="server">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="FormCtl" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server" />
                </asp:Panel>

                <asp:Panel ID="ButtonPanel" runat="server">
                    <table>
                        <tr>
                            <td>
                                <br />
                                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click"
                                    Text="Refresh" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="SortBtn" CssClass="white" runat="server" OnClick="SortBtn_Click"
                                    Text="Sort" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" Visible="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                        <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" PageSize="200"
                        DataKeyNames="ReceiptId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30">
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
            <telerik:RadPageView runat="server" Height="650px" ID="PendingPutawayRadPageView" ContentUrl="InboundSortingPendingPutaway.aspx">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="650px" ID="ReadyforPickupRadPageView" ContentUrl="InboundSortingReadyForPickUp.aspx">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="650px" ID="MissionRobotMissionRadPageView" ContentUrl="InboundSortingManageRobotMission.aspx">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="650px" ID="LoadRobotForPutawayRadPageView" ContentUrl="InboundSortingLoadRobotForPutaway.aspx">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

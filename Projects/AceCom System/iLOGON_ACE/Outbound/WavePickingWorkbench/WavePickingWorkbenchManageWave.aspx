<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WavePickingWorkbenchManageWave.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.WavePickingWorkbenchManageWave" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Wave @ WavePackingWorkbenchPickingPool</title>
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function SelectAll(invoker) {
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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="WaveSummary" Text="Wave Summary" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SKUSummary" Text="SKU Summary" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="WaveSummaryRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="AssignPickerBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Picker"
                                OnClick="AssignPickerBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="AssignPickCartBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Pick Cart"
                                OnClick="AssignPickCartBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="FormCtrl2" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ViewPickingBtn" runat="server" CssClass="white" Text="View Picking"
                                OnClick="ViewPickingBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="StartPickingBtn" runat="server" CssClass="white" Text="Start Picking"
                                OnClick="StartPickingBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="EndPickingBtn" runat="server" CssClass="white" Text="End Picking"
                                OnClick="EndPickingBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UndoWaveBtn" runat="server" CssClass="white" Text="Undo Wave"
                                OnClick="UndoWaveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PickTicketBtn" runat="server" CssClass="blue" Text="Pick Ticket"
                                OnClick="PickTicketBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M"
                                 OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadWindow ID="Window" runat="server" VisibleOnPageLoad="true" Modal="true" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"
                                Width="1200" Height="630" Top="0" Left="0" Visible="false">
                            </telerik:RadWindow>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnPreRender="ResultDG_PreRender">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="SelectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="800px" ID="SKUSummaryRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

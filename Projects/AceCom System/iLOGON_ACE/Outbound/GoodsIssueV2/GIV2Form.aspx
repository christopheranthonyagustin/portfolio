<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV2Form.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV2.GIV2Form" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Goods Issue V2 Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <script type="text/javascript">
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
    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            OnTabClick="RadTabStrip_TabClick" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shipping" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SKULine" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PickTask" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Return" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="InvHistory" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="700" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td><br />
                    <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                        <Items>
                            <telerik:RadMenuItem Text="Print">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <div style="height: 15px"></div>
                <asp:Panel ID="GRMainPanel" runat="server">
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Enabled="False" OnClientClick="disableBtn(this.id,true)"
                        UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button>
                    <asp:Button ID="AllocatedImgBtn" runat="server" Text="Allocate" OnClick="AllocatedImgBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" CausesValidation="false" UseSubmitBehavior="false" CssClass="white"
                        ToolTip="Allocate Selected Issue(s)" />

                    <asp:Button ID="PrintPTBtn" runat="server" Text="Pick Ticket" OnClick="PrintPTBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print Pick Ticket" />

                    <asp:Button ID="PrintDOBtn" runat="server" Text="DO" OnClick="PrintDOBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print DO" />

                    <asp:Button ID="PrintDO2Btn" runat="server" Text="DO (Stamp)" OnClick="PrintDO2Btn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="blue" ToolTip="Print DO2 (Stamp)" />

                    <asp:Button ID="PrintDOTotalPalletBtn" runat="server" Text="DO &nbsp; (TotalPallet)" OnClick="PrintDOTotalPalletBtn_Click"
                        OnClientClick="disableBtn(this.id,false)"
                        UseSubmitBehavior="false" CssClass="LongLabelBlue" ToolTip="Print DO (TotalPallet)" />

                    <asp:Button ID="ReleaseToOpsBtn" runat="server" Text="Release to &nbsp;&nbsp;&nbsp;Ops&nbsp;&nbsp;&nbsp;" OnClick="ReleaseToOpsBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />

                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>

                    <br />
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <asp:Panel ID="SKULinePanel" runat="server">
                    <telerik:RadTabStrip runat="server" ID="RadTabStripSKULine" CausesValidation="false" MultiPageID="RadMultiPageSKULine"
                        AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStripSKULine_TabClick">
                        <Tabs>
                            <telerik:RadTab Text="Line" Value="0" runat="server">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Inventory" Value="100" runat="server">
                            </telerik:RadTab>
                            <telerik:RadTab Text="UploadLot" Value="200" runat="server">
                            </telerik:RadTab>
                            <telerik:RadTab Text="SerialNo" Value="250" runat="server">
                            </telerik:RadTab>
                            <telerik:RadTab Text="BreakBulk" Value="300" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPageSKULine" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" Height="700px" ID="LineRadPageView">
                            <table cellspacing="10" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td valign="middle">
                                        <div style="float: left">
                                            <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                                <ContentTemplate>
                                                    <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                                        CausesValidation="false" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="NewBtn" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                           
                            <telerik:RadGrid ID="ResultDGSKULine" runat="server" AutoGenerateColumns="false" GridLines="None"
                                OnNeedDataSource="ResultDGSKULine_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true" RenderMode="Lightweight"
                                Skin="Metro" OnItemDataBound="ResultDGSKULine_ItemDataBound" OnBatchEditCommand="ResultDGSKULine_BatchEditCommand">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Scrolling ScrollHeight="550px" AllowScroll="true" UseStaticHeaders="true" />
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Width="180%" CommandItemDisplay="Top" EditMode="Batch">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderTemplate>
                                                <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="MassUnallocateChkbx" runat="server" />
                                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                    onclick="return confirm('Confirm delete?')" onserverclick="PickTaskInGrid_DeleteClick"
                                                    runat="server">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                runat="server"></a>
                                                </a>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                            <HeaderTemplate>
                                                S/No
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="skucode" UniqueName="skucode" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" HeaderStyle-Width="220px" ItemStyle-Width="220px"
                                            SortExpression="skudescr" UniqueName="skudescr" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px"
                                            SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px"
                                            SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridNumericColumn DataField="qty" HeaderStyle-Width="90px" ItemStyle-Width="90px" HeaderText="Qty"
                                            SortExpression="qty" UniqueName="qty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                        </telerik:GridNumericColumn>
                                        <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                            SortExpression="loccode" UniqueName="loccode" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="ReceiptDate" DataField="rcdate" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                            SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" AllowFiltering="true" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                            SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" AllowFiltering="true" HeaderStyle-Width="170px" ItemStyle-Width="170px"
                                            SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="LotRemarks" DataField="lotremarks" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="lotremarks" UniqueName="lotremarks" Reorderable="true" DataFormatString="&nbsp;{0}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="adduser" UniqueName="adduser" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px"
                                            SortExpression="edituser" UniqueName="edituser" Reorderable="true" ReadOnly="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="skuid" UniqueName="skuid" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn Display="False" DataField="isid" UniqueName="IsId" />
                                        <telerik:GridBoundColumn Display="False" DataField="isdtid" UniqueName="ISDTId" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
                        <telerik:RadPageView runat="server" ID="UploadLotRadPageView" Height="500px" />
                        <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="500px" />
                        <telerik:RadPageView runat="server" ID="BreakBulkRadPageView" Height="700px"/>
                    </telerik:RadMultiPage>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ShippingRadPageView">
                <br />
                &nbsp;<asp:Button ID="UpdateBtn2" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,false)"
                    UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button><br />
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl_Shipping" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SKULineRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="PickTaskRadPageView" />
            <telerik:RadPageView runat="server" Height="480px" ID="ChargesRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ReturnRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="InvHistoryRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

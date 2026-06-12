<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundDeliveryHead.aspx.cs" Inherits="iWMS.Web.Inbound.InboundDelivery.InboundDeliveryHead" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>InboundDeliveryListHead</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                                &nbsp;
                                <asp:Button ID="FinalizeBtn" runat="server" Text="Finalize" OnClick="FinalizeBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                                &nbsp;
                                <asp:Button ID="SendConfirmationBtn" CssClass="LongLabelWhite" runat="server" OnClick="SendConfirmationBtn_Click" Text="Send Confirmation"
                                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="PrintTUNOBtn" class="LongLabelBlue" runat="server" OnClick="PrintTUNOBtn_Click" Visible="true"
                                    Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TUNO Label" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="PrintReceiptNoteBtn" class="LongLabelBlue" runat="server" OnClick="PrintReceiptNoteBtn_Click" Visible="true"
                                    Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Receipt Note" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" style="float:right"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" Visible="false" ID="InboundDeliveryEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Inbound Delivery"
                                        OnClick="InboundDeliveryEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="PutawayDoneLbl" runat="server"></asp:Label>
                                    <asp:Label ID="GRConfirmDoneLbl" runat="server"></asp:Label>
                                    <asp:Label ID="GRConfirmErrorLbl" runat="server"></asp:Label>
                                    <asp:Label ID="GRConfirmSentLbl" runat="server" />

                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account Name" Display="false"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Receipt No" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="Order No" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" SortExpression="ModifiedOn" HeaderText="ModifiedOn" AllowFiltering="false">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="RCH_SKUCode" SortExpression="RCH_SKUCode" HeaderText="SKU Code" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="RCH_SKUDescr" SortExpression="RCH_SKUDescr" HeaderText="SKU Description" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="BatchNo" SortExpression="BatchNo" HeaderText="BatchNo" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="MaterialDoc" SortExpression="MaterialDoc" HeaderText="MaterialDoc" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ReceivedQty" SortExpression="ReceivedQty" HeaderText="Received Qty" AllowFiltering="false">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="VendorCode" SortExpression="VendorCode" HeaderText="Vendor Code" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Exref1" SortExpression="Exref1" HeaderText="Delivery Note" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                                AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="StorageType" SortExpression="StorageType" HeaderText="Storage Type" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="MatDocYear" SortExpression="MatDocYear" HeaderText="MatDocYear" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="MatDocItem" SortExpression="MatDocItem" HeaderText="MatDocItem" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ReceivedQtyUOM" SortExpression="ReceivedQtyUOM" HeaderText="UOM" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="acid" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn SortExpression="PutawayDone" DataField="PutawayDone" Display="false">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="GRConfirmDone" Display="false">
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="GRConfirmError" Display="false">
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="GRConfirmSent" Display="false">
                             </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="CreatedOn" SortExpression="CreatedOn" HeaderText="Created On" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

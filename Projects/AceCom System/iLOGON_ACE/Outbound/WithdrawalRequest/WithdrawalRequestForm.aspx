<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WithdrawalRequestForm.aspx.cs" Inherits="iWMS.Web.Outbound.WithdrawalRequest.WithdrawalRequestForm" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>IssueForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>               
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="MainInfoRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,true)"
                                        UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click" ValidateRequestMode="Enabled"></asp:Button>
                                    &nbsp;
                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="UpdateBtn" />
                    </Triggers>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip1_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="LineItemTab" Text="Line Item" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="PickTaskTab" Text="Pick Task" Value="50" runat="server">
                        </telerik:RadTab>
                         <telerik:RadTab Id="InventoryTab" Text="Inventory" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="600px" ID="WithdrawalRequestDetlRadPageView">

                        <table cellspacing="10" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td valign="middle">&nbsp;
                            &nbsp;
                            <div style="float: left">
                                <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                    <ContentTemplate>
                                        <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                                        <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>

                                        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    </ContentTemplate>
                                    <Triggers>

                                        <asp:PostBackTrigger ControlID="MsgPopup" />
                                        <asp:PostBackTrigger ControlID="NewBtn" />
                                        <asp:PostBackTrigger ControlID="EditBtn" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                                </td>
                            </tr>
                        </table>
                        <asp:UpdateProgress ID="updateProgress" runat="server">
                            <ProgressTemplate>
                                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                                </div>
                                <div id="LoaderPopup">
                                    <a id="loader"></a>
                                    <a id="text">We are processing your request ...</a>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="70%"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="true"
                            Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling ScrollHeight="200px" AllowScroll="true" UseStaticHeaders="true" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderTemplate>
                                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                                        </HeaderTemplate>
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="MassUnallocateChkbx" runat="server" />
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onclick="return confirm('Confirm delete Issue Detail?')" onserverclick="IsDetail_Delete"
                                                runat="server"></a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false">
                                        <HeaderTemplate>
                                            No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="ExLine" DataField="exline" AllowFiltering="false"
                                        SortExpression="exline" UniqueName="exline" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Expected" DataField="expecteduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Allocated" DataField="allocateduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="allocateduomqty" UniqueName="allocateduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Picked" DataField="pickeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="pickeduomqty" UniqueName="pickeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Packed" DataField="packeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="packeduomqty" UniqueName="packeduomqty" Reorderable="true" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Shipped" DataField="shippeduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="shippeduomqty" UniqueName="shippeduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Reason Code" DataField="ReasonCode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="ReasonCode" UniqueName="ReasonCode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="rcdate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Part No" DataField="lot9" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 7" DataField="lot7" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 2" DataField="lot2" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 3" DataField="lot3" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot 8" DataField="lot8" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TuNo1" DataField="tuno1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="tuno1" UniqueName="tuno1" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TuNo2" DataField="tuno2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="tuno2" UniqueName="tuno2" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="OutboundPermitNo" DataField="OutboundPermitNo" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="OutboundPermitNo" UniqueName="OutboundPermitNo" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="VAS" DataField="vasdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="vasdescr" UniqueName="vasdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Remark1" DataField="rem1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Remark2" DataField="rem2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="rem2" UniqueName="rem2" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Shelf Life" DataField="shelflife" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="shelflife" UniqueName="shelflife" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExtInvNo" DataField="extinvno" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="extinvno" UniqueName="extinvno" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExtPoNo" DataField="extpono" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="extpono" UniqueName="extpono" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExtRef" DataField="extrefno" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="extrefno" UniqueName="extrefno" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ToLot6" DataField="ToLot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="ToLot6" UniqueName="ToLot6" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExtSKU" DataField="extskucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="extskucode" UniqueName="extskucode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExtStatus" DataField="extstatus" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="extstatus" UniqueName="extstatus" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="skuid" UniqueName="skuid" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="False" DataField="shdate" SortExpression="shdate" />
                                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                                    <telerik:GridBoundColumn Display="False" DataField="bom_sku" SortExpression="bom_sku" />
                                    <telerik:GridBoundColumn Display="False" DataField="IsType" SortExpression="IsType" />
                                    <telerik:GridBoundColumn Display="False" DataField="ApproveAllocateStatus" SortExpression="ApproveAllocateStatus" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PickTaskRadPageView" Height="700px" />
                    <telerik:RadPageView runat="server" ID="InventoryRadPageView" Height="700px" />
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

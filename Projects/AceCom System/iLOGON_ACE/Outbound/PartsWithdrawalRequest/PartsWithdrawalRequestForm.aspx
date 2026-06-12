<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartsWithdrawalRequestForm.aspx.cs" Inherits="iWMS.Web.Outbound.PartsWithdrawalRequest.PartsWithdrawalRequestForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Parts Withdrawal Request</title>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
                                   <asp:Button ID="CompleteOrderBtn" runat="server" Text="Complete Order" OnClick="CompleteOrderBtn_Click" CausesValidation="false"
                                       OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
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
                        <asp:PostBackTrigger ControlID="CompleteOrderBtn" />
                    </Triggers>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7">
                    <Tabs>
                        <telerik:RadTab Id="LineItemTab" Text="Line Item" Value="0" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="600px" ID="WithdrawalRequestDetlRadPageView">

                        <table cellspacing="10" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td valign="middle">
                                    <div style="float: left">
                                        <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="always">
                                            <ContentTemplate>
                                                <asp:Button ID="BulkAddBtn" CssClass="white" runat="server" OnClick="BulkAddBtn_Click" Text="BulkAdd"
                                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                                &nbsp;
                                                <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                                                &nbsp;&nbsp;
                                                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BulkAddBtn" />
                                                <asp:PostBackTrigger ControlID="NewBtn" />
                                                <asp:PostBackTrigger ControlID="EditBtn" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
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
                                    <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SKU Description" DataField="skudescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="UOM" DataField="uomdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="uomdescr" UniqueName="uomdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Quantity" DataField="expecteduomqty" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="expecteduomqty" UniqueName="expecteduomqty" Reorderable="true"
                                        DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="loccode" UniqueName="loccode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                        SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
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
                                    <telerik:GridBoundColumn HeaderText="Rcv Date" DataField="rcdate" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                        SortExpression="rcdate" UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
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
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

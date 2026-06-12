<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesInvoiceHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesInvoice.DistributionSalesInvoiceHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<html>
<head runat="server">
    <title>Result @ Delivery Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                 <table cellspacing="2" cellspacing="2">
                     <tr>
                         <td>
                             <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                 OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                         </td>
                         <td>
                             <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                 OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                         </td>
                         <td>
                             <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                 OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;           
                         </td>
                         <td>
                             <asp:Button ID="ConfirmButton" runat="server" CssClass="white" Text="Confirm"
                                 OnClick="ConfirmButton_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                             &nbsp;
                         </td>
                         <td>
                             <asp:Button ID="InvoiceBtn" runat="server" CssClass="blue" Text="Invoice"
                                 OnClick="InvoiceBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                             &nbsp;
                         </td>
                         <td>
                             <asp:Button ID="PostInvBtn" runat="server" CssClass="white" Text="Post"
                                 OnClick="PostInvBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                             &nbsp;
                         </td>
                         <td>
                             <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                         </td>
                         <td align="right">
                             <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                         </td>
                     </tr>
                 </table>

                <table>

                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesInvoiceId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceNo" UniqueName="SalesInvoiceNo" SortExpression="SalesInvoiceNo" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesInvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceDate" UniqueName="SalesInvoiceDate" SortExpression="SalesInvoiceDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesInvoiceDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceReferenceNo" UniqueName="SalesInvoiceReferenceNo" SortExpression="SalesInvoiceReferenceNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesInvoiceReferenceNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="CustomerName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderDate" UniqueName="DeliveryOrderDate" SortExpression="DeliveryOrderDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="DeliveryOrderDate" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderNo" UniqueName="SalesOrderNo" SortExpression="SalesOrderNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesOrderNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderNo " UniqueName="DeliveryOrderNo" SortExpression="DeliveryOrderNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="DeliveryOrderNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesReturnNo" UniqueName="SalesReturnNo" SortExpression="SalesReturnNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesReturnNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderDate" UniqueName="SalesOrderDate" SortExpression="SalesOrderDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="SalesOrderDate" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceStatusDescr" UniqueName="SalesInvoiceStatusDescr" SortExpression="SalesInvoiceStatusDescr" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                HeaderText="ModifiedOn" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" ShowFilterIcon="true" AllowFiltering="false"
                                HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceStatus" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmApproveCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

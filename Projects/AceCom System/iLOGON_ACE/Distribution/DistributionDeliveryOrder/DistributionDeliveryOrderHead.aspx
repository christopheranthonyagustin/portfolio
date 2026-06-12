<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionDeliveryOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionDeliveryOrder.DistributionDeliveryOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Delivery Order Head</title>
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
                <telerik:RadTab Text="Search Result" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                &nbsp;
                <table style="width: 100%; height: 10px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="DOBySOBtn" runat="server" CssClass="white" Text="DOBySO"
                                OnClick="DOBySOBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ConfirmButton" runat="server" CssClass="white" Text="Confirm"
                                OnClick="ConfirmButton_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;                            
                            <asp:Button ID="DeliveryOrderBtn" runat="server" CssClass="LongLabelBlue" Text="Delivery Order"
                                OnClick="DeliveryOrderBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;           
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;           
                             <asp:Button ID="GenInvoiceBtn" runat="server" CssClass="LongLabelWhite" Text="Populate Sales Invoice"
                                 OnClick="GenInvoiceBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PackingListBtn" runat="server" class="green" Text="Packing List"
                                OnClick="PackingListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Packing List" />
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                        </td>
                        <td align="right">
                            <asp:Button ID="CircleBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="DeliveryOrderId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderNo" UniqueName="DeliveryOrderNo" SortExpression="DeliveryOrderNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="DeliveryOrderNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DeliveryOrderDate" UniqueName="DeliveryOrderDate" SortExpression="DeliveryOrderDate"
                                HeaderText="DeliveryOrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DeliveryOrderReferenceNo" UniqueName="DeliveryOrderReferenceNo" SortExpression="DeliveryOrderReferenceNo" AllowFiltering="false"
                                HeaderText="DeliveryOrderReferenceNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CustomerPoNumber" UniqueName="CustomerPoNumber" SortExpression="CustomerPoNumber" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="CustomerPoNumber">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="ShipToCode" SortExpression="ShipToCode" AllowFiltering="false"
                                HeaderText="ShipToCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToAddress" UniqueName="ShipToAddress" SortExpression="ShipToAddress" AllowFiltering="false"
                                HeaderText="ShipToAddress" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCountryCode" UniqueName="ShipToCountryCode" HeaderText="ShipToCountryCode" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceNo" UniqueName="SalesInvoiceNo" HeaderText="InvoiceNo" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceDate" UniqueName="SalesInvoiceDate" SortExpression="SalesInvoiceDate"
                                HeaderText="InvoiceDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderStatusDescr" UniqueName="DeliveryOrderStatusDescr" SortExpression="DeliveryOrderStatusDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryorderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryorderNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>
    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>

</body>
</html>

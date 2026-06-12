<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseOrder.DistributionPurchaseOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Purchase Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

    </script>

    <script type="text/javascript">
        function OnClientItemBlurMenu(sender, args) {
            setTimeout(function () {
                sender.close(true);
            }, 200);
        }

        function OnClientMouseOverHandler(sender, eventArgs) {
            if (eventArgs.get_item().get_parent() == sender) {
                sender.set_clicked(false);
            }
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>

    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <br />
                <div>
                    &nbsp;
                <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                    OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="POByPRBtn" runat="server" CssClass="white" Text="POByPR"
                    OnClick="POByPRBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;                
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="ApproveBtn" runat="server" CssClass="white" Text="Approve"
                    OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="RejectBtn" runat="server" CssClass="white" Text="Reject"
                    OnClick="RejectBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="PurchaseOrderBtn" runat="server" CssClass="LongLabelBlue" Text="Purchase Order"
                    OnClick="PurchaseOrderBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                 <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                     OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                    OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="PopulateGRBtn" CssClass="LongLabelWhite" runat="server" OnClick="PopulateGRBtn_Click" Text="Populate Goods Receive"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    <table style="float: right">
                        <tr>
                            <td>
                                <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                            </td>
                            <td>
                                <asp:Button ID="ApproveConfirmBtn" Text="" Style="display: none;" OnClick="ApproveConfirmBtn_Click" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="RejectConfirmBtn" Text="" Style="display: none;" OnClick="RejectConfirmBtn_Click" runat="server" />
                            </td>
                            <td align="right">
                                <asp:Button ID="CircleBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            </td>
                            <td>
                                <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                            </td>
                        </tr>
                    </table>
                </div>
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="PurchaseOrderId">
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
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntityCode" HeaderText="Entity" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderNo" UniqueName="PurchaseOrderNo" SortExpression="PurchaseOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="PurchaseOrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderDate" UniqueName="PurchaseOrderDate" SortExpression="PurchaseOrderDate"
                                HeaderText="PurchaseOrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="ShipToCode" SortExpression="ShipToCode" AllowFiltering="true"
                                HeaderText="ShipToCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToName" UniqueName="ShipToName" SortExpression="ShipToName" AllowFiltering="true"
                                HeaderText="ShipToName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToAddress" UniqueName="ShipToAddress" SortExpression="ShipToAddress" AllowFiltering="true"
                                HeaderText="ShipToAddress" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" HeaderText="Department" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SupplierCode" UniqueName="SupplierCode" SortExpression="SupplierCode" AllowFiltering="true"
                                HeaderText="SupplierCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SupplierName" UniqueName="SupplierName" SortExpression="SupplierName" AllowFiltering="true"
                                HeaderText="SupplierName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCountryCode" UniqueName="ShipToCountryCode" HeaderText="ShipToCountryCode" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WarehouseCode" UniqueName="WarehouseCode" HeaderText="WarehouseCode" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SubTotal" UniqueName="SubTotal" SortExpression="SubTotal"
                                HeaderText="SubTotal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaxAmt" UniqueName="TaxAmt" SortExpression="TaxAmt"
                                HeaderText="TaxAmt" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalAmt" UniqueName="TotalAmt" SortExpression="TotalAmt"
                                HeaderText="TotalAmt" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Notes">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderStatusDescr" UniqueName="PurchaseOrderStatusDescr" SortExpression="PurchaseOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveStatusDescr" UniqueName="ApproveStatusDescr" SortExpression="ApproveStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ApproveStatus">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveBy" UniqueName="ApproveBy" SortExpression="ApproveBy" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ApproveBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveOn" UniqueName="ApproveOn" SortExpression="ApproveOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ApproveOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveNo" UniqueName="GoodsReceiveNo" SortExpression="GoodsReceiveNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="GoodsReceiveNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseOrderNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ApproveStatus" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>

</body>
</html>

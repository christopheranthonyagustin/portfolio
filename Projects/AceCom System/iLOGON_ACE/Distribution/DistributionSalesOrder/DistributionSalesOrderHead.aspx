<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Sales Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script type="text/javascript">
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
                <table style="width: 100%; height: 10px">
                    <tr>
                        <td>
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp;   
                            <asp:Button ID="SalesOrderBtn" runat="server" CssClass="LongLabelBlue" Text="Sales Order"
                                OnClick="SalesOrderBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AllocateBtn" runat="server" CssClass="white" Text="Allocate"
                                OnClick="AllocateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                                OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PopulateDO" runat="server" CssClass="LongLabelWhite" Text="&nbsp;&nbsp;Populate &nbsp;&nbsp; Delivery Order"
                                OnClick="PopulateDO_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                            <asp:Button ID="PopulateSI" runat="server" CssClass="LongLabelWhite" Text="&nbsp;&nbsp; Populate &nbsp;&nbsp; Sales Invoice"
                                OnClick="PopulateSI_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                          
                                &nbsp
                            <asp:Button ID="PackingListBtn" runat="server" class="green" Text="Packing List"
                                OnClick="PackingListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Packing List" />
                                &nbsp
                            <asp:Button ID="InternalPackingListBtn" runat="server" class="LongLabelGreen" Text=" Internal Packing List"
                                OnClick="InternalPackingListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip=" Internal Packing List" />
                                &nbsp;
                            <asp:Button ID="LoadContainerBtn" runat="server" CssClass="LongLabelWhite" Text="Load Container"
                                OnClick="LoadContainerBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="PopulateConsolSOtoDO" runat="server" CssClass="LongLabelWhite" Text="Populate Combined DO"
                                OnClick="PopulateConsolSOtoDO_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                            <asp:Button ID="PopulateConsolSOtoSI" runat="server" CssClass="LongLabelWhite" Text="Populate Combined SI"
                                OnClick="PopulateConsolSOtoSI_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                         </td>
                        <td align="right">
                            <asp:Button ID="CircleBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; height: 10px">
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SalesOrderId">
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
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderNo" UniqueName="SalesOrderNo" SortExpression="SalesOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="SalesOrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryOrderNo" UniqueName="DeliveryOrderNo" SortExpression="DeliveryOrderNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="DeliveryOrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesInvoiceNo" UniqueName="SalesInvoiceNo" SortExpression="SalesInvoiceNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="SalesInvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderDate" UniqueName="SalesOrderDate" SortExpression="SalesOrderDate"
                                HeaderText="SalesOrderDate" DataFormatString="{0:dd/MMM/yyyy}">
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
                            <telerik:GridBoundColumn DataField="CustomerCode" UniqueName="CustomerCode" SortExpression="CustomerCode" AllowFiltering="true"
                                HeaderText="CustomerCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerName" UniqueName="CustomerName" SortExpression="CustomerName" AllowFiltering="true"
                                HeaderText="CustomerName" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerPONumber" UniqueName="CustomerPONumber" SortExpression="CustomerPONumber" AllowFiltering="true"
                                HeaderText="CustomerPONumber" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ExRef1" UniqueName="ExRef1" SortExpression="ExRef1" AllowFiltering="true"
                                HeaderText="Customer Reference 1" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCountryCode" UniqueName="ShipToCountryCode" HeaderText="ShipToCountryCode" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentDate" UniqueName="ShipmentDate" SortExpression="ShipmentDate"
                                HeaderText="ShipmentDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderStatusDescr" UniqueName="SalesOrderStatusDescr" SortExpression="SalesOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesOrderNo" Display="false">
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionGoodsReceiveHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionGoodsReceive.DistributionGoodsReceiveHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ Goods Receive</title>
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
    <script language="javascript" type="text/javascript">        function selectAll(invoker) {            var inputElements = document.getElementsByTagName('input');            for (var i = 0; i < inputElements.length; i++) {                var myElement = inputElements[i];                if (myElement.type === "checkbox") {                    myElement.checked = invoker.checked;                }                else {                    myElement.checked = invoker.UnChecked                }            }        }        //function disableCirBtn(id, check) {        //    if (check) {        //        if (Page_ClientValidate('')) {        //            var btn = document.getElementById(id);        //            btn.disabled = true;        //            btn.value = "...";        //        }        //        else {        //            return false;        //        }        //    }        //    else {        //        var btn = document.getElementById(id);        //        btn.disabled = true;        //        btn.value = "...";        //    }        //}    </script>
    <script type="text/javascript">        function OnClientClose(sender, args) {            document.location.href = document.location.href;        }    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">            function ConfirmPopulateBtnCallbackFn(arg) {                if (arg) // User clicked OK Button in RadConfirm                {                    __doPostBack("<%=ConfirmPopulateBtn.UniqueID %>", "");                }            }        </script>
    </telerik:RadCodeBlock>
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
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <table style="width: 100%; height=0" cellpadding="7px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" Text="Refresh" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="EditBtn" runat="server" CssClass="white" OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" Text="Edit" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="ReceivebyPOBtn" runat="server" CssClass="white" OnClick="ReceivebyPOBtn_Click" OnClientClick="disableBtn(this.id)" Text="ReceiveByPO" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="ConfirmButton" runat="server" CssClass="white" OnClick="ConfirmButton_Click" OnClientClick="disableBtn(this.id)" Text="Confirm" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="GoodsReceiveBtn" runat="server" CssClass="LongLabelBlue" OnClick="GoodsReceiveBtn_Click" OnClientClick="disableBtn(this.id)" Text="Goods Receive" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="GenInvoiceBtn" runat="server" CssClass="LongLabelWhite" OnClick="GenInvoiceBtn_Click" OnClientClick="disableBtn(this.id)" Text="Populate PurchaseInvoice" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" Text="Cancel" UseSubmitBehavior="false" />
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False" />
                            <asp:Button ID="ConfirmBtn" runat="server" OnClick="ConfirmBtn_Click" Style="display: none;" Text="" />
                            <%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                            
                        </td>
                        <td>
                            <asp:Button ID="ConfirmPopulateBtn" runat="server" CssClass="white" OnClick="ConfirmPopulateBtn_Click" Style="display: none;" Text="" />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" runat="server" class="CircleBtn" OnClick="SwapBtn_Click" OnClientClick="disableCirBtn(this.id)" Text="M" UseSubmitBehavior="false" Visible="true" />
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="GoodsReceiveId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    &nbsp;                                     
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveNo" UniqueName="GoodsReceiveNo" SortExpression="GoodsReceiveNo" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="GoodsReceiveNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveDate" UniqueName="GoodsReceiveDate" SortExpression="GoodsReceiveDate"
                                HeaderText="GoodsReceiveDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveReferenceNo" UniqueName="GoodsReceiveReferenceNo" SortExpression="GoodsReceiveReferenceNo" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="GoodsReceiveReferenceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="ShipToCode" SortExpression="ShipToCode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ShipToCode" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToAddress" UniqueName="ShipToAddress" SortExpression="ShipToAddress" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ShipToAddress" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCountryCode" UniqueName="ShipToCountryCode" HeaderText="ShipToCountryCode" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseInvoiceNo" UniqueName="PurchaseInvoiceNo" HeaderText="PurchaseInvoiceNo" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PurchaseInvoiceDate" UniqueName="PurchaseInvoiceDate" SortExpression="PurchaseInvoiceDate"
                                HeaderText="PurchaseInvoiceDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveStatusDescr" UniqueName="GoodsReceiveStatusDescr" SortExpression="GoodsReceiveStatusDescr" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GoodsReceiveNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>
    <script type="text/javascript">        // Instantiate our BusyBox object                var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");    </script>
</body>
</html>

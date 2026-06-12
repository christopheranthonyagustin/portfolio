<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterVendorInvoice.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterVendorInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VendorInvoice</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        function ClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }

        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager><br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="PostBtn" runat="server" CssClass="white" Text="Post"
                        OnClick="PostBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                </td>
                <td>
                    <asp:Button ID="PaymentVoucherBtn" runat="server" CssClass="LongLabelBlue" Text="Payment Voucher" CausesValidation="false"
                        OnClick="PaymentVoucherBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="GenPaymentVoucherBtn" runat="server" CssClass="LongLabelWhite" Text="&nbsp; Generate &nbsp;&nbsp;&nbsp;&nbsp; PV &nbsp;" CausesValidation="false"
                        OnClick="GenPaymentVoucherBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <telerik:RadMenu ID="EmailRadMenu" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                        OnItemClick="EmailRadMenu_ItemClick" Width="115px" OnClientItemClicked="ClientOnClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp; Email &nbsp;&nbsp;&nbsp;" PostBack="false" BackColor="#88fd64"
                                Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PaymentVoucher" Text="Payment Voucher"
                                        BackColor="White" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                    AllowSorting="true" EnableLinqExpressions="false" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" OnCheckedChanged="VendorInvChk_CheckedChanged" AutoPostBack="true" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="entcode" UniqueName="entcode" HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="InvNoAndDate" HeaderText="InvNo <br/> Date <br/> Status" AllowFiltering="true">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Invoice") %>
                                    <br />
                                    <%# string.Format("{0:dd/MMM/yyyy}",Eval("InvoiceDate")) %>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "StatusDescr") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="APNo" HeaderText="APNo <br/> Date <br/> Status">
                                <ItemTemplate>
                                    <%# string.Format("<b>{0:}</b>",Eval("APNo")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:dd/MMM/yyyy}",Eval("APDate")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:}",Eval("APStatusDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="VendorName" HeaderText="VendorName <br/> PVNo">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "VendorName") %>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "PVNo") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CostAmt" HeaderText="Amt">
                                <ItemTemplate>
                                    <%# Eval("Costamt", "{0:n}") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CostTaxAmt" HeaderText="TaxAmt">
                                <ItemTemplate>
                                    <%# Eval("CostTaxAmt", "{0:n}") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TotalAmtAndCurrency" HeaderText="TotalAmount <br/> Currency">
                                <ItemTemplate>
                                    <%# Eval("TotalAmt", "{0:n}") %>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "Currency") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CostLocalAmt" HeaderText="LocalAmt">
                                <ItemTemplate>
                                    <%# Eval("Costlocalamt", "{0:n}") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CostLocalTaxAmt" HeaderText="Local </br> TaxAmt">
                                <ItemTemplate>
                                    <%# Eval("CostTaxLocalAmt", "{0:n}") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TotalLocalAmtAndCurrency" HeaderText="TotalLocalAmount <br/> Currency">
                                <ItemTemplate>
                                    <%# Eval("TotalLocalAmount", "{0:n}") %>
                                    <br />
                                    <%# DataBinder.Eval(Container.DataItem, "BaseCurrency") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="APAmountOS" HeaderText="Oustsanding Amt <br/> Base Oustsanding Amt">
                                <ItemTemplate>
                                    <%# string.Format("<b>{0:}</b>",Eval("APAmountOS")) %>
                                    <br />
                                    <br />
                                    <%# string.Format("{0:}",Eval("APBaseAmountOS")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="PVNo" UniqueName="PVNo" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Invoice" UniqueName="Invoice" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceDate" UniqueName="InvoiceDate" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vendorId" UniqueName="vendorId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Entid" UniqueName="Entid" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Currency" UniqueName="Currency" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="APHId" UniqueName="APHId" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
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
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
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

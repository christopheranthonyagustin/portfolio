<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaJobRegisterCharge.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMSeaJobRegisterCharge" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaJobRegisterCharge</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab ID="ChargesTab" Text="Charges" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="DetailTab" Text="Detail" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="InvoiceTab" Text="Sales Invoice" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="VendorInvoiceTab" Text="Vendor Invoice" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ReceiptHistoryTab" Text="Receipt History" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="PaymentHistoryTab" Text="Payment History" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="LogTab" Text="Log" Value="600" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
              
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="GenerateChargeBtn" runat="server" CssClass="White" Text="Generate" CausesValidation="false"
                                OnClick="GenerateChargeBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;     
                            <asp:Button ID="AdditionalBtn" runat="server" CssClass="white" Text="Additional" CausesValidation="false"
                                OnClick="AdditionalBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                            <asp:Button ID="DeleteChargeBtn" runat="server" CssClass="white" Text="Delete" CausesValidation="false"
                                OnClick="DeleteChargeBtn_Click" OnClientClick="return confirm('Confirm to Delete?');" />&nbsp;&nbsp;
                            <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" CausesValidation="false"
                                OnClick="ConfirmBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;                           
                            <asp:Button ID="PrintChargeBtn" runat="server" CssClass="LongLabelBlue" Text="&nbsp; Print &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Charge &nbsp;" CausesValidation="false"
                                OnClick="PrintChargeBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;    
                            <asp:Button ID="GenInvBtn" runat="server" CssClass="LongLabelWhite" Text="Generate Invoice" CausesValidation="false"
                                OnClick="GenerateInvBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                            <asp:Button ID="PrintPAndLBtn" runat="server" CssClass="LongLabelBlue" Text="Print P&L" CausesValidation="false"
                                OnClick="PrintPAndLBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                            <asp:Button ID="ArrivalNotice_Charges_Btn" runat="server" CssClass="LongLabelBlue" Text="Arrival Notice W/O charges" CausesValidation="false"
                                OnClick="ArrivalNotice_Charges_Btn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                        <telerik:RadMenu ID="EmailRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                                OnItemClick="EmailRadMenu_ItemClick" OnClientItemClicked="ClientOnClick" width="60px" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Green">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="Email" PostBack="false" Value="Email">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalNoticeW/OCharges" Text="Arrival Notice W/O charges"
                                             />
                                    </Items>
                                </telerik:RadMenuItem>
                            </Items>
                        </telerik:RadMenu>
                        </td>
                    </tr>
                </table>
               
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" Height="400px" OnItemDataBound="ResultDG_ItemDataBound"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="72px" ItemStyle-Width="72px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            &nbsp;
                                            <asp:ImageButton runat="server" ID="CopyIconBtn" ImageUrl="../../image/copy.png" ToolTip="Copy Line"
                                                Width="15" Height="15" AlternateText="Copy" BackColor="Transparent" OnClick="CopyIconBtn_Click"
                                                BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Charge" HeaderText="Seqno <br/> Charge" HeaderStyle-Width="210px" ItemStyle-Width="210px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Seqno")%>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "ChargeDescr")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BranchAndDepartmentAndEntity" HeaderText="Entity <br/> Branch <br/> Department/Product Code" HeaderStyle-Width="220px" ItemStyle-Width="220px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "entityname")%>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "BranchDescr") %>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "DepartmentDescr") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vendor" HeaderText="Vendor <br/> Invoice <br/> InvoiceDate" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "VendorName") %>
                                            <br />
                                            <br />
                                            <b>
                                                <%# DataBinder.Eval(Container.DataItem, "CostRefNo") %></b>
                                            <asp:Label ID="IsCostPostedLbl" runat="server" Text="Posted" Visible="false" ForeColor="Red" Font-Bold="True"></asp:Label>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("CostRefDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CostUnitQtyRateAndAmt" HeaderText="CostQty&UOM <br/> CostUnitRate <br/> CostCurrCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <%# Eval("CostUnitQty", "{0:n}") %> &nbsp; <%# DataBinder.Eval(Container.DataItem, "CostUOMDescr2") %>
                                            <br />
                                            <br />
                                            <%# Eval("CostUnitRate", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "CostCurrCode") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CostAmtExchRateLocalAmt" HeaderText="CostAmt <br/> CostExchRate <br/> CostLocalAmt" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" DataType="System.String">
                                        <ItemTemplate>
                                            <%# Eval("CostAmt", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("CostExchRate", "{0:f6}") %>
                                            <br />
                                            <br />
                                            <%# Eval("CostLocalAmt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CostTaxTypeAmtLocalTaxAmt" HeaderText="CostTaxType <br/> CostTaxAmt <br/> CostLocalTaxAmt" HeaderStyle-Width="120px" ItemStyle-Width="120px" AllowFiltering="false" DataType="System.String">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "CostTaxTypeDescr") %>
                                            <br />
                                            <br />
                                            <%# Eval("CostTaxAmt", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("CostTaxLocalAmt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Account" HeaderText="BillAccount <br/> Invoice <br/> InvoiceDate" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "acname") %>
                                            <br />
                                            <br />
                                            <b>
                                                <%# DataBinder.Eval(Container.DataItem, "InvNo") %></b>
                                            <asp:Label ID="IsChargePostedLbl" runat="server" Text="Posted" Visible="false" ForeColor="Red" Font-Bold="True"></asp:Label>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("InvDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeUnitQtyRateCurrCode" HeaderText="ChargeQty&UOM <br/> ChargeUnitRate <br/> ChargeCurrCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <%# Eval("ChargeUnitQty", "{0:n}") %> &nbsp; <%# DataBinder.Eval(Container.DataItem, "ChargeUOMDescr2") %>
                                            <br />
                                            <br />
                                            <%# Eval("ChargeUnitRate", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "ChargeCurrCode") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeAmtExchRateLocalAmt" HeaderText="ChargeAmt <br/> ChargeExchRate <br/> ChargeLocalAmt" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <%# Eval("ChargeAmt", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("ChargeExchRate", "{0:f6}") %>
                                            <br />
                                            <br />
                                            <%# Eval("ChargeLocalAmt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChargeTaxTypeAmtLocalTaxAmt" HeaderText="ChargeTaxType <br/> ChargeTaxAmt <br/> ChargeLocalTaxAmt" HeaderStyle-Width="130px" ItemStyle-Width="130px" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ChargeTaxTypeDescr") %>
                                            <br />
                                            <br />
                                            <%# Eval("ChargeTaxAmt", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("ChargeTaxLocalAmt", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Status <br/> ModifiedOn" ItemStyle-Wrap="false" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                            <br />
                                            <br />
                                            <%# DataBinder.Eval(Container.DataItem, "EditUser") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsCostPosted" UniqueName="IsCostPosted" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsChargePosted" UniqueName="IsChargePosted" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ChargeAmt" UniqueName="ChargeAmt" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FMJobId" UniqueName="FMJobId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DrId" UniqueName="DrId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DrDtId" UniqueName="DrDtId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillToAcId" UniqueName="BillToAcId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EntId" UniqueName="EntId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ChargeCurrCode" UniqueName="ChargeCurrCode" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Reference" UniqueName="Reference" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                <asp:UpdatePanel runat="server" ID="ResultDG1UpdatePanel">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="true" RenderMode="Lightweight" OnItemDataBound="ResultDG1_ItemDataBound"
                                        EnableLinqExpressions="False" AllowPaging="True" Skin="Metro" OnNeedDataSource="ResultDG1_NeedDataSource" Width="50%">
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="true" RenderMode="Lightweight" OnItemDataBound="ResultDG2_ItemDataBound"
                                        EnableLinqExpressions="False" AllowPaging="True" Skin="Metro" OnNeedDataSource="ResultDG2_NeedDataSource" Width="50%">
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </td>
                            </tr>
                        </table>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ChargeDetailRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="VendorInvoiceRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ReceiptHistoryRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="PaymentHistoryRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LogRadPageView"></telerik:RadPageView>
        </telerik:RadMultiPage>
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
            function ClientOnClick(sender, args) {
                if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                    args.set_cancel(true);
                }
            }
        </script>
    </form>
</body>
</html>

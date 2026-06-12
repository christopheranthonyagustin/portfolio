<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseInvoiceForm.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseInvoice.DistributionPurchaseInvoiceForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Purchase Invoice Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>

                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
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
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Item" Value="10" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="DetailTab" Text="Detail" Value="20" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="GLDistributionRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="DelectBtn" runat="server" CssClass="white" Text="Delete"
                                OnClick="DeleteBtn_Click"  UseSubmitBehavior="false" CauseValidation="false" OnClientClick="disableBtn(this.id,false)"/>
                            <br />
                        </asp:Panel>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="PurchaseInvoiceItemId">
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
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DeleteImg"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete"
                                                OnClick="ldDelete_Click" OnClientClick="return confirm('Confirm delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo" HeaderStyle-Width="40px" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ProjectCode" DataField="ProjectCode" SortExpression="ProjectCode" UniqueName="ProjectCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="expecteduomqty" SortExpression="ItemQty" UniqueName="ItemQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="CurrencyCode" DataField="CurrencyCode" SortExpression="CurrencyCode" UniqueName="CurrencyCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Discount" DataField="ItemDiscountAmount" SortExpression="Discount" UniqueName="Discount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Amount" DataField="Amount" SortExpression="Amount" UniqueName="Amount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExchangeRate" DataField="ExchangeRate" SortExpression="ExchangeRate" UniqueName="ExchangeRate"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="BaseAmount" DataField="BaseAmount" SortExpression="BaseAmount" UniqueName="BaseAmount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    
                                     <telerik:GridBoundColumn HeaderText="TaxTypeDescr" DataField="TaxTypeDescr" SortExpression="TaxTypeDescr" UniqueName="TaxBaseAmount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn HeaderText="TaxAmount" DataField="TaxAmount" SortExpression="TaxAmount" UniqueName="TaxAmount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn HeaderText="TaxBaseAmount" DataField="TaxBaseAmount" SortExpression="TaxBaseAmount" UniqueName="TaxBaseAmount"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="DepartmentCode" DataField="DepartmentCode" SortExpression="DepartmentCode" UniqueName="DepartmentCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>


                                    <%--<telerik:GridTemplateColumn UniqueName="CostTaxTypeAmtLocalTaxAmt" HeaderText="ItemQty & UOM <br/> ItemUnitPrice <br/> CurrencyCode" AllowFiltering="false" HeaderStyle-Width="240px" ItemStyle-Width="240px">
                                        <ItemTemplate>
                                            <%# Eval("expecteduomqty", "{0:n}") %> &nbsp; <%# DataBinder.Eval(Container.DataItem, "ItemUOM") %>
                                            <br />
                                            <br />
                                            <%# Eval("ItemUnitPrice", "{0:f4}") %>
                                            <br />
                                            <br />
                                            <%# Eval("CurrencyCode", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>

                                    <%--<telerik:GridTemplateColumn UniqueName="CostTaxTypeAmtLocalTaxAmt" HeaderText="Amount <br/> ExchangeRate <br/> BaseAmount" HeaderStyle-Width="240px" ItemStyle-Width="240px" AllowFiltering="false" DataType="System.String">
                                        <ItemTemplate>
                                            <%# Eval("Amount", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("ExchangeRate", "{0:f6}") %>
                                            <br />
                                            <br />
                                            <%# Eval("BaseAmount", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>

                                  <%-- <telerik:GridTemplateColumn UniqueName="AmtExchRateLocalAmt" HeaderText="TaxType <br/> TaxAmount <br/> TaxBaseAmount" HeaderStyle-Width="240px" ItemStyle-Width="240px" AllowFiltering="false" DataType="System.String">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TaxTypeDescr") %>
                                            <br />
                                            <br />
                                            <%# Eval("TaxAmount", "{0:n}") %>
                                            <br />
                                            <br />
                                            <%# Eval("TaxBaseAmount", "{0:n}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>--%>

                                    <telerik:GridBoundColumn HeaderText="Status" DataField="PurchaseInvoiceItemStatusDescr" SortExpression="PurchaseInvoiceItemStatus" UniqueName="PurchaseInvoiceItemStatus" HeaderStyle-Width="240px" ItemStyle-Width="240px"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false" HeaderStyle-Width="240px" ItemStyle-Width="240px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                            <%--<%# DataBinder.Eval(Container.DataItem, "EditUser")%>--%>
                                       </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="PurchaseInvoiceItemId" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="DetailRadPageView">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionPurchaseOrderForm.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseOrder.DistributionPurchaseOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="~/Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Purchase Order Form</title>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
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
                                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Item" Value="10" runat="server" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab Id="ReceiveTab" Text="Receive" Value="20" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="30" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="GLDistributionRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />                         
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
                                OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                                OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
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
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="PurchaseOrderItemId">
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
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PODetailEdit"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="PODetailEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="delImg"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="PODelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="POItemDescription" SortExpression="POItemDescription" UniqueName="POItemDescription"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemType" DataField="ItemType" SortExpression="ItemType" UniqueName="ItemType"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="expecteduomqty" SortExpression="ItemQty" UniqueName="ItemQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemIntransitQty" DataField="ExpectedIntransitQty" SortExpression="ItemIntransitQty" UniqueName="ItemIntransitQty"
                                        AllowFiltering="false" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemReceivedQty" DataField="ExpectedReceivedQty" SortExpression="ItemReceivedQty" UniqueName="ItemReceivedQty"
                                        AllowFiltering="false" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="PriceCalculationQualifier" DataField="PriceCalculationQualifier" SortExpression="PriceCalculationQualifier" UniqueName="PriceCalculationQualifier"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="PriceCalculationFactor" DataField="PriceCalculationFactor" SortExpression="PriceCalculationFactor" UniqueName="PriceCalculationFactor"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="PriceCalculationQty" DataField="PriceCalculationQty" SortExpression="PriceCalculationQty" UniqueName="PriceCalculationQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="TaxAmt" DataField="TaxAmt" SortExpression="TaxAmt" UniqueName="TaxAmt"
                                        AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.0000}">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="TotalAmt" SortExpression="TotalAmt" UniqueName="TotalAmt"
                                        AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.0000}">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="DepartmentCode" DataField="DepartmentCode" SortExpression="DepartmentCode" UniqueName="DepartmentCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ProjectCode" DataField="ProjectCode" SortExpression="ProjectCode" UniqueName="ProjectCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="PurchaseOrderReferenceNo" DataField="PurchaseOrderReferenceNo" SortExpression="PurchaseOrderReferenceNo" UniqueName="PurchaseOrderReferenceNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="PurchaseOrderReferenceDate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("PurchaseOrderReferenceDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn HeaderText="DiscountAmt" DataField="DiscountAmt" SortExpression="DiscountAmt" UniqueName="DiscountAmt"
                                        AllowFiltering="false" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Discount1" DataField="Discount1" SortExpression="Discount1" UniqueName="Discount1"
                                        AllowFiltering="false" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Discount2" DataField="Discount2" SortExpression="Discount2" UniqueName="Discount2"
                                        AllowFiltering="false" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="PurchaseOrderItemStatus" DataField="PurchaseOrderItemStatusDescr" SortExpression="PurchaseOrderItemStatus" UniqueName="PurchaseOrderItemStatus"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                            <%--<%# DataBinder.Eval(Container.DataItem, "EditUser")%>--%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="IsSystemGenerated" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PurchaseOrderItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="ReceiveRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="InvoiceRadPageView">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

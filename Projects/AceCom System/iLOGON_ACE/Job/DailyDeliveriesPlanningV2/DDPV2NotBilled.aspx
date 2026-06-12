<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2NotBilled.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2NotBilled" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Not Billed @ DDPV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab ID="ByJobTab" Text="By Job" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="BillableItemsTab" Text="BillableItems" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ByDeliveryDateTab" Text="By Delivery Date" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />                        
                            <telerik:RadMenu ID="BillRadMenu" runat="server" ExpandAnimation-Type="None" ShowToggleHandle="false" ClickToOpen="true"
                                OnItemClick="BillRadMenu_ItemClick">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="&nbsp; Bill &nbsp;" PostBack="false" Value="Bill">
                                        <Items>
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SINGLE" Text="Single"
                                               BackColor="White" />
                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CONSOLIDATED" Text="Consolidated"
                                                BackColor="White" />
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="NonBillableBtn" runat="server" CssClass="LongLabelWhite" Text="Non Billable"
                                OnClick="NonBillableBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AssignQuotationBtn" runat="server" CssClass="LongLabelWhite" Text="Assign Quotation"
                                OnClick="AssignQuotationBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmNonBillableBtn" Text="" Style="display: none;" OnClick="ConfirmNonBillableBtn_Click" runat="server" />
                            &nbsp;
                            <asp:Button ID="ConfirmAssignQuotationBtn" Text="" Style="display: none;" OnClick="ConfirmAssignQuotationBtn_Click" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDGRNB" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDGRNB_NeedDataSource" OnItemDataBound="ResultDGRNB_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="NotBilledGrid">
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
                            <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustReference" UniqueName="CustReference" SortExpression="CustReference" HeaderText="CustReference">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" HeaderText="QuotationNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoOfTrips" UniqueName="NoOfTrips" SortExpression="NoOfTrips" HeaderText="NoOfTrips">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoOfChargeLine" UniqueName="NoOfChargeLine" SortExpression="NoOfChargeLine" HeaderText="NoOfChargeLine">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CreatedOn" UniqueName="CreatedOn" SortExpression="CreatedOn" HeaderText="CreatedOn" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CreatedBy" UniqueName="CreatedBy" SortExpression="CreatedBy" HeaderText="CreatedBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="BillableItemsRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="ByDeliveryDateRadPageView" Height="700px">
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG_ByDeliveryDate" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_ByDeliveryDate_NeedDataSource">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ByDeliveryDateGrid">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="QuotationNo" UniqueName="QuotationNo" SortExpression="QuotationNo" HeaderText="QuotationNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BillOption1" UniqueName="BillOption1" SortExpression="BillOption1" HeaderText="BillOption1">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="DeliveryDate" SortExpression="DeliveryDate" HeaderText="DeliveryDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

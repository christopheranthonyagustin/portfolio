<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3InvoiceSummary.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3InvoiceSummary" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GIV3InvoiceSummary</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
        }
    </style>

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
</head>
<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="NotBilled" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Billed" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="NotBilledRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AllowPaging="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="BilledRadPageView">
                <br />
                <asp:Button ID="InvoiceBtn" runat="server" Text="Invoice" OnClick="InvoiceBtn_Click"
                    CssClass="blue" ToolTip="MassInvoicePrint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                <br />
                <br />
                <telerik:RadGrid ID="BilledResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="BilledResultDG_NeedDataSource"
                    OnItemDataBound="BilledResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AllowPaging="true" DataKeyNames="id" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="SelectCB" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="acid" AllowFiltering="true"
                                SortExpression="acid" UniqueName="acid" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ID" DataField="id" AllowFiltering="true" SortExpression="id"
                                UniqueName="id" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                SortExpression="accode" UniqueName="accode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Billing Name" DataField="billname" AllowFiltering="true"
                                SortExpression="billname" UniqueName="billname" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDate" DataField="invdate" AllowFiltering="true"
                                SortExpression="invdate" UniqueName="invdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="totinvamt" AllowFiltering="true"
                                SortExpression="totinvamt" UniqueName="totinvamt" Reorderable="true" DataFormatString="{0:#,0.00}"
                                ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="false"
                                SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExRate" DataField="exchrate" AllowFiltering="false"
                                SortExpression="exchrate" UniqueName="exchrate" Reorderable="true" DataFormatString="{0:#,0.000000}"
                                ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillingContact" DataField="billcontact" AllowFiltering="false"
                                ColumnGroupName="billcontact" SortExpression="billcontact" UniqueName="billcontact" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="qucode" AllowFiltering="false"
                                ColumnGroupName="qucode" SortExpression="qucode" UniqueName="qucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationType" DataField="qutypedescr" AllowFiltering="false"
                                ColumnGroupName="qutypedescr" SortExpression="qutypedescr" UniqueName="qutypedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SMan" DataField="smancodedescr" AllowFiltering="false"
                                SortExpression="smancodedescr" UniqueName="smancodedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PayTerms" DataField="paytermsdescr" AllowFiltering="false"
                                SortExpression="paytermsdescr" UniqueName="paytermsdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDelvMethod" DataField="invoicedeliverymethod" AllowFiltering="true"
                                SortExpression="invoicedeliverymethod" UniqueName="invoicedeliverymethod" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDelvDate" DataField="invoicedeliverydate" AllowFiltering="true"
                                SortExpression="invoicedeliverydate" UniqueName="invoicedeliverydate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="invtypedescr" AllowFiltering="false"
                                SortExpression="invtypedescr" UniqueName="invtypedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="JobNo" DataField="srcno" AllowFiltering="false"
                                SortExpression="srcno" UniqueName="srcno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SvcChitNo" DataField="tripsvcchitno" AllowFiltering="false"
                                SortExpression="tripsvcchitno" UniqueName="tripsvcchitno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Source" DataField="srcdescr" AllowFiltering="true"
                                SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="ctnrno" AllowFiltering="true"
                                SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem" AllowFiltering="true"
                                SortExpression="rem" UniqueName="rem" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                                SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FromDate" DataField="frdate" AllowFiltering="true"
                                SortExpression="frdate" UniqueName="frdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="To Date" DataField="todate" AllowFiltering="true"
                                SortExpression="todate" UniqueName="todate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Period" DataField="period" AllowFiltering="true"
                                SortExpression="period" UniqueName="period" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Entity" DataField="entity" AllowFiltering="true"
                                SortExpression="entity" UniqueName="entity" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reference" DataField="exref1" AllowFiltering="true"
                                SortExpression="exref1" UniqueName="exref1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                                SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

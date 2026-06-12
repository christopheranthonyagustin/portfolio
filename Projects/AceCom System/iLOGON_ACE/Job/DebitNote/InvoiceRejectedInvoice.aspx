<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceRejectedInvoice.aspx.cs" Inherits="iWMS.Web.Job.DebitNote.InvoiceRejectedInvoice" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejected Invoice</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
        <script>
            function CheckAll(id) {
                var MasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = MasterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        MasterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="ReopenBtn" CssClass="white" runat="server" Text="Re-open" OnClick="ReopenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="InvoiceBtn" CssClass="blue" runat="server" Text="Invoice" OnClick="InvoiceBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <asp:UpdatePanel ID="RejectInvoiceUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="620" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="SelectAllCB" type="checkbox" onclick="CheckAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="AcCode" SortExpression="AcCode" UniqueName="AcCode" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Billing Name" DataField="BillName" SortExpression="BillName" UniqueName="BillName" HeaderStyle-Width="270px" ItemStyle-Width="270px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="InvNo" SortExpression="InvNo" UniqueName="InvNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="RejectReason" DataField="RejectReason" SortExpression="RejectReason" UniqueName="RejectReason" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDate" DataField="InvDate" SortExpression="InvDate" UniqueName="InvDate" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="TotInvAmt" SortExpression="TotInvAmt" UniqueName="TotInvAmt" DataFormatString="{0:#,0.00}" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Currency" DataField="CurrCode" AllowFiltering="false" SortExpression="CurrCode" UniqueName="CurrCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExRate" DataField="ExChRate" AllowFiltering="false" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="ExChRate" UniqueName="ExChRate" DataFormatString="{0:#,0.000000}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillingContact" DataField="BillContact" AllowFiltering="false" SortExpression="BillContact" UniqueName="BillContact" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="QuCode" SortExpression="QuCode" UniqueName="QuCode" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SMan" DataField="SmanCodeDescr" SortExpression="SmanCodeDescr" UniqueName="SmanCodeDescr" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PayTerms" DataField="PayTermsDescr" AllowFiltering="false" SortExpression="PayTermsDescr" UniqueName="PayTermsDescr" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="JobNo" DataField="SrcNo" SortExpression="SrcNo" UniqueName="SrcNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Period" DataField="Period" SortExpression="Period" UniqueName="Period" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Entity" DataField="Entity" SortExpression="Entity" UniqueName="Entity" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reference" DataField="Exref1" SortExpression="Exref1" UniqueName="Exref1" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" SortExpression="StatusDescr" UniqueName="StatusDescr" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="AddDate" SortExpression="AddDate" UniqueName="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="AddUser" SortExpression="AddUser" UniqueName="AddUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="EditDate" SortExpression="EditDate" UniqueName="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="EditUser" SortExpression="EditUser" UniqueName="EditUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Status" DataField="Status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="StatusColor" DataField="StatusColor" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SRCId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

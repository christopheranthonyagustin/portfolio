<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceApproveInvoice.aspx.cs" Inherits="iWMS.Web.Job.DebitNote.InvoiceApproveInvoice" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice Approve @ Invoice Register</title>
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
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" Text="Search" OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ApproveBtn" CssClass="white" runat="server" Text="Approve" OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ManagerApproveBtn" CssClass="LongLabelWhite" runat="server" Text="Manager Approve" OnClick="ManagerApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="InvoiceBtn" CssClass="blue" runat="server" Text="Invoice" OnClick="InvoiceBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <asp:UpdatePanel ID="ApproveInvoiceUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Visible="false"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="660" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="SelectAllCB" type="checkbox" onclick="CheckAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="AcCode" SortExpression="AcCode" UniqueName="AcCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Billing Name" DataField="BillName" SortExpression="BillName" UniqueName="BillName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="InvNo" SortExpression="InvNo" UniqueName="InvNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDate" DataField="InvDate" SortExpression="InvDate" UniqueName="InvDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="TotInvAmt" SortExpression="TotInvAmt" UniqueName="TotInvAmt" DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Currency" DataField="CurrCode" AllowFiltering="false" SortExpression="CurrCode" UniqueName="CurrCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExRate" DataField="ExChRate" AllowFiltering="false"
                                SortExpression="ExChRate" UniqueName="ExChRate" DataFormatString="{0:#,0.000000}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillingContact" DataField="BillContact" AllowFiltering="false" SortExpression="BillContact" UniqueName="BillContact">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="QuCode" SortExpression="QuCode" UniqueName="QuCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationType" DataField="QuTypeDescr" AllowFiltering="false" SortExpression="QuTypeDescr" UniqueName="QuTypeDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SMan" DataField="SmanCodeDescr" SortExpression="SmanCodeDescr" UniqueName="SmanCodeDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PayTerms" DataField="PayTermsDescr" AllowFiltering="false" SortExpression="PayTermsDescr" UniqueName="PayTermsDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDelvMethod" DataField="InvoiceDeliveryMethod" SortExpression="InvoiceDeliveryMethod" UniqueName="InvoiceDeliveryMethod">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDelvDate" DataField="InvoiceDeliveryDate" SortExpression="InvoiceDeliveryDate" UniqueName="InvoiceDeliveryDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="InvTypeDescr" AllowFiltering="false" SortExpression="InvTypeDescr" UniqueName="InvTypeDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="JobNo" DataField="SrcNo" SortExpression="SrcNo" UniqueName="SrcNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SvcChitNo" DataField="TripSVCChitNo" AllowFiltering="false" SortExpression="TripSVCChitNo" UniqueName="TripSVCChitNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SourceType" DataField="SourceType" SortExpression="SourceType" UniqueName="SourceType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SourceExpDate" DataField="SourceExpDate" SortExpression="SourceExpDate" UniqueName="SourceExpDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="CtnrNo" SortExpression="CtnrNo" UniqueName="CtnrNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Rem" SortExpression="Rem" UniqueName="Rem">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" SortExpression="StatusDescr" UniqueName="StatusDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FromDate" DataField="FrDate" SortExpression="FrDate" UniqueName="FrDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="To Date" DataField="ToDate" SortExpression="ToDate" UniqueName="ToDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Period" DataField="Period" SortExpression="Period" UniqueName="Period">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Entity" DataField="Entity" SortExpression="Entity" UniqueName="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reference" DataField="Exref1" SortExpression="Exref1" UniqueName="Exref1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="AddDate" SortExpression="AddDate" UniqueName="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="AddUser" SortExpression="AddUser" UniqueName="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="EditDate" SortExpression="EditDate" UniqueName="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="EditUser" SortExpression="EditUser" UniqueName="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Status" DataField="Status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="StatusColor" DataField="StatusColor" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

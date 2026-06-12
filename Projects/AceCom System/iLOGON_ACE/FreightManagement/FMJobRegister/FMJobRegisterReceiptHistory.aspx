<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterReceiptHistory.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterReceiptHistory" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>FMJobRegisterReceiptHistory</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <div style="height: 92%" id="div1">
                        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource" OnItemDataBound="ResultDG2_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true">
                                <Columns>
                                    <telerik:GridCalculatedColumn HeaderText="ReceiptNo" DataFields="ReceiptNo"
                                        Expression='{0}' SortExpression="ReceiptNo" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridTemplateColumn HeaderText="ReceiptDate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("ReceiptDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridCalculatedColumn HeaderText="PeriodCode" DataFields="PeriodCode"
                                        Expression='{0}' SortExpression="PeriodCode" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridTemplateColumn HeaderText="InvoiceDate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("InvoiceDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridCalculatedColumn HeaderText="Currency" DataFields="Currency"
                                        Expression='{0}' SortExpression="Currency" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn HeaderText="Amount" DataFields="Amount" UniqueName="Amount"
                                        Expression='{0}' SortExpression="Amount" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn HeaderText="ExchangeRate" DataFields="ExchangeRate"
                                        Expression='{0}' SortExpression="ExchangeRate" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn HeaderText="BaseAmount" DataFields="BaseAmount" UniqueName="BaseAmount"
                                        Expression='{0}' SortExpression="BaseAmount" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn HeaderText="CashBookStatus" DataFields="CashBookStatus"
                                        Expression='{0}' SortExpression="CashBookStatus" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

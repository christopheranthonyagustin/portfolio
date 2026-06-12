<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookReceiptAPOutstanding.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookReceipt.CashBookReceiptAPOutstanding" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookPaymentAPOutstanding</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td style="width: 200px">&nbsp;
                    <asp:Button ID="SelectBtn" runat="server" CssClass="white" Text="1.Select"
                        OnClick="SelectBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ApplyBtn" runat="server" CssClass="white" Text="2.Apply" ValidationGroup="reqvalgrp"
                        OnClick="ApplyBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td align="left">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="True" />
                <Scrolling AllowScroll="True" ScrollHeight="600px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" 
                    SaveScrollPosition="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="APHId" PageSize="150" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" Width="40px"></ItemStyle>
                        <HeaderStyle Width="40px" />
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="APHId" UniqueName="APHId" Display="false" />
                    <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="InvoiceNo" SortExpression="InvoiceNo" UniqueName="InvoiceNo"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                        <HeaderStyle Width="200px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="APDate <br /> InvoiceDate" ItemStyle-Wrap="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("APDate")) %>
                             <br />
                             <%# string.Format("{0:dd/MMM/yyyy}",Eval("InvoiceDate")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="TypeDescr" SortExpression="Type" UniqueName="Type"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CCY" DataField="CurrCode" SortExpression="Currency" UniqueName="Currency"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" ItemStyle-HorizontalAlign="Left">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OriginalAmount" DataField="Amount" SortExpression="Amount" UniqueName="Amount"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0,0.00}" ItemStyle-HorizontalAlign="Right">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Outstanding" DataField="AmountOS" SortExpression="AmountOS" UniqueName="AmountOS"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0,0.00}" ItemStyle-HorizontalAlign="Right">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Applying" AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="ApplyingTxt" runat="server" Width="120" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "AmountOS") %>' EnabledStyle-HorizontalAlign="Right" />
                            <asp:CompareValidator ID="ApplyingTxtCompVal" runat="server" ControlToValidate="ApplyingTxt" ValidationGroup="reqvalgrp"
                                EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn UniqueName="APDate" DataField="APDate" Display="false" />
                    <telerik:GridBoundColumn UniqueName="APDate" DataField="InvoiceDate" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

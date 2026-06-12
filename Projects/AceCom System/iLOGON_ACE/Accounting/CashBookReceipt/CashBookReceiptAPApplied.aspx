<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookReceiptAPApplied.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookReceipt.CashBookReceiptAPApplied" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookReceiptAPApplied</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Panel ID="AddPnl" runat="server" Visible="false">
            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </asp:Panel>
        &nbsp;
        <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
            OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        &nbsp;
        <asp:Button ID="AdvanceBtn" runat="server" CssClass="LongLabelWhite" Text="Keep as Advance"
            OnClick="AdvanceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        &nbsp;
         <asp:Button ID="AbsorbDifferenceBtn" runat="server" CssClass="LongLabelWhite" Text="Absorb Difference"
             OnClick="AbsorbDifferenceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="True" />
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="delIng" OnClick="ARAP_Delete" ImageUrl="../../image/bin.gif" Width="15" Height="15" border="0" runat="server" CausesValidation="false" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="InvoiceNo" DataField="InvoiceNo" SortExpression="InvoiceNo" UniqueName="InvoiceNo"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvoiceDate" DataField="InvoiceDate" SortExpression="InvoiceDate" UniqueName="InvoiceDate"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="InvoiceTypeDescr" SortExpression="InvoiceTypeDescr" UniqueName="InvoiceTypeDescr"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CCY" DataField="InvCurrCode" SortExpression="InvCurrCode" UniqueName="InvCurrCode"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OriginalAmount" DataField="InvoiceAmount" SortExpression="InvoiceAmount" UniqueName="InvoiceAmount"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0,0.00}" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PreAppliedAmountOS" DataField="PreAppliedAmountOS" SortExpression="PreAppliedAmountOS" UniqueName="PreAppliedAmountOS"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0,0.00}" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Applied" DataField="Amount" SortExpression="Amount" UniqueName="Amount"
                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0,0.00}" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ID" DataField="id" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

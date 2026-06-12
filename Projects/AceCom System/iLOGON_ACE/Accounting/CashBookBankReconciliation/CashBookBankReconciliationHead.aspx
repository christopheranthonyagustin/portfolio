<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookBankReconciliationHead.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookBankReconciliation.CashBookBankReconciliationHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CashBookBankReconciliationHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="EntCode" UniqueName="EntCode" SortExpression="EntCode" AllowFiltering="true"
                                HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode" AllowFiltering="true"
                                HeaderText="Branch">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BankCode" UniqueName="BankCode" SortExpression="BankCode" AllowFiltering="true"
                                HeaderText="BankCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BankDescr" UniqueName="BankDescr" SortExpression="BankDescr" AllowFiltering="false"
                                HeaderText="BankDescr">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CurrCode" UniqueName="Currency" SortExpression="Currency" AllowFiltering="true"
                                HeaderText="Currency">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NextChequeNo" UniqueName="NextChequeNo" SortExpression="NextChequeNo" AllowFiltering="false"
                                HeaderText="NextChequeNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoofDigits" UniqueName="NoOfDigits" SortExpression="NoofDigits" AllowFiltering="false"
                                HeaderText="NoOfDigits">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TypeDescr" UniqueName="TypeDescr" SortExpression="TypeDescr" AllowFiltering="true"
                                HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CategoryDescr" UniqueName="CategoryDescr" SortExpression="CategoryDescr" AllowFiltering="false"
                                HeaderText="Category">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate" AllowFiltering="false"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" AllowFiltering="false"
                                HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate" AllowFiltering="false"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="UniqueName" AllowFiltering="false"
                                HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CashBookBankReconciliationDashboardRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

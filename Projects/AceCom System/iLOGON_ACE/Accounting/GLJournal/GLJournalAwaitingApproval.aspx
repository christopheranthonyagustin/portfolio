<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLJournalAwaitingApproval.aspx.cs" Inherits="iWMS.Web.Accounting.GLJournal.GLJournalAwaitingApproval" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GLJournalAwaitingApproval</title>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="false" AutoPostBack="True" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="GL" Value="0" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="AR" Value="100" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="Receipt" Value="200" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="AP" Value="300" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="Payment" Value="400" runat="server"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="87%" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="ApproveBtn" runat="server" CssClass="white" Text="Approve"
                    OnClick="ApproveBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br /><br />
                <telerik:RadGrid ID="ResultDg" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDg_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
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
                            <telerik:GridBoundColumn DataField="EntCode" UniqueName="EntCode" SortExpression="EntCode" 
                                HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PeriodCode" UniqueName="PeriodCode" SortExpression="PeriodCode"
                                HeaderText="PeriodCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Journals" UniqueName="Journals" SortExpression="Journals"
                                HeaderText="Journals" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DRAmount" UniqueName="DRAmount" SortExpression="DRAmount"
                                HeaderText="DRAmount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CRAmount" UniqueName="CRAmount" SortExpression="CRAmount"
                                HeaderText="CRAmount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" SortExpression="StatusColourCode"
                                HeaderText="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="entid" UniqueName="entid" Display="false"/>
                            <telerik:GridBoundColumn DataField="periodid" UniqueName="periodid" Display="false"/>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false"/>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="87%" ID="ARRadPageView" />            
            <telerik:RadPageView runat="server" Height="87%" ID="ReceiptRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="APRadPageView" />
            <telerik:RadPageView runat="server" Height="87%" ID="PaymentRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>

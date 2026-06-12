<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLAccountForm.aspx.cs" Inherits="iWMS.Web.Accounting.GLAccount.GLAccountForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GLAccountForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<script type="text/javascript">
    function selectAll(id) {
        var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
        var row = masterTable.get_dataItems();
        if (id.checked == true) {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
            }
        }
        else {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
            }
        }
    }

    function BatchEditOpened(sender, args) {
        if (args.get_columnUniqueName() == "BudgetAmount") {
            var Status = "";
            //get the currently opened cell that holds the combo box
            var comboCell = args.get_cell();
            //get the data item so you can get values from the grid
            var dataItem = $find(args.get_row().getAttribute("id"));
            var BudgetAmountTxt = dataItem.findElement("BudgetAmountTxt");
            var StatusCol = dataItem.get_cell("status");
            if (StatusCol != null && StatusCol != "undefined") {
                Status = StatusCol.innerText.trim();
            }

            if (BudgetAmountTxt != null && BudgetAmountTxt != "undefined" && Status == "10") {

                BudgetAmountTxt.disabled = false;
            }
            else if (BudgetAmountTxt != null && BudgetAmountTxt != "undefined" && Status != "10") {
                BudgetAmountTxt.disabled = true;
            }
            else {
                BudgetAmountTxt.disabled = false;
            }
        }
    }
</script>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />

        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Metro" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadAjaxManager runat="server" SkinID="Metro" ID="RadAjaxManager">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ResultDG">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" LoadingPanelID="LoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enabled="false"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>

                <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enabled="false" />
                <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />

                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab ID="BudgetTab" Text="Budget" Value="0" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <br />
                            <br />
                            <asp:Button ID="LockBtn" CssClass="white" runat="server" OnClick="LockBtn_Click" Visible="true" Text="Lock"
                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enable="false" />
                            &nbsp;&nbsp;
                            <asp:Button ID="UnLockBtn" CssClass="white" runat="server" OnClick="UnLockBtn_Click" Visible="true" Text="Unlock"
                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enable="false" />
                        </td>
                    </tr>
                </table>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="BudgetRadPageView">

                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="false"
                            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                            OnBatchEditCommand="ResultDG_BatchEditCommand">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" />
                                <ClientEvents OnBatchEditOpened="BatchEditOpened" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="GLAPDId" CommandItemDisplay="TopAndBottom" EditMode="Batch" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                HeaderStyle-HorizontalAlign="Left">
                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="20px" HeaderStyle-HorizontalAlign="Center">

                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="PeriodCode" HeaderText="PeriodCode" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActualAmount" HeaderText="ActualAmount" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="BudgetAmount" HeaderText="BudgetAmount"
                                        AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("budgetamount")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="BudgetAmountTxt" TextMode="SingleLine" Width="100px">
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="BudgetAmountCompVal" runat="server" ControlToValidate="BudgetAmountTxt"
                                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="VarainceAmount" HeaderText="VarainceAmount" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PercentageAchieved" HeaderText="PercentageAchieved" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PeriodStatusDescr" HeaderText="PeriodStatusDescr" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PeriodStatusColourCode" HeaderText="PeriodStatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="status" DataField="status" HeaderText="status" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GLAPDId" UniqueName="GLAPDId" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

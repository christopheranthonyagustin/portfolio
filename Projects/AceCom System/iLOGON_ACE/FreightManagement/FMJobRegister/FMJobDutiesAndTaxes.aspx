<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobDutiesAndTaxes.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobDutiesAndTaxes" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Duties And Taxes</title>
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
                    myElement.checked = invoker.UnChecked;
                }
            }
        }
    </script>
</head>
<body>
    <form id="Form" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="NewBtn" runat="server" Text="New" OnClick="NewBtn_Click"
                        CssClass="white" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="DutyAndTax" runat="server" Text="Duty&Tax" OnClick="DutyAndTax_Click"
                        CssClass="BLUE" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:HiddenField ID="JSONHiddenValue" runat="server" />
        <asp:UpdatePanel ID="ResultDG_UpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="false"
                    AllowPaging="true" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowAutomaticUpdates="True" OnItemCommand="ResultDG_ItemCommand">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowKeyboardNavigation="true" KeyboardNavigationSettings-EnableKeyboardShortcuts="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <ClientEvents OnBatchEditCellValueChanged="BatchEditCellValueChanged" OnBatchEditOpened="BatchEditOpening" OnBatchEditClosed="BatchEditClosed" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" EditMode="Batch" CommandItemDisplay="TopAndBottom" TableLayout="Auto">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="Icom" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="S/N" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                <HeaderTemplate>
                                    S/N 
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Item" HeaderText="Item" HeaderStyle-Width="145px" ItemStyle-Width="145px" AllowSorting="true">
                                <ItemTemplate>
                                    <%# Eval("ItemCode") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ItemTxt" Width="140px" ReadOnly="true"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Description" HeaderText="Description" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <%# Eval("ItemDescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="DescriptionTxt" Width="140px"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Currency" HeaderText="Currency" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CurrencyLbl" Text='<%# DataBinder.Eval(Container.DataItem, "CurrCode")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="CurrencyCombo" runat="server" RenderMode="Lightweight" Skin="WebBlue" Width="140px"
                                        Filter="Contains" EnableLoadOnDemand="true" HighlightTemplatedItems="true" OnItemsRequested="CurrencyCombo_ItemsRequested">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ExchangeRate" HeaderText="ExchangeRate" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="ExchangeRateLbl" Text='<%# Eval("ExchangeRate") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ExchangeRateTxt" Width="140px" ClientEvents-OnValueChanged="ExchangeRateTxt_TextChanged"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Percentage" HeaderText="Percentage" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PercentageLbl" Text='<%# Eval("Percentage") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="PercentageTxt" Width="140px" ClientEvents-OnValueChanged="PercentageTxt_TextChanged"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Amount" HeaderText="Amount" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AmountLbl" Text='<%# Eval("Amount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="AmountTxt" Width="140px" ClientEvents-OnValueChanged="AmountTxt_TextChanged"></telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="LocalAmount" HeaderText="LocalAmount" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LocalAmountLbl" Text='<%# Eval("LocalAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="LocalAmountTxt" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="Id" DataField="Id" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="FMJobId" DataField="FMJobId" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            //Start Region: Selected IndexChange for ExchangeRate column
            //We will auto calculate LocalAmount for Item A-D
            function ExchangeRateTxt_TextChanged(sender, args) {
                var ExchangeRate = sender.get_value();
                var Val, ItemCode, Percentage;
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                var PercentageTxt = $telerik.findControl(CurrentRow, "PercentageTxt");
                var ItemTxt = $telerik.findControl(CurrentRow, "ItemTxt");
                var LocalAmountTxt = $telerik.findControl(CurrentRow, "LocalAmountTxt");
                let Grid = $find("<%=ResultDG.ClientID %>");
                let MasterTable = Grid.get_masterTableView();
                let Rows = MasterTable.get_dataItems();

                if (ItemTxt != null) {
                    ItemCode = ItemTxt.get_value();
                }

                if (AmountTxt != null) {
                    Val = AmountTxt.get_value();
                }

                if (Val == ""){
                    Val = 0;
                }

                if (PercentageTxt != null) {
                    Percentage = PercentageTxt.get_value();
                }

                if (Percentage == "") {
                    Percentage = 0;
                }

                if (ExchangeRate == "") {
                    ExchangeRate = 0;
                }

                if (ItemCode == "A" || ItemCode == "D") {
                    if (Percentage != null && Val != null && ExchangeRate != null) {
                        var EachAmount = (Percentage * Val) / 100;
                        var TotalAmount = parseFloat(Val) + parseFloat(EachAmount);
                        var LocalAmount = TotalAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(LocalAmount.toFixed(2));
                        }
                    }
                }
                else if (ItemCode == "B") {
                    let ItemARow = Rows[0];
                    let ItemARowCells = ItemARow._element.cells;
                    var ItemAAmount = ItemARowCells[7].firstElementChild.innerText;
                    if (ItemAAmount == "") {
                        ItemAAmount = 0;
                    }
                    var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                    if (AmountTxt != null) {
                        var ItemBAmount = (ItemAAmount * Percentage) / 100;
                        AmountTxt.set_value(ItemBAmount.toFixed(2));
                        var ItemBLocalAmount = ItemBAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(ItemBLocalAmount.toFixed(2));
                        }
                    }
                }
                else if (ItemCode == "C") {
                    let ItemARow = Rows[0];
                    let ItemARowCells = ItemARow._element.cells;
                    let ItemBRow = Rows[1];
                    let ItemBRowCells = ItemBRow._element.cells;
                    var ItemAAmount = ItemARowCells[7].firstElementChild.innerText;
                    var ItemBAmount = ItemBRowCells[7].firstElementChild.innerText;
                    if (ItemAAmount == "") {
                        ItemAAmount = 0;
                    }
                    if (ItemBAmount == "") {
                        ItemBAmount = 0;
                    }
                    var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                    if (AmountTxt != null) {
                        var ItemCAmount = ((parseFloat(ItemAAmount) + parseFloat(ItemBAmount)) * Percentage) / 100;
                        AmountTxt.set_value(ItemCAmount.toFixed(2));
                        var ItemCLocalAmount = ItemCAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(ItemCLocalAmount.toFixed(2));
                        }
                    }
                }
            } //End Region: Selected IndexChange for ExchangeRate column

            //Start Region: Selected IndexChange for AmountTxt column
            //We will auto calculate LocalAmount for Item A-D
            function AmountTxt_TextChanged(sender, args) {
                var Val, ItemCode, Percentage;
                var Amount = sender.get_value();
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var ExchangeRateTxt = $telerik.findControl(CurrentRow, "ExchangeRateTxt");
                var PercentageTxt = $telerik.findControl(CurrentRow, "PercentageTxt");
                var ItemTxt = $telerik.findControl(CurrentRow, "ItemTxt");
                if (ItemTxt != null) {
                    ItemCode = ItemTxt.get_value();
                }

                if (ExchangeRateTxt != null) {
                    Val = ExchangeRateTxt.get_value();
                }

                if (Val == "") {
                    Val = 0;
                }

                if (PercentageTxt != null) {
                    Percentage = PercentageTxt.get_value();
                }

                if (Percentage == "") {
                    Percentage = 0;
                }

                if (ItemCode == "A" || ItemCode == "D") {
                    if (Percentage != null && Val != null && Amount != null) {
                        var EachAmount = (Percentage * Amount) / 100;
                        var TotalAmount = parseFloat(Amount) + parseFloat(EachAmount);
                        var LocalAmount = TotalAmount * Val;
                        var LocalAmountTxt = $telerik.findControl(CurrentRow, "LocalAmountTxt");
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(LocalAmount.toFixed(2));
                        }
                    }
                }
            } //End Region: Selected IndexChange for AmountTxt column

            //Start Region: Selected IndexChange for Percentage column
            function PercentageTxt_TextChanged(sender, args) {
                var Val, ItemCode, ExchangeRate;
                var Percentage = sender.get_value();
                var CurrentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                var ItemTxt = $telerik.findControl(CurrentRow, "ItemTxt");
                var ExchangeRateTxt = $telerik.findControl(CurrentRow, "ExchangeRateTxt");
                var LocalAmountTxt = $telerik.findControl(CurrentRow, "LocalAmountTxt");
                let Grid = $find("<%=ResultDG.ClientID %>");
                let MasterTable = Grid.get_masterTableView();
                let Rows = MasterTable.get_dataItems();
                if (ItemTxt != null) {
                    ItemCode = ItemTxt.get_value();
                }
                if (AmountTxt != null) {
                    Val = AmountTxt.get_value();
                }

                if (Percentage == "") {
                    Percentage = 0;
                }

                if (Val == "") {
                    Val = 0;
                }

                if (ExchangeRateTxt != null) {
                    ExchangeRate = ExchangeRateTxt.get_value();
                }

                if (ExchangeRate == "") {
                    ExchangeRate = 0;
                }
                if (ItemCode == "A" || ItemCode == "D")
                {
                    if (Percentage != null  && Val != null && ExchangeRate != null) {
                        var EachAmount = (Percentage * Val) / 100;
                        var TotalAmount = parseFloat(Val) + parseFloat(EachAmount);
                        var LocalAmount = TotalAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(LocalAmount.toFixed(2));
                        }
                    }
                }
                else if(ItemCode == "B")
                {
                    let ItemARow = Rows[0];
                    let ItemARowCells = ItemARow._element.cells;
                    var ItemAAmount = ItemARowCells[7].firstElementChild.innerText;
                    if(ItemAAmount =="")
                    {
                        ItemAAmount = 0;
                    }
                    var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                    if (AmountTxt != null) {
                        var ItemBAmount = (ItemAAmount * Percentage) / 100;
                        AmountTxt.set_value(ItemBAmount.toFixed(2));
                        if (ExchangeRate == "")
                        {
                            ExchangeRate = 0;
                        }
                        var ItemBLocalAmount = ItemBAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(ItemBLocalAmount.toFixed(2));
                        }
                    }
                }
                else if (ItemCode == "C") {
                    let ItemARow = Rows[0];
                    let ItemARowCells = ItemARow._element.cells;
                    let ItemBRow = Rows[1];
                    let ItemBRowCells = ItemBRow._element.cells;
                    var ItemAAmount = ItemARowCells[7].firstElementChild.innerText;
                    var ItemBAmount = ItemBRowCells[7].firstElementChild.innerText;
                    if (ItemAAmount == "") {
                        ItemAAmount = 0;
                    }
                    if (ItemBAmount == "") {
                        ItemBAmount = 0;
                    }
                    var AmountTxt = $telerik.findControl(CurrentRow, "AmountTxt");
                    if (AmountTxt != null) {
                        var ItemCAmount = ((parseFloat(ItemAAmount) + parseFloat(ItemBAmount)) * Percentage) / 100;
                        AmountTxt.set_value(ItemCAmount.toFixed(2));
                        var ItemCLocalAmount = ItemCAmount * ExchangeRate;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(ItemCLocalAmount.toFixed(2));
                        }
                    }
                }
                else if (ItemCode == "F") {
                    if (Percentage != null && Percentage != "" && Val != null && Val != "") {
                        var LocalAmount = Val * Percentage;
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.set_value(LocalAmount.toFixed(2));
                        }
                    }
                }
            } //End Region: Selected IndexChange for Percentage column

            function BatchEditCellValueChanged(sender, args) {
                if (args.get_columnUniqueName() === "LocalAmount") {
                    var TotalLocalAmtforE = 0, TotalLocalAmtforJ = 0;
                    var DataItems = args.get_tableView().get_dataItems();
                    var BatchManager = sender.get_batchEditingManager();
                    let Grid = $find("<%=ResultDG.ClientID %>");
                    let MasterTable = Grid.get_masterTableView();
                    let Rows = MasterTable.get_dataItems();
                    let CustomValueRow = Rows[4];
                    let CustomValueRowCells = CustomValueRow._element.cells;

                    //Start Region: Auto Calculation for LocalAmount of Item B
                    var ItemAAmount = BatchManager.getCellValue(DataItems[0].get_cell('Amount'));
                    var ItemBPercentage = BatchManager.getCellValue(DataItems[1].get_cell('Percentage'));
                    if(ItemAAmount == "")
                    {
                        ItemAAmount = 0;
                    }
                    if (ItemBPercentage == "") {
                        ItemBPercentage = 0;
                    }
                    var ItemBAmount = (ItemAAmount * ItemBPercentage) / 100;
                    let ItemBRow = Rows[1];
                    let ItemBRowCells = ItemBRow._element.cells;
                    if (ItemBAmount == 0)
                    {
                        ItemBRowCells[7].firstElementChild.innerText = "";
                    }
                    else {
                        ItemBRowCells[7].firstElementChild.innerText = ItemBAmount.toFixed(2);
                    }
                    var ItemBExchangeRate = BatchManager.getCellValue(DataItems[1].get_cell('ExchangeRate'));
                    if (ItemBExchangeRate == "") {
                        ItemBExchangeRate = 0;
                    }
                    var ItemBLocalAmount = ItemBAmount * ItemBExchangeRate;
                    ItemBRowCells[8].firstElementChild.innerText = ItemBLocalAmount.toFixed(2);
                    //End Region: Auto Calculation for LocalAmount of Item B

                    //Start Region: Auto Calculation for LocalAmount of Item C
                    var ItemAAmount = BatchManager.getCellValue(DataItems[0].get_cell('Amount'));
                    var ItemBAmount = BatchManager.getCellValue(DataItems[1].get_cell('Amount'));
                    var ItemCPercentage = BatchManager.getCellValue(DataItems[2].get_cell('Percentage'));
                    if(ItemAAmount == "")
                    {
                        ItemAAmount = 0;
                    }
                    if(ItemBAmount == "")
                    {
                        ItemBAmount = 0;
                    }
                    if (ItemCPercentage == "") {
                        ItemCPercentage = 0;
                    }
                    var ItemCAmount = ((parseFloat(ItemAAmount) + parseFloat(ItemBAmount)) * ItemCPercentage) / 100;
                    let ItemCRow = Rows[2];
                    let ItemCRowCells = ItemCRow._element.cells;
                    ItemCRowCells[7].firstElementChild.innerText = ItemCAmount.toFixed(2);
                    var ItemCExchangeRate = BatchManager.getCellValue(DataItems[2].get_cell('ExchangeRate'));
                    if (ItemCExchangeRate == "") {
                        ItemCExchangeRate = 0;
                    }
                    var ItemCLocalAmount = ItemCAmount * ItemCExchangeRate;
                    if (ItemCLocalAmount == 0) {
                        ItemCRowCells[8].firstElementChild.innerText = "";
                    }
                    else {
                        ItemCRowCells[8].firstElementChild.innerText = ItemCLocalAmount.toFixed(2);
                    }
                    //End Region: Auto Calculation for LocalAmount of Item C

                    //Start Region: Auto Calculation for LocalAmount of Item E
                    for (var i = 0; i < 4; i++) {
                        var LocalAmount = BatchManager.getCellValue(DataItems[i].get_cell('LocalAmount'));
                        if (LocalAmount == "") {
                            LocalAmount = 0;
                        }
                        TotalLocalAmtforE = parseFloat(LocalAmount) + parseFloat(TotalLocalAmtforE);
                    }
                    if (TotalLocalAmtforE == "NaN") {
                        CustomValueRowCells[8].firstElementChild.innerText = "";
                    }
                    else {
                        CustomValueRowCells[8].firstChild.children[0].innerText = TotalLocalAmtforE.toFixed(2);

                    }

                    //End Region: Auto Calculation for LocalAmount of Item E

                    //Start Region: Auto Calculation for Amount of Item F
                    let CustomValueRowF = Rows[5];
                    let CustomValueRowCells5 = CustomValueRowF._element.cells;
                    if (TotalLocalAmtforE == "NaN") {
                        CustomValueRowCells5[7].firstChild.children[0].innerText = "";
                    }
                    else {
                        CustomValueRowCells5[7].firstChild.children[0].innerText = TotalLocalAmtforE.toFixed(2);
                    }

                    var AmountforItemF = CustomValueRowCells5[7].firstElementChild.innerText;
                    var ExchangeRateforItemF = BatchManager.getCellValue(DataItems[5].get_cell('Percentage'));
                    var LocalAmountforItemF = AmountforItemF * ExchangeRateforItemF;
                    if (LocalAmountforItemF == "NaN") {
                        CustomValueRowCells5[8].firstChild.children[0].innerText = "";
                    }
                    else {
                        var Percentage = 100;
                        var TotalLocalAmountforItemF = LocalAmountforItemF / Percentage;
                        CustomValueRowCells5[8].firstChild.children[0].innerText = TotalLocalAmountforItemF.toFixed(2);
                    }
                    //End Region: Auto Calculation for Amount of Item F

                    //Start Region: Auto Calculation for LocalAmount of Item J
                    let CustomValueRowJ = Rows[9];
                    let CustomValueRowCellsJ = CustomValueRowJ._element.cells;

                    for (var j = 5; j < 9; j++) {
                        var EachLocalAmount = BatchManager.getCellValue(DataItems[j].get_cell('LocalAmount'));

                        if (EachLocalAmount == "") {
                            EachLocalAmount = 0;
                        }

                        TotalLocalAmtforJ = parseFloat(EachLocalAmount) + parseFloat(TotalLocalAmtforJ);

                        if (TotalLocalAmtforJ == "NaN") {
                            CustomValueRowCellsJ[8].firstChild.children[0].innerText = "";
                        }
                        else {
                            CustomValueRowCellsJ[8].firstChild.children[0].innerText = TotalLocalAmtforJ.toFixed(2);
                        }
                    }
                    //End Region: Auto Calculation for LocalAmount of Item J
                }
            }

            //Start Region: To set control as disabled/enabled 
            function BatchEditOpening(sender, args) {
                var DataItems = args.get_tableView().get_dataItems();
                var BatchManager = sender.get_batchEditingManager();
                var Grid = sender;
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0 ; i < DataItems.length; i++) {
                    var Item = BatchManager.getCellValue(DataItems[i].get_cell('Item'));
                    if (Item == "A" || Item == "B" || Item == "C" || Item == "D" || Item == "E" || Item == "J") {
                        var LocalAmountTxt = MasterTable.get_dataItems()[i].findElement("LocalAmountTxt");
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.disabled = true;
                        }
                    }
                    else {
                        var LocalAmountTxt = MasterTable.get_dataItems()[i].findElement("LocalAmountTxt");
                        if (LocalAmountTxt != null) {
                            LocalAmountTxt.disabled = false;
                        }
                    }

                    if (Item == "A" || Item == "B" || Item == "C" || Item == "D") {
                        var ExchangeRateTxt = MasterTable.get_dataItems()[i].findElement("ExchangeRateTxt");
                        if (ExchangeRateTxt != null) {
                            ExchangeRateTxt.disabled = false;
                        }
                    }
                    else {
                        var ExchangeRateTxt = MasterTable.get_dataItems()[i].findElement("ExchangeRateTxt");
                        if (ExchangeRateTxt != null) {
                            ExchangeRateTxt.disabled = true;
                        }
                    }

                    if (Item == "A" || Item == "B" || Item == "C" || Item == "D" ||Item == "F") {
                        var PercentageTxt = MasterTable.get_dataItems()[i].findElement("PercentageTxt");
                        if (PercentageTxt != null) {
                            PercentageTxt.disabled = false;
                        }
                    }
                    else {
                        var PercentageTxt = MasterTable.get_dataItems()[i].findElement("PercentageTxt");
                        if (PercentageTxt != null) {
                            PercentageTxt.disabled = true;
                        }
                    }
                }
            } //End Region: To set control as disabled/enabled 

            //To set Value for Save
            function BatchEditClosed(sender, args) {
                var Grid = $find("<%=ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();
                var DataItems = MasterTable.get_dataItems();
                let Rows = MasterTable.get_dataItems();
                var DataItems = args.get_tableView().get_dataItems();
                var BatchManager = sender.get_batchEditingManager();
                var JsonArr = [];

                for (var i = 0 ; i < DataItems.length; i++) {
                    var Id = BatchManager.getCellValue(DataItems[i].get_cell('Id'));
                    var FMJobId = BatchManager.getCellValue(DataItems[i].get_cell('FMJobId'));
                    var Item = BatchManager.getCellValue(DataItems[i].get_cell('Item'));
                    var Description = BatchManager.getCellValue(DataItems[i].get_cell('Description'));
                    var Currency = BatchManager.getCellValue(DataItems[i].get_cell('Currency'));
                    var ExchangeRate = BatchManager.getCellValue(DataItems[i].get_cell('ExchangeRate'));
                    var Percentage = BatchManager.getCellValue(DataItems[i].get_cell('Percentage'));
                    var Amount = BatchManager.getCellValue(DataItems[i].get_cell('Amount'));
                    var LocalAmount = BatchManager.getCellValue(DataItems[i].get_cell('LocalAmount'));

                    JsonArr.push({
                        "Id": Id,
                        "FMJobId": FMJobId,
                        "Item": Item,
                        "Description": Description,
                        "Currency": Currency,
                        "ExchangeRate": ExchangeRate,
                        "Percentage": Percentage,
                        "Amount": Amount,
                        "LocalAmount": LocalAmount
                    });
                }
                document.getElementById('<%= JSONHiddenValue.ClientID %>').value = JSON.stringify(JsonArr);
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

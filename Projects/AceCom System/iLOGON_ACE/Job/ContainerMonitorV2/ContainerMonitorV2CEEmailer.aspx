<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorV2CEEmailer.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitorV2.ContainerMonitorV2CEEmailer" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function saveChangesToGrid() {
                // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                var grid = $find('<%=CEEmailerResultDG.ClientID%>');
                grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
            }

            function OrderByList_Filter(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var AcId = $telerik.findElement(currentRow, "LblAcId").innerText;
                var OrderByList = $telerik.findControl(currentRow, "OrderByList");
                var OrderByListItems = OrderByList.get_items();
                for (var i = 0; i < OrderByListItems.get_count() ; i++) {
                    var item = OrderByListItems.getItem(i);
                    if (!item.get_text()) {
                        // don't hide empty item
                        item.show();
                    }
                    else if (AcId !== item.get_value().split("|")[1]) {
                        item.hide();
                    }
                    else {
                        item.show();
                    }
                }
                OrderByList.commitChanges();
            }

            function OrderByList_DropDownClosed(sender, args) {
                var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                var OrderByList = $telerik.findControl(currentRow, "OrderByList").get_value();
                if (OrderByList != null && OrderByList != "") {
                    $telerik.findControl(currentRow, "EmailAddressTxt").set_value(OrderByList.split("|")[2]);
                }
                else {
                    $telerik.findControl(currentRow, "EmailAddressTxt").set_value("");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>

        <telerik:RadPanelBar runat="server" ID="RadPanelBar5" Width="100%" Skin="Windows7">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <br />
                                <table border="0" cellpadding="0" cellspacing="0" width="37%">
                                    <tr>
                                        <td>
                                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                                            <asp:Button ID="SelectAllReadyBtn" CssClass="LongLabelWhite" runat="server" OnClick="SelectAllReadyBtn_Click" Text="Select All Ready" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                                            <asp:Button ID="SendEmailBtn" runat="server" Text="Send Email" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="SendEmailBtn_Click" OnClientClick="disableBtn(this.id); saveChangesToGrid()" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="CEEmailerResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableViewState="false" ShowStatusBar="true"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="true"
                    AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="CEEmailerResultDG_NeedDataSource" OnItemDataBound="CEEmailerResultDG_ItemDataBound"
                    OnBatchEditCommand="CEEmailerResultDG_BatchEditCommand">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                        <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                            OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JobId" CommandItemDisplay="TopAndBottom" EditMode="Batch" Name="CEEmailerGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" PageSize="500">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="35px" HeaderStyle-Width="35px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CEEmailerchkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="JobNo" HeaderText="Job No" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Account" HeaderText="Account" ReadOnly="true" AllowFiltering="true" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="EmailAddress" HeaderText="EmailAddress" DataField="EmailAddress" AllowFiltering="false" ItemStyle-Width="250px"
                                HeaderStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblEmailAddress" Text='<%# Eval("EmailAddress") %>' CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="EmailAddressTxt" TextMode="SingleLine" Width="160px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="OrderBy" HeaderText="OrderBy" DataField="OrderBy" AllowFiltering="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblOrderBy" Text='<%# Eval("OrderBy") %>' Width="140px" CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="OrderByList" runat="server" Skin="WebBlue" Filter="Contains" OnClientDropDownOpening="OrderByList_Filter" OnClientDropDownClosed="OrderByList_DropDownClosed"
                                        RenderMode="Lightweight" OnLoad="OrderByList_Load" Width="140px" AllowCustomText="true">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AcId" HeaderText="AcId" DataField="AcId" Display="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblAcId" Text='<%# Eval("AcId") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="CustRef" HeaderText="OrderNo/CustomerRef" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="220px" HeaderStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VesselVoyageETA" HeaderText="Vessel <br/> Voyage <br/> ETA" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PermitNoBkrefPortnetNo" HeaderText="PermitNo <br/> BookingRef <br/> PortnetNo" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="180px" HeaderStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Container" HeaderText="Container" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="90px" HeaderStyle-Width="90px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notified" HeaderText="Notified" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReadyToNotify" HeaderText="Ready To Notify" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BalancePending" HeaderText="Balance Pending" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobId" UniqueName="JobId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HTMLColourCode" UniqueName="HTMLColourCode" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <telerik:RadCodeBlock runat="server">
        <script type="text/jscript">
            var EmailAddress = function (EmailAddrTxt) {
                this.EmailAddrTxt = EmailAddrTxt;
            }
            EmailAddress.prototype.equals = function (emailaddress) {
                if (this.EmailAddrTxt === emailaddress.EmailAddrTxt) {
                    return true;
                }
                return false;
            }
            EmailAddress.prototype.toString = function () {
                return JSON.stringify({
                    EmailAddr: this.EmailAddrTxt,
                }).replaceAll("'", "\\'");
            }

            //For GetCellValue
            function GetCellValue(sender, args) {
                //EmailAddress
                if (args.get_columnUniqueName() === "EmailAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container();
                    var EmailAddrTxt = $telerik.findElement(Container, "LblEmailAddress").innerText;
                    args.set_value(new EmailAddress(EmailAddrTxt));
                }
            }

            //For SetCellValue
            function SetCellValue(sender, args) {
                //EmailAddress
                if (args.get_columnUniqueName() === "EmailAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();
                    $telerik.findElement(Container, "LblEmailAddress").innerText = Value.EmailAddrTxt;
                }
            }

            //For GetEditorValue
            function GetEditorValue(sender, args) {
                //EmailAddress
                if (args.get_columnUniqueName() === "EmailAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        EmailAddrTxt = $telerik.findControl(Container, "EmailAddressTxt").get_value();
                    args.set_value(new EmailAddress(EmailAddrTxt));
                }
            }

            //For SetEditorValue
            function SetEditorValue(sender, args) {
                //EmailAddress
                if (args.get_columnUniqueName() === "EmailAddress") {
                    args.set_cancel(true);
                    var Container = args.get_container(),
                        Value = args.get_value();

                    $telerik.findControl(Container, "EmailAddressTxt").set_value(Value.EmailAddrTxt);
                }
            }
        </script>
    </telerik:RadCodeBlock>

</body>
</html>

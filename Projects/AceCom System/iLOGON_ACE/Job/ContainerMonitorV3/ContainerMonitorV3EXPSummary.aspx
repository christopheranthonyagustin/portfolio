<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorV3EXPSummary.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitorV3.ContainerMonitorV3EXPSummary" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Monitor EXPSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function EXPOnClientClose(sender, args) {
                var EXPmasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                EXPmasterTable.rebind();
            }

            function IMPOnClientClose(sender, args) {
                var IMPmasterTable = $find("<%= IMPResultDG.ClientID %>").get_masterTableView();
                IMPmasterTable.rebind();
            }

            function RowSelected(sender, eventArgs) {
                // checked the checkbox
                var checkbox = eventArgs.get_item().findElement('chkObjective');
                checkbox.checked = true;
            }

            function TMSJobOnClientClose(sender, args) {
                var TMSJobMasterTable = $find("<%= TMSJobResultDG.ClientID %>").get_masterTableView();
                TMSJobMasterTable.rebind();
            }

            function CheckAllIMP(id) {
                var IMPmasterTable = $find("<%= IMPResultDG.ClientID %>").get_masterTableView();
                 var row = IMPmasterTable.get_dataItems();
                 if (id.checked == true) {
                     for (var i = 0; i < row.length; i++) {
                         IMPmasterTable.get_dataItems()[i].findElement("IMPchkObjective").checked = true;
                     }
                 }
                 else {
                     for (var i = 0; i < row.length; i++) {
                         IMPmasterTable.get_dataItems()[i].findElement("IMPchkObjective").checked = false;
                     }
                 }
            }

            let TotalCount = 0;
            function RecordLevelCheckboxCheckedChanged(id) {
                var masterTable = $find("<%= IMPResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    TotalCount = TotalCount + 1;
                }
                else {
                    TotalCount = TotalCount - 1;
                }

                document.getElementById("<%= SelectedTotalLbl.ClientID %>").innerText = "Total Selected:" + TotalCount;
            }
        </script>
    </telerik:RadCodeBlock>
    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap {
            white-space: normal;
            width: 100px;
            height: auto;
            text-align: center;
        }

        .RadPanelBar div.rpSlide,
        .RadPanelBar ul.rpGroup,
        .RadPanelBar li.rpItem {
            overflow: visible;
        }

        html .RadMenu {
            text-decoration: none;
            text-align: left;
            line-height: 16px;
        }

        html .rmGroup .rmItem a.rmLink {
            background-color: #99c2ff !important;
            text-decoration: none;
            line-height: 20px;
        }

        html .RadMenu .rmGroup .rmItem a.rmLink:hover {
            background-color: #ebebe0 !important;
            font-weight: bold;
        }

        .rmItem:hover {
            background-color: white !important;
        }
    </style>
    <script language="javascript" type="text/javascript">

        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true" OnTabClick="RadTabStrip1_Click" Width="190%">
            <Tabs>
                <telerik:RadTab ID="TMSJobTab" Text="TMS Job" readonly="readonly" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="UnstuffingTab" Text="Inbound" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="StuffingTab" Text="Outbound" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ContainerRegisterTab" Text="Container Register" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="TMSJobRadPageView">
                <br />
                <table width="50%">
                    <tr>
                        <td>
                            <asp:Button runat="server" ID="PopulateWarehouseBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false"
                                Text="Populate Warehouse" OnClientClick="disableBtn(this.id)" OnClick="PopulateWarehouseBtn_Click" />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="CompleteBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false"
                                Text="Complete" OnClientClick="disableBtn(this.id)" OnClick="CompleteBtn_Click" />
                        </td>
                        <td>&nbsp;
                            <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="Button1" CssClass="white" CausesValidation="false" UseSubmitBehavior="false"
                                Text="Search" OnClientClick="disableBtn(this.id)" OnClick="SearchBtn_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="TMSJobResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" AllowFilteringByColumn="true"
                    OnNeedDataSource="TMSJobResultDG_NeedDataSource" OnItemDataBound="TMSJobResultDG_ItemDataBound" AllowPaging="true" Width="190%"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowSorting="true">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="620" />
                        <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false" HorizontalAlign="Left"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="TMSJobGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WMSJobNo" UniqueName="WMSJobNo" SortExpression="WMSJobNo" HeaderText="WMSJobNumber" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNumber" UniqueName="JobNumber" SortExpression="JobNumber" HeaderText="JobNumber" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CtnrNo" UniqueName="CtnrNo" SortExpression="CtnrNo" HeaderText="ContainerNo" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Date" UniqueName="Date" SortExpression="Date" HeaderText="Date" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipmentType" UniqueName="ShipmentType" SortExpression="ShipmentType" HeaderText="ShipmentType" AutoPostBackOnFilter="true" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobType" UniqueName="JobType" SortExpression="JobType" HeaderText="JobType" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TransportType" UniqueName="TransportType" SortExpression="TransportType" HeaderText="TransportType" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillsizeType" UniqueName="BillsizeType" SortExpression="BillsizeType" HeaderText="BillsizeType" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FromAddress" UniqueName="FromAddress" SortExpression="FromAddress" HeaderText="FromAddress" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ToAddress" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="ToAddress" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vehicle" UniqueName="Vehicle" SortExpression="Vehicle" HeaderText="Vehicle" AutoPostBackOnFilter="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Driver" UniqueName="Driver" SortExpression="Driver" HeaderText="Driver" AutoPostBackOnFilter="true" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcId" UniqueName="AcId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FrServicePt" UniqueName="FrServicePt" Display="false" />
                            <telerik:GridBoundColumn DataField="ToServicePt" UniqueName="ToServicePt" Display="false" />
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="UnstuffingRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 12px;">
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block"></div>
                                                    <br />
                                                    <asp:Button runat="server" ID="ExpReadyBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="Ready to Return" OnClientClick="disableBtn(this.id)" OnClick="ExpReadyBtn_Click" />
                                                    </div>
                                                    &nbsp;&nbsp;
                                                    <div style="display: inline-block; text-align: center">
                                                        <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                        <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                    </div>
                                                </td>
                                                <td align="right">
                                                    <br />
                                                    <asp:Button ID="ExpSwapBtn" CssClass="CircleBtn" runat="server" OnClick="ExpSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block;">
                                                        <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                        <telerik:RadComboBox ID="ExpAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                            RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                        </telerik:RadComboBox>
                                                    </div>
                                                    &nbsp;&nbsp;
                                                    <div style="display: inline-block">
                                                        <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                        <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </div>
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

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True" Height="100%"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" OnPreRender="ResultDG_PreRender"
                    OnColumnCreated="ResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="EXPGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="StuffingRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar2" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 12px;">
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block"></div>
                                                    <br />
                                                    <asp:Button runat="server" ID="IMPReadyBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="Ready to Return" OnClientClick="disableBtn(this.id)" OnClick="IMPReadyBtn_Click" />
                                                    </div>
                                                    &nbsp;&nbsp;
                                                    <div style="display: inline-block; text-align: center">
                                                        <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                        <asp:Button ID="IMPRunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="IMPRunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                    </div>
                                                </td>
                                                <td align="right">
                                                    <br />
                                                    <asp:Button ID="IMPSwapBtn" CssClass="CircleBtn" runat="server" OnClick="IMPSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block;">
                                                        <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                        <telerik:RadComboBox ID="IMPAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                            RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                        </telerik:RadComboBox>
                                                    </div>
                                                    &nbsp;&nbsp;
                                                    <div style="display: inline-block">
                                                        <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                        <telerik:RadTextBox ID="IMPCtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </div>
                                                     &nbsp;&nbsp;
                                                     <div style="display: inline-block;">
                                                        <asp:Label ID="ctnrLbl" runat="server" Text="Container Status" /><br />
                                                        <telerik:RadComboBox ID="ctnrStatusCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                            RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                        </telerik:RadComboBox>
                                                    </div>
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
                <table>
                    <tr>
                        <td>
                            <asp:Label Style="z-index: 0" ID="SelectedTotalLbl" runat="server" CssClass="errorLabel" Visible="true"></asp:Label>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="IMPResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True" 
                    Skin="Metro" OnNeedDataSource="IMPResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" Height="100%" OnPreRender="IMPResultDG_PreRender"
                    OnColumnCreated="IMPResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true" >
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="IMPGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" CausesValidation="false" AutoPostBack="true" OnClick="CheckAllIMP(this)" OnCheckedChanged="cbSelectAll_CheckedChanged"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="IMPchkObjective" runat="server" OnClick="RecordLevelCheckboxCheckedChanged(this)" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="ContainerRegisterRadPageView">
                <table>
                    <tr>
                        <iWMS:iForm ID="formCt2" runat="server" />
                        <asp:Button runat="server" ID="ConfirmBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="Confirm" OnClientClick="disableBtn(this.id)" OnClick="ConfirmBtn_Click" />
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <telerik:RadGrid ID="ContainerRegisterResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ContainerRegisterResultDG_NeedDataSource" OnColumnCreated="ContainerRegisterResultDG_ColumnCreated" OnPreRender="ContainerRegisterResultDG_PreRender">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="ISId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerMonitorV2EXPSummary.aspx.cs" Inherits="iWMS.Web.Job.ContainerMonitorV2.ContainerMonitorV2EXPSummary" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Monitor EXPSummary</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
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

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function IMPOnClientClose(sender, args) {
                var IMPmasterTable = $find("<%= IMPResultDG.ClientID %>").get_masterTableView();
                IMPmasterTable.rebind();
            }

            function EXPOnClientClose(sender, args) {
                var EXPmasterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                EXPmasterTable.rebind();
            }

            function AssOnClientClose(sender, args) {
                var AssmasterTable = $find("<%= AssResultDG.ClientID %>").get_masterTableView();
                AssmasterTable.rebind();
            }

            function IMPCompletedOnClientClose(sender, args) {
                var IMPCompletedmasterTable = $find("<%= IMPCompletedResultDG.ClientID %>").get_masterTableView();
                IMPCompletedmasterTable.rebind();
            }

            <%--function CEEmailerOnClientClose(sender, args) {
                var CEEmailermasterTable = $find("<%= CEEmailerResultDG.ClientID %>").get_masterTableView();
                CEEmailermasterTable.rebind();
            }--%>

            function RowSelected(sender, eventArgs) {
                // checked the checkbox
                var checkbox = eventArgs.get_item().findElement('chkObjective');
                checkbox.checked = true;
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
        var launch = false;
        function launchModal() {
            launch = true;
        }
        function hideModal() {
            launch = false;
        }

        function pageLoad() {
            if (launch) {
                $find("mpe1").show();
            }
            else {
                $find("mpe1").hide();
            }
        }

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
        <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true" OnTabClick="RadTabStrip1_Click">
            <Tabs>
                <telerik:RadTab ID="EXPSummary" Text="Export Summary" readonly="readonly" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="IMPSummary" Text="Import Summary" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="AssSummary" Text="AirShipmentSummary" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ImpSummaryCompleted" Text="ImpSummary-Completed" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="CEEmailer" Text="C/E Emailer" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="HeaderRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="26%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ExpCMSBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="CMS" OnClientClick="disableBtn(this.id)" OnClick="ExpCMSBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ExpReadyBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="ReadyToExport" OnClientClick="disableBtn(this.id)" OnClick="ExpReadyBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ExpUndoReadyReturnBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="Undo Ready Export" OnClientClick="disableBtn(this.id)" OnClick="ExpUndoReadyReturnBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ExpESNBtn" runat="server" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="ESN" OnClientClick="disableBtn(this.id)" OnClick="ExpESNBtn_Click" />
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                    <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ExpEditBtn" runat="server" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Edit" OnClientClick="disableBtn(this.id)" OnClick="ExpEditBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ExpSwapBtn" CssClass="CircleBtn" runat="server" OnClick="ExpSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr style="height: 10px">
                                            </tr>
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="ExpAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                    </telerik:RadComboBox>

                                                    <td>
                                                        <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                                        <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                                            DataValueField="item" Width="150px" Skin="WebBlue">
                                                        </telerik:RadDropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                                        <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadDropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                        <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadDropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                        <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                        </telerik:RadTextBox>
                                                    </td>
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
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="Both" OnPreRender="ResultDG_PreRender"
                    OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true">
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
            <telerik:RadPageView runat="server" Height="600px" ID="IMPSummaryRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar2" Width="100%" Skin="Windows7">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="37%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ImpReleaseBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Release" OnClientClick="disableBtn(this.id)" OnClick="ImpReleaseBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ImpDischargeBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Discharge" OnClientClick="disableBtn(this.id)" OnClick="ImpDischargeBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ImpReadyBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="ReadyToReturn" OnClientClick="disableBtn(this.id)" OnClick="ImpReadyBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="ImpUndoReadyReturnBtn" CssClass="LongLabelWhite" CausesValidation="false" UseSubmitBehavior="false" Text="Undo Ready Return" OnClientClick="disableBtn(this.id)" OnClick="ImpUndoReadyReturnBtn_Click" />
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                    <asp:Button ID="IMPRunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="IMPRunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <telerik:RadMenu ID="RadMenuMorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="true"
                                                        OnItemClick="RadMenuMorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" Text="ExcelTemplate" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                                            </telerik:RadMenuItem>
                                                        </Items>
                                                    </telerik:RadMenu>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ImpEditBtn" runat="server" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Edit" OnClientClick="disableBtn(this.id)" OnClick="ImpEditBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="IMPSwapBtn" CssClass="CircleBtn" runat="server" OnClick="IMPSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="IMPAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                                    <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                                        DataValueField="item" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                                    <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                    <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <td>
                                                        <asp:Label ID="ETALbl" runat="server" Text="ETA" /><br />
                                                        <telerik:RadDatePicker ID="FromETADateTxt" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="FRO'M' dd/MMM/yyyy" Skin="Office2007">
                                                            <DateInput ID="DateInput1" EmptyMessage="  From" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                        <br />
                                                        <telerik:RadDatePicker ID="ToETADateTxt" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="TO dd/MMM/yyyy 23:59:59" Skin="Office2007">
                                                            <DateInput ID="DateInput2" EmptyMessage="  To" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
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
                <telerik:RadGrid ID="IMPResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
                    Skin="Metro" OnNeedDataSource="IMPResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" Height="100%" OnPreRender="IMPResultDG_PreRender"
                    OnItemDataBound="IMPResultDG_ItemDataBound" OnColumnCreated="IMPResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="IMPGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="IMPchkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="AirShipmentSummaryRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar3" Width="100%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="37%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="AssReleaseBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Release" OnClientClick="disableBtn(this.id)" OnClick="AssReleaseBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="AssDischargeBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Discharge" OnClientClick="disableBtn(this.id)" OnClick="AssDischargeBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button runat="server" ID="AssReadyBtn" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Ready" OnClientClick="disableBtn(this.id)" OnClick="AssReadyBtn_Click" />
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                    <asp:Button ID="AssRunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="AssRunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <telerik:RadMenu ID="RadMenuMorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="true"
                                                        OnItemClick="AssRadMenuMorePrintouts_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" Text="ExcelTemplate" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                                            </telerik:RadMenuItem>
                                                        </Items>
                                                    </telerik:RadMenu>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="AssEditBtn" runat="server" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Edit" OnClientClick="disableBtn(this.id)" OnClick="AssEditBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="AssSwapBtn" CssClass="CircleBtn" runat="server" OnClick="AssSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="shipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="shipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="accountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="AssAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm1Lbl" runat="server" Text="Alarm1" /><br />
                                                    <telerik:RadDropDownList ID="alarm1Ddl" runat="server" Enabled="True" DataTextField="Descr"
                                                        DataValueField="item" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="alarm2Lbl" runat="server" Text="Alarm2" /><br />
                                                    <telerik:RadDropDownList ID="alarm2Ddl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                    <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadTextBox>
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
                <telerik:RadGrid ID="AssResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True" OnPreRender="AssResultDG_PreRender"
                    Skin="Metro" OnNeedDataSource="AssResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" Height="100%"
                    OnItemDataBound="AssResultDG_ItemDataBound" OnColumnCreated="AssResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="AssGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="AsschkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="ImpSummaryCompletedRadPageView">
                <telerik:RadPanelBar runat="server" ID="RadPanelBar4" Width="100%" Skin="Windows7">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="37%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                    <asp:Button ID="ImpCompletedRunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="ImpCompletedRunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <telerik:RadMenu ID="RadMenuMorePrintouts" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="true"
                                                        OnItemClick="RadMenuMorePrintoutsForIMPCompleted_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" Text="ExcelTemplate" PostBack="false" Value="MorePrintouts" Font-Bold="true" ForeColor="Black">
                                                            </telerik:RadMenuItem>
                                                        </Items>
                                                    </telerik:RadMenu>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ImpCompletedEditBtn" runat="server" CssClass="white" CausesValidation="false" UseSubmitBehavior="false" Text="Edit" OnClientClick="disableBtn(this.id)" OnClick="ImpCompletedEditBtn_Click" />
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="ImpCompletedSwapBtn" CssClass="CircleBtn" runat="server" OnClick="ImpCompletedSwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="IMPCompletedshipmentTypeLbl" runat="server" Text="ShipmentType" /><br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="IMPCompletedshipmentTypeCombo" runat="server" Skin="WebBlue" Filter="Contains" Width="150px">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="IMPCompletedaccountLbl" runat="server" Text="Account" /><br />
                                                    <telerik:RadComboBox ID="IMPCompletedAccountCombo" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="refreshIntervalLbl" runat="server" Text="RefreshInterval" /><br />
                                                    <telerik:RadDropDownList ID="refreshIntervalDdl" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CtnrNoLbl" runat="server" Text="ContainerNo" /><br />
                                                    <telerik:RadTextBox ID="CtnrNoTxt" runat="server" Enabled="True" Width="150px" Skin="WebBlue">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <td>
                                                        <asp:Label ID="ETALbl" runat="server" Text="CompletedDate" /><br />
                                                        <telerik:RadDatePicker ID="FromCompletedDateTxt" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="FRO'M' dd/MMM/yyyy" Skin="Office2007">
                                                            <DateInput ID="DateInput1" EmptyMessage="  From" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                        <br />
                                                        <telerik:RadDatePicker ID="ToCompletedDateTxt" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="TO dd/MMM/yyyy 23:59:59" Skin="Office2007">
                                                            <DateInput ID="DateInput2" EmptyMessage="  To" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </td>
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
                <telerik:RadGrid ID="IMPCompletedResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="True"
                    Skin="Metro" OnNeedDataSource="ImpCompletedResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" Height="100%" OnPreRender="ImpCompletedResultDG_PreRender"
                    OnItemDataBound="ImpCompletedResultDG_ItemDataBound" OnColumnCreated="ImpCompletedResultDG_ColumnCreated" AllowSorting="true" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <ClientEvents OnRowSelected="RowSelected" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ImpCompletedGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="IMPCompletedchkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>            
            <telerik:RadPageView runat="server" ID="CEEmailerRadPageView" Height="700px" />
        </telerik:RadMultiPage>
        <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryLeadTimeDashboard.aspx.cs" Inherits="iWMS.Web.Master.DeliveryLeadTime.DeliveryLeadTimeDashboard" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeliveryLeadTimeOriginCity</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <style type="text/css">
        .GridTable {
            float: right;
            position: absolute;
            height: 100px;
        }

        .outerMultiPage {
            height: 100px;
        }

        .ShipmentLbl {
            color: black;
            font-weight: bold;
            font-size: 9.5px;
            position: relative;
            top: 20px;
        }

        .InlineBlock {
            display: inline-block;
            margin-left: 5px;
        }

        .ShipmentDiv {
            height: 60px;
            width: 90px;
            margin: 0 5px 5px 0;
            padding: 5px 4px 4px 4px;
            overflow-wrap: break-word;
            word-wrap: break-word;
            hyphens: auto;
            position: relative;
            border-radius: 5px;
            box-shadow: 2px 2px 2px #808080;
            transition: all 0.3s linear;
            background-color: white;
            text-align: center;
        }

        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-right-width: 0px !important;
        }

        .BoldStyle {
            border-right-width: 2px !important;
            border-right-color: dimgrey !important;
        }

        .Grid {
            margin-left: 150px;
        }

        .ShipmentTypeItemPanel {
            margin-left: 50px;
        }

        We need this CSS because When Click the New Button, default CSS of Batch grid for CommandItem is not working when use two grid .RadGrid_Office2007 .rgSave {
            position: absolute;
            margin-left: 0% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Office2007 .rgCancel {
            position: absolute;
            margin-left: 10.5% !important;
            width: auto !important;
            height: auto !important;
        }

        .RadGrid_Office2007 .rgRefresh {
            margin-right: 70% !important;
            width: 100% !important;
            height: 3.7% !important;
        }
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-right: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Panel runat="server" Width="10%" HorizontalAlign="Left" CssClass="InlineBlock" ID="ShipmentTypeItemPanel">
            <div id="ShipmentDiv" runat="server"></div>
        </asp:Panel>
        <asp:Panel runat="server" Width="89%" HorizontalAlign="Left" CssClass="InlineBlock GridTable" ID="GridPanel">
            <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" AutoPostBack="true"
                CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" Width="160%">
                <%--<Tabs>
                    <telerik:RadTab Text="CreateNew" Value="0" runat="server"></telerik:RadTab>
                </Tabs>--%>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                <telerik:RadPageView ID="MainRadPageView" runat="server">
                    <br />
                    <asp:Button runat="server" ID="NewBtn" Text="New" CausesValidation="false" UseSubmitBehavior="false" CssClass="white" OnClientClick="disableBtn(this.id)" OnClick="NewBtn_Click" />
                    <br />
                    &nbsp;
                    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Silk" RenderMode="Lightweight" AllowPaging="true"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true" Height="500%"
                        ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true"
                        AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true" OnBatchEditCommand="ResultDG_BatchEditCommand">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="100px" />
                            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                            <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                            <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                                OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnRowSelected="RowSelected" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" Name="ParentGrid"
                            PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="Top" TableLayout="Auto" EditMode="Batch">
                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                            <CommandItemSettings ShowAddNewRecordButton="true" />
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Right">
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false" />
                                <telerik:GridTemplateColumn UniqueName="No" HeaderText="No" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn UniqueName="ToCityCode" HeaderText="ToCity" ItemStyle-Wrap="false" AllowFiltering="true" DataField="ToCityCode">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "ToCityCode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadComboBox ID="ToCityCodeList" runat="server" DataTextField="descr" DataValueField="item" RenderMode="Lightweight"
                                            OnItemsRequested="ToCityCodeList_ItemsRequested" HighlightTemplatedItems="true" Skin="WebBlue" Width="120px"
                                            EnableLoadOnDemand="true" AllowCustomText="false" Filter="Contains">
                                        </telerik:RadComboBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn UniqueName="LeadTimeBetweenCitiesInDays" HeaderText="LeadTime" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="true"  DataField="LeadTimeBetweenCitiesInDays">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}",Eval("LeadTimeBetweenCitiesInDays")) %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="LeadtimeTxt" Width="140px"></telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn UniqueName="DeliveryLeadTimeStatus" ItemStyle-HorizontalAlign="Center" HeaderText="Status" HeaderStyle-Width="200px" ItemStyle-Width="200px" AllowFiltering="false">
                                    <ItemTemplate>
                                        <%# string.Format("{0:}",Eval("DeliveryLeadTimeStatus")) %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadDropDownList ID="StatusDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px"
                                            OnLoad="StatusDDL_Load" DataTextField="Descr" DataValueField="Item">
                                        </telerik:RadDropDownList>
                                    </EditItemTemplate>

                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="AddDate" HeaderText="AddDate" ReadOnly="true" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AddUser" HeaderText="AddUser" ReadOnly="true" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditDate" HeaderText="EditDate" ReadOnly="true" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="EditUser" HeaderText="EditUser" ReadOnly="true" AllowFiltering="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Deletebtn">
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </asp:Panel>
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                // originally taken from https://vanillajstoolkit.com/polyfills/stringreplaceall/
                /**
                 * String.prototype.replaceAll() polyfill
                 * https://gomakethings.com/how-to-replace-a-section-of-a-string-with-another-one-with-vanilla-js/
                 * @author Chris Ferdinandi
                 * @license MIT
                 */
                if (!String.prototype.replaceAll) {
                    String.prototype.replaceAll = function (str, newStr) {

                        // If a regex pattern
                        if (Object.prototype.toString.call(str).toLowerCase() === '[object regexp]') {
                            return this.replace(str, newStr);
                        }

                        // If a string
                        return this.replace(new RegExp(str, 'g'), newStr);

                    };
                }

                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function saveChangesToGrid() {
                    // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                    var grid = $find('<%=ResultDG.ClientID%>');
                    grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
                }

                function GetCellValue(sender, args) {
                }

                function SetCellValue(sender, args) {
                }

                function GetEditorValue(sender, args) {
                }

                function SetEditorValue(sender, args) {
                }

                function RowSelected(sender, eventArgs) {
                    // uncheck all other checkbox first
                    var inputElements = document.getElementsByTagName('input');
                    for (var i = 0; i < inputElements.length; i++) {
                        var myElement = inputElements[i];
                        if (myElement.type === "checkbox") {
                            myElement.checked = false;
                        }
                    }

                    // checked the checkbox
                    var checkbox = eventArgs.get_item().findElement('chkObjective');
                    checkbox.checked = true;
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManpowerSchedulingWorkbench.aspx.cs" Inherits="iWMS.Web.Job.TMSManpowerSchedulingWorkbench.TMSManpowerSchedulingWorkbench" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS Manpower Scheduling Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <style type="text/css">
        html, body, form {
            height: 100%;
        }

        .AdditionalDG .rgDataDiv {
            height: auto !important;
        }
        /*.ResultDG .rgDataDiv {
            height: 100% !important;
        }*/
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
                var grid = $find('<%=ResultDG.ClientID%>');
                grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main Activity" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload Manpower Job" Value="3" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Field Service Support Activity" Value="5" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Personnel Schedule" Value="7" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Packing" Value="9" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Personnel Time Tracker" Value="11" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <br />
                <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="110%" Skin="Office2007">
                    <Items>
                        <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                            Style="text-align: center; font-size: 15px; font-weight: bold;">
                            <Items>
                                <telerik:RadPanelItem runat="server" Value="Panel">
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0 12px;">
                                            <tr>
                                                <td>
                                                    <div style="display: inline-block">
                                                        <asp:Label ID="DateLbl" runat="server" Text="Date" /><br />
                                                        <telerik:RadDatePicker ID="FromDateDP" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="FRO'M' dd/MMM/yyyy" Skin="Office2007">
                                                            <DateInput ID="DateInput1" EmptyMessage="  From" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                        <br />
                                                        <telerik:RadDatePicker ID="ToDateDP" MinDate="1/1/1800" runat="server" Width="155" DateInput-DateFormat="TO dd/MMM/yyyy 23:59:59" Skin="Office2007">
                                                            <DateInput ID="DateInput2" EmptyMessage="  To" runat="server">
                                                            </DateInput>
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </div>
                                                    &nbsp;&nbsp;
                                            <div style="display: inline-block; text-align: left">
                                                &nbsp;<asp:Label ID="Refresh" runat="server" Text="Refresh" /><br />
                                                <asp:Button ID="RunBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" CssClass="white" OnClick="RunBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="OpenBtn" runat="server" Text="Open" CausesValidation="false" ToolTip="Open" CssClass="white" OnClick="OpenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="AssignBtn" runat="server" Text="Assign" CausesValidation="false" ToolTip="Assign" CssClass="blue" OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="CompleteBtn" runat="server" Text="Complete" CausesValidation="false" ToolTip="Complete" CssClass="green" OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CausesValidation="false" ToolTip="Delete" CssClass="white" OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CssClass="white" OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                                &nbsp;
                                                <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CausesValidation="false" ToolTip="Excel" CssClass="green" OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableViewState="false" ShowStatusBar="true"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="false"
                    AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnBatchEditCommand="ResultDG_BatchEditCommand">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="TopAndBottom" EditMode="Batch" Name="TMSManPowerGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" PageSize="500">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="60px" ItemStyle-Width="60px" HeaderStyle-HorizontalAlign="Left">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:Label ID="AttcLbl" runat="server"></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Account" HeaderText="Account" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" HeaderText="Job No" ReadOnly="true" AllowFiltering="true" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="ActivityName" HeaderText="Activity Name" DataField="ActivityName" AllowFiltering="false" ItemStyle-Width="250px"
                                HeaderStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblActivityName" Text='<%# Eval("ActivityName") %>' CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ActivityNameTxt" TextMode="SingleLine" Width="160px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="FromDate" HeaderText="From Date" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center"
                                AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="FromDate" DataField="FromDate">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblFromDate" Text='<%# DataBinder.Eval(Container.DataItem, "FromDate", "{0:dd/MMM/yyyy <br/> HH:mm}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker runat="server" ID="FromDateDP" Skin="Office2007" Width="140px"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00">
                                    </telerik:RadDateTimePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ToDate" HeaderText="To Date" ItemStyle-Width="155px" HeaderStyle-Width="155px" ItemStyle-HorizontalAlign="Center"
                                AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="FromDate" DataField="ToDate">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblToDate" Text='<%# DataBinder.Eval(Container.DataItem, "ToDate", "{0:dd/MMM/yyyy <br/> HH:mm}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDateTimePicker runat="server" ID="ToDateDP" Skin="Office2007" Width="140px"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                        TimeView-TimeFormat="HH:mm" TimeView-Interval="00:30:00">
                                    </telerik:RadDateTimePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PIC" HeaderText="PIC"
                                SortExpression="PIC" AllowFiltering="false" ItemStyle-Width="170px" HeaderStyle-Width="170px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblPIC" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "PicDescr")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="PICList" runat="server" Skin="WebBlue"
                                        RenderMode="Lightweight" OnLoad="PICListDDL_Load" Width="140px">
                                    </telerik:RadDropDownList>
                                    <br />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Foreman" HeaderText="Foreman" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Manpower" HeaderText="Manpower" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="FromAddress" HeaderText="From Address" DataField="FromAddress" AllowFiltering="false" ItemStyle-Width="250px"
                                HeaderStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblFromAddress" Text='<%# Eval("FromAddress") %>' CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="FromAddressTxt" TextMode="MultiLine" Width="160px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ToAddress" HeaderText="To Address" DataField="ToAddress" AllowFiltering="false" ItemStyle-Width="250px"
                                HeaderStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblToAddress" Text='<%# Eval("ToAddress") %>' CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ToAddressTxt" TextMode="MultiLine" Width="160px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ActivityRemarks" HeaderText="Activity Remarks" DataField="ActivityRemarks" AllowFiltering="false" ItemStyle-Width="250px"
                                HeaderStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LblActivityRemarks" Text='<%# Eval("ActivityRemarks") %>' CssClass="wordwrap"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ActivityRemarksTxt" TextMode="MultiLine" Width="160px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ReadOnly="true" AllowFiltering="false" ItemStyle-Width="150px" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusCode" UniqueName="StatusCode" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="680px" ID="UploadManpowerJobRadPageView" />
            <telerik:RadPageView runat="server" Height="680px" ID="FieldServiceSupportActivityRadPageView" />
            <telerik:RadPageView runat="server" Height="680px" ID="PersonnelScheduleRadPageView" />
            <telerik:RadPageView runat="server" Height="680px" ID="PackingRadPageView" />
            <telerik:RadPageView runat="server" Height="680px" ID="PersonnelTimeTrackerRadPageView" />
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1300px" Height="700px" Top="0"
                    Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>

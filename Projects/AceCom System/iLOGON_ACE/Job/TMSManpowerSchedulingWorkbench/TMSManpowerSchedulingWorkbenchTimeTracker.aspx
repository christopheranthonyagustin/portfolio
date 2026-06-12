<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSManpowerSchedulingWorkbenchTimeTracker.aspx.cs" Inherits="iWMS.Web.Job.TMSManpowerSchedulingWorkbench.TMSManpowerSchedulingWorkbenchTimeTracker" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <div>
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </div>
                    <div>
                        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CausesValidation="false"
                            CssClass="white" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Button ID="OpenBtn" runat="server" Text="Open" CausesValidation="false" CssClass="white"
                        OnClick="OpenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Button ID="AssignBtn" runat="server" Text="Assign" CausesValidation="false" CssClass="blue"
                        OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Button ID="CompleteBtn" runat="server" Text="Complete" CausesValidation="false" CssClass="green"
                        OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CausesValidation="false" CssClass="white"
                        OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CausesValidation="false" CssClass="white"
                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                   <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CausesValidation="false" ToolTip="Excel" CssClass="green"
                        OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <br />
                        <br />
                        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                            Visible="False"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" EnableLinqExpressions="false" AllowFilteringByColumn="false"
            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" 
            OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" CommandItemDisplay="TopAndBottom" EditMode="Batch" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" PageSize="500">
                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Left">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="S/N" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                        AutoPostBackOnFilter="true" AllowFiltering="false" HeaderText="S/N" SortExpression="S/N">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="account" AllowFiltering="true"
                        ColumnGroupName="account" SortExpression="account" UniqueName="account"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Job Number" DataField="jobno" AllowFiltering="true"
                        ColumnGroupName="jobno" SortExpression="jobno" UniqueName="jobno"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Activity" DataField="activity" AllowFiltering="true"
                        ColumnGroupName="activity" SortExpression="activity" UniqueName="activity"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Personnel" DataField="personnel" AllowFiltering="true"
                        ColumnGroupName="personnel" SortExpression="personnel" UniqueName="personnel"
                        Reorderable="true" HeaderStyle-Width="120px" ItemStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="PerName" HeaderText="Name" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" AllowSorting="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="PerNameLbl" Text='<%# DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="PerNameDDL" runat="server" Skin="WebBlue" Width="120px" DropDownWidth="120px" OnLoad="PerNameDDL_Load">
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="plannedstart" HeaderText="Planned Start" HeaderStyle-Width="180px" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center"
                        AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="plannedstart" DataField="plannedstart">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="PlannedStartDateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "plannedstart", "{0:dd/MMM/yyyy HH:mm:ss}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="PlannedStartDate" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm"
                                Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" TimeView-Interval="00:30:00">
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="plannedend" HeaderText="Planned End" HeaderStyle-Width="180px" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center"
                        AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="plannedend" DataField="plannedend">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="PlannedEndDateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "plannedend", "{0:dd/MMM/yyyy HH:mm:ss}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="PlannedEndDate" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm"
                                Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" TimeView-Interval="00:30:00">
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="actualstart" HeaderText="Actual Start" HeaderStyle-Width="180px" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center"
                        AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="actualstart" DataField="actualstart">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="ActualStartDateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "actualstart", "{0:dd/MMM/yyyy HH:mm:ss}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="ActualStartDate" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm"
                                Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" TimeView-Interval="00:30:00">
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="actualend" HeaderText="Actual End" HeaderStyle-Width="180px" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center"
                        AllowSorting="true" AutoPostBackOnFilter="true" SortExpression="actualend" DataField="actualend">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="ActualEndDateLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "actualend", "{0:dd/MMM/yyyy HH:mm:ss}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDateTimePicker ID="ActualEndDate" runat="server" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm"
                                Width="150px" Skin="Office2007" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" TimeView-Interval="00:30:00">
                            </telerik:RadDateTimePicker>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="workthroughlunch" HeaderText="WorkThroughLunch" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" AllowSorting="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="WorkThroughLunchLbl" Text='<%# DataBinder.Eval(Container.DataItem, "workthroughlunch")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="WorkThroughLunchDDL" runat="server" Width="120px" Skin="WebBlue" DropDownWidth="150px" OnLoad="WorkThroughLunchDDL_Load"></telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="AllowanceAmount" HeaderText="Allowance Amount" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" AllowSorting="true">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("allowanceamt")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="AllowanceAmountTxt" Width="120px" Text='<%# DataBinder.Eval(Container.DataItem, "allowanceamt") %>'
                                TextMode="SingleLine">
                            </telerik:RadTextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="AllowanceAmountTxt" runat="server"
                                ErrorMessage="Number Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="OTHours" HeaderText="OT Hours" HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" AllowSorting="true">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("othours")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="OTHoursTxt" Width="120px" Text='<%# DataBinder.Eval(Container.DataItem, "othours") %>'
                                TextMode="SingleLine">
                            </telerik:RadTextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="OTHoursTxt" runat="server"
                                ErrorMessage="Number Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="TaskDescription" HeaderText="Task Description" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("taskdescription")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="TaskDescriptionTxt" Width="120px" Text='<%# DataBinder.Eval(Container.DataItem, "taskdescription") %>'
                                TextMode="MultiLine" Resize="Both">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="StatusCode" UniqueName="StatusCode" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="true"
                        SortExpression="status" UniqueName="status" Reorderable="true"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="StatusColourCode"
                        SortExpression="StatusColourCode" UniqueName="StatusColourCode" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>


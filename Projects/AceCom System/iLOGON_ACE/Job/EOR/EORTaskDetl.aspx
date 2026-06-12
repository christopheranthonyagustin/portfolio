<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EORTaskDetl.aspx.cs" Inherits="iWMS.Web.Job.EOR.EORTaskDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>EORTaskDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="GenerateBtn" CssClass="white" runat="server" OnClick="GenerateBtn_Click" Visible="true"
                        Text="Generate" />
                </td>
                <td>
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                        Font-Bold="True"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
            OnEditCommand="ResultDG_Edit" GroupPanelPosition="Top" OnUpdateCommand="ResultDG_UpdateCommand"
            OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace"
                CommandItemDisplay="Top">
                <CommandItemSettings ShowRefreshButton="false" />
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="TaskDetail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="S/N">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="taskcodedescr" HeaderText="Task">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taskcodedescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="TaskList" runat="server" DefaultMessage="Select a Task"
                                DropDownHeight="150px" Skin="Sunset" DataSource='<%# taskListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taskListDS,DataBinder.Eval(Container.DataItem, "taskcode").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="TaskListReqVal" runat="server" ControlToValidate="TaskList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date" DataType="System.DateTime">
                        <HeaderTemplate>
                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" Width="150px" Style="text-align: center"></asp:Label>
                            <br />
                            <asp:Label ID="lblEndDate" runat="server" Text="End Date" Width="150px" Style="text-align: center"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startdate","{0:dd/MMM/yyyy HH:mm:ss tt}")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "enddate","{0:dd/MMM/yyyy HH:mm:ss tt}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="StartDateListReqVal" runat="server" ControlToValidate="StartDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="StartDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss tt"
                                DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss tt"
                                PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "startdate") %>'
                                DateInput-Skin="Sunset" DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                            <br />
                            <asp:RequiredFieldValidator ID="EndDateListReqVal" runat="server" ControlToValidate="EndDatePicker"
                                ErrorMessage="*" />
                            <telerik:RadDateTimePicker ID="EndDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss tt"
                                DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" Skin="Office2007" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss tt"
                                PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate") %>'
                                DateInput-Skin="Sunset" DateInput-BackColor="Yellow">
                                <Calendar>
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDateTimePicker>
                            <br />
                            <asp:CompareValidator ID="ComVal" runat="server" ControlToValidate="StartDatePicker" ControlToCompare="EndDatePicker" Operator="LessThanEqual"
                                EnableClientScript="true" Type="String" ErrorMessage="StartDate should be eailer than EndDate" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Status" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="200px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="StatusList" runat="server" DefaultMessage="Select a Status"
                                DropDownHeight="150px" DataSource='<%# statusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                                DataTextField="descr" DataValueField="item" Skin="Sunset">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="StartStatusListReqVal" runat="server" ControlToValidate="StatusList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="startremark">
                        <HeaderTemplate>
                            <asp:Label ID="txtStartRemarks" runat="server" Text="Start Remarks" DataField="startstatusremarks"></asp:Label>
                            <br />
                            <asp:Label ID="txtEndRemarks" runat="server" Text="End Remarks" DataField="startstatusremarks"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="300px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="300px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "startremarks")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "endremarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtStartRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "startremarks") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                            <br />
                            <telerik:RadTextBox runat="server" ID="txtEndRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "endremarks") %>'
                                TextMode="MultiLine" Rows="2" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

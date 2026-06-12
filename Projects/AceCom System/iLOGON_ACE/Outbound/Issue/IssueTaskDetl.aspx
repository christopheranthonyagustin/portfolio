<%@ Page Language="c#" CodeBehind="IssueTaskDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.IssueTaskDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueTaskDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Button ID="AddDetailBtn" runat="server" Text="New Line" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png" Width="30" Height="30"
                    Visible="false" OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0"
                    ImageAlign="AbsMiddle" ToolTip="Delete" />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
        AllowPaging="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
        OnEditCommand="ResultDG_Edit" OnUpdateCommand="ResultDG_Update" OnItemCommand="ResultDG_ItemCommand"
        GroupPanelPosition="Top">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
            TableLayout="Auto" CommandItemDisplay="Top">
            <Columns>
                <%--17/Mar/2016 Sandi converted to radGrid--%>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="70px" />
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="20px"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
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
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="20px" />
                    <ItemTemplate>
                        <%#Container.ItemIndex + 1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="taskcodedescr" HeaderText="Task">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50px" />
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
                <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblStartDate" runat="server" Text="StartDate" Width="150px" Style="text-align: center" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEndDate" runat="server" Text="EndDate" Width="150px" Style="text-align: center" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startdate", "{0: dd/MMM/yyyy HH:mm:ss}")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "enddate", "{0: dd/MMM/yyyy HH:mm:ss}")%>
                    </ItemTemplate>
                    <EditItemTemplate> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="StartDatePicker"
                            ErrorMessage="*" />                                               
                           <telerik:RadDateTimePicker ID="StartDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                            DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss"
                            PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "startdate") %>'
                            DateInput-Skin="Sunset" DateInput-BackColor="Yellow">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDateTimePicker>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EndDatePicker"
                            ErrorMessage="*" />                       
                        <telerik:RadDateTimePicker ID="EndDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                            DateInput-TimeFormat="HH:mm:ss" TimeView-TimeFormat="HH:mm:ss" Skin="Office2007" PopupDirection="TopRight"
                            DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate") %>' DateInput-Skin="Sunset"
                            DateInput-BackColor="Yellow">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDateTimePicker>  
                        <br />
                            <asp:CompareValidator ID="ComVal" runat="server" ControlToValidate="StartDatePicker" ControlToCompare="EndDatePicker" Operator="LessThanEqual"
                        EnableClientScript="true" Type="String" ErrorMessage="StartDate should be eailer than EndDate"/>                      
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="Status" AllowFiltering="false">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblStartStatus" runat="server" Text="StartStatus" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEndStatus" runat="server" Text="EndStatus" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startstatusdescr")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "endstatusdescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="StartStatusList" runat="server" DefaultMessage="Select a Start Status"
                            DropDownHeight="150px" Skin="Sunset" DataSource='<%# startstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(startstatusListDS,DataBinder.Eval(Container.DataItem, "startstatus").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ID="StartStatusListReqVal" runat="server" ControlToValidate="StartStatusList"
                            ErrorMessage="*" />
                        <br />
                        <telerik:RadDropDownList ID="EndStatusList" runat="server" DefaultMessage="Select a End Status"
                            DropDownHeight="150px" Skin="Sunset" DataSource='<%# endstatusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(endstatusListDS,DataBinder.Eval(Container.DataItem, "endstatus").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ID="EndStatusListReqVal" runat="server" ControlToValidate="EndStatusList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="startreason">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblStartReason" runat="server" Text="StartReason" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEndReason" runat="server" Text="EndReason" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="false" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startreason")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "endreason")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadTextBox runat="server" ID="txtStartReason" Text='<%# DataBinder.Eval(Container.DataItem, "startreason") %>'
                                        TextMode="MultiLine" Rows="2" Width="90%">
                                    </telerik:RadTextBox>
                                    <tr>
                                        <td>
                                            <telerik:RadTextBox runat="server" ID="txtEndReason" Text='<%# DataBinder.Eval(Container.DataItem, "endreason") %>'
                                                TextMode="MultiLine" Rows="2" Width="90%">
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="startremark">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="txtStartRemarks" runat="server" Text="StartRemarks" DataField="startstatusremarks" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="txtEndRemarks" runat="server" Text="EndRemarks" DataField="endstatusremarks" CssClass="RGridHeader_CUSTOM"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "startremarks")%>
                        <br />
                        <%# DataBinder.Eval(Container.DataItem, "endremarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadTextBox runat="server" ID="txtStartRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "startremarks") %>'
                                        TextMode="MultiLine" Rows="2" Width="90%">
                                    </telerik:RadTextBox>
                                </td>
                                <tr>
                                    <td>
                                        <telerik:RadTextBox runat="server" ID="txtEndRemarksedit" Text='<%# DataBinder.Eval(Container.DataItem, "endremarks") %>'
                                            TextMode="MultiLine" Rows="2" Width="90%">
                                        </telerik:RadTextBox>
                                    </td>
                                </tr>
                        </table>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="resource" HeaderText="Resource">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "resource")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="txtresource" Text='<%# DataBinder.Eval(Container.DataItem, "resource") %>'
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="statuscolour" Display="false">
                </telerik:GridBoundColumn>
                <%--   <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                    Reorderable="true" ReadOnly="true">
                </telerik:GridBoundColumn>--%>
                <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "Status")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="Status" runat="server" DropDownHeight="150px" Skin="Sunset"
                            DataSource='<%# statusListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                            DataTextField="descr" DataValueField="item">
                        </telerik:RadDropDownList>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
